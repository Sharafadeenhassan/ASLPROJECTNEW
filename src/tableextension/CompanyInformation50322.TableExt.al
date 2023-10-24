tableextension 50322 "tableextension50322" extends "Company Information"
{
    fields
    {
        field(50000; "Min Foreign Indirect Cost %"; Decimal)
        {
        }
    }

    //Unsupported feature: Code Modification on "GetRegistrationNumber(PROCEDURE 14)".

    //procedure GetRegistrationNumber();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit("Registration No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    exit("VAT Registration No.");
    */
    //end;

    //Unsupported feature: Code Modification on "GetRegistrationNumberLbl(PROCEDURE 15)".

    //procedure GetRegistrationNumberLbl();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    exit(FieldCaption("Registration No."));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    exit(FieldCaption("VAT Registration No."));
    */
    //end;
}
