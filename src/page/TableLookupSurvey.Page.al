page 50012 "Table Lookup Survey."
{
    Editable = false;
    PageType = Card;
    SourceTable = "Payroll-Lookup Header.";
    UsageCategory = Documents;
    ApplicationArea = All, Basic;

    layout
    {
        area(content)
        {
            repeater(Control1)
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
                field("Max. Extract Amount"; Rec."Max. Extract Amount")
                {
                    ApplicationArea = All;
                }
                field("Min. Extract Amount"; Rec."Min. Extract Amount")
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

