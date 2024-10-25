page 50087 "Dynamic Purchase Requisition"
{
    Caption = 'Dynamic Purchase Requisition';
    PageType = Document;
    SourceTable = "Dynamics Procurement Header";
    SourceTableView = where(Processed = const(true));
    ApplicationArea = all;
    UsageCategory = Documents;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;

                field("DPS No."; Rec."DPS No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DPS No. field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved field.', Comment = '%';
                }
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store Approved field.', Comment = '%';
                }
                field("Req Department"; Rec."Req Department")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Req Department field.', Comment = '%';
                }
                field("Approved Line items"; Rec."Approved Line items")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Line items field.', Comment = '%';
                }
            }
            group("Details Process")
            {
            grid(Details)
            {
                GridLayout = Columns;
                group(Lines)
                {
                part("Requested Line"; "Dynamic Purchase Req. SubPage")
                {
                    Caption = 'Requested Items';
                    SubPageLink = "Req No." = FIELD("DPS No.");
                    SubPageView = where("Security checked" = const(false));
                    ApplicationArea = All;
                    Editable = false;
                }
                }
                group(Process)
                {
                part(Approval; "Dynamics Purchase SubPage")
                {
                    Provider = "Requested Line";
                    SubPageLink = "Req. Line No." = FIELD("Req. Line No."),
                              "Req No." = FIELD("Req No.");
                    ApplicationArea = All;
                    Editable = true;
                }
                }
            }
            }
        }
        /* area(FactBoxes)
         {
             part(Approvals; "Dynamics Purchase SubPage")
             {
                 Provider = "Requested Line";
                 SubPageLink = "Req. Line No." = FIELD("Req. Line No."),
                               "Req No." = FIELD("Req No.");
                 ApplicationArea = All;
                 Editable = true;
             }
         }*/
    }
}
