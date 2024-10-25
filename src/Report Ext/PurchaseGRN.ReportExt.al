reportextension 55000 "PurchaseGRN" extends "Purchase Document - Test"
{
    // RDLCLayout = './src/reportrdlc/PurchaseDocumentTest.rdlc';
    RDLCLayout = './src/reportextension/PurchaseDocumentTest.rdlc';

    dataset
    {
        add("Purchase Header")
        {
            column(PreparedBy; PreparedBy) { }
            column(Created_By; "Created By") { IncludeCaption = true; }
            column(Approved_By; "Approved By") { IncludeCaption = true; }
            column(Signature; Signature) { }
        }

        add(RoundLoop)
        {
            column(UOM; "Purchase Line"."Unit of Measure") { }
            Column(Unit_Rate; "Purchase Line"."Unit Cost") { }
            column(UnitCostLCY_PurchaseLine; "Purchase Line"."Unit Cost (LCY)") { }
            column(OutstandingAmountLCY_PurchaseLine; "Purchase Line"."Outstanding Amount (LCY)") { }
            column(InvPosGrp; "Purchase Line"."Posting Group") { }
            column(S_No; S_No) { }
            column(SumOutstadingAmountLCY; SumOutstadingAmountLCY) { }
        }

        /* */
        modify(RoundLoop)
        {
            trigger OnAfterPreDataItem()
            begin
                SumOutstadingAmountLCY := 0;
                S_No := 0;
            end;

            trigger OnAfterAfterGetRecord()
            begin
                S_No := S_No + 1;
            end;
        }
        modify(DimensionLoop2)
        {
            trigger OnBeforePostDataItem()
            begin
                SumOutstadingAmountLCY := SumOutstadingAmountLCY + "Purchase Line"."Outstanding Amount (LCY)";//TempPurchLine."Outstanding Amount (LCY)";
            end;
        }
    }

    var
        Signature: Label 'Signature: ';
        PreparedBy: Label 'Prepared By: ';
        S_No: integer;
        SumOutstadingAmountLCY: Decimal;
}
