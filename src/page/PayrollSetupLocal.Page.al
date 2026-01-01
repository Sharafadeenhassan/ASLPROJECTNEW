page 50001 "Payroll Setup Local"
{
    PageType = Card;
    SourceTable = "ASL Payroll Setup";
    Caption = 'Payroll Setup Local';
    UsageCategory = Administration;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Loan Nos."; Rec."Loan Nos.")
                {
                    ApplicationArea = All;
                }
                field("Overtime Nos."; Rec."Overtime Nos.")
                {
                    Caption = 'Overtime Register Nos.';
                    ApplicationArea = All;
                }
                field("Staff Loans Control Account"; Rec."Staff Loans Control Account")
                {
                    ApplicationArea = All;
                }
                field("Taxfree Pay ED"; Rec."Taxfree Pay ED")
                {
                    ApplicationArea = All;
                }
                field("Monthly Working Days"; Rec."Monthly Working Days")
                {
                    ApplicationArea = All;
                }
                field("Daily Working Hours"; Rec."Daily Working Hours")
                {
                    ApplicationArea = All;
                }
                field("Total Monthly Hours"; Rec."Total Monthly Hours")
                {
                    ApplicationArea = All;
                }
            }
            group(Permission)
            {
                Caption = 'Permission';
                field("MD ID"; Rec."MD ID")
                {
                    LookupPageID = Users;
                    ApplicationArea = All;
                }
                field("Accountant 1"; Rec."Accountant 1")
                {
                    ApplicationArea = All;
                }
                field("Accountant 2"; Rec."Accountant 2")
                {
                    ApplicationArea = All;
                }
                field("Accountant 3"; Rec."Accountant 3")
                {
                    ApplicationArea = All;
                }
                field("HR Officer"; Rec."HR Officer")
                {
                    ApplicationArea = All;
                }
                field("Allow HR Edit on"; Rec."Allow HR Edit on")
                {
                    ApplicationArea = All;
                }
            }
            group("ED Default")
            {
                Caption = 'ED Default';
                field("Basic+Hous+Transp"; Rec."Basic+Hous+Transp")
                {
                    ApplicationArea = All;
                }
                field("NSITF(Employee)"; Rec."NSITF(Employee)")
                {
                    ApplicationArea = All;
                }
                field("NSITF(Employer)"; Rec."NSITF(Employer)")
                {
                    ApplicationArea = All;
                }
                field(Seniority; Rec.Seniority)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}
