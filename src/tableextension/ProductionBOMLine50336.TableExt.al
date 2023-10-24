tableextension 50336 "tableextension50336" extends "Production BOM Line"
{
    fields
    {
        //Unsupported feature: Property Modification (Data type) on ""Version Code"(Field 3)".

        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("No.");
        if xRec."Unit of Measure Code" <> "Unit of Measure Code" then
          TestField(Type,Type::Item);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        TestField(Type,Type::Item);
        TestField("No.");
        */
        //end;
    }
}
