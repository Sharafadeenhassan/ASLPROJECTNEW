pageextension 50366 "pageextension50366" extends "Purchase Order List"
{
    layout
    {
        addafter("Posting Date")
        {
            field("Your Reference";"Your Reference")
            {
                ApplicationArea = All;
            }
            field("Purchase Order Req. No";"Purchase Order Req. No")
            {
                ApplicationArea = All;
            }
        }
    }
    //Unsupported feature: Property Modification (SourceTableView) on ""Purchase Order List"(Page 9307)".
}
