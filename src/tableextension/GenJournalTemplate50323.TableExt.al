tableextension 50323 "tableextension50323" extends "Gen. Journal Template"
{
    fields
    {
        //Unsupported feature: Code Modification on "Type(Field 9).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "Test Report ID" := REPORT::"General Journal - Test";
        "Posting Report ID" := REPORT::"G/L Register";
        SourceCodeSetup.Get;
        case Type of
        #5..47
          "Page ID" := PAGE::"Recurring General Journal";

        OnAfterValidateType(Rec,SourceCodeSetup);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        "Test Report ID" := REPORT::"General Journal - trasactions";
        #2..50
        */
        //end;
    }
}
