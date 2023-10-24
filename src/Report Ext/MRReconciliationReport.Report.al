report 50057 "MR Reconciliation Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/MRReconciliationReport.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'MR Reconciliation Report';
    dataset
    {
        dataitem("Store Requisition Line New"; "Store Requisition Line New")
        {
            DataItemTableView = WHERE("Final Approval" = CONST(Approved));
            column(ReqNo; "Store Requisition Line New"."Req. No.")
            {
            }
            column(ItemNo; "Store Requisition Line New"."Item No.")
            {
            }
            column(Desc; "Store Requisition Line New"."Item Description")
            {
            }
            column(ReqQty; "Store Requisition Line New"."Requested Quantity")
            {
            }
            column(AppQty; "Store Requisition Line New"."Approved Quantity")
            {
            }
            column(IssQty; "Store Requisition Line New"."Issued Quantity")
            {
            }
            column(Loc; "Store Requisition Line New"."Store Location")
            {
            }
            column(Emp; "Store Requisition Line New"."Claim by Employee")
            {
            }
            column(Approval; "Store Requisition Line New"."Final Approval")
            {
            }
            column(AppDate; "Store Requisition Line New"."Final Approval Date")
            {
            }
            column(Isscap; "Store Requisition Line New"."Issued Captured")
            {
            }
            column(IssDate; "Store Requisition Line New"."Issues Captured Date")
            {
            }
            column(Diffe; Differential)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Differential := "Store Requisition Line New"."Approved Quantity" - "Store Requisition Line New"."Issued Quantity";
            end;
        }
    }

    requestpage
    { 
        SaveValues = true;
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
        Differential: Integer;
}
