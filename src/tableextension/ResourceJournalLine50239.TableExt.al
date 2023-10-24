tableextension 50239 "tableextension50239" extends "Res. Journal Line"
{
    fields
    {
        field(50001; Type; Option)
        {
            OptionMembers = " ",Skill,Performance;
        }
        field(50002; "Skill Score"; Decimal)
        {
        }
        field(50003; "Skill Total"; Decimal)
        {
        }
        field(50004; "Skill Percentage"; Decimal)
        {
        }
        field(50005; "Performance  Score"; Decimal)
        {
        }
        field(50006; "Performance Total"; Decimal)
        {
        }
        field(50007; "Performance Percentage"; Decimal)
        {
        }
        field(50008; "Total Percentage"; Decimal)
        {
        }
        field(50009; Comment; Text[80])
        {
        }
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LockTable;
    ResJnlTemplate.Get("Journal Template Name");
    ResJnlBatch.Get("Journal Template Name","Journal Batch Name");

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    "Shortcut Dimension 2 Code":='ATLANTIC';
    #4..6
    */
    //end;
}
