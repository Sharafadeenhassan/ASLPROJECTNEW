pageextension 50021 "Item Categories Ext Page" extends"Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field("FT Product";"FT Product")
            {
                ApplicationArea = All;
            }
            field("Shipped Quantity";"Shipped Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
