table 50051 ShopHeader
{
    Caption = 'ShopHeader';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Shop Code"; Code[20])
        {
            Caption = 'Shop Code';
            Description = 'This is the same as Location Cade';
            TableRelation = "Shop Setup"."Shop Code";
        }
        field(2; "Invoice No."; Code[20])
        {
            Caption = 'Invoice/Receipt No.';
            trigger OnValidate()
            begin
                if "Invoice No." <> xRec."Invoice No." then begin
                    ShopSetup.Get("Shop Code", "Terminal No.");
                    NoSeriesMgt.TestManual(ShopSetup."Invoice Nos");
                    "No. Series" := '';
                end;
                "Posting Date" := Today;
            end;
        }
        field(3; "Posting date"; Date)
        {
            Caption = 'Posting date';
            Description = 'Transaction Date';
        }
        field(4; "Cashier Code"; Code[20])
        {
            Caption = 'Cashier Code';
            Description = 'Cashier Name / Code';
            TableRelation = "User Setup"."User ID";
            Editable = false;
        }
        field(5; "Invoice Total"; Decimal)
        {
            Caption = 'Invoice Total';
            FieldClass = FlowField;
            CalcFormula = Sum("Shop Lines"."Line Amount" WHERE("Invoice No." = field("Invoice No.")));
            Editable = false;

        }
        field(6; "Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            FieldClass = FlowField;
            CalcFormula = Sum("Shop Lines".Discount WHERE("Invoice No." = field("Invoice No.")));
            Editable = false;

        }
        field(7; "Amount Due"; Decimal)
        {
            Caption = 'Amount Due';
            Description = 'Invoice Total Less Discount';
            FieldClass = FlowField;
            CalcFormula = Sum("Shop Lines"."Line Amount Due" WHERE("Invoice No." = field("Invoice No.")));
            Editable = false;

        }
        field(8; "Amount Paid"; Decimal)
        {
            Caption = 'Amount Paid';
            Description = 'Amount Given to Cashier (In Case of Cash Payment any Excess goes to Change due)';
        }
        field(9; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            Description = 'This is only required for Credit Customer';
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                if CustRec.get("Customer No.") then begin
                    Rec."Customer Name" := CustRec.Name;
                    "Price Group" := CustRec."Customer Price Group";
                end;
            end;
        }
        field(10; PayMode; Option)
        {
            Caption = 'PayMode';
            OptionMembers = Cash,Transfer,Value,Multiple,Credit;

            trigger OnValidate();
            begin
                ShopSetup.Get("Shop Code", "Terminal No.");
                case
                    PayMode of
                    0:
                        begin
                            "Transfer Pay" := 0;
                            "Transfer Device" := '';
                            "Value card" := 0;
                            "Value device" := '';
                            rec.Validate(rec."Customer No.", ShopSetup."Cash Customer Acct");
                        end;
                    1:
                        begin
                            "Cash Pay" := 0;
                            "Cash Device" := '';
                            "Value card" := 0;
                            "Value device" := '';
                            rec.Validate(rec."Customer No.", ShopSetup."Cash Customer Acct");

                        end;
                    2:
                        begin
                            "Transfer Pay" := 0;
                            "Transfer Device" := '';
                            "Cash Pay" := 0;
                            "Cash device" := '';
                            rec.Validate(rec."Customer No.", ShopSetup."Value Customer Acct");
                        end;
                    3:
                        begin
                            rec.Validate(rec."Customer No.", ShopSetup."Multiple Pay Customer Acct");
                        end;
                    4:
                        begin

                            if not "Credit Cash" then begin
                                "Transfer Pay" := 0;
                                "Transfer Device" := '';
                                "Value card" := 0;
                                "Value device" := '';
                                "Cash Pay" := 0;
                                "Cash Device" := '';
                            end;
                            Message('Remember to Specify the Credit Customer Account');
                        end;
                end;
            end;
        }
        field(11; "General Device"; code[20])
        {
            Caption = 'General Device';
            Description = 'Default Pay Device to Accommodate Credit and Multiple Pay Invoice';
            TableRelation = "Shop Payment Mode".Code where("Fish Shop Code" = field("Shop Code"), "Payment Mode" = field(PayMode));

            trigger OnValidate()
            var
                PayRec: Record "Shop Payment Mode";
            begin
                PayRec.Get("General Device", "Shop Code");
                case
                    PayMode of
                    0:
                        begin
                            PayRec.TestField("Payment Mode", 0);
                            rec.Validate("Cash Device", "General Device");
                        end;
                    1:
                        begin
                            PayRec.TestField("Payment Mode", 1);
                            rec.Validate("Transfer Device", "General Device");
                        end;
                    2:
                        begin
                            PayRec.TestField("Payment Mode", 2);
                            rec.Validate("Value Device", "General Device");
                        end;
                end;
            end;
        }
        field(12; "Cash Pay"; Decimal)
        {
            Caption = 'Cash Pay';
            trigger OnValidate()
            begin
                TestField("Cash Device");
                rec.Validate(Paid);
            end;

        }
        field(13; "Transfer Pay"; Decimal)
        {
            Caption = 'Transfer Pay';
            trigger OnValidate()
            begin
                TestField("Transfer Device");
                rec.Validate(Paid);
            end;
        }
        field(14; "Value card"; Decimal)
        {
            Caption = 'Value card';
            trigger OnValidate()
            begin
                TestField("Value Device");
                rec.Validate(Paid);
            end;
        }
        field(15; "Cash Device"; Code[20])
        {
            Caption = 'Cash Device';
            TableRelation = "Shop Payment Mode".code where("Payment Mode" = const(0), "Fish Shop Code" = field("Shop Code"));

        }
        field(16; "Transfer Device"; Code[20])
        {
            Caption = 'Transfer Device';
            TableRelation = "Shop Payment Mode".code where("Payment Mode" = const(1), "Fish Shop Code" = field("Shop Code"));

        }
        field(17; "Value device"; Code[20])
        {
            Caption = 'Value device';
            TableRelation = "Shop Payment Mode".code where("Payment Mode" = const(2), "Fish Shop Code" = field("Shop Code"));
        }
        field(18; "Cash Change"; Decimal)
        {
            Caption = 'Cash Change';
        }
        field(19; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(20; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(21; "Terminal No."; code[20])
        {
            Caption = 'Terminal No.';
            TableRelation = "Shop Setup"."Terminal No." where("Shop Code" = field("Shop Code"));
        }
        field(22; Paid; Boolean)
        {
            trigger OnValidate()
            var
                ErrMag: Decimal;
                ErrAll: Boolean;
            begin
                ErrMag := 1;
                TestField(Post, false);
                TestField("Customer No.");
                TestField("General Device");
                CalcFields("Invoice Total", "Amount Due", "Discount Amount");
                "Amount Paid" := "Cash Pay" + "Transfer Pay" + "Value card";
                "Cash Change" := "Amount Paid" - "Amount Due";
                if "Cash Change" <> 0 then begin
                    if Abs("Cash Change") > ErrMag then
                        ErrAll := false
                    else
                        ErrAll := true;
                end else
                    ErrAll := true;
                if not ErrAll then
                    if "Cash Change" < 0 then begin
                        Message('Amount Paid is not Enough, Remain %1', "Cash Change");
                        Paid := False;
                    end else
                        if "Cash Change" > 0 then begin
                            Message('Amount Paid is More than Amount Due %1, Over paid by  %2', "Amount Due", "Cash Change");
                            rec.Paid := true;
                        end
            end;
        }
        field(23; Post; Boolean)
        {
            Caption = 'Post Sales';
            trigger OnValidate()
            var
                ErrMag: Decimal;
                ErrAll: Boolean;
            begin
                if not Post then error('You cannot Undo Posted Invoice');
                ErrMag := 1;
                if PayMode <> Paymode::Credit then begin
                    if "Cash Change" <> 0 then begin
                        if Abs("Cash Change") > ErrMag then
                            ErrAll := false
                        else
                            ErrAll := true;
                    end else
                        ErrAll := true;
                    TestField(Paid, true);
                    TestField("General Device");
                    if not ErrAll then
                        if "Cash Change" < 0 then begin
                            Error('Amount Paid is not Enough, Remain %1', "Cash Change");
                            Paid := False;
                        end else
                            if "Cash Change" > 0 then begin
                                Error('Amount Paid is More than Amount Due %1, Give Back Change of %2 ', "Amount Due", "Cash Change");
                            end;
                end;
                xRec.TestField(xRec.post, false);
                TestField(rec.Suspended, false);
                CreatesalesInv();
                Commit();

                if PostedInvoice.get(rec."Document No.") then begin
                    PostedInvoice.SetRange(PostedInvoice."No.", PDocNo);
                    PostedInvoice.SetRecFilter();                    
                    SaleInvoice.SetTableView(PostedInvoice);
                    SaleInvoice.UseRequestPage(true);
                    SaleInvoice.Run();
                end;
                
                //if PostedSaleInv.get("Document No.") then
                //   Report.Run(50145, false, true, PostedSaleInv);
            end;

        }
        field(24; Suspended; Boolean)
        {
            Caption = 'Suspended';
            Description = 'Invoice to be corrected or cancelled';
            trigger OnValidate()
            var
            //UserSetup: Record "User Setup";
            begin
                //UserRec.Get(UserId);
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.Find() then
                    UserSetup.TestField(UserSetup."FS Suspend Sale", true);
                TestField(Post, true);
                TestField(Cancelled, false);
                rec."Suspended By" := UserId;
            end;
        }
        field(25; Cancelled; Boolean)
        {
            Caption = 'Cancelled';
            Description = 'Cancelled and reversed Invoice';
            trigger OnValidate()
            begin

                //UserRec.Get(UserId);
                if not Cancelled then error('A Cancelled Sale can not be Reversed');
                UserSetup.SetRange("User ID", UserId);
                if UserSetup.Find() then
                    UserSetup.TestField(UserSetup."FS Cancel Sales", true);
                TestField(Post, true);
                TestField(Suspended, true);
                xRec.TestField(xRec.Cancelled, false);
                CreatesalesCredit();

            end;
        }
        field(26; "Credit Cash"; Boolean)
        {
            Caption = 'Cash and Carry Credit';
            Description = 'When a Credit/Register Customer is willing to pay and Carry Immediately';
        }
        field(27; "Document No."; code[20])
        {
            Caption = 'Posted Document No.';
        }
        field(28; "Payment Ref"; Code[20])
        {
            Caption = 'Posted Payment Doc. No.';
        }
        field(29; "Posted By"; Text[80])
        {
            Caption = 'Posted By Name';
            Editable = false;
        }
        field(30; "Price Group"; Code[20])
        {
            TableRelation = "Customer Price Group".Code;
            trigger OnValidate()
            begin

            end;
        }
        field(31; "Suspended By"; Code[20])
        {
            Editable = false;
        }
        field(32; "Cancelled By"; Code[20])
        {
            Editable = false;
        }
        field(33; "Customer Name"; text[50])
        {
        }
        field(34; "Cancel No."; code[20])
        {
        }
        field(35; "Cancelled Date"; Date)
        {
        }
        field(36; "Payment Refund"; Boolean)
        {
            Description = 'Over Payment Refund';
            trigger OnValidate()
            begin
                TestField(Post, true);
                "Refund By" := UserId;
                "Refund Date" := Today;
            end;
        }
        field(37; "Refund By"; Code[20])
        {
        }
        field(38; "Refund Date"; Date)
        {
        }
    }
    keys
    {
        key(PK; "Shop Code", "Invoice No.")
        {
            Clustered = true;
        }
    }

    var
        ShopSetup: Record "Shop Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        PaymentJnl: Record "Gen. Journal Line";
        CustRec: Record Customer;
        DimValue: Record "Dimension Value";
        ItemRec: Record Item;
        UserRec: Record User;
        PostedSaleInv: Record "Sales Invoice Header";
        PDocNo: Code[20];
        PostedSaleCredit: Record "Sales Cr.Memo Header";
        UserSetup: Record "User Setup";
        PayDone: Boolean;
        ShopLine: Record "Shop Lines";
        PostedInvoice: Record "Sales Invoice Header";
        SaleInvoice: Report "FishShopSales - Invoice";


    trigger OnInsert()
    begin
        if "Invoice No." = '' then begin
            UserSetup.Get(UserId);
            if ShopSetup.get(UserSetup."Fish Shop Code", UserSetup."Fish Shop Terminal")
            // if ShopSetup.FindFirst() 
            then begin
                ShopSetup.TestField("Invoice Nos");
                NoSeriesMgt.InitSeries(ShopSetup."Invoice Nos", xRec."No. Series", 0D, "Invoice No.", "No. Series");
                //"Terminal No." := ShopSetup."Terminal No.";
                "Price Group" := ShopSetup."Default Price Group";
                "Cashier Code" := UserId;
                "Posting Date" := Today;
            end;
        end;
    end;

    trigger OnRename()
    begin
        TestField(Post, false);
        ShopLine.SetRange(ShopLine."Invoice No.", rec."Invoice No.");
        if ShopLine.FindFirst() then
            repeat
                ShopLine.Rename(xRec."Shop Code", ShopLine.code);
                ShopLine.Rename(xRec."invoice No.", ShopLine."Invoice No.");
                ShopLine.Modify();
            until ShopLine.Next() = 0;
    end;

    trigger OnModify()
    begin
        //if (xRec."Document No." <> '') and (not xRec.Suspended)  then error('You Can Not Modify A Posted Sales Invoice')
        //if (xRec."Cancel No." <> '') then Error('Cancelled Sales Invoice Can Not be Changed');            
    end;

    trigger OnDelete()
    var SaleLine: Record "Shop Lines";  
    begin
        if rec.Post = true then Error('You cannot delete a posted Invoice')
        else begin
        SaleLine.SetRange(SaleLine.Code,rec."Shop Code");
        SaleLine.SetRange(SaleLine."Invoice No.",rec."Invoice No.");
        if SaleLine.FindSet() then 
        SaleLine.DeleteAll();
        end;

    end;

    procedure AssistEdit(OldSale: Record "ShopHeader"): Boolean
    var
        SaleRec: Record "ShopHeader";
    begin
        SaleRec := Rec;
        ShopSetup.Get(rec."Shop Code", rec."Terminal No.");
        ShopSetup.TestField("Invoice Nos");
        if NoSeriesMgt.SelectSeries(ShopSetup."Invoice Nos", OldSale."No. Series", SaleRec."No. Series") then begin
            NoSeriesMgt.SetSeries(SaleRec."Invoice No.");
            Rec := SaleRec;
            exit(true);
        end;
    end;

    procedure CreatesalesInv()
    var
        LineNo: Integer;
        //noseriesmgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        SalesSetup: Record "Sales & Receivables Setup";
        SalesInv: Record "Sales Header";
        SalesInvLine: Record "Sales Line";
        SHopSaleLine: Record "Shop Lines";

    begin
        PostedSaleInv.SetRange(PostedSaleInv."Pre-Assigned No.", "Invoice No.");
        if PostedSaleInv.FindLast() then begin
            PDocNo := PostedSaleInv."No.";
            "Document No." := PDocNo;
        end else begin
            TestField(Cancelled, false);
            TestField("Document No.", '');

            if "Posting Date" = 0D then
                "Posting date" := Today;
            SHopSaleLine.SetRange(SHopSaleLine.Code, "Shop Code");
            SHopSaleLine.SetRange(SHopSaleLine."Invoice No.", "Invoice No.");
            if not SHopSaleLine.FindSet() then
                Error('No Item To Invoice');
            SalesSetup.Get();
            ShopSetup.Get(Rec."Shop Code", rec."Terminal No.");
            DocNo := "Invoice No.";
            SalesInv.Init();
            SalesInv."Document Type" := SalesInv."Document Type"::Invoice;
            SalesInv."No." := DocNo;
            if not SalesInv.Insert() then SalesInv.modify(true);
            SalesInv.Validate("Sell-to Customer No.", Rec."Customer No.");
            SalesInv.Validate("Posting Date", rec."Posting date");
            if Rec.Description = '' then
                SalesInv."Posting Description" := 'FishShop Sale for: ' + "Invoice No."
            else
                SalesInv."Posting Description" := Rec.Description;
            SalesInv."External Document No." := DocNo;
            //SalesInv.insert();
            SalesInv.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
            SalesInv.Validate("Shortcut Dimension 2 Code", rec."General Device");
            SalesInv.Modify();
            LineNo := 0;
            if SHopSaleLine.FindSet() then
                repeat
                    LineNo += 10000;
                    SalesInvLine."Document Type" := SalesInvLine."Document Type"::Invoice;
                    SalesInvLine."Document No." := DocNo;
                    SalesInvLine."Line No." := LineNo;
                    if not SalesInvLine.Insert() then SalesInvLine.Modify;
                    SalesInvLine.Validate(SalesInvLine.Type, SalesInvLine.Type::Item);
                    SalesInvLine.Validate("No.", SHopSaleLine."Item No.");
                    SalesInvLine.Validate("Shipment Date", "Posting Date");
                    SalesInvLine.Validate(Quantity, SHopSaleLine.Quantity);
                    SalesInvLine.Validate("Shortcut Dimension 2 Code", "General Device");
                    SalesInvLine.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
                    SalesInvLine.Validate(SalesInvLine."Unit Price", SHopSaleLine."Unit Price");
                    SalesInvLine.Modify();
                    SHopSaleLine.Posted := true;
                    SHopSaleLine.Modify();
                until SHopSaleLine.Next() = 0;
            Codeunit.Run(Codeunit::"Sales-Post",SalesInv);
            PostedSaleInv.SetRange(PostedSaleInv."Pre-Assigned No.", DocNo);
            if PostedSaleInv.FindLast() then PDocNo := PostedSaleInv."No.";
        end;
        if rec.Paid then begin
            PostPayment();
            "Payment Ref" := PDocNo;
        end;
        "Document No." := PDocNo;
        Post := true;
        //Modify();
        //Commit();

        //Report.Run(50145,false, true,PostedInvoice);
        /* UserRec.SetRange("User Name", UserId);
         if UserRec.FindSet() then
             "Cashier Code" := UserRec."Full Name";
*/


    end;


    procedure CreatesalesCredit()
    var
        LineNo: Integer;
        DocNo: Code[20];
        SalesSetup: Record "Sales & Receivables Setup";
        SalesInv: Record "Sales Header";
        SalesInvLine: Record "Sales Line";
        SHopSaleLine: Record "Shop Lines";
    begin
        PostedSaleCredit.SetRange(PostedSaleCredit."Pre-Assigned No.", "Invoice No.");
        if PostedSaleCredit.FindLast() then begin
            PDocNo := PostedSaleCredit."No.";
            "Cancel No." := PDocNo;
        end else begin
            TestField(Suspended, true);
            TestField("Document No.");
            TestField("Cancel No.", '');
            SHopSaleLine.SetRange(SHopSaleLine.Code, "Shop Code");
            SHopSaleLine.SetRange(SHopSaleLine."Invoice No.", "Invoice No.");
            if not SHopSaleLine.FindSet() then
                Error('No Item To Invoice');
            SalesSetup.Get();
            ShopSetup.Get(Rec."Shop Code", rec."Terminal No.");
            DocNo := rec."Invoice No.";
            SalesInv.Init();
            SalesInv."Document Type" := SalesInv."Document Type"::"Credit Memo";
            SalesInv."No." := DocNo;
            SalesInv.Insert(); // then SalesInv.modify();
            SalesInv.Validate("Sell-to Customer No.", Rec."Customer No.");
            SalesInv.Validate("Posting Date", rec."Posting date");
            if Rec.Description = '' then
                SalesInv."Posting Description" := 'FishShop Cancelled for: ' + "Invoice No."
            else
                SalesInv."Posting Description" := Rec.Description;
            SalesInv."External Document No." := DocNo;
            SalesInv.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
            SalesInv.Validate("Shortcut Dimension 2 Code", rec."General Device");
            SalesInv.Modify();
            LineNo := 0;
            if SHopSaleLine.FindSet() then
                repeat
                    LineNo += 10000;
                    SalesInvLine."Document Type" := SalesInvLine."Document Type"::"Credit Memo";
                    SalesInvLine."Document No." := DocNo;
                    SalesInvLine."Line No." := LineNo;
                    SalesInvLine.Insert();
                    SalesInvLine.Validate(SalesInvLine.Type, SalesInvLine.Type::Item);
                    SalesInvLine.Validate("No.", SHopSaleLine."Item No.");
                    SalesInvLine.Validate("Shipment Date", "Posting Date");
                    SalesInvLine.Validate(Quantity, SHopSaleLine.Quantity);
                    SalesInvLine.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
                    SalesInvLine.Validate("Shortcut Dimension 2 Code", "General Device");
                    SalesInvLine.Validate(SalesInvLine."Unit Price", SHopSaleLine."Unit Price");
                    SalesInvLine.Modify();
                    SHopSaleLine.Posted := true;
                    SHopSaleLine.Modify();
                until SHopSaleLine.Next() = 0;
            Codeunit.Run(Codeunit::"Sales-Post", SalesInv);
            PostedSaleCredit.SetRange(PostedSaleCredit."Pre-Assigned No.", DocNo);
            if PostedSaleCredit.FindLast() then PDocNo := PostedSaleCredit."No.";
            //SalesHeader.SendToPosting(Codeunit::"Sales-Post") ;
        end;
        if rec.Paid then begin
            PostPayment();
            "Payment Ref" := PDocNo;
        end;
        "Cancel No." := PDocNo;
        Cancelled := true;
        "Cancelled By" := UserId;
        "Cancelled Date" := Today;
        
        //Report.Run(50145,false,false,PostedSaleInv);
        /* UserRec.SetRange("User Name", UserId);
         if UserRec.FindSet() then
             "Cashier Code" := UserRec."Full Name";
 */
        Modify();

    end;


    local procedure PostPayment()
    var
        GnJourLine: Record "Gen. Journal Line";
        ShopSetup: Record "Shop Setup";
        ShopPay: Record "Shop Payment Mode";
        LineNo: Integer;
        CustLedger: Record "Cust. Ledger Entry";
        Closed: Boolean;

    begin
        LineNo := 0;
        /*
        Closed := false;
        CustLedger.SetRange(CustLedger."Document No.", PDocNo);
        if not Suspended then
            CustLedger.SetRange(CustLedger."Document Type", CustLedger."Document Type"::Invoice)
        else
            CustLedger.SetRange(CustLedger."Document Type", CustLedger."Document Type"::"Credit Memo");
        if FindLast() then
            if CustLedger.Open = true then
                Closed := false else
                Closed := true;
                */
        ShopSetup.get("Shop Code", "Terminal No.");
        GnJourLine.SetRange(GnJourLine."Journal Template Name", ShopSetup."Gen. Journal Template");
        GnJourLine.SetRange(GnJourLine."Journal Batch Name", ShopSetup."General Journal Batch");
        if GnJourLine.FindSet() then GnJourLine.DeleteAll();
        if "Cash Pay" <> 0 then begin
            GnJourLine.Init();
            GnJourLine."Journal Template Name" := ShopSetup."Gen. Journal Template";
            GnJourLine."Journal Batch Name" := ShopSetup."General Journal Batch";
            GnJourLine."Line No." += 10000;
            GnJourLine.validate("Posting Date", "Posting date");
            GnJourLine."Document No." := PDocNo;
            ShopPay.Get("Cash Device", ShopSetup.Department);
            GnJourLine."Account Type" := ShopPay."Account Type";
            GnJourLine.Validate("Account No.", ShopPay."Account Code");
            GnJourLine."Bal. Account Type" := GnJourLine."Bal. Account Type"::Customer;
            GnJourLine.validate("Bal. Account No.", "Customer No.");
            GnJourLine.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
            GnJourLine.Validate("Shortcut Dimension 2 Code", "Cash Device");
            GnJourLine."External Document No." := "Invoice No.";
            if rec.Suspended then begin
                GnJourLine."Document Type" := 0;
                GnJourLine.Description := ' Cash Reversed for Invoice : ' + "Invoice No.";
                GnJourLine.validate(Amount, -"Cash Pay");
                //if not Closed then begin
                    GnJourLine."Applies-to Doc. Type" := GnJourLine."Applies-to Doc. Type"::"Credit Memo";
                    GnJourLine."Applies-to Doc. No." := PDocNo;
                //end;

            end
            else begin
                GnJourLine."Document Type" := GnJourLine."Document Type"::Payment;
                GnJourLine.Description := ' Cash Pay for Invoice : ' + "Invoice No.";
                GnJourLine.validate(Amount, "Cash Pay");
                //if not Closed then begin
                    GnJourLine."Applies-to Doc. Type" := GnJourLine."Applies-to Doc. Type"::Invoice;
                    GnJourLine."Applies-to Doc. No." := PDocNo;
               // end;
            end;
            GnJourLine.Insert();
            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post line", GnJourLine);
        end;
        //Insert Line for Transfer Payment
        if "Transfer Pay" > 0 then begin
            GnJourLine."Journal Template Name" := ShopSetup."Gen. Journal Template";
            GnJourLine."Journal Batch Name" := ShopSetup."General Journal Batch";
            GnJourLine."Line No." += 10000;
            GnJourLine.validate("Posting Date", "Posting date");
            GnJourLine."Document No." := PDocNo;
            ShopPay.Get("Transfer Device", ShopSetup.Department);
            GnJourLine."Account Type" := ShopPay."Account Type";
            GnJourLine.Validate("Account No.", ShopPay."Account Code");
            GnJourLine."Bal. Account Type" := GnJourLine."Bal. Account Type"::Customer;
            GnJourLine.validate("Bal. Account No.", "Customer No.");
            GnJourLine.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
            GnJourLine.Validate("Shortcut Dimension 2 Code", "Transfer Device");
            GnJourLine."External Document No." := "Invoice No.";
            if rec.Suspended then begin
                GnJourLine."Document Type" := 0;
                GnJourLine.Description := ' Transfer Reversed for Invoice : ' + "Invoice No.";
                GnJourLine.validate(Amount, -"Transfer Pay");
                //if not Closed then begin
                    GnJourLine."Applies-to Doc. Type" := GnJourLine."Applies-to Doc. Type"::"Credit Memo";
                    GnJourLine."Applies-to Doc. No." := PDocNo;
                //end;
            end
            else begin
                GnJourLine."Document Type" := GnJourLine."Document Type"::Payment;
                GnJourLine.Description := ' Cash Transfer for Invoice : ' + "Invoice No.";
                GnJourLine.validate(Amount, "Transfer Pay");
                //if not Closed then begin
                    GnJourLine."Applies-to Doc. Type" := GnJourLine."Applies-to Doc. Type"::Invoice;
                    GnJourLine."Applies-to Doc. No." := PDocNo;
                //end;
            end;
            GnJourLine.Insert();
            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post line", GnJourLine);
        end;
        //Insert Value Card Payment
        if "Value card" > 0 then begin
            GnJourLine.Init();
            GnJourLine."Journal Template Name" := ShopSetup."Gen. Journal Template";
            GnJourLine."Journal Batch Name" := ShopSetup."General Journal Batch";
            GnJourLine."Line No." += 10000;
            GnJourLine."Document No." := PDocNo;
            GnJourLine.validate("Posting Date", "Posting date");
            ShopPay.Get("Value device", ShopSetup.Department);
            GnJourLine."Account Type" := ShopPay."Account Type";
            GnJourLine.Validate("Account No.", ShopPay."Account Code");
            GnJourLine."Bal. Account Type" := GnJourLine."Bal. Account Type"::Customer;
            GnJourLine.validate("Bal. Account No.", "Customer No.");
            GnJourLine.Validate("Shortcut Dimension 1 Code", ShopSetup.Department);
            GnJourLine.Validate("Shortcut Dimension 2 Code", "Value device");
            GnJourLine."External Document No." := "Invoice No.";
            if rec.Suspended then begin
                GnJourLine."Document Type" := 0;
                GnJourLine.Description := ' Value Reversed for Invoice : ' + "Invoice No.";
                GnJourLine.validate(Amount, -"Value Card");
                //if not Closed then begin
                    GnJourLine."Applies-to Doc. Type" := GnJourLine."Applies-to Doc. Type"::"Credit Memo";
                    GnJourLine."Applies-to Doc. No." := PDocNo;
                //end;
            end
            else begin
                GnJourLine."Document Type" := GnJourLine."Document Type"::Payment;
                GnJourLine.Description := ' ValueCard Pay for Invoice : ' + "Invoice No.";
                GnJourLine.validate(Amount, "Value card");
                //if not Closed then begin
                    GnJourLine."Applies-to Doc. Type" := GnJourLine."Applies-to Doc. Type"::Invoice;
                    GnJourLine."Applies-to Doc. No." := PDocNo;
                //end;
            end;
            GnJourLine.Insert();
            CODEUNIT.Run(CODEUNIT::"Gen. Jnl.-Post line", GnJourLine);
        end;
    end;

    procedure UpdatePostedIncomplete()
    var PostedSales: Record "Sales Invoice Header";
        FishRec:Record ShopHeader; CusLedEntry: Record "Cust. Ledger Entry";
    begin
        //FishRec.SetFilter(FishRec.Post,'%1',false);
        FishRec := Rec;
        PostedSales.SetRange(PostedSales."Bill-to Customer No.",FishRec."Customer No.");
        PostedSales.SetFilter("Pre-Assigned No.",FishRec."Invoice No.");
        if PostedSales.FindFirst() then begin
        CusLedEntry.SetFilter(CusLedEntry."Document No.",'%1', PostedSales."No.");
        CusLedEntry.SetFilter(CusLedEntry."Document Type",'%1',CusLedEntry."Document Type"::Payment);
        if CusLedEntry.FindSet() then begin
        FishRec.Paid := true;
        FishRec.Post := true;
        FishRec."Payment Ref" := CusLedEntry."Document No.";
        FishRec."Document No." := CusLedEntry."Document No.";
        FishRec.Modify();
        end
        else begin
        FishRec.Validate(Paid, true);
        FishRec.Validate(Post,true);
        end;
        end;
    end;
}
