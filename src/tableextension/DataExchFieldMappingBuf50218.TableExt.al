tableextension 50218 "tableextension50218" extends "Data Exch. Field Mapping Buf."
{
    //Unsupported feature: Code Modification on "SourceAssistEdit(PROCEDURE 4)".

    //procedure SourceAssistEdit();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if PAGE.RunModal(PAGE::"Select Source",XMLBuffer) = ACTION::LookupOK then
      Validate(Source,XMLBuffer.Path);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if PAGE.RunModal(PAGE::"Select Source",XMLStructure) = ACTION::LookupOK then
      Validate(Source,XMLStructure.Path);
    */
    //end;

    //Unsupported feature: Property Modification (Name) on "SourceAssistEdit(PROCEDURE 4).XMLBuffer(Parameter 1000)".

    //Unsupported feature: Property Modification (Subtype) on "SourceAssistEdit(PROCEDURE 4).XMLBuffer(Parameter 1000)".
}
