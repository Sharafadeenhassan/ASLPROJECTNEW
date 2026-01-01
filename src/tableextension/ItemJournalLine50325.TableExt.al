tableextension 50325 "Item Journal Line Ext" extends "Item Journal Line"
{
    fields
    {
        modify("Reason Code")
        {
            TableRelation = "Reason Code" WHERE(Type = FILTER("Item Jl" | Usage));
        }
        modify("External Document No.")
        {
            TableRelation = IF ("Reason Code" = CONST('USAGEFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('USAGERES')) Location
            ELSE
            IF ("Reason Code" = CONST('USAGEVES')) Location
            ELSE
            IF ("Reason Code" = CONST('USAGEOTR')) "Dimension Value".Code WHERE("Global Dimension No." = CONST(1))
            ELSE
            IF ("Reason Code" = CONST('USAGEACHD')) "Standard Text" WHERE(Others = CONST(true),
                                                                                              Type = CONST(net))
            ELSE
            IF ("Reason Code" = CONST('CONVTFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('CRMISSUE')) "Standard Text" WHERE(Others = CONST(true),
                                                                                                                                                               Type = CONST(crmissue))
            ELSE
            IF ("Reason Code" = CONST('LNADJ')) "Standard Text" WHERE(Others = CONST(true),
                                                                                                                                                                                                                             Type = CONST(ItemLoan));
        }

        field(50000; "BOM EXPLODED"; Boolean)
        {
            trigger OnValidate()
            begin
                //AAA
                ItemSetup.Get();
                if ItemSetup."Automatic BOM Explosion" then
                    ExplodeBom.Run(Rec)
                else
                    "BOM EXPLODED" := false;
            end;
        }
        field(50001; "Item List Cat"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
        }
        field(50003; "Consumed Quantity"; Decimal)
        {
        }
        field(50004; "Lock Qty"; Boolean)
        {
        }
        field(50316; "Issue Type"; Option)
        {
            Description = 'From Regular,Repairs,Dry Dock,Over Hauling to';
            OptionMembers = Mainte,Fuel;
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionCaption = ' ,Short Voyage ';
            OptionMembers = " ","Short Voyage ";
        }
         field(50366;"DPS No.";Code[20])
        {
            TableRelation = "Purchase Requisition1"."Req No.";
            Editable = false;
        }
        field(50405; "CRM / STR"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                  "Location Code" = FILTER('GNRL ASL' | 'GNRL COS' | 'GNRL ICF' | 'GNRL SSC' | 'CRM-ASL' | 'CRM-COS' | 'CRM-ICF' | 'CRM-SSC')));
            DecimalPlaces = 0 : 5;
            Description = 'Inventory of items in Cold Room/Store';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(ASLKey1; "Document No.")
        {
        }
        key(ASLKey2; "Item No.")
        {
        }
    }

   
    var
        ItemSetup: Record "Inventory Setup";
        ExplodeBom: Codeunit "Item Jnl.-Explode BOM";
}
