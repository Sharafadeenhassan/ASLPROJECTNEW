pageextension 50263 "pageextension50263" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Remaining Quantity")
        {
            field("Applied Qty  Negative"; "Applied Qty  Negative")
            {
                ApplicationArea = All;
            }
            field("Applied Qty Posistive"; "Applied Qty Posistive")
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Task No.")
        {
            field("Source Code"; "Source Code")
            {
                ApplicationArea = All;
            }
            field("Source No."; "Source No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("External Document No."; "External Document No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("Source Type"; "Source Type")
            {
                ApplicationArea = All;
            }
        }
    }

    //Unsupported feature: Property Insertion (Length) on "GetCaption(PROCEDURE 3).ReturnValue".


    //Unsupported feature: Property Insertion (Length) on "GetCaption(PROCEDURE 3).SourceTableName(Variable 1002)".

}
