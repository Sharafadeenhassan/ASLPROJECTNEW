pageextension 50272 "pageextension50272" extends "Sales Credit Memo"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
        }
    }
    actions
    {
        //Unsupported feature: Property Insertion (RunObject) on "TestReport(Action 71)".

        //Unsupported feature: Code Modification on "TestReport(Action 71).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ReportPrint.PrintSalesHeader(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //ReportPrint.PrintSalesHeader(Rec);
        */
        //end;
    }
}
