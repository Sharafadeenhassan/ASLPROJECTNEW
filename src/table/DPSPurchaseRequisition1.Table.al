table 50045 "Purchase Requisition1"
{
    Caption = 'Purchase Requisition1';
    DrillDownPageID = "Purchase Request List";
    LookupPageID = "Purchase Request List";

    fields
    {
        field(1; "Req No."; Code[20])
        {
            TableRelation = "Dynamics Procurement Header"."DPS No.";
            ValidateTableRelation = false;
        }
        field(2; "Req Department"; Code[20])
        {
        }
        field(3; "Req Location"; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(4; "Item No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                if ItemRec.Get("Item No.") then
                    Description := ItemRec.Description;
                PPI.SetCurrentKey(PPI."Posting Date");
                PPI.SetFilter(PPI."No.", '%1', "Item No.");
                
                if PPI.FindLast() then begin
                    "Last Price1" := PPI."Unit Cost (LCY)";
                    "LPrice1 Date" := PPI."Posting Date";
                    "LPrice1 InvoiceNo" := PPI."Document No.";
                    PPI.Next(-1);
                    "Last Price2" := PPI."Unit Cost (LCY)";
                    "LPrice2 Date" := PPI."Posting Date";
                    "LPrice2 InvoiceNo" := PPI."Document No.";
                    PPI.Next(-1);
                    "Last Price3" := PPI."Unit Cost (LCY)";
                    "LPrice3 Date" := PPI."Posting Date";
                    "LPrice3 InvoiceNo" := PPI."Document No.";
                    PPI.Next(-1);
                end;
            end;
        }
        field(5; Description; Text[250])
        {
            Editable = false;
        }
        field(6; Quantity; Decimal)
        {
            Editable = false;
        }
        field(7; "Unit Price"; Decimal)
        {
            
            trigger OnValidate()
            begin
                if Process then error('You cannot change Unit Price after processing');
                if "Unit Price" < 0 then Error('Negative Price Not Allowed');
            end;
        }
        field(8; "Req. By"; Code[20])
        {
        }
        field(9; "Req. By Name"; Text[50])
        {
        }
        field(10; "Req. Date"; DateTime)
        {
        }
        field(11; "Req. Proc. Date"; Date)
        {
        }
        field(12; "Supply By"; Code[20])
        {
            TableRelation = Vendor."No.";
            trigger OnValidate()
            begin
                if VendRec.Get("Supply By") then
                    "Supplier Name" := VendRec.Name;
            end;
        }
        field(13; "Supplier Name"; Text[50])
        {
        }
        field(14; "Req. Line No."; Integer)
        {
        }
        field(15; "Sent to Security"; Boolean)
        {
            trigger OnValidate()
            begin
                TestField("Security Check By");
            end;
        }
        field(16; "Security Check By"; Code[20])
        {
            TableRelation = "User Setup"."User ID" where("Allow DPS Security Check" = const(true));
        }
        field(17; "Security Check Time"; DateTime)
        {
        }
        field(18; "Security Check Quantity"; Decimal)
        {
            
            trigger OnValidate()
            begin
                
                if ("Security Check Quantity" > Quantity) or ("Security Check Quantity" < 0) then
                    Error('Excess Supply or Negative Quantity Not Allowed')
                else
                    "Shortage Supplied  Quantity" := Quantity - "Security Check Quantity";
            end;
        }
        field(19; "QCC Check"; Boolean)
        {
            trigger OnValidate()
            begin
                //TestField("QCC Check  By");
                if UserId <> "QCC Check  By" then error('You are Not allowed Check this Product');
                UserRec.SetCurrentKey("User Name");
                UserRec.SetRange("User Name", "QCC Check  By");
                if UserRec.FindSet() then
                    "QCC Check  Name" := UserRec."Full Name";
                "QCC Check Time" := CurrentDateTime;
            end;
        }
        field(20; "QCC Check  By"; Code[20])
        {
            TableRelation = "User Setup"."User ID" where("Allowed DPS QC Check" = const(true));
        }
        field(21; "QCC Check  Name"; Text[50])
        {
        }
        field(22; "QCC Check Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                if ("QCC Check Quantity" > "Security Check Quantity")  or ("QCC Check Quantity" < 0) then
                    Error('Quantity More than Security Checked Quantity or Negative Quantity Not Allowed')
                else
                    "QCC Rejected Quantity" := "Security Check Quantity" - "QCC Check Quantity";
            end;
        }
        field(23; "QCC Check Time"; DateTime)
        {
        }
        field(24; Process; Boolean)
        {
            trigger OnValidate()
            begin
                if process then begin
                    TestField("Supply By");
                    "Process By" := UserId;
                  if  UserRec.get(UserSecurityId) then
                        "Process By Name" := UserRec."Full Name";
                    "Process Time" := CurrentDateTime;
                end;
            end;
        }
        field(25; "Process By"; Code[20])
        {
            TableRelation = "User Setup"."User ID" where("Allow DPS Store Process" = const(true));
        }
        field(26; "Process By Name"; Text[50])
        {
        }
        field(27; "Invoice No."; Code[20])
        {
            Caption = 'Purchase Order No';
        }
        field(28; "Last Price1"; Decimal)
        {
        }
        field(29; "Last Price2"; Decimal)
        {
        }
        field(30; "Last Price3"; Decimal)
        {
        }
        field(31; "LPrice1 InvoiceNo"; Code[20])
        {
            TableRelation = "Purch. Inv. Header"."No.";
        }
        field(32; "LPrice1 Date"; Date)
        {
        }
        field(33; "LPrice2 InvoiceNo"; Code[20])
        {
            TableRelation = "Purch. Inv. Header"."No.";
        }
        field(34; "LPrice2 Date"; Date)
        {
        }
        field(35; "LPrice3 InvoiceNo"; Code[20])
        {
            TableRelation = "Purch. Inv. Header"."No.";
        }
        field(36; "LPrice3 Date"; Date)
        {
        }
        field(37; "Security checked"; Boolean)
        {
            trigger OnValidate()
            begin
                if UserId <> "Security Check By" then error('You are Not Assigned for this Product Checking');
                UserRec.SetCurrentKey("User Name");
                UserRec.SetRange("User Name", "Security Check By");
                if UserRec.FindSet() then
                    "Security Checked By Name" := UserRec."Full Name";
                "Security Check Time" := CurrentDateTime;
            end;
        }
        field(38; "Security Checked By Name"; Text[50])
        {
        }
        field(39; "Security Comment"; Text[100])
        {
        }
        field(40; "QCC Comment"; Text[100])
        {
        }
        field(41; "Sent For QCC"; Boolean)
        {
            trigger OnValidate()
            begin
                TestField("Security checked");
                TestField("Security Check Quantity");
                TestField("QCC Check  By");
            end;
        }
        field(42; "Procurement Mgr. Action"; Option)
        {
            OptionCaption = ' ,Approved,Returned,On Hold';
            OptionMembers = " ",Approved,Returned,"On Hold";

            trigger OnValidate()
            begin
                if "Procurement Mgr. Action" = "Procurement Mgr. Action"::Approved then
                    "Fully Supply" := "QCC Check Quantity" = Quantity
                else
                    "Fully Supply" := false;

            end;
        }
        field(43; "QCC Rejected Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                if "QCC Rejected Quantity" > "Security Check Quantity" then 
                Error('You Cannot reject more than Security Check-In Quantity');
            end;
        }
        field(44; "Quantity To Return"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Quantity To Return" < "QCC Rejected Quantity" then begin
                    if not Confirm('The Quantity to Return is Not the same as Rejected Quantity. Continue to Return', false) then
                        Error('Please Check the Qcc Rejected Quantity');
                end else
                    if "Quantity To Return" > "QCC Rejected Quantity" then Error('You can not Return more than Qcc Rejected Quantity');
            end;
        }
        field(45; "Shortage Supplied  Quantity"; Decimal)
        {
        }
        field(46; "Return to Security"; Boolean)
        {
            trigger OnValidate()
            begin
                
            end;
        }
        field(47; "Security Returned"; Boolean)
        {
            trigger OnValidate()
            begin
                if not Confirm('Hope You have Printed the Waybill', false) then
                    Error('Please make sure you Update Quantity to return for all line then Print Waybill');
                "Retuned Date" := CurrentDateTime;
                UserRec.SetRange("User Name", UserId);
                if UserRec.FindSet() then
                    "Security Return Name" := UserRec."Full Name";
            end;
        }
        field(48; "Security Return Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Security Return Quantity" <> "Quantity To Return" then
                    Error('Please put correct Quantity to Return');
            end;
        }
        field(49; "Process Time"; DateTime)
        {
        }
        field(50; "Retuned Date"; DateTime)
        {
        }
        field(51; "Security Return by"; Code[20])
        {
        }
        field(52; "Security Return Name"; Text[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(53; Printed; Boolean)
        {
        }
        field(54; "Awaiting Supply"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Awaiting Supply" then
                    TestField("Fully Supply", false);
            end;
        }
        field(55; "Puch.Req Line No."; Integer)
        {
        }
        field(56; "Fully Supply"; Boolean)
        {
        }
        field(57; "Sent For Store Mgr Action"; Boolean)
        {
            trigger OnValidate()
            begin
                TestField("QCC Check");
                TestField("Store Manager");
                "Time Sent for Store Action" := CurrentDateTime;
            end;
        }
        field(58; "Time Sent for Store Action"; DateTime)
        {
            Editable = false;
        }
        field(59;"Send To StoreKeeper";Code[30])
        {
            TableRelation = "User Setup" where(StoreKeeper = const(true));
        }
        field(60;"Store Manager";code[30])
        {
            TableRelation = "User Setup"."User ID" where(StoreKeeper = const(true));
        }

    }

    keys
    {
        key(Key1; "Req No.", "Req. Line No.", "Puch.Req Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Description)
        {
        }
    }

    var
        PPI: Record "Purch. Inv. Line";
        ItemRec: Record Item;
        UserRec: Record User;
        Text0001: Label 'Purchase Invoice No %1 has been Raised for %2';
        VendRec: Record Vendor;

    [Scope('OnPrem')]
    procedure CreatePurchInv()
    var
        LineNo: Integer;
        noseriesmgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        PurchSetup: Record "Purchases & Payables Setup";
        PurchInv: Record "Purchase Header";
        PurchInvLine: Record "Purchase Line";
        ReqLines: Record "Purchase Requisition1";
        DPSLine : Record "Dynamics Procurement Register";
        UserRec: Record User;
        PODate: Date;
        ReqPODate:Date;
    begin
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindFirst() then;

        ReqLines.SetRange(ReqLines."Supply By", rec."Supply By");
        ReqLines.SetFilter(ReqLines."QCC Check Quantity", '<>%1', 0);
        ReqLines.SetFilter(ReqLines."QCC Check", '%1', true);
        ReqLines.SetFilter(ReqLines.Process, '%1', true);
        ReqLines.SetFilter(ReqLines."Invoice No.",'%1','');
        if not ReqLines.FindSet() then
            Error('Notting To Process. No Line(s) is Ready for Process')
        else begin
        PODate := DT2Date(rec."Security Check Time");
            PurchSetup.Get();
            DocNo := noseriesmgt.GetNextNo(PurchSetup."Order Nos.", PODate, true);
            PurchInv.Init();
            PurchInv."Document Type" := PurchInv."Document Type"::Order;
            PurchInv.Validate(PurchInv."No.", DocNo);
            PurchInv.Validate("Posting Date", PODate);
            PurchInv.Validate(PurchInv."Buy-from Vendor No.", "Supply By"); 
            PurchInv.Insert(true);
            if Description = '' then 
            PurchInv."Posting Description" := 'DPS Order for '+ "Req No." 
            else        
            PurchInv."Posting Description" := Description;
            PurchInv."Your Reference" := "Req No.";
            //PurchInv."Purchase Order Req. No" := "Req No.";
            PurchInv."DPS No." := "Req No.";
            PurchInv."Req Locked" := true;
            PurchInv."Order Date" := "Req. Proc. Date";

            LineNo := 0;
            if ReqLines.FindSet() then
                repeat
                ReqPODate := DT2Date(ReqLines."Security Check Time");
                if ReqPODate =PODate then begin
                    LineNo += 10000;
                    PurchInvLine."Document Type" := PurchInvLine."Document Type"::Order;
                    PurchInvLine."Document No." := DocNo;
                    PurchInvLine."Line No." := LineNo;
                    PurchInvLine.Insert(true);
                    PurchInvLine.Validate(PurchInvLine.Type, PurchInvLine.Type::Item);
                    PurchInvLine."Location Code" := ReqLines."Req Location";
                    PurchInvLine.Validate("No.", ReqLines."Item No.");
                    PurchInvLine.Validate(Quantity, ReqLines."QCC Check Quantity");
                    PurchInvLine.Validate(PurchInvLine."Direct Unit Cost", ReqLines."Unit Price");
                    PurchInvLine."External Document No." := ReqLines."Req No.";
                    //PurchInvLine.Description := (ReqLines.Description + ' '+ ReqLines."Req No.");
                    PurchInvLine."DPS No." := ReqLines."Req No.";
                    PurchInvLine."DPS Line No" := ReqLines."Req. Line No.";
                    PurchInvLine."Req Locked" := true;
                    //PurchInvLine.VALIDATE(PurchInvLine."Expected Receipt Date",TODAY);
                    PurchInvLine.Modify();
                    //ReqLines.Process := true;
                    UserRec.SetRange("User Name", UserId);
                    if UserRec.FindSet() then
                        ReqLines."Process By Name" := UserRec."Full Name";
                    ReqLines."Process Time" := CurrentDateTime;
                    ReqLines."Invoice No." := DocNo;
                    ReqLines.Modify();
                    if DPSLine.get(ReqLines."Req No.",ReqLines."Req. Line No.") then
                    begin
                    DPSLine."Order No." := DocNo;
                    DPSLine.Modify()
                    end;
                end;
                until ReqLines.Next() = 0;
            "Invoice No." := DocNo;
            PurchInv.Modify();
            Message(Text0001, DocNo, "Supplier Name");
        end;
    end;
    trigger OnModify()
    begin
        TestField("Invoice No.",'');
    end;
}