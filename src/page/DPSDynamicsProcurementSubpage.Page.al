page 50119 "Dynamics Procurement SubPage"
{
    AutoSplitKey = true;
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Dynamics Procurement Register";
    Caption = 'Dynamics Procurement SubPage';
    layout
    {
        area(content)
        {
            repeater("Item Stock Status")
            {
                FreezeColumn = "Location Code";
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("DPS Code";"DPS Code")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    
                    Style = Unfavorable;
                    StyleExpr = rec.Approved = true;
                    
                }
                field(Description; Rec.Description)
                {
                    StyleExpr = rec."Security Check";
                    Style = Favorable;
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                    StyleExpr = rec."Qcc Checked";
                    Style = Attention;
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Available Stock Months"; Rec."Available Stock Months")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Requested Quantity"; rec."Requested Quantity")
                {
                    ApplicationArea = all;
                    Editable = rec.Approved = false;
                }
                field("HOD Approved Qty";rec."HOD Approved Qty")
                {
                    ApplicationArea = all;
                    StyleExpr = rec."PI No." <> '';
                    Style = Strong;
                }
                field("Req+Ava Qty"; rec."Req+Ava Qty")
                {
                    ApplicationArea = all;
                }
                field("Expected Stock Period"; rec."Expected Stock Period")
                {
                    Description = 'With Requested Quantity how long It will Take to consume';
                    ApplicationArea = all;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Approved Order Quantity"; Rec."Approved Order Quantity")
                {
                    Editable = Rec.Approved = FALSE;
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Process Mode"; Rec."Process Mode")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("2nd Approved (Store)"; Rec.Approved)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Average Consumption Base"; Rec."Average Consumption Base")
                {
                    Importance = Additional;
                    ApplicationArea = all;

                }
                field("Item Status"; Rec."Item Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Store processed"; Rec.processed)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Store process By"; Rec."process By")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Base Date"; Rec."Base Date")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Last Month Consumption"; Rec."Last Month Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Last 3 Months Consumption"; Rec."Last 3 Months Consumption")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Last 6 Month Consumption"; Rec."Last 6 Month Consumption")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Last One Year Consumption"; Rec."Last One Year Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Last 2 Years Consumption"; Rec."Last 2 Years Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Last 3 Years Consumption"; Rec."Last 3 Years Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Last 4 Years Consumption"; Rec."Last 4 Years Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Last 5 Years Consumption"; Rec."Last 5 Years Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Ave. 3 Month Consumption"; Rec."Ave. 3 Month Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Ave. 6 Month Consumption"; Rec."Ave. 6 Month Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Ave. One Year Consumption"; Rec."Ave. One Year Consumption")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Last 2 Years Monthly Average"; Rec."Last 2 Years Monthly Average")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Last 3 Years Monthly Average"; Rec."Last 3 Years Monthly Average")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Last 4 Years Monthly Average"; Rec."Last 4 Years Monthly Average")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Visible = false;
                }
                field("Last 5 Years Monthly Average"; Rec."Last 5 Years Monthly Average")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }

            }
            group(Processing)
            {
                Visible = false;

                field("Security Check"; rec."Security Check")
                {
                    ApplicationArea = all;
                }
                field("Qcc Checked"; rec."Qcc Checked")
                {
                    ApplicationArea = all;
                }
                field("Ready For GRN";rec."Ready For GRN")
                {
                    ApplicationArea = all;
                }
                field("PO No.";rec."PO No.")
                {
                    ApplicationArea = all;
                }
                field("PI No.";rec."PI No.")
                {
                    ApplicationArea = all;
                }
            }

        }
    }

    actions
    {
        area(processing)
        {
            action("Create Purchase Order")
            {
                Image = Invoice;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CreatePurchInv();
                end;
            }
            action("Create Purchase Register")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.UpdatePurReq();
                end;
            }
        }
    }
}
