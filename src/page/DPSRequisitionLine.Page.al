page 50129 "DPS  Requisition Line"
{
    ApplicationArea = All;
    Caption = 'DPS  Requisition Line';
    PageType = List;
    SourceTable = "Dynamics Procurement Register";
    UsageCategory = Lists;
    Editable = false;
    
    layout
    {        
        area(Content)
        {
            repeater(General)
            {
                Editable = false;
                field("DPS Code"; Rec."DPS Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DPS Code field.', Comment = '%';
                }
                field("Base Date"; Rec."Base Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Base Date field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("Req Department"; Rec."Req Department")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Req Department field.', Comment = '%';
                }
                field("Requested Quantity"; Rec."Requested Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Requested Quantity field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store Approved field.', Comment = '%';
                }
                field("Approved Order Quantity"; Rec."Approved Order Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Order Quantity field.', Comment = '%';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.', Comment = '%';
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available Quantity field.', Comment = '%';
                }
                field("Available Stock Months"; Rec."Available Stock Months")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Available Stock Months field.', Comment = '%';
                }
                field("Ave. 3 Month Consumption"; Rec."Ave. 3 Month Consumption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ave. 3 Month Consumption field.', Comment = '%';
                }
                field("Ave. 6 Month Consumption"; Rec."Ave. 6 Month Consumption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ave. 6 Month Consumption field.', Comment = '%';
                }
                field("Ave. One Year Consumption"; Rec."Ave. One Year Consumption")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ave. One Year Consumption field.', Comment = '%';
                }
                field("Last 2 Years Monthly Average"; Rec."Last 2 Years Monthly Average")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last 2 Years Monthly Average field.', Comment = '%';
                }
                field("Last 3 Months Average"; Rec."Last 3 Months Average")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last 3 Months Average field.', Comment = '%';
                }
                field("Last 3 Years Monthly Average"; Rec."Last 3 Years Monthly Average")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last 3 Years Monthly Average field.', Comment = '%';
                }
                field("Last 4 Years Monthly Average"; Rec."Last 4 Years Monthly Average")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last 4 Years Monthly Average field.', Comment = '%';
                }
                field("Last 5 Years Monthly Average"; Rec."Last 5 Years Monthly Average")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last 5 Years Monthly Average field.', Comment = '%';
                }
                field(processed; Rec.processed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the processed field.', Comment = '%';
                }
                field("process By"; Rec."process By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the process By field.', Comment = '%';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order No. field.', Comment = '%';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Order Date field.', Comment = '%';
                }
            }
        }
    }
}
