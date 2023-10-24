pageextension 50347 "pageextension50347" extends "Error Messages"
{
    //Unsupported feature: Code Modification on "SetRecords(PROCEDURE 1)".

    //procedure SetRecords();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if TempErrorMessage.FindFirst then;
    if TempErrorMessage.IsTemporary then
      Copy(TempErrorMessage,true)
    else
      TempErrorMessage.CopyToTemp(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if TempErrorMessage.FindFirst then;
    Copy(TempErrorMessage,true);
    */
    //end;
}
