page 50011 "Table Lookup Lines."
{
    Caption = 'Table Lookup Sub';
    PageType = ListPart;
    SourceTable = "Payroll-Lookup Lines.";
    //SaveValues = true;
    //SourceTableView = SORTING(TableId, "Lower Amount", "Lower Code");
    ApplicationArea = All;
    UsageCategory = Lists;
    //AutoSplitKey = true;
    DelayedInsert = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(TableId;rec.TableId)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Lower Amount"; Rec."Lower Amount")
                {
                    ApplicationArea = All;
                }
                field("Upper Amount"; Rec."Upper Amount")
                {
                    ApplicationArea = All;
                }
                field("Lower Code"; Rec."Lower Code")
                {
                    ApplicationArea = All;
                }
                field("Upper Code"; Rec."Upper Code")
                {
                    ApplicationArea = All;
                }
                field("Extract Amount"; Rec."Extract Amount")
                {
                    ApplicationArea = All;
                }
                field("Tax Rate %"; Rec."Tax Rate %")
                {
                    ApplicationArea = All;
                }
                field("Cum. Tax Payable"; Rec."Cum. Tax Payable")
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
