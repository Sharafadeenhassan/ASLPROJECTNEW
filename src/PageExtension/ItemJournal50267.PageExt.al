pageextension 50267 "Item Journal Ext Page" extends "Item Journal"
{
    layout
    {
        addafter("Shortcut Dimension 1 Code")
        {
            field("Reason Code68076"; Rec."Reason Code")
            {
                ApplicationArea = All;
            }
            field("External Document No.18105"; Rec."External Document No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(Amount)
        {
            field("Gen. Prod. Posting Group12489"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("Gen. Bus. Posting Group35291"; Rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit Amount")
        {
            field("Item List Cat"; Rec."Item List Cat")
            {
                ApplicationArea = All;
            }
            field("Issue Type"; Rec."Issue Type")
            {
                ApplicationArea = All;
                Visible = true;
            }
        }
        modify("Entry Type")
        {
            OptionCaption = 'Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer';
        }
        modify("Applies-to Entry")
        {
            Visible = false;
        }
    }
    var
        UserRec: Record "User Setup";

    trigger OnOpenPage()
    begin
        if UserRec.Get(UserId) then
            if not UserRec."Use Item Journal" then Error('You Can Not Use Item Journal');
    end;

    //Unsupported feature: Code Modification on "OnInsertRecord".

    //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Entry Type" > "Entry Type"::"Negative Adjmt." then
      Error(Text000,"Entry Type");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if "Entry Type" > "Entry Type"::Transfer then
      Error(Text000,"Entry Type");
    */
    //end;

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IsSaasExcelAddinEnabled := ServerConfigSettingHandler.GetIsSaasExcelAddinEnabled;
    if ClientTypeManagement.GetCurrentClientType = CLIENTTYPE::ODataV4 then
      exit;
    #4..12
    if not JnlSelected then
      Error('');
    ItemJnlMgt.OpenJnl(CurrentJnlBatchName,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if UserRec.Get(UserId) then
      if not UserRec."Use Item Journal" then Error('You Can Not Use Item Journal');
    #1..15
    */
    //end;
}
