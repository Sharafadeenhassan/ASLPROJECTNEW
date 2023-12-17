pageextension 50321 "pageextension50321" extends "Detailed Cust. Ledg. Entries"
{
    layout
    {
        //Unsupported feature: Property Modification (Name) on ""Amount (LCY)"(Control 16)".

        //Unsupported feature: Property Modification (SourceExpr) on ""Amount (LCY)"(Control 16)".

        //Unsupported feature: Property Modification (ImplicitType) on ""Amount (LCY)"(Control 16)".

        addafter("User ID")
        {
            field("Ledger Entry Amount"; Rec."Ledger Entry Amount")
            {
                ApplicationArea = All;
            }
        }
    }
}
