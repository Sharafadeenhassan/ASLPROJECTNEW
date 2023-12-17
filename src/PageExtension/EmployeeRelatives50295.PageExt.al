pageextension 50295 "pageextension50295" extends "Employee Relatives"
{
    //Unsupported feature: Property Insertion (PopulateAllFields) on ""Employee Relatives"(Page 5209)".

    layout
    {
        modify("Birth Date")
        {
            Visible = false;
        }
        addafter("Relative's Employee No.")
        {
            field(Address; Rec.Address)
            {
                ApplicationArea = All;
            }
        }
    }
}
