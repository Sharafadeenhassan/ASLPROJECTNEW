tableextension 50282 "tableextension50282" extends "Alternative Address"
{
    fields
    {
        modify("Employee No.")
        {
            TableRelation = IF (Source = CONST(" ")) Employee
            ELSE
            IF (Source = CONST(Applicant)) Applicants;
        }

        //Unsupported feature: Code Modification on ""Employee No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Employee.Get("Employee No.");
        Name := Employee."Last Name";
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //Employee.GET("Employee No.");
        //Name := Employee."Last Name";

        if Source=Source::" " then
        begin
          Employee.Get("Employee No.");
          Name := Employee."Last Name";
        end
          else
            begin
              Applicant.Get("Employee No.");
              Name := Applicant.Surname;
            end;
        */
        //end;

        //Unsupported feature: Code Modification on ""Post Code"(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PostCode.ValidatePostCode(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) and GuiAllowed);

        if PostCode.Get("Post Code") then
          City := PostCode.City;
        */
        //end;
        field(50000; Source; Option)
        {
            OptionMembers = " ",Applicant;
        }
    }
}
