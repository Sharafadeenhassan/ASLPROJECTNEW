tableextension 50261 "tableextension50261" extends "Reminder Header"
{
    //Unsupported feature: Code Modification on "InsertLines(PROCEDURE 3)".

    //procedure InsertLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrencyForReminderLevel.Init;
    ReminderLevel.SetRange("Reminder Terms Code","Reminder Terms Code");
    ReminderLevel.SetRange("No.",1,"Reminder Level");
    #4..29
        ReminderLine.Type := ReminderLine.Type::"G/L Account";
        TestField("Customer Posting Group");
        CustPostingGr.Get("Customer Posting Group");
        ReminderLine.Validate("No.",CustPostingGr.GetAdditionalFeeAccount);
        ReminderLine.Description :=
          CopyStr(
    #36..51
    Modify;

    OnAfterInsertLines(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..32

    #33..54
    */
    //end;
}
