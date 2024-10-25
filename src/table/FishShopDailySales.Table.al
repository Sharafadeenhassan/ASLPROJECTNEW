table 50044 "Fish Shop Daily Sales"
{
    DrillDownPageID = "Fishshop Daily sales";
    LookupPageID = "Fishshop Daily sales";
    Caption = 'Fish Shop Daily Sales';
    fields
    {
        field(1; "Document No"; Code[10])
        {
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = Item."No.";
        }
        field(3; Description; Text[50])
        {
        }
        field(4; Location; Code[20])
        {
            TableRelation = Location.Code;
        }
        field(5; "Transaction Date"; Date)
        {
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(7; "Unit Price"; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(8; Amount; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(9; "Payment Type"; Code[10])
        {
            TableRelation = "Payment Method".Code;
        }
        field(10; Processed; Boolean)
        {
        }
        field(11; "Day Sale Qty"; Decimal)
        {
            CalcFormula = Sum("Fish Shop Daily Sales".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                      Location = FIELD(Location),
                                                                      "Transaction Date" = FIELD("Transaction Date"),
                                                                      "Payment Type" = FIELD("Payment Type"),
                                                                      "Payment Device"= field("Payment Device")));
            FieldClass = FlowField;
            Editable = false;
            DecimalPlaces=2;
        }
        field(12; "Day Sale Value"; Decimal)
        {
            CalcFormula = Sum("Fish Shop Daily Sales".Amount WHERE("Item No." = FIELD("Item No."),
                                                                    Location = FIELD(Location),
                                                                    "Transaction Date" = FIELD("Transaction Date"),
                                                                    "Payment Type" = FIELD("Payment Type"),
                                                                    "Payment Device"= field("Payment Device")));
            FieldClass = FlowField;
            Editable = false;
            DecimalPlaces = 2;
        }
        field(13; "Cust No"; Code[20])
        {
        }
        field(14;"Payment Device"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Document No", "Item No.", Location, "Transaction Date", "Payment Type")
        {
            SumIndexFields = Quantity, Amount;
        }
        key(Key2; "Item No.", Location, "Transaction Date", "Payment Type")
        {
            Clustered = true;
            SumIndexFields = Quantity, Amount;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Location, Description)
        {
        }
    }

    local procedure GenerateDailysale()
    begin
    end;
}
