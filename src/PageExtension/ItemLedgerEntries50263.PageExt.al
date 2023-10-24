pageextension 50263 "pageextension50263" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Remaining Quantity")
        {
            field("Applied Qty  Negative"; Rec."Applied Qty  Negative")
            {
                ApplicationArea = All;
            }
            field("Applied Qty Posistive"; Rec."Applied Qty Posistive")
            {
                ApplicationArea = All;
            }
        }
        addafter("Job Task No.")
        {
            field("Source Code"; Rec."Source Code")
            {
                ApplicationArea = All;
            }
            field("Source No."; Rec."Source No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("External Document No."; Rec."External Document No.")
            {
                Visible = false;
                ApplicationArea = All;
            }
            field("Source Type"; Rec."Source Type")
            {
                ApplicationArea = All;
            }
        }
    }

    //Unsupported feature: Property Insertion (Length) on "GetCaption(PROCEDURE 3).ReturnValue".

    //Unsupported feature: Property Insertion (Length) on "GetCaption(PROCEDURE 3).SourceTableName(Variable 1002)".
}
