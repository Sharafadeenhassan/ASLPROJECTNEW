pageextension 50223 "pageextension50223" extends "Posted Purchase Receipt"
{
    layout
    {
        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to City"(Control 36)".
        addafter("Shipment Method Code")
        {
            field("Your Reference"; rec."Your Reference")
            {
                ApplicationArea = all;
            }

        }
    }
}
