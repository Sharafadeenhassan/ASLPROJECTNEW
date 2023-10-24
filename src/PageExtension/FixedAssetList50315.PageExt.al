pageextension 50315 "pageextension50315" extends "Fixed Asset List"
{
    layout
    {
        addafter("FA Location Code")
        {
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = All;
            }
            field("Serial No.";"Serial No.")
            {
                ApplicationArea = All;
                Visible = True;
            }
        }
    }
}
