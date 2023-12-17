pageextension 50333 "pageextension50333" extends "Posted Service Shipment Lines"
{
    actions
    {
        //Unsupported feature: Property Modification (Name) on "Dimenions(Action 21)".

        //Unsupported feature: Property Modification (Name) on "ItemInvoiceLines(Action 38)".
    }
    local procedure ShowDimensions()
    begin
        Rec.ShowDimensions();
    end;

    local procedure ShowItemTrackingLines()
    begin
        Rec.ShowItemTrackingLines();
    end;
}
