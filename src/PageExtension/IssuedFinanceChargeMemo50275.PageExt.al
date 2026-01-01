pageextension 50275 "pageextension50275" extends "Issued Finance Charge Memo"
{
    actions
    {
        //Unsupported feature: Code Modification on ""Send by &Email"(Action 3).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IssuedFinChrgMemoHeader := Rec;
        CurrPage.SetSelectionFilter(IssuedFinChrgMemoHeader);
        IssuedFinChrgMemoHeader.PrintRecords(false,true,false);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        IssuedFinChrgMemoHeader := Rec;
        CurrPage.SetSelectionFilter(IssuedFinChrgMemoHeader);
        IssuedFinChrgMemoHeader.PrintRecords(false,true,true);
        */
        //end;
    }
}
