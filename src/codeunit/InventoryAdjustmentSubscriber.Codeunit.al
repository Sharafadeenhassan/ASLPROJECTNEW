codeunit 50035 "InventoryAdjustmentSubscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Adjustment", 'OnBeforeCopyILEToILE', '', true, true)]
    local procedure InventoryAdjustmentOnBeforeCopyILEToILE(ItemLedgEntry: Record "Item Ledger Entry")
    var
        SkipItem: Label 'EG-0010';
    begin
        if ItemLedgEntry."Item No." = SkipItem then
            exit;
        ItemLedgEntry.SetFilter(ItemLedgEntry."Entry Type", '<>%1', ItemLedgEntry."Entry Type"::Transfer);  //Refactor (Place it outside this event)
        ItemLedgEntry.SETFILTER(ItemLedgEntry."Entry Type",'<>%1',ItemLedgEntry."Entry Type"::Transfer);//shod 2018
    end;
}