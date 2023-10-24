tableextension 50286 "tableextension50286" extends "Employee Relative"
{
    fields
    {
        modify("Employee No.")
        {
            TableRelation = IF (Source = CONST(" ")) Employee
            ELSE
            IF (Source = CONST(Applicant)) Applicants;
        }
        field(50000; Source; Option)
        {
            OptionMembers = " ",Applicant;
        }
        field(50001; Address; Text[80])
        {
        }
    }
}
