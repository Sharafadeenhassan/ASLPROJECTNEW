pageextension 50239 "pageextension50239" extends "Deferral Schedule"
{
    actions
    {
        //Unsupported feature: Property Modification (Name) on "CalculateSchedule(Action 10)".
    }

    //Unsupported feature: Code Modification on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    // Prevent closing of the window if the sum of the periods does not equal the Amount to Defer
    if DeferralHeader.Get("Deferral Doc. Type",
         "Gen. Jnl. Template Name",
    #4..15
    DeferralLine.SetRange("Document Type","Document Type");
    DeferralLine.SetRange("Document No.","Document No.");
    DeferralLine.SetRange("Line No.","Line No.");

    RecCount := DeferralLine.Count;
    ExpectedCount := DeferralUtilities.CalcDeferralNoOfPeriods("Calc. Method","No. of Periods","Start Date");
    if ExpectedCount <> RecCount then
      FieldError("No. of Periods");

    DeferralLine.SetFilter("Posting Date",'>%1',0D);
    if DeferralLine.FindFirst then begin
      EarliestPostingDate := DeferralLine."Posting Date";
      if EarliestPostingDate <> DeferralHeader."Start Date" then
        Error(PostingDateErr);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..18
    #25..30
    */
    //end;
}
