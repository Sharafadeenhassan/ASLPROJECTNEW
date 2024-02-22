tableextension 50307 "Value Entry Ext" extends "Value Entry"
{
    // UNL-ASL3.60.01.005 (Santus) May 17, 2005
    fields
    {
        field(50026; "Old External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(50300; "Maintenance Code"; Code[10])
        {
        }
        field(50301; "Marked Rec"; Boolean)
        {
            Description = 'For Voyage P&L Reporting Marked current entrie to be reported, cleared at the end of D Rep.';
        }
        field(50302; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionCaption = ' ,Short Voyage ';
            OptionMembers = " ","Short Voyage ";
        }
        field(50356;MADJ;Boolean)
        {

        }
    }

    keys
    {
        key(ASLKey1; "Location Code", "Inventory Posting Group", "Posting Date", "Source Code")
        {
            Enabled = true;

            SumIndexFields = "Valued Quantity";
        }
        key(ASLKey2; "Inventory Posting Group", "Item No.", "Posting Date", "Location Code", "External Document No.")
        {
            SumIndexFields = "Valued Quantity";
        }
        key(ASLKey3; "Document No.", "Gen. Prod. Posting Group")
        {
        }
        key(ASLKey4; "Item Ledger Entry Type", "Location Code", "External Document No.", "Gen. Prod. Posting Group", "Item No.", "Posting Date")
        {
        }
        key(ASLKey5; "Reason Code", "External Document No.", "Gen. Prod. Posting Group", "Posting Date", "Item Ledger Entry Type")
        {
        }
        key(ASLKey6; "External Document No.")
        {
        }
        key(ASLKey7; "Posting Date","Location Code","Inventory Posting Group","External Document No.")
        {
            Enabled = true; 
            SumIndexFields = "Valued Quantity";
        }
        key(ASLKey8; "Gen. Prod. Posting Group", "Document No.")
        {
        }
        key(ASLKey9; "Marked Rec") { }
        key(ASLKey10; "Gen. Prod. Posting Group", "Location Code", "Posting Date")
        {
            Enabled = true;
            SumIndexFields = "Valued Quantity", "Cost Amount (Actual)";
        }
        key(ASLKey11; "Item No.","Item Ledger Entry Type",Adjustment)
        {
            Enabled = true;
        }
        key(ASLKey12; "Item No.")
        {
            enabled = true;
        }
    }

    procedure ItemName() Desc: Text[50]
    begin
        if item.Get("Item No.") then Desc := item.Description;
    end;

    var
        item: Record Item;
}
