table 50059 "Shop Payment Mode"
{
    Caption = 'Shop Payment Mode';
    DataClassification = ToBeClassified;
    LookupPageId = 50113;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = "Dimension Value"."Code" where("Global Dimension No." = const(2), "Dimension Value Type" = const(Standard));
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Account Type"; Enum "Gen. Journal Account Type")
        {
            Caption = 'Account Type';
            ValuesAllowed = 0, 3;
        }
        field(4; "Account Code"; Code[20])
        {
            Caption = 'Account Code';
            TableRelation = IF ("Account Type" = CONST(0)) "G/L Account"."No." WHERE("Account Type" = CONST(Posting),
                                                                                          Blocked = CONST(false))
            ELSE
            IF ("Account Type" = CONST(3)) "Bank Account"."No." where(Blocked = const(false));
        }
        field(5; "Fish Shop Code"; Code[20])
        {
            Caption = 'Fish Shop Code';
            TableRelation = "Dimension Value"."Code" where("Global Dimension No." = const(1), "Dimension Value Type" = const(Standard));
        }
        field(6; "Payment Mode"; Option)
        {
            Caption = 'PayMode';
            OptionMembers = Cash,Transfer,Value,Multiple,Credit;
        }
        field(7;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(8;"Department Filter";code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(9;"Total Payment";Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = -sum("Detailed Cust. Ledg. Entry".Amount where("Posting Date"=field("Date Filter"),
            "Initial Entry Global Dim. 1"= field("Fish Shop Code"),"Initial Entry Global Dim. 2"= field(Code),
            "Document Type"= filter(Payment|''),"Entry Type"= const("Initial Entry")));
        }
        field(10;"Total Sales";Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = -sum("Detailed Cust. Ledg. Entry".Amount where("Posting Date"=field("Date Filter"),
            "Initial Entry Global Dim. 1"= field("Fish Shop Code"),"Initial Entry Global Dim. 2"= field(Code),
            "Document Type"= filter(Invoice|'Credit Memo'),"Entry Type"= const("Initial Entry")));
        }        
    }
    keys
    {
        key(PK; "Code", "Fish Shop Code")
        {
            Clustered = true;
        }
    }
}
