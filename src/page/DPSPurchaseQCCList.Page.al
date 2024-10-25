page 50117 "Purchase Request QCC List"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    SourceTable = "Purchase Requisition1";
    SourceTableView = WHERE("Security checked" = CONST(true),
                            "QCC Check" = CONST(false),
                            "Sent For QCC" = CONST(true),
                            Process = CONST(false));
    Caption = 'Purchase QCC List';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Req No."; Rec."Req No.")
                {
                    Enabled = false;
                    ApplicationArea = All;
                }
                field("Req Location"; Rec."Req Location")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Req. By Name"; Rec."Req. By Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("QCC Action")
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                field("QCC Check Quantity"; Rec."QCC Check Quantity")
                {
                    ApplicationArea = All;
                }
                field("QCC Comment"; Rec."QCC Comment")
                {
                    ApplicationArea = All;
                }
                field("QCC Check"; Rec."QCC Check")
                {
                    ApplicationArea = All;
                }
                field("QCC Check  By"; Rec."QCC Check  By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("QCC Check  Name"; Rec."QCC Check  Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("QCC Check Time"; Rec."QCC Check Time")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
        trigger OnOpenPage()
    begin
        Rec.SetFilter("QCC Check  By", UserId);
        Rec.FilterGroup(2);
    end;

}
