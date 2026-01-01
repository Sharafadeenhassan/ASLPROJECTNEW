/// <summary>
/// Codeunit ItemJnlPostLineSubcriber (ID 50028).
/// </summary>
codeunit 50028 "ItemJnlPostLineSubcriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforePostItem', '', true, true)]
    local procedure ItemJnlPostLineOnBeforePostItem(var ItemJournalLine: Record "Item Journal Line")
    var
        ItemAvailability: Codeunit "Item-Check Avail.";
        text001: Label 'ENU="%1 is Insufficient in Line %2   "';
    begin
        IF ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Transfer THEN
            IF ItemAvailability.ItemJnlCheckLine(ItemJournalLine) THEN //IF ItemAvailability.ItemJnlCheckLinePost(ItemJnlLine) THEN
                ERROR(text001, ItemJournalLine."Item No.", ItemJournalLine."Line No.");
    end;
/*
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Item Jnl.-Post Line", 'OnBeforeItemValuePosting', '', true, true)]
    Local procedure ItemJnlPostLineOnBeforeItemValuePosting(var IsHandled: Boolean; ItemJnlLine: Record "Item Journal Line")
    begin
        with ItemJnlLine do begin
            if ("Entry Type" = "Entry Type"::Transfer) and ("Source Code" = 'INVTADJMT')
               and Adjustment then
                IsHandled := true;
        end;

    end;
*/
    [EventSubscriber(ObjectType::CodeUnit, Codeunit::"Item Jnl.-Post Line", 'OnInsertItemLedgEntryOnBeforeVerifyOnInventory', '', true, true)]
    local procedure ItemJnlPostLineOnInsertItemLedgEntryOnBeforeVerifyOnInventory(var IsHandled: Boolean; ItemJnlLine: Record "Item Journal Line"; ItemLedgEntry: Record "Item Ledger Entry")
    var
        ItemRec: Record Item;
    begin
        if ItemLedgEntry."Entry Type" = ItemLedgEntry."Entry Type"::Sale then begin
            if ItemRec.Get(ItemLedgEntry."Item No.") then
                IsHandled := ItemRec."FT Product";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Ledger Entry", 'OnBeforeVerifyOnInventory', '', true, true)]
    local procedure ItemLedgEntryOnBeforeVerifyOnInventory(var IsHandled: Boolean; var ItemLedgerEntry: Record "Item Ledger Entry")
    var
        ItemRec: Record Item;
    begin
        if ItemLedgerEntry."Entry Type" = ItemLedgerEntry."Entry Type"::Sale then
            if ItemRec.Get(ItemLedgerEntry."Item No.") then
                IsHandled := ItemRec."FT Product";

    end;
    /*
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterUpdateUnitCost', '', true, true)]
        local procedure ItemJnlPostLineOnAfterUpdateUnitCost(ItemJournalLine: Record "Item Journal Line"; ValueEntry: Record "Value Entry"; LastDirectCost: Decimal)
        var
            Item: Record Item;
            CompanyInfo: Record "Company Information";
        begin
            if (ValueEntry."Valued Quantity" > 0) and
              (ItemJournalLine.Amount + ItemJournalLine."Discount Amount" > 0) and
              not (ValueEntry."Expected Cost" or ItemJournalLine.Adjustment) then begin
                item.Get(ItemJournalLine."No.");
                if (ItemJournalLine."Indirect Cost %" >= CompanyInfo."Min Foreign Indirect Cost %") then
                    Item."Last Imported Cost" := LastDirectCost
                else
                    Item."Last Local Cost" := LastDirectCost;
                Item.Modify;
            end
        end;
    */
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure ItemJnlPostLineOnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line")
    begin
        NewItemLedgEntry."Source Code" := ItemJournalLine."Source Code";
        NewItemLedgEntry."Scrap Quantity" := ItemJournalLine."Scrap Quantity";
        NewItemLedgEntry."Consumed Quantity" := ItemJournalLine."Consumed Quantity";
        NewItemLedgEntry."DPS No." := ItemJournalLine."DPS No.";
        NewItemLedgEntry."Vessel Type" := ItemJournalLine."Vessel Type";
        if ItemJournalLine."Entry Type" = ItemJournalLine."Entry Type"::Consumption then begin
            NewItemLedgEntry.Quantity := -ItemJournalLine."Consumed Quantity";
            NewItemLedgEntry."Invoiced Quantity" := -ItemJournalLine."Consumed Quantity";
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforePostInventoryToGL', '', true, true)]
    local procedure ItemJnlPostLineOnBeforePostInventoryToGL(var ValueEntry: Record "Value Entry"; var IsHandled: Boolean)
    var SaleItem: Record Item;
    begin
        if ValueEntry."Item Ledger Entry Type" in [ValueEntry."Item Ledger Entry Type"::Transfer, ValueEntry."Item Ledger Entry Type"::Sale, ValueEntry."Item Ledger Entry Type"::Consumption] then
            IsHandled := true;
            if ValueEntry."Item Ledger Entry Type" = ValueEntry."Item Ledger Entry Type"::Sale then begin
                if SaleItem.get(ValueEntry."Item No.") then 
                IsHandled := SaleItem."FT Product"; 
            end;
    end;
/*
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Item Jnl.-Post Line", 'OnInsertPostValueEntryToGLOnAfterTransferFields', '', True, true)]

    local procedure IJPLOnInsertPostValueEntryToGLOnAfterTransferFields(var PostValueEntryToGL: Record "Post Value Entry to G/L"; ValueEntry: Record "Value Entry")
    begin
        IF ValueEntry."Item Ledger Entry Type" = ValueEntry."Item Ledger Entry Type"::Transfer THEN EXIT;
    end;
    
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line",'OnAfterPostInventoryToGL','',True,true)]
    local procedure ItemJnlPostLineOnAfterPostInventoryToGL(var ValueEntry: Record "Value Entry")
    var IsHandled : Boolean;
    begin
       if (ValueEntry."Item Ledger Entry Type" = ValueEntry."Item Ledger Entry Type"::Transfer) and (ValueEntry."Source Code" = 'INVTADJMT') then 
       //IsHandled := true;
       exit;   
    end;
    */

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertValueEntry', '', True, true)]
    local procedure ItemJnlPostLineOnBeforeInsertValueEntry(var ValueEntry: Record "Value Entry"; CalledFromAdjustment: Boolean)
    begin
        if CalledFromAdjustment then
            if (ValueEntry."Item Ledger Entry Type" = ValueEntry."Item Ledger Entry Type"::Transfer) and (ValueEntry."Source Code" = 'INVTADJMT') then
                exit;
    end;

    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"Item Jnl.-Post Line", 'OnAfterPostInventoryToGL', '', True, true)]
    local procedure ItemJnlPostLineOnAfterPostInvtoryToGL(var ValueEntry: Record "Value Entry")
    begin
        IF (ValueEntry."Item Ledger Entry Type" = ValueEntry."Item Ledger Entry Type"::Transfer) AND (ValueEntry."Source Code" = 'INVTADJMT') THEN EXIT;
    end;
    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitValueEntry', '', true, true)]
    // local procedure ItemJnlPostLineOnAfterInitValueEntry(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line")
    // begin
    // end;

    //>>>>>>>>>>>>>>>> Stop

    // [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforePostInventoryToGL', '', true, true)]
    // local procedure ItemJnlPostLine()
    // begin
    // end;
}