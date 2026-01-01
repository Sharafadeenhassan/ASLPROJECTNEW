table 59100 "Purchase Variance (Item) XAC"
{
    Caption = 'Purchase Variance (Item) XAC';
    fields
    {
        field(1; OrderNo; Code[20])
        {
        }
        field(2; ItemNo; Code[20])
        {
        }
        field(3; EntrySequence; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; OrderNo, ItemNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; OrderNo, ItemNo)
        {
        }
    }
}
