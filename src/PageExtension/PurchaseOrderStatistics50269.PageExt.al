pageextension 50269 "pageextension50269" extends "Purchase Order Statistics"
{
    layout
    {
        //Unsupported feature: Property Modification (Name) on ""VATAmount_Invoicing"(Control 47)".
    }

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
