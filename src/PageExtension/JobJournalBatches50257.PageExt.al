pageextension 50257 "pageextension50257" extends "Job Journal Batches"
{
    //Unsupported feature: Property Insertion (Permissions) on ""Job Journal Batches"(Page 276)".
    //Unsupported feature: Property Insertion (SourceTableView) on ""Job Journal Batches"(Page 276)".

    layout
    {
        //Unsupported feature: Property Modification (ImplicitType) on "Name(Control 2)".

        addafter(Name)
        {
            field("Vessel Name"; Rec."Vessel Name")
            {
                ApplicationArea = All;
            }
            field("Job No."; Rec."Job No.")
            {
                ApplicationArea = All;
            }
            field("Voyage No."; Rec."Voyage No.")
            {
                ApplicationArea = All;
                
            }
            field("Fuel Balance"; Rec."Fuel Balance")
            {
                ApplicationArea = All;
            }
            field("R.P.M."; Rec."R.P.M.")
            {
                ApplicationArea = All;
            }
            field(Speed; Rec.Speed)
            {
                ApplicationArea = All;
            }
            field("Sea Temperature"; Rec."Sea Temperature")
            {
                ApplicationArea = All;
            }
            field("Fish Hold Temp"; Rec."Fish Hold Temp")
            {
                ApplicationArea = All;
            }
            field("Fishing Ground"; Rec."Fishing Ground")
            {
                ApplicationArea = All;
            }
            field("Catch Date"; Rec."Catch Date")
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Batch Type"; Rec."Batch Type")
            {
                ApplicationArea = All;
            }
        }
        addafter("Reason Code")
        {
            field(Posted; Rec.Posted)
            {
                ApplicationArea = All;
            }
            field("Journal Template Name"; Rec."Journal Template Name")
            {
                ApplicationArea = All;
            }
        }
        modify(Name)
        {
            Width = 17;
        }
    }

    actions
    {
        addafter("Edit Journal")
        {
            action("Catch Reconciliation GRN")
            {
                Caption = 'Catch Reconciliation GRN';
                Image = OpenJournal;
                RunObject = Page "Job Journal";
                ApplicationArea = All;
            }
        }
    }
}

