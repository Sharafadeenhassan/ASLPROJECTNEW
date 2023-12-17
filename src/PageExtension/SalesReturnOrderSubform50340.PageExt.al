pageextension 50340 "pageextension50340" extends "Sales Return Order Subform"
{
    layout
    {
        //Unsupported feature: Property Modification (Name) on "Control28(Control 28)".
    }
    actions
    {
        //Unsupported feature: Property Modification (Name) on "Reserve(Action 1902085804)".

        //Unsupported feature: Property Modification (Name) on "Comments(Action 1900525904)".

        //Unsupported feature: Property Modification (Name) on "ItemTrackingLines(Action 1905987604)".

        //Unsupported feature: Code Modification on "Reserve(Action 1902085804).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PageShowReservation;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowReservation;
        */
        //end;
    }

    //Unsupported feature: Property Modification (Name) on "PageShowReservation(PROCEDURE 2)".

    local procedure OpenItemTrackingLines()
    begin
        Rec.OpenItemTrackingLines();
    end;
}
