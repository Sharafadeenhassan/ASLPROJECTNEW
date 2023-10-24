tableextension 50266 "tableextension50266" extends "Item Ledger Entry"
{
    fields
    {
        field(50025; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
        }
        field(50026; "Old External Document No."; Code[20])
        {
            Caption = 'Old External Document No.';
        }
        field(50027; "Scrap Quantity"; Decimal)
        {
        }
        field(50028; "Consumed Quantity"; Decimal)
        {
        }
        field(50029; "Applied Qty  Negative"; Decimal)
        {
            CalcFormula = - Sum("Item Application Entry".Quantity WHERE("Outbound Item Entry No." = FIELD("Entry No."),
                                                                        "Inbound Item Entry No." = FILTER(<> 0),
                                                                        Quantity = FILTER(< 0)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50030; "Applied Qty Posistive"; Decimal)
        {
            CalcFormula = Sum("Item Application Entry".Quantity WHERE("Inbound Item Entry No." = FIELD("Entry No."),
                                                                       "Outbound Item Entry No." = FILTER(<> 0),
                                                                       Quantity = FILTER(< 0)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionCaption = ' ,Short Voyage ';
            OptionMembers = " ","Short Voyage ";
        }
    }
    keys
    {
        key(ASLKey1; "Document No.", "Posting Date", "Entry Type")
        {
            SumIndexFields = Quantity;
        }
        key(ASLKey2; "Entry Type", Nonstock, "Item No.", "Posting Date", "Location Code")
        {
        }
        key(ASLKey3; "Entry Type", "Item No.", "Posting Date", "Location Code")
        {
        }
        key(ASLKey4; "Item No.", "Location Code", "Posting Date", "Entry Type")
        {
        }
        key(ASLKey5; "Location Code", "Item No.")
        {
        }
        Key(ASLKey6; "Source Code") { }
    }
}
