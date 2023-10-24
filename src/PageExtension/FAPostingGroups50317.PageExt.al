pageextension 50317 "pageextension50317" extends "FA Posting Groups"
{
    layout
    {
        addafter("Code")
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
    }
}
