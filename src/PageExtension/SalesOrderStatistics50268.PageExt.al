pageextension 50268 "pageextension50268" extends "Sales Order Statistics"
{
    layout
    {
        //Unsupported feature: Property Modification (Name) on "VATAmount(Control 16)".
    }

    //Unsupported feature: Code Modification on "RefreshOnAfterGetRecord(PROCEDURE 10)".

    //procedure RefreshOnAfterGetRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CurrPage.Caption(StrSubstNo(Text000,"Document Type"));

    if PrevNo = "No." then
    #4..82
    TempVATAmountLine4.ModifyAll(Modified,false);

    PrevTab := -1;

    UpdateHeaderInfo(2,TempVATAmountLine2);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..85
    */
    //end;

    //Unsupported feature: Code Modification on "CustInvDiscRecExists(PROCEDURE 4)".

    //procedure CustInvDiscRecExists();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustInvDisc.SetRange(Code,InvDiscCode);
    exit(CustInvDisc.FindFirst);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if CustInvDisc.ReadPermission then begin
    CustInvDisc.SetRange(Code,InvDiscCode);
      exit(CustInvDisc.FindFirst);
      end;
    */
    //end;
}
