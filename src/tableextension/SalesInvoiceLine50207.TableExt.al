tableextension 50207 "tableextension50207" extends "Sales Invoice Line"
{
    fields
    {
        //Unsupported feature: Property Modification (Data type) on ""Description 2"(Field 12)".

        //Unsupported feature: Property Insertion (Editable) on ""Unit Price"(Field 22)".

        //Unsupported feature: Property Insertion (Editable) on ""Unit Cost (LCY)"(Field 23)".

        field(50300; Grade; Option)
        {
            Description = ',Excellent,Good,Average,Poor';
            OptionMembers = " ",Excellent,Good,"Average",Poor;
        }
        field(50301; Comment; Text[80])
        {
        }
        field(50302; quantity1; Decimal)
        {
            Description = 'Used by Performance score for sum';
        }
        field(50303; TTSkill; Decimal)
        {
            Description = 'Used by skill score for sum';
        }
        field(50304; TTPerformance; Decimal)
        {
            Description = 'used by performance total for sum';
        }
        field(50350; Numbers; Decimal)
        {
            Description = 'factor of Quantity';
        }
        field(50351; Packing; Decimal)
        {
            Description = 'factor of Quantity';
        }
        field(50352; "Pack Size"; Code[10])
        {
        }
        field(50353; Brand; Code[10])
        {
            TableRelation = "Reason Code" WHERE("In Use" = CONST(true),
                                                 Type = CONST(Brands));
        }
        field(50354; "Pack Size Code"; Code[1])
        {
            TableRelation = "Unit of Measure" WHERE("In Use" = CONST(true),
                                                     "Catch Code" = FILTER(<> ''));
        }
        field(50355; "Brand Code"; Code[1])
        {
            TableRelation = "Reason Code" WHERE("In Use" = CONST(true),
                                                 Type = CONST(Brands));
        }
        field(50356; ProdCd; Code[3])
        {
            TableRelation = Item;
        }
        field(50357; "On Pallet"; Option)
        {
            OptionMembers = Yes,No,"Part";
        }
        field(50359; "Item Category Code Sort"; Code[15])
        {
            Caption = 'Item Category Code';
            TableRelation = "Item Category";
        }
        field(50360; Explodedline; Boolean)
        {
        }
        field(50361; "Payment Type"; Code[10])
        {
        }
    }
    keys
    {
        key(ASLKey1; "Document No.", Type, "No.")
        {
            SumIndexFields = Quantity;
        }
        key(ASLKey2; "Document No.", Type, "Item Category Code", "Posting Group")
        {
            //SumIndexFields = Quantity, Packing;
        }
        key(ASLKey3; "Location Code", "Shipment Date", "No.")
        {
            SumIndexFields = Amount;
        }
    }

    //Unsupported feature: Code Modification on "ShowLineComments(PROCEDURE 8)".

    //procedure ShowLineComments();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesCommentLine.ShowComments(SalesCommentLine."Document Type"::"Posted Invoice","Document No.","Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesCommentLine.ShowComments(SalesCommentLine."Document Type"::Shipment,"Document No.","Line No.");
    */
    //end;
}
