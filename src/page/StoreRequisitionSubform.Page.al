page 50060 "Store Requisition Subform"
{
    PageType = ListPart;
    SourceTable = "Store Requisition Line New";
    Caption = 'Store Requisition Subform';
    DelayedInsert = true;
    AutoSplitKey = true;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                FreezeColumn = "Item Description";
                field("Req. No."; Rec."Req. No.")
                {
                    ApplicationArea = All;
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                }
                field("Store Location"; Rec."Store Location")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Claim by Employee"; Rec."Claim by Employee")
                {
                    ApplicationArea = All;
                }
                field("Requested Quantity"; Rec."Requested Quantity")
                {
                    ApplicationArea = All;
                }
                field("Approved Quantity"; Rec."Approved Quantity")
                {
                    ApplicationArea = All;
                }
                field("Issued Quantity"; Rec."Issued Quantity")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Claim by Resources"; Rec."Claim by Resources")
                {
                    ApplicationArea = All;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("Req. Type"; Rec."Req. Type")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Pending Approved Qty"; Rec."Pending Approved Qty")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("1st Approval"; Rec."1st Approval")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Final Approval"; Rec."Final Approval")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = All;
                }
                field("Procurement Request"; Rec."Procurement Request")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Shortage Qty"; Rec."Shortage Qty")
                {
                    ApplicationArea = All;
                }
                field("Item Category"; Rec."Item Category")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Last Replacement Date"; Rec."Last Replacement Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Expected Replacement Date"; Rec."Expected Replacement Date")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Replaced; Rec.Replaced)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Bin Card From Location")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    ReqRec.SetRange(ReqRec."No.", Rec."Item No.");
                    ReqRec.SetFilter(ReqRec."Location Filter", Rec."Store Location");
                    if ReqRec.FindFirst() then
                        REPORT.RunModal(704, true, false, ReqRec);
                end;
            }
            action("Bin Card To Location")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    StoreHead.Get(Rec."Req. No.");
                    ReqRec.SetRange(ReqRec."No.", Rec."Item No.");
                    ReqRec.SetFilter(ReqRec."Location Filter", StoreHead."Transfer To.");
                    if ReqRec.FindFirst() then
                        REPORT.RunModal(704, true, false, ReqRec);
                end;
            }
        }
    }

    var
        ReqRec: Record Item;
        StoreHead: Record "Store Requisition Header New";
/*
    trigger OnNewRecord();
    begin
        Rec."Store Location" := xRec."Store Location";
    end;
    */
}
