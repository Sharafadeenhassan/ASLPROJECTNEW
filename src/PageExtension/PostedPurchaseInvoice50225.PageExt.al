pageextension 50225 "pageextension50225" extends "Posted Purchase Invoice"
{
    layout
    {
        addafter("No.")
        {
            field("Your Reference"; rec."Your Reference")
            {
                ApplicationArea = all;
            }

            //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to City"(Control 44)".
        }
    }
}