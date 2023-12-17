pageextension 50281 "pageextension50281" extends "Purchase Quote"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
        }
        modify("Foreign Trade")
        {
            Visible = true;
        }
        addafter("Document Date")
        {
            field("Order Type"; Rec."Order Type")
            {
                ApplicationArea = All;
            }
        }

        //Unsupported feature: Property Modification (ImplicitType) on ""Ship-to City"(Control 46)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Pay-to City"(Control 28)".
    }
}
