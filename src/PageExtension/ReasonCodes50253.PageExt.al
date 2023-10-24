pageextension 50253 "pageextension50253" extends "Reason Codes"
{
    Editable = false;
    layout
    {
        addafter("Code")
        {
            field(Type; Rec.Type)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}
