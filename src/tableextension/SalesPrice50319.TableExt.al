tableextension 50319 "tableextension50319" extends "Sales Price"
{
    fields
    {
        //Unsupported feature: Code Modification on ""Starting Date"(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Starting Date" > "Ending Date") and ("Ending Date" <> 0D) then
          Error(Text000,FieldCaption("Starting Date"),FieldCaption("Ending Date"));

        if CurrFieldNo = 0 then
          exit;

        if "Starting Date" <> 0D then
          if "Sales Type" = "Sales Type"::Campaign then
            Error(Text002,"Sales Type");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3

        #4..9
        */
        //end;
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Sales Type" = "Sales Type"::"All Customers" then
      "Sales Code" := ''
    else
      TestField("Sales Code");
    TestField("Item No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
      TestField("Item No.");
    */
    //end;
}
