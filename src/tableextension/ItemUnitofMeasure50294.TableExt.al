tableextension 50294 "tableextension50294" extends "Item Unit of Measure"
{
    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TestItemUOM;
    CheckNoEntriesWithUoM;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    TestItemUOM;
    */
    //end;

    //Unsupported feature: Code Modification on "CheckNoRemQtyProdOrderLine(PROCEDURE 12)".

    //procedure CheckNoRemQtyProdOrderLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ProdOrderLine.SetRange("Item No.","Item No.");
    ProdOrderLine.SetRange("Unit of Measure Code",Code);
    ProdOrderLine.SetFilter("Remaining Quantity",'<>%1',0);
    ProdOrderLine.SetFilter(Status,'<>%1',ProdOrderLine.Status::Finished);
    if not ProdOrderLine.IsEmpty then
      Error(
        CannotModifyUnitOfMeasureErr,TableCaption,xRec.Code,"Item No.",
        ProdOrderLine.TableCaption,ProdOrderLine.FieldCaption("Remaining Quantity"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    #5..8
    */
    //end;

    //Unsupported feature: Code Modification on "CheckNoRemQtyProdOrderComponent(PROCEDURE 13)".

    //procedure CheckNoRemQtyProdOrderComponent();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ProdOrderComponent.SetRange("Item No.","Item No.");
    ProdOrderComponent.SetRange("Unit of Measure Code",Code);
    ProdOrderComponent.SetFilter("Remaining Quantity",'<>%1',0);
    ProdOrderComponent.SetFilter(Status,'<>%1',ProdOrderComponent.Status::Finished);
    if not ProdOrderComponent.IsEmpty then
      Error(
        CannotModifyUnitOfMeasureErr,TableCaption,xRec.Code,"Item No.",
        ProdOrderComponent.TableCaption,ProdOrderComponent.FieldCaption("Remaining Quantity"));
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    #5..8
    */
    //end;
}
