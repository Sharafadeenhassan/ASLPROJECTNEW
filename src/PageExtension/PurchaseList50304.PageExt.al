pageextension 50304 "pageextension50304" extends "Purchase List"
{
    layout
    {
        addafter("Currency Code")
        {
            field("Completely Received"; Rec."Completely Received")
            {
                ApplicationArea = All;
            }
            field("Due Date"; Rec."Due Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
