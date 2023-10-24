pageextension 50271 "pageextension50271" extends "Issued Reminder"
{
    actions
    {
        //Unsupported feature: Code Modification on ""Send by &Email"(Action 5).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IssuedReminderHeader := Rec;
        CurrPage.SetSelectionFilter(IssuedReminderHeader);
        IssuedReminderHeader.PrintRecords(false,true,false);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IssuedReminderHeader := Rec;
        CurrPage.SetSelectionFilter(IssuedReminderHeader);
        IssuedReminderHeader.PrintRecords(false,true,true);
        */
        //end;
    }
}
