pageextension 50021 "Item Categories Ext Page" extends"Item Categories"
{
    layout
    {
        addafter(Description)
        {
            field("FT Product";rec."FT Product")
            {
                ApplicationArea = All;
            }
            field("Shipped Quantity";Rec."Shipped Quantity")
            {
                ApplicationArea = All;
            }
            field("Return Quantity";Rec."Return Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
