xmlport 50011 "Import FS daily sales"
{
    Format = VariableText;
    Caption = 'Import FS daily sales';
    schema
    {
        textelement(Root)
        {
            tableelement("Fish Shop Daily Sales"; "Fish Shop Daily Sales")
            {
                XmlName = 'FishShopSales';
                fieldelement(DocNo; "Fish Shop Daily Sales"."Document No")
                {
                }
                fieldelement(ItemNo; "Fish Shop Daily Sales"."Item No.")
                {
                }
                fieldelement(Description; "Fish Shop Daily Sales".Description)
                {
                }
                fieldelement(Location; "Fish Shop Daily Sales".Location)
                {
                }
                fieldelement(TranDate; "Fish Shop Daily Sales"."Transaction Date")
                {
                }
                fieldelement(Quantity; "Fish Shop Daily Sales".Quantity)
                {
                }
                fieldelement(Unitprice; "Fish Shop Daily Sales"."Unit Price")
                {
                }
                fieldelement(Amount; "Fish Shop Daily Sales".Amount)
                {
                }
                fieldelement(CusNo; "Fish Shop Daily Sales"."Cust No")
                {
                }
                fieldelement(PaymType; "Fish Shop Daily Sales"."Payment Type")
                {
                }
                fieldelement(PayDev;"Fish Shop Daily Sales"."Payment Device")
                {}
            }
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }
}
