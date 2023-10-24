pageextension 50326 "pageextension50326" extends "Posted Transfer Receipt"
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
    }
    actions
    {
        addafter("&Receipt")
        {
            action("Item &Tracking Lines")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //AAA
                    //Currpage.TransferReceiptLines.page.ShowItemTrackingLines;
                end;
            }
        }
    }
}
