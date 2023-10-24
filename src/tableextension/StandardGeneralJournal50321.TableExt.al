tableextension 50321 "tableextension50321" extends "Standard General Journal"
{
    //Unsupported feature: Code Modification on "CopyGenJnlFromStdJnl(PROCEDURE 3)".

    //procedure CopyGenJnlFromStdJnl();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlLine.Init;
    GenJnlLine."Line No." := 0;
    GenJnlManagement.CalcBalance(GenJnlLine,LastGenJnlLine,Balance,TotalBalance,ShowBalance,ShowTotalBalance);
    #4..8

    GenJnlLine.TransferFields(StdGenJnlLine,false);
    GenJnlLine.UpdateLineBalance;
    GenJnlLine."Currency Factor" := 0;
    GenJnlLine.Validate("Currency Code");

    if GenJnlLine."VAT Prod. Posting Group" <> '' then
    #16..25
    GenJnlLine.Insert(true);

    LastGenJnlLine := GenJnlLine;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    #13..28
    */
    //end;
}
