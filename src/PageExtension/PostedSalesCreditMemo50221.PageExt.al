pageextension 50221 "pageextension50221" extends "Posted Sales Credit Memo"
{
    actions
    {
        //Unsupported feature: Property Modification (Name) on "Print(Action 50)".

        //Unsupported feature: Code Modification on "Print(Action 50).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        SalesCrMemoHeader := Rec;
        CurrPage.SetSelectionFilter(SalesCrMemoHeader);
        SalesCrMemoHeader.PrintRecords(true);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SetSelectionFilter(SalesCrMemoHeader);
        SalesCrMemoHeader.PrintRecords(true);
        */
        //end;
    }
}
