page 50004 "Payroll ED Survey."
{
    Editable = false;
    PageType = Card;
    SourceTable = "Payroll-E/D Codes.";
    Caption = 'Payroll ED Survey.';
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("E/D Code"; Rec."E/D Code")
                {
                    ApplicationArea = All;
                }
                field("Payslip Text"; Rec."Payslip Text")
                {
                    ApplicationArea = All;
                }
                field("Payslip appearance"; Rec."Payslip appearance")
                {
                    ApplicationArea = All;
                }
                field("Payslip Group ID"; Rec."Payslip Group ID")
                {
                    ApplicationArea = All;
                }
                field("Pos. In Payslip Grp."; Rec."Pos. In Payslip Grp.")
                {
                    ApplicationArea = All;
                }
                field("Payslip Column"; Rec."Payslip Column")
                {
                    ApplicationArea = All;
                }
                field(Compute; Rec.Compute)
                {
                    ApplicationArea = All;
                }
                field("Add/Subtract"; Rec."Add/Subtract")
                {
                    ApplicationArea = All;
                }
                field("Factor Of"; Rec."Factor Of")
                {
                    ApplicationArea = All;
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = All;
                }
                field("Table Look Up"; Rec."Table Look Up")
                {
                    ApplicationArea = All;
                }
                field("Edit Amount?"; Rec."Edit Amount?")
                {
                    ApplicationArea = All;
                }
                field("Edit Grp. Amount?"; Rec."Edit Grp. Amount?")
                {
                    ApplicationArea = All;
                }
                field("Yes/No Req.?"; Rec."Yes/No Req.?")
                {
                    ApplicationArea = All;
                }
                field("Max. Amount"; Rec."Max. Amount")
                {
                    MaxValue = 99990;
                    MinValue = 0;
                    NotBlank = true;
                    ApplicationArea = All;
                }
                field("Min. Amount"; Rec."Min. Amount")
                {
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
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
