pageextension 50352 "pageextension50352" extends "Standard Text Codes"
{
    layout
    {
        addafter(Description)
        {
            field(Others; Rec.Others)
            {
                ShowCaption = false;
                ApplicationArea = All;
            }
        }
    }
}
