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
            field("Job Contract Entry No.";Rec."Job Contract Entry No.")
            {
                Editable = true;
            }
            field("General Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the general product posting group for the sales line.';
                Editable = true;
            }
        }
    }
}
