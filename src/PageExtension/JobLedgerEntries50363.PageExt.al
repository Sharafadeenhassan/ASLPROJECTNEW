pageextension 50363 "pageextension50363" extends "Job Ledger Entries"
{
    layout
    {
        addafter("Location Code")
        {
            field("Vessel Type"; Rec."Vessel Type")
            {
                ApplicationArea = All;
            }
        }
        addafter(Quantity)
        {
            field("Journal Batch Name"; Rec."Journal Batch Name")
            {
                ApplicationArea = All;
            }
        }
        addafter("DateTime Adjusted")
        {
            field(ROB; Rec.ROB)
            {
                ApplicationArea = All;
            }
            field("ROB By"; Rec."ROB By")
            {
                ApplicationArea = All;
            }
            field("Catch Sea Days"; Rec."Catch Sea Days")
            {
                ApplicationArea = All;
            }
            field("Marked Rec"; Rec."Marked Rec")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("Phase Code"; Rec."Phase Code")
            {
                ApplicationArea = All;
            }
            field("Task Code"; Rec."Task Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
