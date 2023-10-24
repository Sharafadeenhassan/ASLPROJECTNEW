pageextension 50316 "pageextension50316" extends "FA Posting Group Card"
{
    layout
    {
        addafter("Maintenance Expense Account")
        {
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
            }
        }
    }
}
