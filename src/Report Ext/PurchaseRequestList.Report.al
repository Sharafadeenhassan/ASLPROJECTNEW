report 50233 "Purchase Request List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PurchaseRequestList.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Purchase Request Status List';
    dataset
    {
        dataitem("Purchase Requisition1"; "Purchase Requisition1")
        {
            RequestFilterFields = "Req No.", "Item No.", "Supply By";
            column(ReqNo; "Purchase Requisition1"."Req No.")
            {
            }
            column(Location; "Purchase Requisition1"."Req Location")
            {
            }
            column(ItemNo; "Purchase Requisition1"."Item No.")
            {
            }
            column(description; "Purchase Requisition1".Description)
            {
            }
            column(Quantity; "Purchase Requisition1".Quantity)
            {
            }
            column(RequsetedbyName; "Purchase Requisition1"."Req. By Name")
            {
            }
            column(Supplier; "Purchase Requisition1"."Supplier Name")
            {
            }
            column(SecCheQty; "Purchase Requisition1"."Security Check Quantity")
            {
            }
            column(SecCheName; "Purchase Requisition1"."Security Checked By Name")
            {
            }
            column(SecCheTime; "Purchase Requisition1"."Security Check Time")
            {
            }
            column(QccCheQty; "Purchase Requisition1"."QCC Check Quantity")
            {
            }
            column(QccCheName; "Purchase Requisition1"."QCC Check  Name")
            {
            }
            column(QccCheTime; "Purchase Requisition1"."QCC Check Time")
            {
            }
            column(Processed; "Purchase Requisition1".Process)
            {
            }
            column(ProcByName; "Purchase Requisition1"."Process By Name")
            {
            }
            column(ProcTime; "Purchase Requisition1"."Process Time")
            {
            }
            column(InvoiceNo; "Purchase Requisition1"."Invoice No.")
            {
            }
            column(RejectedQty; "Purchase Requisition1"."QCC Rejected Quantity")
            {
            }
            column(SecReturnedQty; "Purchase Requisition1"."Security Return Quantity")
            {
            }
            column(ProcMgrAction; "Purchase Requisition1"."Procurement Mgr. Action")
            {
            }
            column(SNO; SNo)
            {
            }
            column(FilterTest;FilterTest)
            {                
            }
        

            trigger OnAfterGetRecord()
            begin
                SNo += 1;
            end;

            trigger OnPreDataItem()
            begin
                SNo := 0;
                FilterTest := GetFilters;

            end;
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        SNo: Integer;
        FilterTest: Text[200];
}
