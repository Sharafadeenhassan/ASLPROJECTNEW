report 50162 "ASL Store Availability "
{
    ApplicationArea = All;
    Caption = 'ASL Store Availability ';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(Item; Item)
        {
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(NegativeAdjmtQty; "Negative Adjmt. (Qty.)")
            {
            }
            column(NegveAdjmtQty; "Negve Adjmt. (Qty.)")
            {
            }
            column(NetInvoicedQty; "Net Invoiced Qty.")
            {
            }
            column(OutputQuantity; "Output Quantity")
            {
            }
            column(PositiveAdjmtQty; "Positive Adjmt. (Qty.)")
            {
            }
            column(PosveAdjmtQty; "Posve Adjmt. (Qty.)")
            {
            }
            column(ProductionConsumedQty; "Production Consumed (Qty.)")
            {
            }
            column(PurchasesQty; "Purchases (Qty.)")
            {
            }
            column(SalesQty; "Sales (Qty.)")
            {
            }
            column(TransOrdReceiptQty; "Trans. Ord. Receipt (Qty.)")
            {
            }
            column(TransOrdShipmentQty; "Trans. Ord. Shipment (Qty.)")
            {
            }
            column(TransferedReceiptQty; "Transfered Receipt (Qty.)")
            {
            }
            column(TransferedShipmentQty; "Transfered Shipment (Qty.)")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                    
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
