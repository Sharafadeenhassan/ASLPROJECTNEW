page 50134 "Shop Lines"
{
    ApplicationArea = All;
    Caption = 'Fish Shop Sales Lines';
    PageType = List;
    SourceTable = "Shop Lines";
    UsageCategory = Lists;
    InsertAllowed = false;
    ShowFilter = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
            
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shop Code field.', Comment = '%';
                    Editable = False;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice No. field.', Comment = '%';
                }
                field("General Device"; Rec."General Device")
                { 
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the General Device field.', Comment = '%';
                }
                field("Terminal No."; Rec."Terminal No.")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terminal No. field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.', Comment = '%';
                }
                field(Posted; Rec.Posted)
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoiced field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Price Group"; Rec."Price Group")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Price group field.', Comment = '%';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    Editable = False;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("Header Exist";rec."Header Exist")
                {
                    ApplicationArea = All;
                }
                field("Restore Header"; Rec."Restore Header")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Restore Header field.', Comment = '%';
                }
            }
        }
    }
}
