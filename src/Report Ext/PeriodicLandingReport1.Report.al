report 50335 "Periodic Landing Report1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PeriodicLandingReport1.rdlc';
    Caption = 'Periodic Landing Report1';
    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            DataItemTableView = SORTING("Job No.", "Posting Date") WHERE("Location Code" = CONST('CRM-ASL'), "Gen. Prod. Posting Group" = CONST('FIS'), "Reason Code" = CONST('CATCH'));
            RequestFilterFields = "Posting Date";
            column(GroupSort_JobLedgerEntry; "Job Ledger Entry".GroupSort)
            {
            }
            column(JobPostingGroup_JobLedgerEntry; "Job Ledger Entry"."Job Posting Group")
            {
            }
            column(ReasonCode_JobLedgerEntry; "Job Ledger Entry"."Reason Code")
            {
            }
            column(TotalPrice_JobLedgerEntry; "Job Ledger Entry"."Total Price")
            {
            }
            column(UnitofMeasureCode_JobLedgerEntry; "Job Ledger Entry"."Unit of Measure Code")
            {
            }
            column(Quantity_JobLedgerEntry; "Job Ledger Entry".Quantity)
            {
            }
            column(SourceCode_JobLedgerEntry; "Job Ledger Entry"."Source Code")
            {
            }
            column(Description_JobLedgerEntry; "Job Ledger Entry".Description)
            {
            }
            column(LocationCode_JobLedgerEntry; "Job Ledger Entry"."Location Code")
            {
            }
            column(GenProdPostingGroup_JobLedgerEntry; "Job Ledger Entry"."Gen. Prod. Posting Group")
            {
            }
            column(JobNo_JobLedgerEntry; "Job Ledger Entry"."Job No.")
            {
            }
            column(PostingDate_JobLedgerEntry; "Job Ledger Entry"."Posting Date")
            {
            }
            column(DocumentNo_JobLedgerEntry; "Job Ledger Entry"."Document No.")
            {
            }
            column(No_JobLedgerEntry; "Job Ledger Entry"."No.")
            {
            }
            column(Company_Name; cmpny.Name)
            {
            }
            column(Text001; Text001)
            {
            }
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        cmpny: Record "Company Information";
        Text001: Label 'Landing For the Period';
}
