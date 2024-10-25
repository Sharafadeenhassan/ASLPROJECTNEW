report 50244 "Purchase Return Way Bill"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PurchaseReturnWayBill.rdlc';
    Caption = 'Purchase Return Way Bill';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;
    
    dataset
    {
        dataitem("Purchase Requisition1"; "Purchase Requisition1")
        {
            DataItemTableView = WHERE("Return to Security" = CONST(true), "Security Returned" = CONST(false),"Security Return Quantity" = filter(>0));
            RequestFilterFields = "Supply By", "Req. Proc. Date";
            column(ItemNo; "Purchase Requisition1"."Item No.")
            {
            }
            column(Description; "Purchase Requisition1".Description)
            {
            }
            column(Supplier; "Purchase Requisition1"."Supplier Name")
            {
            }
            column(Quantity; "Purchase Requisition1"."Security Return Quantity")
            {
            }
            column(SNO; SNo)
            {
            }
            column(Address; Address)
            {
            }
            column(SupplierName; SupplierName)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if Vendor.Get("Purchase Requisition1"."Supply By") then begin
                    SupplierName := Vendor.Name;
                    Address := Vendor.Address;
                end;
                SNo += 1;
            end;

            trigger OnPreDataItem()
            begin
                SNo := 0;
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
        SupplierName: Text[50];
        Address: Text[50];
        Vendor: Record Vendor;
}
