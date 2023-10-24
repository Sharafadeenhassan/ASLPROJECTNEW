pageextension 50241 "pageextension50241" extends "General Ledger Entries"
{
    layout
    {
        addafter("Entry No.")
        {
            field("Transaction No."; Rec."Transaction No.")
            {
                ApplicationArea = All;
            }
            field("Source Type1"; Rec."Source Type")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("Source No.1"; Rec."Source No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}
