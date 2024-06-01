pageextension 50399 "AccountantRoleCenter" extends "Accountant Role Center"
{
    layout
    {
    }

    actions
    {
        addafter("Cost Accounting")
        {
            group(Payroll)
            {
                group(SetupPayroll)
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
                        RunObject = Page "Employee Groups Survey.";
                        ApplicationArea = All;
                    }
                    action("Posting Groups")
                    {
                        Caption = 'Posting Groups';
                        RunObject = Page "Posting Group Header.";
                        ApplicationArea = All;
                    }
                }
                group(ProcessingPayroll)
                {
                    Caption = 'Processing';
                    action(Periods)
                    {
                        Caption = 'Periods';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page "Payroll Periods.";
                        ApplicationArea = All;
                    }
                    action(Banks)
                    {
                        Caption = 'Banks';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page "Banks.";
                        ApplicationArea = All;
                    }
                    action("Monthly Payroll")
                    {
                        Caption = 'Monthly Payroll';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page "Payslip Header Survey.";
                        ApplicationArea = All;
                    }
                    action("Payroll Process")
                    {
                        Caption = 'Generate Payroll ';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Report "ASL Create New payslips - New";
                        ApplicationArea = All;
                    }
                    action("Monthly Variables")
                    {
                        Caption = 'Monthly Variables';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page "Monthly Var. Header Survey.";
                        ApplicationArea = All;
                    }
                    action("Create G/L Journal")
                    {
                        Caption = 'Create G/L Journal';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Report "PRoll; Create Journal Entries";
                        ApplicationArea = All;
                    }
                    action("Staff Loans")
                    {
                        Caption = 'Staff Loans';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page "Loan List";
                        ApplicationArea = All;
                    }
                    action("General Journals PR")
                    {
                        Caption = 'General Journals';
                        ApplicationArea = All;
                        //Promoted = true;
                        //PromotedCategory = Process;
                    }
                    action(ReportsPR)
                    {
                        Caption = 'Reports';
                        ApplicationArea = All;
                        //Promoted = true;
                        //PromotedCategory = Process;

                        // AAA trigger OnAction()
                        // var Reportlist: Record "Report Selections";
                        // Begin;
                        //     WITH Reportlist DO;
                        //         //reportlist.ShowList(FIELDNO("Payroll Reports"));
                        // end;
                    }
                    action(Utilities)
                    {
                        Caption = 'Utilities';
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page "Utilities.";
                        Visible = true;
                        ApplicationArea = All;
                    }
                    action(Navigate)
                    {
                        Caption = 'Navigate';
                        Image = Navigate;
                        ApplicationArea = all;
                        //Promoted = true;
                        //PromotedCategory = Process;
                        RunObject = Page Navigate;
                    }
                }
            }
        }
    }
}

// page 50000 "Payroll Menu"
// {
//     // trigger OnInit()
//     // begin
//     //     SetupEnable := true;
//     // end;

//     // trigger OnOpenPage()
//     // begin
//     //     if Users.Get(UserId) then begin
//     //         SetupEnable := Users."Periodic Activits/SetUp Access";
//     //     end;
//     // end;

//     var
//         Users: Record "User Setup";
//         GenJnlManagement: Codeunit GenJnlManagement;
//         IntraJnlManagement: Codeunit IntraJnlManagement;
//         VATStmtManagement: Codeunit VATStmtManagement;
//         [InDataSet]
//         SetupEnable: Boolean;
// }
