pageextension 50278 "pageextension50278" extends "Sales Order Subform"
{
    layout
    {
        modify("Unit Cost (LCY)")
        {
            Visible = false;
        }
        addafter("Unit of Measure")
        {
            field("Unit Cost"; Rec."Unit Cost")
            {
                ApplicationArea = All;
            }
        }
    }
}
