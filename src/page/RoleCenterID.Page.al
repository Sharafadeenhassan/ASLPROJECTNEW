/// <summary>
/// Page Role Center ID (ID 50136).
/// </summary>
page 50136 "Role Center ID"
{
    PageType = RoleCenter;
    Caption = 'ASL General Menu';
    UsageCategory = Administration;
    ApplicationArea = All;
    layout
    {
        area(RoleCenter)
        {
            group(Control22)
            {
                ShowCaption = false;
                part(Control21; "Finance Performance")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                part(Control20; "Account Manager Activities")
                {
                    ApplicationArea = All;
                }
                part(Control19; "My Customers")
                {
                    ApplicationArea = All;
                }
            }
            group(Control18)
            {
                ShowCaption = false;
                part(Control17; "Trailing Sales Orders Chart")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                part(Control16; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                part(Control14; "My Vendors")
                {
                    ApplicationArea = All;
                }
                part(Control13; "Report Inbox Part")
                {
                    ApplicationArea = All;
                }
                systempart(Control11; MyNotes)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            group("All Menu Reports")
            {
                action("Item Reports")
                {
                    Caption = 'Item Reports';
                    RunObject = Page "Inventory-Report";
                    ApplicationArea = All;
                }
                action("Periodic Stock Position")
                {
                    Caption = 'Periodic Stock Position';
                    RunObject = Report "Periodic Stock Position-CODEWA";
                    ApplicationArea = All;
                }
                action(Job)
                {
                    Caption = 'Job Reports';
                    RunObject = Page "Job-Reports";
                    ApplicationArea = All;
                }
                action(Sales)
                {
                    Caption = 'Sales Report';
                    RunObject = page "Sales& Rec-Report";
                    ApplicationArea = All;
                }
                action(Purchases)
                {
                    Caption = 'Purchase Reports';
                    RunObject = Page "Purchase&Pay-Reports";
                    ApplicationArea = All;
                }


            }
        }
        area(sections)
        {
            group(Inventory)
            {
                action(Item)
                {
                    RunObject = page "Item List";
                    Image = Inventory;
                    ApplicationArea = all;
                }
                action("Item Journal")
                {
                    RunObject = page "Item Journal";
                    Image = InventoryJournal;
                    ApplicationArea = all;
                }
                action("Transfer Order")
                {
                    RunObject = page "Transfer Orders";
                    Image = TransferOrder;
                    ApplicationArea = all;
                }
                action("Posted Transfer Receipt")
                {
                    RunObject = page "Posted Transfer Receipts";
                    Image = PostedReceipts;
                    ApplicationArea = all;
                }
                action("Posted Transfer Shipment")
                {
                    RunObject = page "Posted Transfer Shipments";
                    Image = PostedShipment;
                    ApplicationArea = all;
                }
                action("Item-Reports")
                {
                    Caption = 'Item-Reports';
                    RunObject = Page "Inventory-Report";
                    image = Inventory;
                    ApplicationArea = All;
                }


            }
            group("Material Requisition")
            {
                Caption = 'Material Requisition';
                action(Requisition)
                {
                    Caption = 'Materia Requisition';
                    RunObject = Page "Store Requisitions";
                    RunPageView = WHERE("Send for Approval" = CONST(false));
                    ApplicationArea = All;
                }
                action("Requisition Awaiting HOD Approval")
                {
                    RunObject = Page "Store Req. ready For Approval";
                    RunPageView = WHERE("Send for Approval" = CONST(true),
                                        "1st Approved" = FILTER(<> Approved));
                    ApplicationArea = All;
                }
                action("Requisition Awaiting Store Approval")
                {
                    RunObject = Page "Store Req. Ready for Final App";
                    RunPageView = WHERE("Send for Approval" = CONST(true),
                                        "1st Approved" = CONST(Approved),
                                        "Final Approved" = FILTER(<> Approved));
                    ApplicationArea = All;
                }
                action("Requisition Awaiting Store Keeper Process")
                {
                    RunObject = Page "Store Req. Ready for Capture";
                    RunPageView = WHERE("Send for Approval" = CONST(true),
                                        "1st Approved" = CONST(Approved),
                                        "Final Approved" = CONST(Approved),
                                        "Issued Captured" = CONST(false),
                                        Processed = CONST(false));
                    ApplicationArea = All;
                }
                action("Awaiting Processed Requisition")
                {
                    RunObject = Page "MR. Issued Ready for Process";
                    ApplicationArea = All;
                }
                action("Completed Processed Requisition")
                {
                    RunObject = Page "Store Req.  Approved and Issue";
                    ApplicationArea = All;
                }
                action("Rejected Material Requisition")
                {
                    Caption = 'Rejected Materia Requisition';
                    RunObject = Page "Store Req.  Rejected";
                    ApplicationArea = All;
                }
                action("All Material Requisition Status")
                {
                    Caption = 'All  Materia Requisition Status';
                    RunObject = Page "All Requisition Status";
                    RunPageView = WHERE("Send for Approval" = CONST(true));
                    ApplicationArea = All;
                }
                action("Material Variance Report")
                {
                    RunObject = Report "Material Variant report";
                    ApplicationArea = All;
                }
                action("MR Reconciliation ")
                {
                    RunObject = Page "MR Reconciliation";
                    ApplicationArea = All;
                }
            }
            Group("Dynamic Procurement System")
            {
                action("Dynamics Register")
                {
                    RunObject = page "Dynamic Procurement Register";
                    ApplicationArea = All;
                }
                action("Awaiting  HOD Approval")
                {
                    RunObject = page "DPS Waiting For Approval";
                    //RunPageView = WHERE("Send for Approval" = CONST(true));
                    ApplicationArea = All;
                }
                action("Awaiting Store Approver")
                {
                    RunObject = page "Approved DPS For Processing";
                    ApplicationArea = All;
                }
                action("Approved DPS Lines")
                {
                    RunObject = page "Approved DPS Line";
                    Visible = false;
                }
                action("DPS Status")
                {
                    RunObject = page "Dynamic Procurement Status";
                    RunPageView = order(descending);
                    RunPageMode = View;
                    ApplicationArea = All;
                }


            }
            Group("Store Purchase Request")
            {
                group("StoreKeeper Processed")
                {
                    action("Pending DPS")
                    {
                        RunObject = page "Processed Approved DPS";
                        ApplicationArea = All;
                    }
                    action("Send To QCC List")
                    {
                        RunObject = page "DPS Purch. Req. for QCC";
                        ApplicationArea = All;
                    }
                    action("Send To Store Mgr. List")
                    {
                        RunObject = page "DPS Purch. Req. Qcc Ready";
                        ApplicationArea = All;
                    }
                    action("Send for PO")
                    {
                        RunObject = page "Purch. Req. Process List";
                        ApplicationArea = All;
                    }
                    action("Ready for PO")
                    {
                        RunObject = page "Purchase Request List";
                        RunPageView = order(descending) where(Process = const(true), "Invoice No." = filter(''));
                        Promoted = true;
                        PromotedCategory = Process;
                        ApplicationArea = All;
                    }
                    action("GRN Generated")
                    {
                        RunObject = page "Purchase Request List";
                        RunPageView = where(Process = const(true), "Invoice No." = filter(<> ''));
                        ApplicationArea = All;
                    }
                }
                action("Security Check")
                {
                    RunObject = page "Purchase Request Sec. check";
                    ApplicationArea = All;
                }
                action("Quality Check")
                {
                    RunObject = page "Purchase Request QCC List";
                    ApplicationArea = All;
                }
                action("Awaiting Store Manager")
                {
                    RunObject = page "Purch Request Mgr Action Sheet";
                    ApplicationArea = All;
                }
                action("Security Return")
                {
                    RunObject = page "Purchase Request Sec. Return";
                    ApplicationArea = All;
                }
                action("Purchase Request Status")
                {
                    RunObject = page "Purchase Request List";
                    RunPageView = order(descending);
                    RunPageMode = View;
                    ApplicationArea = All;
                }
            }

        }

    }
}
