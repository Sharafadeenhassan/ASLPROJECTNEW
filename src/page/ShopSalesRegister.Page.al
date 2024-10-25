page 50130 "Shop Sales Register"
{
    Caption = 'Shop Sales Register';
    PageType = List;
    SourceTable = ShopHeader;
    ApplicationArea = All;
    UsageCategory = Administration;
    InsertAllowed = false;
    Editable = false;
    ShowFilter = true;
    SourceTableView =order(descending);

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowAsTree = true;
                TreeInitialState = CollapseAll;

                field("Shop Code"; Rec."Shop Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shop Code field.', Comment = '%';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice/Receipt No. field.', Comment = '%';
                }
                field("Posting date"; Rec."Posting date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting date field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted Document No. field.', Comment = '%';
                }
                field(PayMode; Rec.PayMode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PayMode field.', Comment = '%';
                }
                field("General Device"; Rec."General Device")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the General Device field.', Comment = '%';
                }
                field("Invoice Total"; Rec."Invoice Total")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Total field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("Terminal No."; Rec."Terminal No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terminal No. field.', Comment = '%';
                }
                field("Transfer Pay"; Rec."Transfer Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Pay field.', Comment = '%';
                }
                field("Value card"; Rec."Value card")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value card field.', Comment = '%';
                }
                field("Cash Pay"; Rec."Cash Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Pay field.', Comment = '%';
                }
                field("Cashier Code"; Rec."Cashier Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier Code field.', Comment = '%';
                }
            }
            part(Details; "Shop Sales Sub")
            {
                SubPageLink = Code = field("Shop Code"), "Invoice No." = field("Invoice No.");
                Editable = false;

            }

        }
    }
}
