pageextension 50368 "pageextension50368" extends "Released Production Orders"
{
    layout
    {
        moveafter("Starting Date-Time"; "Ending Date-Time")
        modify("Ending Date-Time")
        {
            ApplicationArea = Manufacturing;
            ToolTip = 'Specifies the ending date and ending time of the production order.';
            visible = false;
        }
    }
    actions
    {
        //Unsupported feature: Property Modification (Name) on "ProdOrderJobCard(Action 1903594306)".

        //Unsupported feature: Property Insertion (RunObject) on "ProdOrderJobCard(Action 1903594306)".

        //Unsupported feature: Property Modification (Name) on "ProdOrderMaterialRequisition(Action 1902917606)".

        //Unsupported feature: Property Insertion (RunObject) on "ProdOrderMaterialRequisition(Action 1902917606)".

        //Unsupported feature: Property Modification (Name) on "ProdOrderShortageList(Action 1903746906)".

        //Unsupported feature: Property Insertion (RunObject) on "ProdOrderShortageList(Action 1903746906)".

        modify(ProdOrderJobCard)
        {
            Visible = false;
        }
        modify(ProdOrderMaterialRequisition)
        {
            Visible = false;
        }
        modify(ProdOrderShortageList)
        {
            Visible = false;
        }
        addafter("Production Order Statistics")
        {
            action("<Production - Yield Report >")
            {
                Caption = 'Production - Yield Report';
                RunObject = Report "Sum. Production Yield Report";
                ApplicationArea = All;
            }
        }
    }
}
