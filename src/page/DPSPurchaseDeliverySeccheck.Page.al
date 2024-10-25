page 50116 "Purchase Request Sec. check"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    SourceTable = "Purchase Requisition1";
    SourceTableView = WHERE("Sent to Security" = CONST(true),
                            "QCC Check" = CONST(false),
                            "Security checked" = CONST(false));
    Caption = 'Purchase Delivery Sec. check';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Req No."; Rec."Req No.")
                {
                    Editable = false;
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
                field("Supply By"; Rec."Supply By")
                {
                    Editable = false;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Sent to Security"; Rec."Sent to Security")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group("Security Action")
            {
                field("Security Check Quantity"; Rec."Security Check Quantity")
                {
                    ApplicationArea = All;
                }
                field("Security Comment"; Rec."Security Comment")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Security checked"; Rec."Security checked")
                {
                    Editable = Rec."Security Check Quantity" > 0;
                    ApplicationArea = All;
                }
                field("Security Check By"; Rec."Security Check By")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Security Check Time"; Rec."Security Check Time")
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
        Rec.SetFilter("Security Check By", UserId);
        Rec.FilterGroup(2);
    end;

}
