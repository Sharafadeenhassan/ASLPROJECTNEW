pageextension 50235 "pageextension50235" extends "Sales Statistics"
{
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
