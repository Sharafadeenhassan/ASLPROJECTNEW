pageextension 50364 "pageextension50364" extends "Sales Invoice List"
{
    layout
    {
        moveafter("Shipment Method Code"; "Shipping Agent Code")
        Modify("Shipping Agent Code")
        {
            ApplicationArea = Suite;
            ToolTip = 'Specifies the code for the shipping agent who is transporting the items.';
            Visible = false;
        }

        moveafter("Job Queue Status"; Amount)
        modify(Amount)
        {
            ApplicationArea = Basic, Suite;
            ToolTip = 'Specifies the sum of amounts in the Line Amount field on the sales order lines. It is used to calculate the invoice discount of the sales order.';
        }
    }
    actions
    {
        addafter(Preview)
        {
            action("Delivery Note")
            {
                Caption = 'Delivery Note';
                Image = Delivery;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunPageOnRec = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TrasRec.SetRange(TrasRec."No.", Rec."No.");
                    TrasRec.SetRange(TrasRec."Document Type", Rec."Document Type");
                    if TrasRec.FindFirst() then
                        REPORT.RunModal(50093, true, false, TrasRec);
                end;
            }
            action("Import Fish Shop Daily Sales")
            {
                Image = Process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Fishshop Daily sales";
                ApplicationArea = All;
            }
        }
    }

    //Unsupported feature: Property Modification (Id) on "LinesInstructionMgt(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //LinesInstructionMgt : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //LinesInstructionMgt : 1103;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "JobQueueActive(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //JobQueueActive : 1000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //JobQueueActive : 1100;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "OpenApprovalEntriesExist(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //OpenApprovalEntriesExist : 1004;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OpenApprovalEntriesExist : 1104;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "OpenPostedSalesInvQst(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //OpenPostedSalesInvQst : 1006;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //OpenPostedSalesInvQst : 1106;
    //Variable type has not been exported.

    var
        TrasRec: Record "Sales Header";
}
