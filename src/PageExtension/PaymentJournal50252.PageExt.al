pageextension 50252 "pageextension50252" extends "Payment Journal"
{
    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    StyleTxt := GetOverdueDateInteractions(OverdueWarningText);
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    UpdateBalance;
    EnableApplyEntriesAction;
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

    if GenJournalBatch.Get("Journal Template Name","Journal Batch Name") then begin
      ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RecordId);
      IsAllowPaymentExport := GenJournalBatch."Allow Payment Export";
    end;
    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RecordId);

    EventFilter := WorkflowEventHandling.RunWorkflowOnSendGeneralJournalLineForApprovalCode;
    EnabledApprovalWorkflowsExist := WorkflowManagement.EnabledWorkflowExist(DATABASE::"Gen. Journal Line",EventFilter);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    #8..15
    */
    //end;
}
