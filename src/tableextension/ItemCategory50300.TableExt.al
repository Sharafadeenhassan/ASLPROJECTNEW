tableextension 50300 "tableextension50300" extends "Item Category"
{
    fields
    {
        field(50000; Type; Option)
        {
            OptionMembers = cldrm,store;
        }
        field(50001; "No."; Integer)
        {
        }
        field(50385; "Shipped Quantity"; Decimal)
        {
            CalcFormula = Sum("Sales Shipment Line".Quantity WHERE("Shipment Date" = FIELD("Date Filter"),
                                                                    "Item Category Code" = FIELD(Code),
                                                                    "Gen. Bus. Posting Group" = CONST('FOREIGN')));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50386; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }
    keys
    {
        key(ASLKey1; "No.")
        {
        }
    }
}
