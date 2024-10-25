page 50123 "Purchase Request Sec. Return"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    SourceTable = "Purchase Requisition1";
    SourceTableView = WHERE("Sent to Security" = CONST(true),
                            "QCC Check" = CONST(true),
                            "Security checked" = CONST(true),
                            //"Procurement Mgr. Action" = CONST(Approved),
                            "Return to Security" = CONST(true),
                            "Quantity To Return" = filter(>0),
                            "Security Returned" = CONST(false));

    Caption = 'Purchase Delivery Sec. Return';
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
                field("Security Return Quantity"; Rec."Security Return Quantity")
                {
                    ApplicationArea = All;
                }
                field("Security Returned"; Rec."Security Returned")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Print Security Way Bill")
            {
                Image = Delivery;
                Promoted = true;
                //RunObject = Report "Purchase Return Way Bill";
                //RunPageOnRec = true;
                ApplicationArea = All;

                trigger OnAction()
                var PR1 : record "Purchase Requisition1";
                    PurchWay: Report "Purchase Return Way Bill";
                    begin
                        PR1.SetRange(PR1."Supply By",Rec."Supply By");
                        PR1.SetFilter(PR1."Security Return Quantity",'>%1',0);
                        PR1.SetFilter(PR1."Security Returned",'%1',false);
                        PurchWay.SetTableView(PR1);
                        PurchWay.Run();
                    end;

            }
        }
    }
        trigger OnOpenPage()
    begin
        Rec.SetFilter("Security Check By", UserId);
        Rec.FilterGroup(2);
    end;

}
