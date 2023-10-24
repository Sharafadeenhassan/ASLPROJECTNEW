pageextension 50325 "pageextension50325" extends "Posted Transfer Shipment"
{
    layout
    {
        moveafter("Transfer-to Code"; "Direct Transfer")
        modify("Direct Transfer")
        {
            ApplicationArea = Location;
            Editable = false;
            ToolTip = 'Specifies that the transfer does not use an in-transit location.';
        }

        moveafter(TransferShipmentLines; Shipment)
        modify(Shipment)
        {
            Caption = 'Shipment';
        }
    }
    actions
    {
        addfirst("&Shipment")
        {
            action(List)
            {
                ShortCutKey = 'F5';
                ApplicationArea = All;
            }
        }
        addafter(Dimensions)
        {
            action("Item &Tracking Lines")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //AAA
                    /*
                    CurrPage.TransferShipmentLines.page.ShowItemTrackingLines;
                    */
                end;
            }
        }
    }
}
