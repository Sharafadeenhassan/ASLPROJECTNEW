pageextension 50351 "pageextension50351" extends "Resource List"
{
    layout
    {
        addafter("Default Deferral Template Code")
        {
            field(Posted; Rec.Posted)
            {
                ApplicationArea = All;
            }
            field("Posted To Operation Voyage No."; Rec."Posted To Operation Voyage No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addfirst(Reporting)
        {
            action("Catch Incentive Report")
            {
                Caption = 'Catch Incentive Report';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Catch Incentive";
                ApplicationArea = All;
            }
            action("Crew List Report")
            {
                Caption = 'Crew List Report';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Material Req Reconciliation";
                ApplicationArea = All;
            }
        }
    }
}
