codeunit 50033 "InventoryPostingToGLSubcriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Posting To G/L", 'OnPostInvtPostBufOnAfterInitGenJnlLine', '', true, true)]
    local procedure InventoryPostingToGLOnPostInvtPostBufOnAfterInitGenJnlLine(var GenJournalLine: Record "Gen. Journal Line"; var ValueEntry: Record "Value Entry")
    begin
        GenJournalLine."Maintenance Code" := ValueEntry."Maintenance Code";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Inventory Posting To G/L", 'OnBeforeBufferAdjmtPosting','',true,true)]
    local procedure InventoryPostingToGLOnBeforeBufferAdjmtPosting(var GlobalInvtPostBuf: Record "Invt. Posting Buffer";var IsHandled: Boolean;var ValueEntry: Record "Value Entry")
    begin
        if ValueEntry."Item Ledger Entry Type" = ValueEntry."Item Ledger Entry Type"::Transfer then IsHandled := True;
    end;

}
