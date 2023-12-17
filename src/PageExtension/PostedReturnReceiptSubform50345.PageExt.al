pageextension 50345 "pageextension50345" extends "Posted Return Receipt Subform"
{
    actions
    {
        //Unsupported feature: Property Modification (Name) on "Comments(Action 1901741704)".

        //Unsupported feature: Property Modification (Name) on "ItemTrackingEntries(Action 1905987604)".

        //Unsupported feature: Property Modification (Name) on "ItemCreditMemoLines(Action 1901652104)".

        //Unsupported feature: Code Modification on "ItemCreditMemoLines(Action 1901652104).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        PageShowItemSalesCrMemoLines;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ShowItemSalesCrMemoLines;
        */
        //end;
    }

    //Unsupported feature: Property Modification (Name) on "PageShowItemSalesCrMemoLines(PROCEDURE 2)".

    local procedure ShowItemTrackingLines()
    begin
        Rec.ShowItemTrackingLines();
    end;

    local procedure ShowLineComments()
    begin
        Rec.ShowLineComments();
    end;
}
