reportextension 50252 BincardExt extends "Inventory - Transaction Detail"
{
    dataset
    {
        add("Item Ledger Entry")
        {
            column(LocationCode; "Location Code")
            {
            }
            column(TransferFr; TransferFr)
            {
            }
            column(TransferFrLB; TransferFrLB)
            {
            }
            column(TransferTo; TransferTo)
            {
            }
            column(TransferToLB; TransferToLB)
            {
            }
            column(IssueNo; IssueNo)
            {
            }
            column(ReqNo; ReqNo)
            {
            }
        }
    }
    var
        TransferTo: Text[30];
        TransferToLB: Label 'Transfer To';
        TransferFr: Text[30];
        TransferFrLB: Label 'Transfer From';
        ReqNo: Label 'Req No.';
        IssueNo: Code[20];

}
