codeunit 50035 "InventoryAdjustmentSubscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Adjustment", 'OnBeforeCopyILEToILE', '', true, true)]
    local procedure InventoryAdjustmentOnBeforeCopyILEToILE(ItemLedgEntry: Record "Item Ledger Entry");
    var
        SkipItem: Label 'EG-0010';
        Item: record item;
    begin
        ItemLedgEntry.SetCurrentKey("Item No."); //inserted to speed up
        ItemLedgEntry.SetFilter("Entry Type", '<>%1', ItemLedgEntry."Entry Type"::Transfer);
        if ItemLedgEntry."Item No." = SkipItem then
            exit;
        ItemLedgEntry.SetFilter(ItemLedgEntry."Entry Type", '<>%1', ItemLedgEntry."Entry Type"::Transfer)
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Adjustment", 'OnCopyCostElementBufToValueEntryBufOnBeforeValueEntryBufInsert', '', true, true)]
    Local procedure InvAdjOnCopyCostElementBufToValueEntryBufOnBeforeValueEntryBufInsert(var ValueEntryBuf: Record "Value Entry")
    var
        ItemLedgEntry: Record "Item Ledger Entry";

    begin
        ItemLedgEntry.Get(ValueEntryBuf."Item Ledger Entry No.");
        if
         ItemLedgEntry."Entry Type" = ItemLedgEntry."Entry Type"::Transfer then
            ValueEntryBuf.Next();
    end;
}