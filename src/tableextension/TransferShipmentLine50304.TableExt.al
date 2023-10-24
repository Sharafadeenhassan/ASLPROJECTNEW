tableextension 50304 "tableextension50304" extends "Transfer Shipment Line"
{
    fields
    {
        field(6; "Quantity Shipped"; Decimal)
        {
            Caption = 'Quantity Shipped';
            DecimalPlaces = 0 : 5;
        }
        field(50300; "Qty. Reqd."; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50301; ROB; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                /*IF ROB > "Qty. Reqd." THEN ERROR('ROB can not be greater that Quantity Required');
                VALIDATE(Quantity,"Qty. Reqd."-ROB);
                */
            end;
        }
    }
}
