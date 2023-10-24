pageextension 50350 "pageextension50350" extends "Resource Card"
{
    layout
    {
        //Unsupported feature: Property Modification (Name) on ""Use Time Sheet"(Control 3)".

        //Unsupported feature: Property Modification (SourceExpr) on ""Use Time Sheet"(Control 3)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Use Time Sheet"(Control 3)".

        //Unsupported feature: Property Modification (Name) on ""Time Sheet Owner User ID"(Control 5)".

        //Unsupported feature: Property Modification (SourceExpr) on ""Time Sheet Owner User ID"(Control 5)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Time Sheet Owner User ID"(Control 5)".

        //Unsupported feature: Property Modification (Name) on ""Time Sheet Approver User ID"(Control 7)".

        //Unsupported feature: Property Modification (SourceExpr) on ""Time Sheet Approver User ID"(Control 7)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Time Sheet Approver User ID"(Control 7)".

        //Unsupported feature: Property Modification (Level) on "County(Control 45)".

        //Unsupported feature: Property Modification (Name) on ""Social Security No."(Control 12)".

        //Unsupported feature: Property Modification (SourceExpr) on ""Social Security No."(Control 12)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Social Security No."(Control 12)".

        moveafter("Contract Class"; "Employment Date")
        addafter("Contract Class")
        {
            field(Posted; Rec.Posted)
            {
                ApplicationArea = All;
            }
            field("Sick Leave"; Rec."Sick Leave")
            {
                ApplicationArea = All;
            }
            field("Annual Leave"; Rec."Annual Leave")
            {
                ApplicationArea = All;
            }
            field("Casual Leave"; Rec."Casual Leave")
            {
                ApplicationArea = All;
            }
            field(Suspension; Rec.Suspension)
            {
                ApplicationArea = All;
            }
        }
        moveafter(Blocked; Invoicing)
        moveafter("VAT Prod. Posting Group"; "Personal Data")
        moveafter("Address 2"; "Post Code")
        moveafter("Post Code"; City)
        moveafter(City; "Social Security No.")
    }
    actions
    {
        modify("Resource Statistics")
        {
            //Unsupported feature: Property Modification (Name) on ""Resource Statistics"(Action 1901205806)".

            Caption = 'Catch Incentive Report';

            //Unsupported feature: Property Modification (RunObject) on ""Resource Statistics"(Action 1901205806)".
        }
        modify("Resource Usage")
        {
            //Unsupported feature: Property Modification (Name) on ""Resource Usage"(Action 1907688806)".

            Caption = 'Crew List Report';

            //Unsupported feature: Property Modification (RunObject) on ""Resource Usage"(Action 1907688806)".
        }
    }
}
