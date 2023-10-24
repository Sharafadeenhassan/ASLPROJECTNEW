tableextension 50220 "tableextension50220" extends "Salesperson/Purchaser"
{
    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Validate(Code);
    DimMgt.UpdateDefaultDim(
      DATABASE::"Salesperson/Purchaser",Code,
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    Validate(Code);
    //AAA - Oct 2002
    "Global Dimension 2 Code":='ATLANTIC';
    #2..4
    */
    //end;
}
