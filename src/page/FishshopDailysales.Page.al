page 50061 "Fishshop Daily sales"
{
    PageType = List;
    SourceTable = "Fish Shop Daily Sales";
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Fishshop Daily sales';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
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
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                }
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                }
                field("Day Sale Qty"; Rec."Day Sale Qty")
                {
                    ApplicationArea = All;
                }
                field("Day Sale Value"; Rec."Day Sale Value")
                {
                    ApplicationArea = All;
                }
                field("Cust No"; Rec."Cust No")
                {
                    ApplicationArea = All;
                }
                field("Payment Device";"Payment Device")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Daily Sales")
            {
                RunObject = XMLport "Import FS daily sales";
                ApplicationArea = All;
            }
        }
    }
}
