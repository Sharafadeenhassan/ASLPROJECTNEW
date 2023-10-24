tableextension 50306 "tableextension50306" extends "Transfer Receipt Line"
{
    fields
    {
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
