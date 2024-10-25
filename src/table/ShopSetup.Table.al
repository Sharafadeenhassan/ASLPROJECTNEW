table 50058 "Shop Setup"
{
    Caption = 'Shop Setup';
    DataClassification = ToBeClassified;
    LookupPageId = 50107;   

    fields
    {
        field(1; "Shop Code"; Code[20])
        {
            Caption = 'Shop Code';
            TableRelation = Location.Code;
            NotBlank = true;
            trigger OnValidate()
            var
                LocRec: Record Location;
            begin
                if LocRec.Get("Shop Code") then begin
                    Rec.Name := LocRec.Name;
                    Rec.Address := LocRec.Address;
                    Rec.City := LocRec.City;
                    Rec."E-Mail" := LocRec."E-Mail";
                    rec.Telephone := LocRec."Phone No.";
                end
            end;
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; Address; Text[50])
        {
            Caption = 'Address';
        }
        field(4; City; Text[30])
        {
            Caption = 'City';
        }
        field(5; "E-Mail"; Text[50])
        {
            Caption = 'E-Mail';
        }
        field(6; Telephone; Code[20])
        {
            Caption = 'Telephone';
            
        }
        field(7; "Invoice Nos"; Code[20])
        {
            Caption = 'Invoice Nos';
            TableRelation = "No. Series";
        }
        field(8; "Cash Customer Acct"; Code[20])
        {
            Caption = 'Cash Customer Acct';
            TableRelation = Customer."No.";
        }
        field(9; "Value Customer Acct"; code[20])
        {
            Caption = 'Value Card Customer Acct';
            TableRelation = Customer."No.";
        }
        field(10; "Terminal No."; Code[20])
        {
            Caption = 'Terminal No.';
        }
        field(11;"Terminal Operator";Text[30])
        {
            Caption = 'Terminal Operator';
            TableRelation = "User Setup"."User ID" where("FS Cashier" = const(true),"Fish Shop Code" = field("Shop Code"));

        }
        field(12;Department;Code[20])
        {
            Caption = 'Fish Shop Unit';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),"Dimension Value Type"= const(Standard));
        }
        field(13;"Multiple Pay Customer Acct";Code[20])
        {
            Caption = 'Multi Payment Customer Account';
            TableRelation = Customer."No." where(Blocked = filter(0));
        }
        field(14;"Default Price Group";Code[20])
        {
            TableRelation = "Customer Price Group".Code;
        }
        field(15;"Total Sales";Decimal)
        {
            Caption = 'Total Sales';
            FieldClass = FlowField;
            CalcFormula = sum("Shop Lines"."Line Amount Due" where(Code=field("Shop Code"),"Transaction Date" = field("Date Filter")));
        }
        field(16;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(17;"Gen. Journal Template";Code[20])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(18;"General Journal Batch";code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Gen. Journal Template"));
        }
        field(19;"Total Cash";Decimal)
        {
            Caption = 'Cash Received';
            FieldClass = FlowField;
            CalcFormula = sum(ShopHeader."Cash Pay" where("Shop Code" = field("Shop Code"),"Terminal No." = field("Terminal No."),"Posting date"= field("Date Filter")));
        }
        field(20;"Total Value card";Decimal)
        {
            Caption = 'POS Received';
            FieldClass = FlowField;
            CalcFormula = sum(ShopHeader."Value card" where("Shop Code" = field("Shop Code"),"Terminal No." = field("Terminal No."),
            "Posting date"= field("Date Filter"),"Value device"= field("Payment filter")));
        }
        field(21;"Total Transfer";Decimal)
        {
            Caption = 'Transfer Received';
            FieldClass = FlowField;
            CalcFormula = sum(ShopHeader."Transfer Pay" where("Shop Code" = field("Shop Code"),"Terminal No." = field("Terminal No."),
            "Posting date"= field("Date Filter"),"Transfer Device"= field("Payment filter")));

        }

        field(22;"Payment filter"; Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No."= const(2));
        }
    }
    keys
    {
        key(PK; "Shop Code", "Terminal No.")
        {
            Clustered = true;
        }
    }
}
