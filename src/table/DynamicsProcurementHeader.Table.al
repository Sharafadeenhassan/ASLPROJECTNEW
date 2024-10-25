table 50053 "Dynamics Procurement Header"
{
    Caption = 'Dynamics Procurement Header';
    fields
    {
        field(1; "DPS No."; Code[20])
        {
            trigger OnValidate()
            begin
                if "DPS No." <> xRec."DPS No." then begin
                    InventSetup.Get();
                    NoSeriesMgt.TestManual(InventSetup."DPS No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Process Date"; Date)
        {
        }
        field(3; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;
            InitValue = 'GNRL ASL';
        }
        field(4; "Item Filter"; Text[50])
        {
            TableRelation = Item."No.";
            ValidateTableRelation = false;
        }
        field(5; "Inventory Group Filter"; Text[50])
        {
            TableRelation = "Inventory Posting Group";
            ValidateTableRelation = false;
        }
        field(6; "Gen. Product Posting Group"; Text[50])
        {
            TableRelation = "Gen. Product Posting Group".Code;
            ValidateTableRelation = false;
        }
        field(7; "Maxmum Order Period"; DateFormula)
        {
            Caption = 'Maximum Order Period';
        }
        field(8; "Process By"; Code[20])
        {
            Caption = 'Store Approved By';
            TableRelation = "User Setup"."User ID";
        }
        field(9; "Process By Name"; Text[50])
        {
            Caption = 'Store Approved By Name';
        }
        field(10; "Base Date"; Date)
        {
        }
        field(11; "Update Record"; Boolean)
        {
            trigger OnValidate()
            begin
                TestField("Base Date");
                TestField("Maxmum Order Period");
                TestField(Processed, false);
            end;
        }
        field(12; Processed; Boolean)
        {
            Caption = 'Store Approved';
            trigger OnValidate()
            begin
                if "Return To For Process" <> UserId then Error('This Document is not for you to Process');
                TestField(Approved, true);
                //xRec.TestField(xRec.Processed,false);
                if Processed then begin
                    "Process By Name" := UserId;
                    "Process By" := UserId;
                    "Process Date" := Today;
                    UpdatePurReq();
                end else begin
                    "Process By Name" := '';
                    "Process Date" := 0D;
                end;
            end;

        }
        field(13; "Location Filter"; Code[20])
        {
            TableRelation = Location.Code;
            ValidateTableRelation = false;
            Caption = 'Location Code';
        }
        field(14; "Suggest Items"; Boolean)
        {
            Caption = 'Suggest Items';
            trigger OnValidate()
            begin
                if "Suggest Items" then begin
                    DPSLine.SetRange(DPSLine."DPS Code", "DPS No.");
                    TestField("Base Date");
                    if DPSLine.FindSet() then Error('DPS Line(s) already EXISTS');
                    if "Item Filter" <> '' then
                        ItemRec.SetFilter(ItemRec."No.", '%1', "Item Filter");
                    if "Gen. Product Posting Group" <> '' then
                        ItemRec.SetFilter(ItemRec."Gen. Prod. Posting Group", '%1', "Gen. Product Posting Group");
                    if "Inventory Group Filter" <> '' then
                        ItemRec.SetFilter(ItemRec."Inventory Posting Group", '%1', "Inventory Group Filter");
                    if ItemRec.FindFirst() then
                        repeat
                            LineNo := LineNo + 1000;
                            DPSLine.Init();
                            DPSLine."DPS Code" := "DPS No.";
                            DPSLine."Line No." := LineNo;
                            DPSLine."Base Date" := "Base Date";
                            DPSLine."Location Code" := "Location Code";
                            DPSLine.Validate(DPSLine."Item No.", ItemRec."No.");
                            DPSLine.Insert();
                        until ItemRec.Next() = 0;
                end;
            end;
        }
        field(15; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(16; "Send For Approval"; Boolean)
        {
            trigger OnValidate()
            begin
                //TestField("Location Code");
                TestField("Req Department");
                if "Send For Approval" = true then begin
                    "Send For Approval By" := UserId;
                    "Send for Approval Time" := CurrentDateTime;
                end else begin
                    "Send For Approval By" := '';
                    "Send for Approval Time" := 0DT;
                end;
            end;
        }
        field(17; "Send For Approval By"; Text[80])
        {
        }
        field(18; Approved; Boolean)
        {
            trigger OnValidate()
            begin
                TestField("Send For Approval", true);
                if "Sent To For Approval" <> UserId then Error('This Document is not for your Approval');

                DPSLine.SetRange(DPSLine."DPS Code", rec."DPS No.");
                DPSLine.SetFilter(DPSLine."HOD Approved Qty", '<=%1', 0);
                if DPSLine.FindSet() then Error('Line(s) without HOD Approved Quantity Exist Please Input Quantity or Delete Line to Continue');
                if Approved then begin
                    //
                    "Approved By" := UserId;
                    "Approved Time" := CurrentDateTime;
                    "Return Time" := CurrentDateTime;
                    if DPSRec.Get(rec."DPS No.") then begin
                        DPSRec.SetRange(DPSRec."DPS No.", Rec."DPS No.");

                        DPSRec.SetRecFilter();
                        MdAppRep.SetTableView(DPSRec);
                        MdAppRep.UseRequestPage(true);
                        MdAppRep.Run();
                    end;
                    //Report.run(50219,true,true,rec);
                end else begin
                    "Approved By" := '';
                    "Approved Time" := 0DT;
                end;
            end;
        }
        field(19; "Approved By"; Text[80])
        {

        }
        field(20; "Approved Time"; DateTime)
        {
        }
        field(21; "Send for Approval Time"; DateTime)
        {
        }
        field(22; "Sent To For Approval"; Code[50])
        {
            TableRelation = "User Setup"."User ID" where("Store Req 1st Approval" = const(true),
                                                "Shortcut Dimension 1 Code"=field("Req Department"));
        }
        field(23; Supplier; Code[20])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if VendRec.Get(Supplier) then
                    "Supplier Name" := VendRec.Name
                else
                    "Supplier Name" := '';
            end;
        }
        field(24; "Supplier Name"; Text[50])
        {
        }
        field(25; "Return To For Process"; Code[20])
        {
            Caption = 'For Store Approval';
            TableRelation = "User Setup"."User ID" where("Store Req Final Approval" = const(true));

            trigger OnValidate()
            begin
                //UserRec.SetRange(UserRec."User Name", "Return To For Process");
                UserSecID := Database.UserSecurityId();
                if UserRec.get(UserSecID) then
                    "Return To Name" := UserRec."Full Name"
                else
                    "Return To Name" := '';
            end;
        }
        field(26; "Return To Name"; Text[50])
        {
            caption = 'Store Approved Name';
        }
        field(27; "Return Time"; DateTime)
        {
            Caption = 'Store Approved Time';
        }
        field(28; "Approved Line items"; Integer)
        {
            CalcFormula = Count("Dynamics Procurement Register" WHERE(Approved = CONST(true),
                                                                       "DPS Code" = FIELD("DPS No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Total Line Items"; Integer)
        {
            CalcFormula = Count("Dynamics Procurement Register" WHERE("DPS Code" = FIELD("DPS No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Unapproved Line Items"; Integer)
        {
            CalcFormula = Count("Dynamics Procurement Register" WHERE(Approved = CONST(false),
                                                                       "DPS Code" = FIELD("DPS No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Req Department"; code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(32; "Average Consumption Base"; Option)
        {
            OptionMembers = " ","1M","3M","6M","1Y","2Y","3Y","4Y","5Y";
            OptionCaption = ' ,1Month,3Months,6Months,1Year,2Years,3Years,4Years,5Years';
        }
        field(33; "Send to StoreKeeper"; Code[30])
        {
            TableRelation = "User Setup"."User ID" where(StoreKeeper = const(true));
        }
        field(34; "Requisition Date"; Date)
        {
        }
        Field(35; "DPS Completed";Boolean)
        {

        }


    }

    keys
    {
        key(Key1; "DPS No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "DPS No." = '' then begin
            InventSetup.Get();
            InventSetup.TestField("DPS No. Series");
            NoSeriesMgt.InitSeries(InventSetup."DPS No. Series", xRec."No. Series", 0D, "DPS No.", "No. Series");
        end;
        "Base Date" := Today;
    end;

    var
        ItemRec: Record Item;
        DPSLine: Record "Dynamics Procurement Register";
        LineNo: Integer;
        InventSetup: Record "Inventory Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserRec: Record User;
        Text0001: Label 'Purchase Order No. ''%1'' has been Created for %2 ';
        VendRec: Record Vendor;
        UserSecID: Guid;
        DPSRec: Record "Dynamics Procurement Header";
        MdAppRep: Report "DPS Request List";

    //[Scope('OnPrem')]
    procedure AssistEdit(OldDPS: Record "Dynamics Procurement Header"): Boolean
    var
        DPSRec: Record "Dynamics Procurement Header";
    begin
        DPSRec := Rec;
        InventSetup.Get();
        InventSetup.TestField(InventSetup."DPS No. Series");
        if NoSeriesMgt.SelectSeries(InventSetup."DPS No. Series", OldDPS."No. Series", DPSRec."No. Series") then begin
            NoSeriesMgt.SetSeries(DPSRec."DPS No.");
            Rec := DPSRec;
            exit(true);
        end;
    end;

    // [Scope('OnPrem')]
    procedure CreatePurchInv()
    var
        LineNo: Integer;
        noseriesmgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        PurchSetup: Record "Purchases & Payables Setup";
        PurchInv: Record "Purchase Header";
        PurchInvLine: Record "Purchase Line";
        ReqLines: Record "Dynamics Procurement Register";
        UserRec: Record User;
    begin
        UserSecID := Database.UserSecurityId();
        if UserRec.Get(UserSecID) then;
        ReqLines.SetRange(ReqLines."Supply by", Supplier);
        ReqLines.SetFilter(ReqLines."Approved Order Quantity", '<>%1', 0);
        ReqLines.SetFilter(ReqLines.processed, '%1', false);
        if not ReqLines.FindSet() then
            Error('Notting To Process. No Line(s) is Ready for Process')
        else begin
            PurchSetup.Get();
            DocNo := noseriesmgt.GetNextNo(PurchSetup."Order Nos.", Today, true);
            PurchInv.Init();
            PurchInv."Document Type" := PurchInv."Document Type"::Order;
            PurchInv.Validate(PurchInv."No.", DocNo);
            PurchInv.Insert(true);
            PurchInv.Validate("Posting Date", Today);
            PurchInv.Validate(PurchInv."Buy-from Vendor No.", ReqLines."Supply by");
            PurchInv."Posting Description" := 'Supply Request from DPS ' + "DPS No.";
            PurchInv."Your Reference" := "DPS No.";
            PurchInv."Purchase Order Req. No" := "DPS No.";
            PurchInv."Order Date" := "Base Date";

            PurchInv.Modify();

            LineNo := 0;
            if ReqLines.FindSet() then
                repeat
                    LineNo += 10000;
                    PurchInvline."Document Type" := PurchInvline."Document Type"::Order;
                    PurchInvline."Document No." := DocNo;
                    PurchInvline."Line No." := LineNo;
                    PurchInvline.Insert(true);
                    PurchInvline.Validate(PurchInvline.Type, PurchInvline.Type::Item);
                    PurchInvline."Location Code" := ReqLines."Location Code";
                    PurchInvline.Validate("No.", ReqLines."Item No.");
                    PurchInvline.Validate(Quantity, ReqLines."Approved Order Quantity");
                    //PurchInvline.VALIDATE(PurchInvline."Direct Unit Cost",ReqLines."Unit Price");
                    //PurchInvline.VALIDATE(PurchInvline."Expected Receipt Date",TODAY);
                    PurchInvline.Modify();
                    ReqLines.processed := true;
                    UserSecID := DATABASE.UserSecurityId();
                    if UserRec.Get(UserSecID) then
                        ReqLines."process By" := UserRec."Full Name";
                    //ReqLines."Processed Date":= CURRENTDATETIME;
                    ReqLines."Order No." := DocNo;
                    ReqLines.Modify();
                until ReqLines.Next() = 0;
            Message(Text0001, DocNo, ReqLines."Supplier Name");
        end;
    end;

    procedure UpdatePurReq()
    var
        Purcreq: Record "Purchase Requisition1";
        DPSRec: Record "Dynamics Procurement Register";
        Purchreq: Record "Purchase Requisition1";
        "LineNo.": Integer;
    begin
        DPSRec.SetRange(DPSRec."DPS Code", "DPS No.");
        DPSRec.SetFilter(DPSRec.Approved, '%1', true);
        DPSRec.SetFilter(DPSRec.processed, '%1', false);
        DPSRec.SetRange(DPSRec."Process Mode", DPSRec."Process Mode"::"Purch. Req. Systems");
        if Purchreq.FindLast() then "LineNo." := Purchreq."Puch.Req Line No.";
        if DPSRec.FindFirst() then
            repeat
                "LineNo." += 10000;
                Purcreq.Init();
                Purcreq.Validate(Purcreq."Req No.", DPSRec."DPS Code");
                Purcreq.Validate(Purcreq."Item No.", DPSRec."Item No.");
                Purcreq.Description := DPSRec.Description;
                Purcreq."Req. Line No." := DPSRec."Line No.";
                Purcreq."Req Location" := DPSRec."Location Code";
                Purchreq."Req. By" := "Approved By";
                Purchreq."Req. Date" := "Approved Time";
                Purcreq.Quantity := DPSRec."Approved Order Quantity";
                Purcreq."Req Department" := rec."Req Department";
                Purcreq."Puch.Req Line No." := "LineNo.";
                DPSRec.Validate(DPSRec.processed, true);
                Purchreq."Store Manager" := rec."Process By";
                Purcreq.Insert();
                DPSRec."Order No." := 'PurchReg';
                DPSRec.Modify();
            until DPSRec.Next() = 0;
    end;

}
