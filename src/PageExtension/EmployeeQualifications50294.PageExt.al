pageextension 50294 "pageextension50294" extends "Employee Qualifications"
{
    //Unsupported feature: Property Insertion (SaveValues) on ""Employee Qualifications"(Page 5206)".

    //Unsupported feature: Property Insertion (PopulateAllFields) on ""Employee Qualifications"(Page 5206)".

    layout
    {
        addafter("Course Grade")
        {
            field(Source; Rec.Source)
            {
                ApplicationArea = All;
            }
        }
    }
}
