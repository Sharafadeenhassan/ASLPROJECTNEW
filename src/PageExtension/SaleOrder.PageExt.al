pageextension 55000 "SaleOrder" extends "Sales Order"
{
    layout
    {
        addafter("Shipping Advice")
        {
            field("Vessel Name"; Rec."Vessel Name")
            {
                ApplicationArea = All;
            }
            field("Seal No"; Rec."Seal No")
            {
                caption = 'Container No.';
                ApplicationArea = All;
            }
            field("Container Code"; Rec."Container Code")
            {
                ApplicationArea = All;
            }
            field("Container Size"; Rec."Container Size")
            {
                ApplicationArea = All;
            }
            field("Shipment Month"; "Shipment Month")
            {
                ApplicationArea = All;
            }
        }
        addafter("Area")
        {
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }
}