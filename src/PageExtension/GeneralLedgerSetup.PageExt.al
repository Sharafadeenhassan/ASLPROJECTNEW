pageextension 50208 "pageextension50208" extends "General Ledger Setup"
{
    layout
    {
        addafter("Bank Account Nos.")
        {
            field("Deposit Number Series"; Rec."Deposit Number Series")
            {
                ApplicationArea = All;
            }
        }
        addafter("Use Legacy G/L Entry Locking")
        {
            field("LCY Unit"; Rec."LCY Unit")
            {
                ApplicationArea = All;
            }
        }
        addafter("Show Amounts")
        {
            field("Schedule Name 1"; Rec."Schedule Name 1")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 1"; Rec."Col Layout Name 1")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 2"; Rec."Schedule Name 2")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 2"; Rec."Col Layout Name 2")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 3"; Rec."Schedule Name 3")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 3"; Rec."Col Layout Name 3")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 4"; Rec."Schedule Name 4")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 4"; Rec."Col Layout Name 4")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 5"; Rec."Schedule Name 5")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 5"; Rec."Col Layout Name 5")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 6"; Rec."Schedule Name 6")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 6"; Rec."Col Layout Name 6")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 7"; Rec."Schedule Name 7")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 7"; Rec."Col Layout Name 7")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 8"; Rec."Schedule Name 8")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 8"; Rec."Col Layout Name 8")
            {
                ApplicationArea = All;
            }
            field("Schedule Name 9"; Rec."Schedule Name 9")
            {
                ApplicationArea = All;
            }
            field("Col Layout Name 9"; Rec."Col Layout Name 9")
            {
                ApplicationArea = All;
            }
        group(Authority)
                {
                    Caption = 'Authority';

                    field(Administrator; Administrator)
                    {
                        Visible = true;
                        ApplicationArea = all;
                    }

                }
        }
    }
}
