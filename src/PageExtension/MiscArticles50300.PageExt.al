pageextension 50300 "pageextension50300" extends "Misc. Articles"
{
    layout
    {
        addafter("Code")
        {
            field("Mat Type"; Rec."Mat Type")
            {
                ApplicationArea = All;
            }
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Replacement Interval"; Rec."Replacement Interval")
            {
                ApplicationArea = All;
            }
            field(Replaceable; Rec.Replaceable)
            {
                ApplicationArea = All;
            }
        }
    }
}
