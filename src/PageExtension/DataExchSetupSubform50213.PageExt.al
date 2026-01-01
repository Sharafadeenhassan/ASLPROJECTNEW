pageextension 50213 "pageextension50213" extends "Data Exch. Setup Subform"
{
    layout
    {
        //Unsupported feature: Code Modification on "SourceField(Control 5).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SourceAssistEdit(TempXMLBuffer);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SourceAssistEdit(TempXMLStructure);
        */
        //end;
    }

    var
    //***TempXMLStructure: Record "XML Structure" temporary;

    //Unsupported feature: Code Modification on "SetXMLDefinition(PROCEDURE 3)".

    //procedure SetXMLDefinition();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempXMLBuffer.Reset;
    TempXMLBuffer.DeleteAll;

    if XMLBuffer.FindSet then
      repeat
        TempXMLBuffer.Copy(XMLBuffer);
        TempXMLBuffer.Insert;
      until XMLBuffer.Next = 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TempXMLStructure.Reset;
    TempXMLStructure.DeleteAll;

    if XMLStructure.FindSet then
      repeat
        TempXMLStructure.Copy(XMLStructure);
        TempXMLStructure.Insert;
      until XMLStructure.Next = 0;
    */
    //end;

    //Unsupported feature: Property Modification (Name) on "SetXMLDefinition(PROCEDURE 3).XMLBuffer(Parameter 1000)".

    //Unsupported feature: Property Modification (Subtype) on "SetXMLDefinition(PROCEDURE 3).XMLBuffer(Parameter 1000)".
}
