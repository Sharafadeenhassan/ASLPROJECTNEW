tableextension 50259 "tableextension50259" extends "Bank Account Posting Group"
{
    fields
    {
        field(50001; Category; Option)
        {
            OptionMembers = "Cash/Cheques","Local Bank","Foreign Bank";
        }
    }
}
