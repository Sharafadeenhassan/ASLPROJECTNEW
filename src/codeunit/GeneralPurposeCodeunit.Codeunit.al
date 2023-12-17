codeunit 50001 "General Purpose Codeunit"
{
    trigger OnRun()
    begin
    end;

    var
        Dy: Integer;
        Mth: Integer;
        Yr: Integer;
        DateRec2: Record Date;
        HolidayRec: Record Holidays;
        WkDay: Text[10];
        Cnt: Integer;
        TmpDate: Date;
        EDRec: Record "Payroll-E/D Codes.";

    //[Scope('OnPrem')]
    procedure Parents2Components(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        ProductGroups: array[100] of Code[20];
        g: Integer;
        i: Integer;
        j: Integer;
        ProductFound: Boolean;
        ItemRec: Record Item;
        ComponentsItems: array[100, 10] of Code[20];
    begin
        /*
        Assumptions:  - Not more than 100 Product group
                      - Not more than 10 components(Inventory product) per Product group
                        [productgroup][components]
        ComponentsItems[100][10]     // Final
        Componentsqty[100][10]
        */

        SalesLine.Reset();
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        g := 0;
        repeat
            ProductFound := false;
            i := 1;
            while ((i < g) and not ProductFound) do begin
                if ProductGroups[i] = GetGroup(SalesLine."No.") then
                    ProductFound := true;
                i := i + 1;
            end;
            if not ProductFound then begin
                g := g + 1;
                ProductGroups[g] := GetGroup(SalesLine."No.");
            end;
        until SalesLine.Next() = 0;

        for i := 1 to g do begin  // For each product in (Load ?/return ?)
            ItemRec.SetCurrentKey("Item Category Code");
            ItemRec.SetRange(ItemRec."Item Category Code", ProductGroups[i]);
            ItemRec.SetRange(ItemRec."Assembly BOM", false);
            if ItemRec.Find('-') then begin
                j := 1;
                repeat
                    ComponentsItems[i] [j] := ItemRec."No.";
                    j := j + 1;
                until ItemRec.Next() = 0;
            end;
        end;
        Message('[' + Format(g) + ']');
    end;

    //[Scope('OnPrem')]
    procedure Components2Parents(SalesHeader: Record "Sales Header")
    begin
    end;

    //[Scope('OnPrem')]
    procedure GetGroup(ItemNo: Code[20]): Code[10]
    var
        ItemRec: Record Item;
    begin
        ItemRec.Get(ItemNo);
        exit(ItemRec."Item Category Code");
    end;

    //[Scope('OnPrem')]
    procedure ExplodeSalesHeader(SalesHeader: Record "Sales Header")
    var
        SalesLines: Record "Sales Line";
        ItemRec: Record Item;
    begin
        SalesLines.SetCurrentKey("Document Type", "Document No.", Explodedline);
        SalesLines.SetRange("Document Type", SalesHeader."Document Type");
        SalesLines.SetRange("Document No.", SalesHeader."No.");
        SalesLines.SetRange(Explodedline, true);
        if SalesLines.Find('-') then
            SalesLines.DeleteAll();

        SalesLines.Reset();
        SalesLines.SetRange("Document Type", SalesHeader."Document Type");
        SalesLines.SetRange("Document No.", SalesHeader."No.");

        if SalesLines.Find('-') then begin
            repeat
                if SalesLines.Type = SalesLines.Type::Item then begin
                    ItemRec.Get(SalesLines."No.");
                    ItemRec.CalcFields(ItemRec."Assembly BOM");
                    if ItemRec."Assembly BOM" then
                        SalesLines.Mark(true);
                end;
            until SalesLines.Next() = 0;

            SalesLines.MarkedOnly(true);
            SalesLines.Find('-');

            repeat
                ExplodeSalesLine(SalesLines);
            until SalesLines.Next() = 0;
        end;
    end;

    // [Scope('OnPrem')]
    procedure ExplodeSalesLine(SalesLine: Record "Sales Line")
    var
        ToSalesLine: Record "Sales Line";
        FromBOMComp: Record "BOM Component";
        SalesHeader: Record "Sales Header";
        ItemTranslation: Record "Item Translation";
        Item: Record Item;
        ItemCheckAvail: Codeunit "Item-Check Avail.";
        UnitOfMeasureMgt: Codeunit "Unit of Measure Management";
        LineSpacing: Integer;
        NextLineNo: Integer;
        NoOfBOMComp: Integer;
    begin
        SalesLine.TestField(SalesLine.Type, SalesLine.Type::Item);
        SalesLine.TestField(SalesLine."Quantity Shipped", 0);
        SalesLine.TestField(SalesLine."Reserved Qty. (Base)", 0);
        if SalesLine."Purch. Order Line No." <> 0 then
            Error(
              'The BOM cannot be exploded on the sales lines because it is associated with purchase order %1.',
              SalesLine."Purchase Order No.");

        SalesHeader.Get(SalesLine."Document Type", SalesLine."Document No.");
        FromBOMComp.SetRange("Parent Item No.", SalesLine."No.");
        NoOfBOMComp := FromBOMComp.Count;
        if NoOfBOMComp = 0 then
            Error(
              'Item %1 is not a bill of materials.',
              SalesLine."No.");

        // remove this line
        ///IF NOT CONFIRM('Do you want to explode the BOM?',FALSE) THEN
        ///  EXIT;

        ToSalesLine.Reset();
        ToSalesLine.SetRange("Document Type", SalesLine."Document Type");
        ToSalesLine.SetRange("Document No.", SalesLine."Document No.");
        ToSalesLine := SalesLine;
        if ToSalesLine.Find('>') then begin
            LineSpacing := (ToSalesLine."Line No." - SalesLine."Line No.") div (1 + NoOfBOMComp);
            if LineSpacing = 0 then
                Error('There is not enough space to explode the BOM.');
        end else
            LineSpacing := 10000;

        if SalesLine."Document Type" in [SalesLine."Document Type"::Order, SalesLine."Document Type"::Invoice] then begin
            ToSalesLine := SalesLine;
            FromBOMComp.SetRange(Type, FromBOMComp.Type::Item);
            FromBOMComp.SetFilter("No.", '<>%1', '');
            if FromBOMComp.Find('-') then
                repeat
                    FromBOMComp.TestField(Type, FromBOMComp.Type::Item);
                    Item.Get(FromBOMComp."No.");
                    ToSalesLine."Line No." := 0;
                    ToSalesLine."No." := FromBOMComp."No.";
                    ToSalesLine."Variant Code" := FromBOMComp."Variant Code";
                    ToSalesLine."Unit of Measure Code" := FromBOMComp."Unit of Measure Code";
                    ToSalesLine."Qty. per Unit of Measure" := UnitOfMeasureMgt.GetQtyPerUnitOfMeasure(Item, FromBOMComp."Unit of Measure Code");
                    ToSalesLine."Outstanding Quantity" := Round(SalesLine."Quantity (Base)" * FromBOMComp."Quantity per", 0.00001);
                    if ToSalesLine."Outstanding Quantity" > 0 then
                        ItemCheckAvail.SalesLineCheck(ToSalesLine);
                until FromBOMComp.Next() = 0;
        end;

        ToSalesLine := SalesLine;
        //ToSalesLine.INIT;
        //ToSalesLine.Description := SalesLine.Description;
        //ToSalesLine."Description 2" := SalesLine."Description 2";
        //ToSalesLine.MODIFY;
        //ToSalesLine."Component Line" := FALSE;
        ToSalesLine.Modify();

        FromBOMComp.Reset();
        FromBOMComp.SetRange("Parent Item No.", SalesLine."No.");
        FromBOMComp.Find('-');
        NextLineNo := SalesLine."Line No.";
        repeat
            ToSalesLine.Init();
            NextLineNo := NextLineNo + LineSpacing;
            ToSalesLine."Line No." := NextLineNo;
            case FromBOMComp.Type of
                FromBOMComp.Type::" ":
                    ToSalesLine.Type := ToSalesLine.Type::" ";
                FromBOMComp.Type::Item:
                    ToSalesLine.Type := ToSalesLine.Type::Item;
                FromBOMComp.Type::Resource:
                    ToSalesLine.Type := ToSalesLine.Type::Resource;
            end;
            if ToSalesLine.Type <> ToSalesLine.type::" " then begin
                ToSalesLine.Validate("No.", FromBOMComp."No.");
                ToSalesLine.Validate("Variant Code", FromBOMComp."Variant Code");
                if ToSalesLine.Type = ToSalesLine.Type::Item then begin
                    ToSalesLine."Drop Shipment" := SalesLine."Drop Shipment";
                    Item.Get(FromBOMComp."No.");
                    ToSalesLine.Validate(Quantity,
                      Round(
                        SalesLine."Quantity (Base)" * FromBOMComp."Quantity per" *
                        UnitOfMeasureMgt.GetQtyPerUnitOfMeasure(Item, FromBOMComp."Unit of Measure Code") /
                        ToSalesLine."Qty. per Unit of Measure",
                        0.00001));
                end else
                    ToSalesLine.Validate(Quantity, SalesLine."Quantity (Base)" * FromBOMComp."Quantity per");
            end;
            if SalesHeader."Language Code" = '' then
                ToSalesLine.Description := FromBOMComp.Description
            else
                if not ItemTranslation.Get(FromBOMComp."No.", FromBOMComp."Variant Code", SalesHeader."Language Code") then
                    ToSalesLine.Description := FromBOMComp.Description;

            ToSalesLine."Location Code" := SalesLine."Location Code"; // Also copy location: Adam
            ToSalesLine.Explodedline := true;
            ToSalesLine.Insert();
        until FromBOMComp.Next() = 0;

        Commit();
    end;

    // [Scope('OnPrem')]
    procedure AfterPostSalesDeleteExplode(SalesHeader: Record "Sales Header")
    var
        SalesLineRec: Record "Sales Line";
    begin
        // Added by Adam to delete exploded lines in case of posting error

        SalesLineRec.SetCurrentKey("Document Type", "Document No.", Explodedline);
        SalesLineRec.SetRange(SalesLineRec."Document Type", SalesHeader."Document Type");
        SalesLineRec.SetRange(SalesLineRec."Document No.", SalesHeader."No.");
        SalesLineRec.SetRange(SalesLineRec.Explodedline, true);
        if SalesLineRec.Find('-') then
            SalesLineRec.DeleteAll();
    end;

    // [Scope('OnPrem')]
    procedure IsHoliday(CheckDate: Date): Boolean
    begin
        Dy := Date2DMY(CheckDate, 1);
        Mth := Date2DMY(CheckDate, 2);
        Yr := Date2DMY(CheckDate, 3);

        DateRec2.Reset();
        HolidayRec.Reset();
        HolidayRec.SetRange(HolidayRec.Day, Dy);
        HolidayRec.SetRange(HolidayRec.Month, Mth);

        if HolidayRec.Count <> 0 then
            exit(true)
        else begin
            DateRec2.SetRange(DateRec2."Period Type", 0);
            DateRec2.SetRange(DateRec2."Period Start", CheckDate);
            if DateRec2.Find('-') then begin
                WkDay := DateRec2."Period Name";
                HolidayRec.Reset();
                HolidayRec.SetRange(HolidayRec."Day Of Week", WkDay);
                if HolidayRec.Count <> 0 then
                    exit(true)
                else
                    exit(false);
            end
            else
                exit(false);
        end;
    end;

    //[Scope('OnPrem')]
    procedure GetEndDate(StartD: Date; NoOfDays: Integer): Date
    begin
        TmpDate := StartD - 1;
        Cnt := 0;
        repeat
            TmpDate := TmpDate + 1;
            if not (IsHoliday(TmpDate)) then Cnt := Cnt + 1;
        until (Cnt = NoOfDays);
        exit(TmpDate);
    end;

    //[Scope('OnPrem')]
    procedure GetStartDate(EndD: Date; NoOfDays: Integer): Date
    begin
        TmpDate := EndD + 1;
        Cnt := 0;
        repeat
            TmpDate := TmpDate - 1;
            if not (IsHoliday(TmpDate)) then Cnt := Cnt + 1;
        until (Cnt = NoOfDays);
        exit(TmpDate);
    end;

    //[Scope('OnPrem')]
    procedure GetNoOfDays(StartD: Date; EndD: Date): Integer
    begin
        TmpDate := StartD - 1;
        Cnt := 0;
        repeat
            TmpDate := TmpDate + 1;
            if not (IsHoliday(TmpDate)) then Cnt := Cnt + 1;
        until (TmpDate = EndD);
        exit(Cnt);
    end;

    // [Scope('OnPrem')]
    procedure GetGrossED(SearchED: Option " ","NSITF Employee","NSITF Employer","Gross Salary","Pension Employee","Pension Employer"): Code[20]
    begin
        EDRec.SetCurrentKey(EDRec."ED Type");
        EDRec.SetRange(EDRec."ED Type", SearchED);

        if EDRec.Find('-') then exit(EDRec."E/D Code");
    end;

    procedure PrintVesselCatches(var NewJobJnlLine: Record "Job Journal Line")
    var
        JobJnlLine: Record "Job Journal Line";
        VesselCatches: Report "Vessel Catches";
    begin
        JobJnlLine.Copy(NewJobJnlLine);
        JobJnlLine.SetRange("Journal Template Name", JobJnlLine."Journal Template Name");
        JobJnlLine.SetRange("Journal Batch Name", JobJnlLine."Journal Batch Name");
        // JobJnlTemplate.Get(JobJnlLine."Journal Template Name");
        // JobJnlTemplate.TestField("Test Report ID");
        // REPORT.Run(JobJnlTemplate."Test Report ID", true, false, JobJnlLine);
        VesselCatches.SetTableView(JobJnlLine);
        VesselCatches.Run();
    end;

    procedure PrintJobJnlLine(var NewJobJnlLine: Record "Job Journal Line")
    var
        JobJnlLine: Record "Job Journal Line";
        VesselCatchesReportID: Integer;
    begin
        VesselCatchesReportID := 50085;
        JobJnlLine.Copy(NewJobJnlLine);
        JobJnlLine.SetRange("Journal Template Name", JobJnlLine."Journal Template Name");
        JobJnlLine.SetRange("Journal Batch Name", JobJnlLine."Journal Batch Name");
        // JobJnlTemplate.Get(JobJnlLine."Journal Template Name");
        // JobJnlTemplate.TestField("Test Report ID");
        REPORT.Run(VesselCatchesReportID, true, false, JobJnlLine);
    end;
}
