pageextension 50273 "pageextension50273" extends "Issued Reminder List"
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
        CurrPage.SetSelectionFilter(IssuedReminderHeader2);
        IssuedReminderHeader.SetCurrentKey("Customer No.");
        if IssuedReminderHeader.FindSet then
        #6..9
            end;
            PrevCustomerNo := IssuedReminderHeader."Customer No.";
          until IssuedReminderHeader.Next = 0;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IssuedReminderHeader := Rec;
        CurrPage.SetSelectionFilter(IssuedReminderHeader);

        #3..12
        {<<<<<<<}
        */
        //end;
    }
}
