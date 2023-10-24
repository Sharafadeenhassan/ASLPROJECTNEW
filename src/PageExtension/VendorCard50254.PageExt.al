pageextension 50254 "pageextension50254" extends "Vendor Card"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Our Account No.")
        {
            Visible = false;
        }
        modify("Language Code")
        {
            Visible = false;
        }
        modify("VAT Registration No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Modification (Name) on "GLN(Control 25)".

        //Unsupported feature: Property Modification (SourceExpr) on "GLN(Control 25)".

        //Unsupported feature: Property Modification (ImplicitType) on "GLN(Control 25)".

        modify("Pay-to Vendor No.")
        {
            Visible = false;
        }
        modify(Priority)
        {
            Visible = false;
        }
        moveafter("Search Name"; GLN)
    }
}
