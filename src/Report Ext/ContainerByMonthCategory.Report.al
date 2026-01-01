report 50252 "Container By Month Category"
{
    ApplicationArea = All;
    Caption = 'Container By Month Category';
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem(ItemCategory; "Item Category")
        {
            DataItemTableView=SORTING("Parent Category")where("FT Product"=filter(true));
            column(Code; "Code")
            {
            }
            column(Description; Description)
            {
            }
            column(ShippedQuantity; "Shipped Quantity")
            {
            }
            column(ReturnQuantity; "Return Quantity")
            {
            }
            column(No; "No.")
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
