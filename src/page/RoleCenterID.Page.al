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
            group(Action7)
            {
                action("Periodic Stock Position")
                {
                    Caption = 'Periodic Stock Position';
                    RunObject = Report "Periodic Stock Position-CODEWA";
                    ApplicationArea = All;
                }
            }
        }
        area(sections)
        {
            group("Material Requisiion")
            {
                Caption = 'Material Requisiion';
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
                action("Awaiting Approval")
                {
                    RunObject = page "DPS Waiting For Approval";
                    RunPageView = WHERE("Send for Approval" = CONST(true));
                    ApplicationArea = All; 
                }
                action("Approved Awaiting Process")
                {
                    RunObject = page "Processed Approved DPS";
                    RunPageView = WHERE(Processed = CONST(false),
                                        Approved = const(true));
                    ApplicationArea = All;                    
                }
                action("Processed DPS")
                {
                    RunObject = page "Processed Approved DPS";
                    RunPageView = WHERE(Processed = CONST(true),
                                        Approved = const(true));
                    ApplicationArea = All;   
                }
            }
            Group(Sales)
            {                
            }
        }
        area(Processing)
        {}
    }
}
