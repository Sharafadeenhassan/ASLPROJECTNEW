tableextension 50296 "tableextension50296" extends "Prod. Order Component"
{
    //Unsupported feature: Code Modification on "UpdateUnitCost(PROCEDURE 12)".

    //procedure UpdateUnitCost();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if GetSKU then
      "Unit Cost" := SKU."Unit Cost"
    else
    #4..11
    "Overhead Rate" :=
      Round(Item."Overhead Rate" * "Qty. per Unit of Measure",
        GLSetup."Unit-Amount Rounding Precision");

    "Direct Unit Cost" :=
      Round(
        ("Unit Cost" - "Overhead Rate") / (1 + "Indirect Cost %" / 100),
        GLSetup."Unit-Amount Rounding Precision");

    OnAfterUpdateUnitCost(Rec,GLSetup);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    if "Indirect Cost %" >=0 then
    #16..21
    */
    //end;
}
