report 50107 "ASL Batch Job Update"
{
    ApplicationArea = All;
    Caption = 'ASL Batch Job Update';
    Permissions = TableData "Value Entry" = rimd;                 
    ProcessingOnly = true;
    UsageCategory = Tasks;
    dataset
    {
        dataitem(ValueEntry; "Value Entry")
        {
            DataItemTableView = SORTING("Item Ledger Entry Type",Adjustment) WHERE("Item Ledger Entry Type" = Filter(Transfer),Adjustment = CONST(False));
            RequestFilterFields = "Item Ledger Entry Type","Item No.", "Date Filter";
            column(ItemNo; "Item No.")
            {
            }
            column(ItemLedgerEntryType; "Item Ledger Entry Type")
            {
            }
            column(Adjustment; Adjustment)
            {
            }
            column(MADJ; MADJ)
            {
            }
           trigger OnAfterGetRecord()           
           begin
            ValueEntry.Adjustment := true;
            ValueEntry.MADJ := True;
            ValueEntry.Modify();
           end;
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
