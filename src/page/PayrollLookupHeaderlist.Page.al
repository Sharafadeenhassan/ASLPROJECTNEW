page 50135 "Payroll-Lookup Header list"
{
    SourceTable = "Payroll-Lookup Header.";
    Caption = 'Payroll-Lookup Header list';
    CardPageId = "Table Lookup Header.";
    UsageCategory = Lists;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            group(Control12)
            {
                ShowCaption = false;
                field(TableId; Rec.TableId)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                }
                field("Max. Extract Amount"; Rec."Max. Extract Amount")
                {
                    ApplicationArea = All;
                }
                field("Min. Extract Amount"; Rec."Min. Extract Amount")
                {
                    ApplicationArea = All;
                }
                field("Input Factor"; Rec."Input Factor")
                {
                    ApplicationArea = All;
                }
                field("Output Factor"; Rec."Output Factor")
                {
                    ApplicationArea = All;
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ApplicationArea = All;
                }
                field("Rounding Direction"; Rec."Rounding Direction")
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
