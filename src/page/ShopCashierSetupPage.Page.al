page 50108 "Shop Cashier Setup Page"
{
    Caption = 'Shop Cashier Setup Page';
    PageType = Card;
    SourceTable = "Shop Setup";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Shop Code"; Rec."Shop Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shop Code field.', Comment = '%';
                }
                field("Terminal No."; Rec."Terminal No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terminal No. field.', Comment = '%';
                }
                field("Terminal Operator"; Rec."Terminal Operator")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Terminal Operator field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-Mail field.', Comment = '%';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone field.', Comment = '%';
                }
                field("Invoice Nos"; Rec."Invoice Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Nos field.', Comment = '%';
                }
                field("Cash Customer Acct"; Rec."Cash Customer Acct")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Customer Acct field.', Comment = '%';
                }
                field("Value Customer Acct"; Rec."Value Customer Acct")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value Card Customer Acct field.', Comment = '%';
                }
                field("Multiple Pay Customer Acct";"Multiple Pay Customer Acct")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies Customer Account To be Used for Multiple Payment Customer',Comment = '%';
                }
                field("Default Price Group"; rec."Default Price Group")
                {
                    ApplicationArea = all;
                }
                field(Department; rec.Department)
                {
                    ApplicationArea = All;
                }
                field("Gen. Journal Template"; rec."Gen. Journal Template")
                {
                    ApplicationArea = All;
                }
                field("General Journal Batch"; rec."General Journal Batch")
                {
                    ApplicationArea = All;
                }
            }
            group("Sale Details")
            { 
                Editable = false;                
                field("Total Sales";Rec."Total Sales")
                {
                    ApplicationArea = All;
                }
                field("Total Cash";"Total Cash")
                {
                    ApplicationArea = all;
                    Importance = Additional;                
                }
                field("Total Transfer";"Total Transfer")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
                field("Total Value card";"Total Value card")
                {
                    ApplicationArea = all;
                    Importance = Additional;
                }
            }
        }
    }
}