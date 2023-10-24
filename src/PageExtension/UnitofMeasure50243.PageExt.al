pageextension 50243 "pageextension50243" extends "Units of Measure"
{
    layout
    {
        addafter("International Standard Code")
        {
            field("Catch Code"; Rec."Catch Code")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("In Use"; Rec."In Use")
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}
