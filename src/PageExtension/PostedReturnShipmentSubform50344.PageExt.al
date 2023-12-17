pageextension 50344 "pageextension50344" extends "Posted Return Shipment Subform"
{
    actions
    {
        //Unsupported feature: Property Modification (Name) on "Comments(Action 1907504604)".

        //Unsupported feature: Property Modification (Name) on "ItemTrackingEntries(Action 1905987604)".

        //Unsupported feature: Property Modification (Name) on "ItemCreditMemoLines(Action 1903100004)".

        //Unsupported feature: Code Modification on "ItemCreditMemoLines(Action 1903100004).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PageShowItemPurchCrMemoLines;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowItemPurchCrMemoLines;
        */
        //end;
    }

    //Unsupported feature: Property Modification (Name) on "PageShowItemPurchCrMemoLines(PROCEDURE 2)".

    local procedure ShowItemTrackingLines()
    begin
        Rec.ShowItemTrackingLines();
    end;

    local procedure ShowLineComments()
    begin
        Rec.ShowLineComments();
    end;
}
