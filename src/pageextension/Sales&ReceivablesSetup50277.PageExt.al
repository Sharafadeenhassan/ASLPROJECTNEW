pageextension 50277 "pageextension50277" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Posted Prepmt. Cr. Memo Nos.")
        {
            field("Appraisal No."; Rec."Appraisal No.")
            {
                ApplicationArea = All;
            }
            field("Posted Appraisal No."; Rec."Posted Appraisal No.")
            {
                ApplicationArea = All;
            }
            field("Posted Exp. Invoice Nos."; Rec."Posted Exp. Invoice Nos.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Freight G/L Acc. No.")
        {
            field("Default Off Loading Account"; Rec."Default Off Loading Account")
            {
                ApplicationArea = All;
            }
            field("Default Off Loading Charge"; Rec."Default Off Loading Charge")
            {
                ApplicationArea = All;
            }
        }
    }
}
