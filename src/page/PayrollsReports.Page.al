page 50167 "Payrolls-Reports"
{
    UsageCategory = Administration;
    ApplicationArea = all;
    Caption = 'Payrolls-Reports';
    layout
    {
    }

    actions
    {
        area(reporting)
        {
            group(Action152)
            {
                Image = Report;
                action("Create New Payslips ")
                {
                    Image = Report;
                    RunObject = Report "ASL Create New payslips - New";
                    ApplicationArea = All;
                }
                action("Monthly Payslip")
                {
                    Image = Report;
                    RunObject = Report "Monthly Payslip";
                    ApplicationArea = All;
                }
                action("Payroll Report")
                {
                    Image = Report;
                    RunObject = Report "Payroll Report";
                    ApplicationArea = All;
                }
                action("Outstanding Loans")
                {
                    Image = "Report";
                    RunObject = Report "OUTSTANDING LOANS";
                    ApplicationArea = All;
                }
                action("Payroll Report - NSITF")
                {
                    Image = "report";
                    RunObject = Report "Payroll Report - NSITF";
                    ApplicationArea = All;
                }
                action("PRoll; Create Journal Entries")
                {
                    Image = "report";
                    RunObject = Report "PRoll; Create Journal Entries";
                    ApplicationArea = All;
                }
                action("Bank Account - Employee")
                {
                    Image = "report";
                    RunObject = Report "Employee-Bank Acct";
                    ApplicationArea = All;
                }
            }
        }
    }
}
