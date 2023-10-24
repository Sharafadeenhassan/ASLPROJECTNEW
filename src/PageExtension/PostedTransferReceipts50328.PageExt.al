pageextension 50328 "pageextension50328" extends "Posted Transfer Receipts"
{
    layout
    {
        addafter("Shortcut Dimension 1 Code")
        {
            field("Transfer Order No."; Rec."Transfer Order No.")
            {
                ApplicationArea = All;
            }
            field("Transfer Order Date"; Rec."Transfer Order Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
