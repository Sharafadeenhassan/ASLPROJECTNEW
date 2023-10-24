pageextension 50251 "pageextension50251" extends "Cash Receipt Journal"
{
    layout
    {
        modify("External Document No.")
        {
            Visible = True;
        }
        modify("Document Type")
        {
            Visible = true;
        }
        addafter(Amount)
        {
            field("Loan ID"; Rec."Loan ID")
            {
                ApplicationArea = All;
            }
            field("FA Posting Type"; Rec."FA Posting Type")
            {
                ApplicationArea = All;
            }
        }
    }
    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GenJnlManagement.GetAccounts(Rec,AccName,BalAccName);
    UpdateBalance;
    EnableApplyEntriesAction;
    SetControlAppearance;
    CurrPage.IncomingDocAttachFactBox.PAGE.LoadDataFromRecord(Rec);

    if GenJournalBatch.Get("Journal Template Name","Journal Batch Name") then
      ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(GenJournalBatch.RecordId);
    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RecordId);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
    ShowWorkflowStatusOnBatch := CurrPage.WorkflowStatusBatch.PAGE.SetFilterOnWorkflowRecord(RecordId);
    ShowWorkflowStatusOnLine := CurrPage.WorkflowStatusLine.PAGE.SetFilterOnWorkflowRecord(RecordId);
    */
    //end;
}
