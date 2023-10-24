tableextension 50257 "tableextension50257" extends "Bank Account Ledger Entry"
{
    fields
    {
        field(50000; "DEPOSIT ID"; Code[10])
        {
            TableRelation = DEPOSIT."Deposit ID";
        }
    }
    keys
    {
        key(ASLKey1; "Bank Account No.", "Posting Date", Positive)
        {
            SumIndexFields = Amount, "Amount (LCY)", "Debit Amount", "Credit Amount", "Debit Amount (LCY)", "Credit Amount (LCY)";
        }
        // key(Key2; "DEPOSIT ID", "Bank Account No.")
        // {
        //     SumIndexFields = Amount;
        // }
    }
}
