tableextension 50262 "tableextension50262" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; "Appraisal No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50002; "Posted Appraisal No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50013; "Posted Exp. Invoice Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50014; "Default Off Loading Charge"; Decimal)
        {
        }
        field(50015; "Default Off Loading Account"; Code[20])
        {
            TableRelation = "G/L Account"."No." WHERE("Account Type" = CONST(Posting));
        }
    }
}
