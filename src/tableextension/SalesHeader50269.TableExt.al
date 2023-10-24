tableextension 50269 "tableextension50269" extends "Sales Header"
{
    fields
    {
        //Unsupported feature: Property Modification (Editable) on ""No. Series"(Field 107)".

        //Unsupported feature: Code Modification on ""Posting Date"(Field 20).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Posting Date");
        TestNoSeriesDate(
          "Posting No.","Posting No. Series",
        #4..25
            ConfirmUpdateCurrencyFactor;
        end;

        if "Posting Date" <> xRec."Posting Date" then
          if DeferralHeadersExist then
            ConfirmUpdateDeferralDate;
        SynchronizeAsmHeader;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..28
        SynchronizeAsmHeader;
        */
        //end;

        //Unsupported feature: Code Modification on ""Location Code"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        if ("Location Code" <> xRec."Location Code") and
           (xRec."Sell-to Customer No." = "Sell-to Customer No.")
        then
          MessageIfSalesLinesExist(FieldCaption("Location Code"));

        UpdateShipToAddress;
        UpdateOutboundWhseHandlingTime;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7

        if "Location Code" <> '' then begin
          if Location.Get("Location Code") then
            "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
        end else begin
          if InvtSetup.Get then
            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
        end;
        */
        //end;

        //Unsupported feature: Code Modification on ""Sell-to Contact No."(Field 5052).OnValidate".

        //trigger "(Field 5052)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;

        if "Sell-to Contact No." <> '' then
        #4..36
              Error(Text038,Cont."No.",Cont.Name,"Sell-to Customer No.");
        end;

        if "Sell-to Contact No." <> '' then
          if Cont.Get("Sell-to Contact No.") then
            if ("Salesperson Code" = '') and (Cont."Salesperson Code" <> '') then
              Validate("Salesperson Code",Cont."Salesperson Code");

        UpdateSellToCust("Sell-to Contact No.");
        UpdateSellToCustTemplateCode;
        UpdateShipToContact;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..39
        #45..47
        */
        //end;

        //Unsupported feature: Code Modification on ""Responsibility Center"(Field 5700).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        if not UserSetupMgt.CheckRespCenter(0,"Responsibility Center") then
          Error(
            Text027,
            RespCenter.TableCaption,UserSetupMgt.GetSalesFilter);

        UpdateLocationCode('');
        UpdateOutboundWhseHandlingTime;
        UpdateShipToAddress;
        #10..18
          RecreateSalesLines(FieldCaption("Responsibility Center"));
          "Assigned User ID" := '';
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..5
           "Location Code" := UserSetupMgt.GetLocation(0,'',"Responsibility Center");
        if "Location Code" <> '' then begin
          if Location.Get("Location Code") then
            "Outbound Whse. Handling Time" := Location."Outbound Whse. Handling Time";
        end else begin
          if InvtSetup.Get then
            "Outbound Whse. Handling Time" := InvtSetup."Outbound Whse. Handling Time";
        end;
        #7..21
        */
        //end;
        field(50301; "Contr. Code/Postn.  Applied"; Option)
        {
            OptionMembers = "01-Skipper","02-Marine Eng","03-Coxswain","04-Eng Superv","05-Shr Mast/Sail","06-Mec/Carp/Wel/Secu","07-Others";
        }
        field(50302; "Appraisal Selection"; Option)
        {
            Description = ' ,Interview,Skill & Performance';
            OptionMembers = " ",Interview,"Skill & Performance";
        }
        field(50303; "Skill Score"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE(Type = CONST(Resource),
                                                           "Document No." = FIELD("No."),
                                                           "Document Type" = CONST(Quote)));
            Editable = false;
            FieldClass = FlowField;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(50304; "Skill Total"; Decimal)
        {
            CalcFormula = Sum("Sales Line".TTSkill WHERE(Type = CONST(Resource),
                                                          "Document No." = FIELD("No."),
                                                          "Document Type" = CONST(Quote)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50305; "Skill Percentage"; Decimal)
        {
            trigger OnLookup()
            begin
                /*
                //Univision Start 31/10/01 Yusuf
                  "Skill Percentage":=0;
                 Larger:= '>';
                 Precision:=0.1;
                 IF "Skill Total" > 0 THEN
                    "Skill Percentage":=("Skill Score"/"Skill Total")*100
                ELSE
                 "Skill Percentage":=0;
                "Skill Percentage":=ROUND("Skill Percentage",Precision,Larger);
                // Univision Finish 31/10/01 Yusuf
                */  //#1
            end;
        }
        field(50306; "Performance Score"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE(Type = CONST(Item),
                                                           "Document No." = FIELD("No."),
                                                           "Document Type" = CONST(Quote)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50307; "Performance Total"; Decimal)
        {
            CalcFormula = Sum("Sales Line".TTPerformance WHERE(Type = CONST(Item),
                                                                "Document No." = FIELD("No."),
                                                                "Document Type" = CONST(Quote)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50308; "Performance Percentage"; Decimal)
        {
            trigger OnLookup()
            begin
                //Univision Start 31/10/01 Yusuf
                "Performance Percentage" := 0;

                Larger := '>';
                Precision := 0.1;

                if "Performance Total" > 0 then
                    "Performance Percentage" := ("Performance Score" / "Performance Total") * 100
                else
                    "Performance Percentage" := 0;
                "Performance Percentage" := Round("Performance Percentage", Precision, Larger);
                // Univision Finish 31/10/01 Yusuf
            end;
        }
        field(50309; "Total Percentage"; Decimal)
        {
            trigger OnLookup()
            begin
                // Univision Start 31/10/01 Yusuf
                "Total Percentage" := 0;
                Larger := '>';
                Precision := 0.1;

                ttscore := "Skill Score" + "Performance Score";
                Result := "Skill Total" + "Performance Total";
                if Result > 0 then
                    "Total Percentage" := (ttscore / Result) * 100
                else
                    "Total Percentage" := 0;
                "Total Percentage" := Round("Total Percentage", Precision, Larger);
                // Univision Finish 31/10/01 Yusuf
            end;
        }
        field(50310; Cgrade; Code[2])
        {
        }
        field(50311; Cstep; Code[2])
        {
        }
        field(50312; Cedamount; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD(CGrp),
                                                                                      "Payslip Group ID" = CONST("GROSS PAY")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50313; CGrp; Code[10])
        {
        }
        field(50314; Rgrade; Code[2])
        {
            trigger OnValidate()
            begin
                if StrLen(Rgrade) = 1 then Rgrade := '0' + Rgrade;
                RGrp := GetGrp(Rgrade, Rstep);
            end;
        }
        field(50315; Rstep; Code[2])
        {
            trigger OnValidate()
            begin
                RGrp := GetGrp(Rgrade, Rstep);
                if StrLen(Rstep) = 1 then Rstep := '0' + Rstep;
            end;
        }
        field(50316; Redamount; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD(RGrp),
                                                                                      "Payslip Group ID" = CONST("GROSS PAY")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50317; RGrp; Code[10])
        {
            TableRelation = "Payroll-Employee Group Header.";

            trigger OnValidate()
            begin
                if EmpGrpT.Get(RGrp) then begin
                    Rgrade := EmpGrpT.Grade;
                    Rstep := EmpGrpT.Step;
                end;
            end;
        }
        field(50330; Agrade; Code[2])
        {
            trigger OnValidate()
            begin
                if StrLen(Agrade) = 1 then Agrade := '0' + Agrade;
                AGrp := GetGrp(Agrade, Astep);
            end;
        }
        field(50332; Astep; Code[2])
        {
            trigger OnValidate()
            begin
                if StrLen(Astep) = 1 then Astep := '0' + Astep;
                AGrp := GetGrp(Agrade, Astep);
            end;
        }
        field(50334; Aedamount; Decimal)
        {
            CalcFormula = Sum("Payroll-Employee Group Lines."."Default Amount" WHERE("Employee Group" = FIELD(AGrp),
                                                                                      "Payslip Group ID" = CONST("GROSS PAY")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50336; AGrp; Code[10])
        {
            trigger OnValidate()
            begin
                if EmpGrpT.Get(AGrp) then begin
                    Agrade := EmpGrpT.Grade;
                    Astep := EmpGrpT.Step;
                end;
            end;
        }
        field(50337; Date1; Date)
        {
        }
        field(50338; Date2; Date)
        {
        }
        field(50339; Date3; Date)
        {
        }
        field(50340; Date4; Date)
        {
        }
        field(50341; Date5; Date)
        {
        }
        field(50342; Date6; Date)
        {
        }
        field(50343; Date7; Date)
        {
        }
        field(50344; Date8; Date)
        {
        }
        field(50345; Date9; Date)
        {
        }
        field(50346; Skill1; Integer)
        {
        }
        field(50347; Skill2; Integer)
        {
        }
        field(50348; Skill3; Integer)
        {
        }
        field(50349; Skill4; Integer)
        {
        }
        field(50350; Skill5; Integer)
        {
        }
        field(50351; Skill6; Integer)
        {
        }
        field(50352; Skill7; Integer)
        {
        }
        field(50353; Skill8; Integer)
        {
        }
        field(50354; Skill9; Integer)
        {
        }
        field(50355; Performance1; Integer)
        {
        }
        field(50356; Performance2; Integer)
        {
        }
        field(50357; Performance3; Integer)
        {
        }
        field(50358; Performance4; Integer)
        {
        }
        field(50359; Performance5; Integer)
        {
        }
        field(50360; Performance6; Integer)
        {
        }
        field(50361; Performance7; Integer)
        {
        }
        field(50362; Performance8; Integer)
        {
        }
        field(50363; Performance9; Integer)
        {
        }
        field(50364; Tpercent1; Integer)
        {
        }
        field(50365; Tpercent2; Integer)
        {
        }
        field(50366; Tpercent3; Integer)
        {
        }
        field(50367; Tpercent4; Integer)
        {
        }
        field(50368; Tpercent5; Integer)
        {
        }
        field(50369; Tpercent6; Integer)
        {
        }
        field(50370; Tpercent7; Integer)
        {
        }
        field(50371; Tpercent8; Integer)
        {
        }
        field(50372; Tpercent9; Integer)
        {
        }
        field(50380; "Container Code"; Code[10])
        {
        }
        field(50381; "Seal No"; Code[15])
        {
        }
        field(50382; "Container Size"; Option)
        {
            OptionMembers = "20 Ft","40 Ft";
        }
        field(50383; "Vessel Name"; Text[30])
        {
        }
        field(50384; "Shipment Month"; Option)
        {
            OptionMembers = Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        }
        field(50385; "Total Qty"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE("Document Type" = FIELD("Document Type"),
                                                           "Document No." = FIELD("No.")));
            FieldClass = FlowField;
            TableRelation = Item.Inventory;
            Editable = false;
        }
        field(50386; "No. Of DN Printed"; Integer)
        {
        }
        field(50387; "Insert Offloading Charge"; Boolean)
        {
            trigger OnValidate()
            begin
                SalesSetup.Get();
                if "Insert Offloading Charge" then begin
                    SalesLine.SetRange(SalesLine."Document No.", "No.");
                    SalesLine.SetRange(SalesLine."Document Type", "Document Type");
                    SalesLine.SetFilter(SalesLine."No.", '%1', SalesSetup."Default Off Loading Account");
                    if SalesLine.FindLast() then begin
                        SalesLine.Validate(SalesLine."Unit Price", SalesSetup."Default Off Loading Charge");
                        SalesLine.Modify();
                    end else begin
                        SalesLine.Reset();
                        SalesLine.SetRange(SalesLine."Document No.", "No.");
                        SalesLine.SetRange(SalesLine."Document Type", "Document Type");
                        if SalesLine.FindLast() then
                            LineNo := SalesLine."Line No." + 10000
                        else
                            LineNo := 10000;
                        SalesLine.Init();
                        SalesLine.Validate(SalesLine."Document No.", "No.");
                        SalesLine.Validate(SalesLine."Document Type", "Document Type");
                        SalesLine."Line No." := LineNo;
                        SalesLine.Type := SalesLine.Type::"G/L Account";
                        SalesLine.Validate(SalesLine."No.", SalesSetup."Default Off Loading Account");
                        SalesLine.Validate(SalesLine."Unit Price", SalesSetup."Default Off Loading Charge");
                        SalesLine.Insert();
                    end;
                end;
            end;
        }
    }

    //Unsupported feature: Code Modification on "InitInsert(PROCEDURE 61)".

    //procedure InitInsert();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsHandled := false;
    OnBeforeInitInsert(Rec,xRec,IsHandled);
    if not IsHandled then
    #4..7

    OnInitInsertOnBeforeInitRecord(Rec,xRec);
    InitRecord;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10

    case "Document Type" of
      "Document Type"::Order:
        begin
          SalesSetup.Get;
          "Posting No. Series":=SalesSetup."Posted Exp. Invoice Nos.";
        end;
    end ;
    */
    //end;

    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 10)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetSalesSetup;
    IsHandled := false;
    OnBeforeInitRecord(Rec,IsHandled);
    #4..65

    "Posting Description" := Format("Document Type") + ' ' + "No.";

    UpdateOutboundWhseHandlingTime;

    "Responsibility Center" := UserSetupMgt.GetRespCenter(0,"Responsibility Center");
    "Doc. No. Occurrence" := ArchiveManagement.GetNextOccurrenceNo(DATABASE::"Sales Header","Document TypeSalesLine","No.");

    OnAfterInitRecord(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..68
    Reserve := Reserve::Optional;

    if InvtSetup.Get then
      Validate("Outbound Whse. Handling Time",InvtSetup."Outbound Whse. Handling Time");
    UpdateOutboundWhseHandlingTime;
    #71..74
    */
    //end;

    //Unsupported feature: Code Modification on "TestNoSeries(PROCEDURE 6)".

    //procedure TestNoSeries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetSalesSetup;
    IsHandled := false;
    OnBeforeTestNoSeries(Rec,IsHandled);
    #4..21
        "Document Type"::"Blanket Order":
          SalesSetup.TestField("Blanket Order Nos.");
      end;

    OnAfterTestNoSeries(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..24
    OnAfterTestNoSeries(Rec);
    */
    //end;

    //Unsupported feature: Code Modification on "CheckItemAvailabilityInLines(PROCEDURE 142)".

    //procedure CheckItemAvailabilityInLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesLine.SetRange("Document Type","Document Type");
    SalesLine.SetRange("Document No.","No.");
    SalesLine.SetRange(Type,SalesLine.Type::Item);
    SalesLine.SetFilter("No.",'<>%1','');
    SalesLine.SetFilter("Outstanding Quantity",'<>%1',0);
    OnCheckItemAvailabilityInLinesOnAfterSetFilters(SalesLine);
    if SalesLine.FindSet then
      repeat
        if ItemCheckAvail.SalesLineCheck(SalesLine) then
          ItemCheckAvail.RaiseUpdateInterruptedError;
      until SalesLine.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
       // IF ItemCheckAvail.SalesLineCheck(SalesLine) THEN
           ItemCheckAvail.RaiseUpdateInterruptedError;
      until SalesLine.Next = 0;
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: FSdailySale) (VariableCollection) on "GenerateFSDailySales(PROCEDURE 82)".

    //Unsupported feature: Variable Insertion (Variable: TransactionDate) (VariableCollection) on "GenerateFSDailySales(PROCEDURE 82)".

    //Unsupported feature: Variable Insertion (Variable: SalesRecLine) (VariableCollection) on "GenerateFSDailySales(PROCEDURE 82)".

    //Unsupported feature: Variable Insertion (Variable: FsdailyFilter) (VariableCollection) on "GenerateFSDailySales(PROCEDURE 82)".

    //Unsupported feature: Variable Insertion (Variable: LNO) (VariableCollection) on "GenerateFSDailySales(PROCEDURE 82)".

    //Unsupported feature: Property Modification (Name) on "DeferralHeadersExist(PROCEDURE 82)".

    //Unsupported feature: Code Modification on "DeferralHeadersExist(PROCEDURE 82)".

    //procedure DeferralHeadersExist();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    DeferralHeader.SetRange("Deferral Doc. Type",DeferralUtilities.GetSalesDeferralDocType);
    DeferralHeader.SetRange("Gen. Jnl. Template Name",'');
    DeferralHeader.SetRange("Gen. Jnl. Batch Name",'');
    DeferralHeader.SetRange("Document Type","Document Type");
    DeferralHeader.SetRange("Document No.","No.");
    exit(not DeferralHeader.IsEmpty);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    procedure GenerateFSDailySales()
    var
        FSdailySale: Record "Fish Shop Daily Sales";
        FSdailyFilter: Record "Fish Shop Daily Sales";
        SalesRecLine: Record "Sales Line";
        LNO: Integer;
        newprice: Decimal;
    begin
        LNO := 10000;
        FSdailySale.SetFilter(FSdailySale.Location, '%1', "Location Code");
        FSdailySale.SetFilter(FSdailySale.Processed, '%1', false);
        FSdailySale.SetFilter(FSdailySale."Transaction Date", '%1', "Document Date");
        FSdailySale.SetFilter(FSdailySale."Payment Type", '%1', "Payment Method Code");
        if FSdailySale.FindFirst() then
            repeat
                FsdailyFilter.CopyFilters(FSdailySale);
                FsdailyFilter.SetFilter(FsdailyFilter."Item No.", '%1', FSdailySale."Item No.");
                if FsdailyFilter.FindSet() then begin
                    FsdailyFilter.CalcFields(FsdailyFilter."Day Sale Qty", FsdailyFilter."Day Sale Value");
                    SalesRecLine.Init();
                    SalesRecLine."Document No." := "No.";
                    SalesRecLine."Document Type" := "Document Type";
                    SalesRecLine."Line No." := LNO;
                    SalesRecLine."Sell-to Customer No." := "Sell-to Customer No.";
                    SalesRecLine.Type := SalesRecLine.Type::Item;
                    SalesRecLine.Validate(SalesRecLine."No.", FsdailyFilter."Item No.");
                    SalesRecLine."Location Code" := FsdailyFilter.Location;
                    SalesRecLine.Validate(SalesRecLine.Quantity, FsdailyFilter."Day Sale Qty");
                    newprice := FSdailyFilter."Day Sale Value" / FSdailyFilter."Day Sale Qty";
                    if newprice > SalesRecLine."Unit Price" then
                        SalesRecLine.Validate(SalesRecLine."Unit Price", newprice);
                    SalesRecLine.Validate(SalesRecLine."Line Amount", FsdailyFilter."Day Sale Value");
                    SalesRecLine.Validate(SalesRecLine."Shipment Date", FsdailyFilter."Transaction Date");
                    SalesRecLine.Insert(true);
                    FsdailyFilter.ModifyAll(FsdailyFilter.Processed, true);
                end;
                LNO := LNO + 10000;
            until FSdailySale.Next() = 0;
    end;

    procedure DeferralHeadersExist1(): Boolean
    var
        DeferralHeader: Record "Deferral Header";
        DeferralUtilities: Codeunit "Deferral Utilities";
    begin
        DeferralHeader.SetRange("Deferral Doc. Type", DeferralUtilities.GetSalesDeferralDocType());
        DeferralHeader.SetRange("Gen. Jnl. Template Name", '');
        DeferralHeader.SetRange("Gen. Jnl. Batch Name", '');
        DeferralHeader.SetRange("Document Type", "Document Type");
        DeferralHeader.SetRange("Document No.", "No.");
        exit(not DeferralHeader.IsEmpty);
    end;

    procedure GetGrp(grade: Code[10]; step: Code[10]) Grp: Code[10]
    begin
        Grp := StaffType + grade + step;
    end;

    procedure ValidateQuantity()
    var
        SalesLine: Record "Sales Line";
    begin
        SalesLine.SetRange(SalesLine."Document No.", rec."No.");
        SalesLine.SetRange(SalesLine."Document Type", rec."Document Type");
        if SalesLine.FindFirst() then
            repeat
                SalesLine.validate(SalesLine.Quantity);
                SalesLine.Modify();
            until SalesLine.Next() = 0;
    end;
    //Unsupported feature: Deletion (VariableCollection) on "DeferralHeadersExist(PROCEDURE 82).DeferralHeader(Variable 1000)".

    //Unsupported feature: Deletion (VariableCollection) on "DeferralHeadersExist(PROCEDURE 82).DeferralUtilities(Variable 1001)".

    //Unsupported feature: Property Modification (Id) on "RecreateSalesLinesCancelErr(Variable 1104)".

    //var
    //>>>> ORIGINAL VALUE:
    //RecreateSalesLinesCancelErr : 1104;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //RecreateSalesLinesCancelErr : 1204;
    //Variable type has not been exported.

    var
        EmpGrpT: Record "Payroll-Employee Group Header.";
        ttscore: Decimal;
        Result: Decimal;
        Precision: Decimal;
        Larger: Text[30];
        StaffType: Code[1];
        Rgrade: Code[2];
        Agrade: Code[2];
        Rstep: Code[2];
        Astep: Code[2];
        RGrp: Code[10];
        LineNo: Integer;
        SalesSetup: record "Sales & Receivables Setup";
        SalesLine: Record "Sales Line";
}
