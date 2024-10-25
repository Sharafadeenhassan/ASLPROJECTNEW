page 50128 "Approved DPS Line"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Dynamics Procurement Register";
    SourceTableView = WHERE(processed = CONST(false),
                            Approved = CONST(true));
    UsageCategory = Administration;
    ApplicationArea = all;
    Caption = 'Approved DPS Line';
    Editable = false;
    layout
    {
        area(content)
        {
            repeater("Item Stock Status")
            {
                FreezeColumn = "Location Code";
                field("DPS Code";rec."DPS Code")
                {
                    ApplicationArea = all;
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
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
                field("Item Status"; Rec."Item Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                }                
                field("Approved Order Quantity"; Rec."Approved Order Quantity")
                {
                    Editable = Rec.Approved = FALSE;
                    ApplicationArea = All;
                }                                
                field(processed; Rec.processed)
                {
                    ApplicationArea = All;
                }
                field("process By"; Rec."process By")
                {
                    ApplicationArea = All;
                }                
                field("Base Date"; Rec."Base Date")
                {
                    Editable = false;
                    Visible = false;
                    ApplicationArea = All;
                }                
                field("Last Month Consumption"; Rec."Last Month Consumption")
                {
                    ApplicationArea = All;
                }
                field("Last 3 Months Consumption"; Rec."Last 3 Months Consumption")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Last 6 Month Consumption"; Rec."Last 6 Month Consumption")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Last One Year Consumption"; Rec."Last One Year Consumption")
                {
                    ApplicationArea = All;
                }
                field("Last 2 Years Consumption"; Rec."Last 2 Years Consumption")
                {
                    ApplicationArea = All;
                }
                field("Last 3 Years Consumption"; Rec."Last 3 Years Consumption")
                {
                    ApplicationArea = All;
                }
                field("Last 4 Years Consumption"; Rec."Last 4 Years Consumption")
                {
                    ApplicationArea = All;
                }
                field("Last 5 Years Consumption"; Rec."Last 5 Years Consumption")
                {
                    ApplicationArea = All;
                }
                field("Ave. 3 Month Consumption"; Rec."Ave. 3 Month Consumption")
                {
                    ApplicationArea = All;
                }
                field("Ave. 6 Month Consumption"; Rec."Ave. 6 Month Consumption")
                {
                    ApplicationArea = All;
                }
                field("Ave. One Year Consumption"; Rec."Ave. One Year Consumption")
                {
                    ApplicationArea = All;
                }
                field("Last 2 Years Monthly Average"; Rec."Last 2 Years Monthly Average")
                {
                    ApplicationArea = All;
                }
                field("Last 5 Years Monthly Average"; Rec."Last 5 Years Monthly Average")
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
            action("Create Purchase Order")
            {
                Image = Invoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CreatePurchInv();
                end;
            }
            action("Create Purchase Register")
            {
                Image = RegisteredDocs;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.UpdatePurReq();
                end;
            }
        }
    }
}
