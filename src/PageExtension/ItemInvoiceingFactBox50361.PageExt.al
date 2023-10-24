pageextension 50361 "pageextension50361" extends "Item Invoicing FactBox"
{
    layout
    {
        addafter("Unit Price")
        {
            field(Inventory; Rec.Inventory)
            {
                ApplicationArea = All;
            }
            field("CRM / STR"; Rec."CRM / STR")
            {
                ApplicationArea = All;
            }
            group("Material Requisition")
            {
                field("MR Pending  Qty"; Rec."MR Pending  Qty")
                {
                    ApplicationArea = All;
                }
                field("MR Approved Qty"; Rec."MR Approved Qty")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
