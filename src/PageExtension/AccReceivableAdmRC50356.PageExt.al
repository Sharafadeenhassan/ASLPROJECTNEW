pageextension 50356 "pageextension50356" extends "Acc. Receivables Adm. RC"
{
    actions
    {
        addafter("Sales &Reminder")
        {
            action("Requisition Register")
            {
                RunObject = Page "Store Requisitions";
                ApplicationArea = All;
            }
        }
    }
}
