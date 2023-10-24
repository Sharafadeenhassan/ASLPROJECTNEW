tableextension 50256 "tableextension50256" extends "Bank Account"
{
    fields
    {
        //Unsupported feature: Code Insertion on ""Bank Acc. Posting Group"(Field 21)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        if BankPGrp.Get("Bank Acc. Posting Group") then
          Category := BankPGrp.Category;
        */
        //end;
        field(50001; Category; Option)
        {
            OptionMembers = "Cash/Cheques","Local Bank","Foreign Bank","Term Deposit";
        }
    }
}
