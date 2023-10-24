tableextension 50311 "tableextension50311" extends "Service Item"
{
    //Unsupported feature: Property Insertion (Length) on "CheckIfCanBeDeleted(PROCEDURE 5).ReturnValue".

    //Unsupported feature: Code Modification on "CheckIfCanBeDeleted(PROCEDURE 5)".

    //procedure CheckIfCanBeDeleted();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ServItemLinesExist then
      exit(
        StrSubstNo(
    #4..21
      if ServContract.Get(ServContractLine."Contract Type",ServContractLine."Contract No.") then
        exit(
          StrSubstNo(Text002,TableCaption,"No."));

    exit(MoveEntries.CheckIfServiceItemCanBeDeleted(ServiceLedgerEntry,"No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..24
    */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "CheckIfCanBeDeleted(PROCEDURE 5).ServiceLedgerEntry(Variable 1000)".
}
