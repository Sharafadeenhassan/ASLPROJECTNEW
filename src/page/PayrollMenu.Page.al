page 50000 "Payroll Menu"
{
    Caption = 'Payroll Menu';
    PageType = Card;
    UsageCategory = Administration;
    ApplicationArea = All, Basic, Suite;

    layout
    {
        area(content)
        {
            label(Control1)
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            label(Control9)
            {
                CaptionClass = Text19062951;
                ShowCaption = true;
                ApplicationArea = All;
            }
            label(Control3)
            {
                CaptionClass = Text19034387;
                ShowCaption = true;
                Style = Standard;
                StyleExpr = TRUE;
                ApplicationArea = All;
            }
        }
    }

 actions
    {
        area(navigation)
        {
            group(Setup)
            {
                Caption = 'Setup';
                action("Payroll &Setup")
                {
                    Caption = 'Payroll &Setup';
                    RunObject = Page "Payroll Setup Local";
                    ApplicationArea = All;
                }
                action("Table Lookup Details")
                {
                    Caption = 'Table Lookup Details';
                    RunObject = Page "Table Lookup Header.";
                    ApplicationArea = All;
                }
                separator("-----------------------------------")
                {
                    Caption = '-----------------------------------';
                }
                action("E/Ds")
                {
                    Caption = 'E/Ds';
                    RunObject = Page "ED Codes.";
                    ApplicationArea = All;
                }
                action("Employee Groups")
                {
                    Caption = 'Employee Groups';
                    RunObject = Page 50101;
                    ApplicationArea = All;
                }
                action("Posting Groups")
                {
                    Caption = 'Posting Groups';
                    RunObject = Page 50141;
                    ApplicationArea = All;
                }
            }
        }
        area(processing)
        {
            action(Periods)
            {
                Caption = 'Periods';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Payroll Periods.";
                ApplicationArea = All;
            }
            action(Banks)
            {
                Caption = 'Banks';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Banks.";
                ApplicationArea = All;
            }
            action("Monthly Payroll")
            {
                Caption = 'Monthly Payroll';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Payslip Header Survey.";
                ApplicationArea = All;
            }
            action("Payroll Process")
            {
                Caption = 'Generate Payroll ';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report 50054;
                ApplicationArea = All;
            }
            action("Monthly Variables")
            {
                Caption = 'Monthly Variables';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Monthly Var. Header Survey.";
                ApplicationArea = All;
            }
            action("Create G/L Journal")
            {
                Caption = 'Create G/L Journal';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "PRoll; Create Journal Entries";
                ApplicationArea = All;
            }
            action("Staff Loans")
            {
                Caption = 'Staff Loans';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Loan List";
                ApplicationArea = All;
            }
            action("General Journals")
            {
                Caption = 'General Journals';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //GenJnlManagement.TemplateSelection(0,FALSE);
                end;
            }
            action(Reports)
            {
                Caption = 'Reports';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                Begin
                    ;
                    ;
                    //reportlist.ShowList(FIELDNO("Payroll Reports"));
                end;
            }
            action(Utilities)
            {
                Caption = 'Utilities';
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Utilities.";
                Visible = true;
                ApplicationArea = All;
            }
            action(Navigate)
            {
                Caption = 'Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Navigate;
                ApplicationArea = All;
            }
        }
    }

    trigger OnInit()
    begin
        SetupEnable := true;
    end;

    trigger OnOpenPage()
    begin
        if Users.Get(UserId) then
            SetupEnable := Users."Periodic Activits/SetUp Access";
    end;

    var
        Users: Record "User Setup";
        [InDataSet]
        SetupEnable: Boolean;
        Text19034387: Label 'PayRoll';
        Text19062951: Label '   . . . .';
}
