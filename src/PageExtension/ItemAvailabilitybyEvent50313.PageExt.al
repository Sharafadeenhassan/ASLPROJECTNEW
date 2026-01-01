pageextension 50313 "pageextension50313" extends "Item Availability by Event"
{
    //Unsupported feature: Code Modification on "Initialize(PROCEDURE 1)".

    //procedure Initialize();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    Item.SetRange("Drop Shipment Filter",false);
    CalcInventoryPageData.Initialize(Item,ForecastName,IncludeBlanketOrders,0D,IncludePlanningSuggestions);
    LastUpdateTime := CurrentDateTime;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CalcInventoryPageData.Initialize(Item,ForecastName,IncludeBlanketOrders,0D,IncludePlanningSuggestions);
    LastUpdateTime := CurrentDateTime;
    */
    //end;
}
