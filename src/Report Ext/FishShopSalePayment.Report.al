report 50215 "Fish Shop Sale Payment"
{
    ApplicationArea = All;
    Caption = 'Fish Shop Sale Payment';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/reportrdlc/FishShopSalePayment.rdl';
    
    dataset
    {
        dataitem(ShopHeader; ShopHeader)
        {
            column(InvoiceNo; "Invoice No.")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(CustomerNo; "Customer No.")
            {
            }
            column(PayMode; PayMode)
            {
            }
            column(AmountPaid; "Amount Paid")
            {
            }
            column(CashPay; "Cash Pay")
            {
            }
            column(TransferPay; "Transfer Pay")
            {
            }
            column(Valuecard; "Value card")
            {
            }
            column(ShopCode; "Shop Code")
            {
            }
            column(GeneralDevice; "General Device")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {                
                }
                
            }
        
        
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
