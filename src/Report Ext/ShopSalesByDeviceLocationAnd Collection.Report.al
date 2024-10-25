report 50237 "Shop Sales and Collection"
{
    ApplicationArea = All;
    Caption = 'Shop Sales And Collections';
    RDLCLayout = './src/reportrdlc/SalesAndCollectionByDevLoc.rdl';
    UsageCategory = ReportsAndAnalysis;

    dataset
    {

        dataitem(ShopPaymentMode; "Shop Payment Mode")
        {
            RequestFilterFields = "Fish Shop Code", Code, "Date Filter", "Department Filter";
            RequestFilterHeading = 'Fish Shop Code,Code,Date Filter,Department Filter';

            column(FishShopCode; "Fish Shop Code")
            {
            }
            column(Description; Description)
            {
            }
            column(Code; "Code")
            {
            }
            column(AccountCode; "Account Code")
            {
            }
            column(PaymentMode; "Payment Mode")
            {
            }
            column(TotalPayment; "Total Payment")
            {
            }
            column(TotalSales; "Total Sales")
            {
            }
            column(CreditSale; CreditSale)
            {
            }
            trigger OnAfterGetRecord()
            begin
                CalcFields("Total Payment", "Total Sales");
                CreditSale := "Total Sales" - "Total Payment";
            end;
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
    var
        PayMode: Record "Shop Payment Mode";
        UserRec: Record "User Setup";
        ShopFilter: Text[50];
        CreditSale: Decimal;
        DateFilter: Date;

    trigger OnInitReport()

    begin
        if UserRec.Get(UserId) then begin
            ShopFilter := UserRec."Fish Shop Code";
            DateFilter := today;
            ShopPaymentMode."Date Filter" := DateFilter;
            ShopPaymentMode."Department Filter" := ShopFilter;

        end
    end;


}
