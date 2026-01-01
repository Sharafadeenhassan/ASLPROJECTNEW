page 50010 "Table Lookup Header."
{
    PageType = Card;
    SourceTable = "Payroll-Lookup Header.";
    Caption = 'Table Lookup Header.';
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field(TableId; Rec.TableId)
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
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
            }
            group(Details)
            {
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
                field("Use Slabs";Rec."Use Slabs")
                {
                    ApplicationArea = All;
                }
            }
            part("Table Lookup Lines."; "Table Lookup Lines.")
            {
                SubPageLink = TableId = FIELD(TableId);
                SubPageView = SORTING(TableId, "Lower Amount", "Lower Code");
                UpdatePropagation = Both;
                ApplicationArea = All;                
            }
        }
    }

    actions
    {
    }
}
