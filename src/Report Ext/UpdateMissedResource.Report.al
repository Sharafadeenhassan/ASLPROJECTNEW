report 50083 "Update Missed Resource"
{
    ApplicationArea = All;
    Caption = 'Update Missed Resource';
    UsageCategory = Tasks;
    dataset
    {
        dataitem(JobJournalBatch; "Job Journal Batch")
        {
            column(BatchType; "Batch Type")
            {
            }
            column(CatchDate; "Catch Date")
            {
            }
            column(Description; Description)
            {
            }
            column(JobNo; "Job No.")
            {
            }
            column(JournalTemplateName; "Journal Template Name")
            {
            }
            column(Name; Name)
            {
            }
        }
            }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
