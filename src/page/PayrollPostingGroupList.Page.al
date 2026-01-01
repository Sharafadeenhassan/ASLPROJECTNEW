page 50141 "Payroll- Posting Group List"
{
    ApplicationArea = All;
    Caption = 'Payroll- Posting Group List';
    PageType = List;
    SourceTable = "Payroll-Posting Group Header.";
    UsageCategory = Lists;
    CardPageId = 50013;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Posting Group Code"; Rec."Posting Group Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Group Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Search Name field.', Comment = '%';
                    Visible = false;
                }
                field(Management; Rec.Management)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Management field.', Comment = '%';
                    Visible = false;
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Leave Days field.', Comment = '%';
                    Visible = false;
                }
                field("Budgeted Count"; Rec."Budgeted Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budgeted Count field.', Comment = '%';
                    Visible = false;
                }
                field("Group Range"; Rec."Group Range")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Group Range field.', Comment = '%';
                    Visible = false;
                }
                field(StaffCount; Rec.StaffCount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the StaffCount field.', Comment = '%';
                    Visible = false;
                }
            }
        }
    }
}
