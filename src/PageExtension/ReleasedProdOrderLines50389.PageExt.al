pageextension 50389 "pageextension50389" extends "Released Prod. Order Lines"
{
    layout
    {
        //Unsupported feature: Property Modification (ImplicitType) on ""Routing Version Code"(Control 42)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Production BOM Version Code"(Control 38)".
    }
    actions
    {
        //Unsupported feature: Property Modification (Name) on "ItemAvailabilityByEvent(Action 5)".

        //Unsupported feature: Property Modification (Name) on "ItemAvailabilityByPeriod(Action 1901741904)".

        //Unsupported feature: Property Modification (Name) on "ItemAvailabilityByVariant(Action 1903866604)".

        //Unsupported feature: Property Modification (Name) on "ItemAvailabilityByLocation(Action 1901313004)".

        //Unsupported feature: Property Modification (Name) on "ItemAvailabilityByBOMLevel(Action 3)".

        //Unsupported feature: Property Modification (Name) on "ReservationEntries(Action 1900205804)".

        //Unsupported feature: Property Modification (Name) on "Routing(Action 1903098604)".

        //Unsupported feature: Property Modification (Name) on "ItemTrackingLines(Action 1905987604)".

        //Unsupported feature: Property Modification (Name) on "ProductionJournal(Action 1902760704)".

        //Unsupported feature: Code Modification on ""&Reserve"(Action 1902759304).OnAction".

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

    //Unsupported feature: Property Modification (Name) on "PageShowReservation(PROCEDURE 16)".

    local procedure ShowDimensions()
    begin
        Rec.ShowDimensions();
    end;

    local procedure OpenItemTrackingLines()
    begin
        Rec.OpenItemTrackingLines();
    end;
}
