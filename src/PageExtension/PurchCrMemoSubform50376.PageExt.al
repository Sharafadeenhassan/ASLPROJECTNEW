pageextension 50376 "pageextension50376" extends "Purch. Cr. Memo Subform"
{
    layout
    {
        addafter(ShortcutDimCode8)
        {
            field("External Document No."; Rec."External Document No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
            // field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
            // {
            // }
        }
    }
}
