pageextension 50236 "pageextension50236" extends "Purchase Statistics"
{
    //Unsupported feature: Code Modification on "VendInvDiscRecExists(PROCEDURE 4)".

    //procedure VendInvDiscRecExists();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    VendInvDisc.SetRange(Code,InvDiscCode);
    exit(VendInvDisc.FindFirst);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if VendInvDisc.ReadPermission then begin
      VendInvDisc.SetRange(Code,InvDiscCode);
      exit(VendInvDisc.FindFirst);
    end;
    */
    //end;
}
