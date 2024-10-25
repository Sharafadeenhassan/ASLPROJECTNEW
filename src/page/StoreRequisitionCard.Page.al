page 50059 "Store Requisition Card"
{
    PageType = Card;
    SourceTable = "Store Requisition Header New";
    Caption = 'Store Requisition Card';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Req. Type"; Rec."Req. Type")
                {
                    ApplicationArea = All;
                }
                field("Req. No"; Rec."Req. No")
                {
                    ApplicationArea = All;
                    Editable = false;
                    
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Req Date"; Rec."Req Date")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Processed Date"; Rec."Processed Date")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Fish Store Requisition"; Rec."Fish Store Requisition")
                {
                    ApplicationArea = All;
                }
                field("To Be Collected By"; Rec."To Be Collected By")
                {
                    ApplicationArea = All;
                }
                field("Transfer From"; Rec."Transfer From")
                {
                    ApplicationArea = All;
                }
                field("Transfer To."; Rec."Transfer To.")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Voyage No."; Rec."Voyage No.")
                {
                    ApplicationArea = All;
                }
                field("Requisition Template"; Rec."Requisition Template")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Claim by Employee"; Rec."Claim by Employee")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Claim by Resources"; Rec."Claim by Resources")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
            }
            group(Account)
            {
                field("Job Related"; Rec."Job Related")
                {
                    ApplicationArea = All;
                }
                field("Journal Batch"; Rec."Journal Batch")
                {
                    ApplicationArea = All;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = All;
                }
                field(DryDock; Rec.DryDock)
                {
                    ApplicationArea = All;
                }
                field("Job No."; Rec."Job No.")
                {
                    DrillDownPageID = "Dry Docking/Job  list";
                    LookupPageID = "Dry Docking/Job  list";
                    ApplicationArea = All;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = All;
                }
                field("Gen Bus. posting Grp."; Rec."Gen Bus. posting Grp.")
                {
                    ApplicationArea = All;
                }
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                }
            }
            part("Requisition Line"; "Store Requisition Subform")
            {
                SubPageLink = "Req. No." = FIELD("Req. No");
                ApplicationArea = All;
            }
            group("Approval Section")
            {
                field("1st Approval to"; Rec."1st Approval to")
                {
                    ApplicationArea = All;
                }
                field("1st Approval Name"; Rec."1st Approval Name")
                {
                    ApplicationArea = All;
                }
                field("Mail Body"; Rec."Mail Body")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Send for Approval"; Rec."Send for Approval")
                {
                    ApplicationArea = All;
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                }
                field("Sent Time"; Rec."Sent Time")
                {
                    ApplicationArea = All;
                }
                field("Final Approval to"; Rec."Final Approval to")
                {
                    ApplicationArea = All;
                }
                field("Final Approval Name"; Rec."Final Approval Name")
                {
                    ApplicationArea = All;
                }
                field("1st Approved"; Rec."1st Approved")
                {
                    ApplicationArea = All;
                }
                field("1st Approved Time"; Rec."1st Approved Time")
                {
                    ApplicationArea = All;
                }
                field("Final Approved"; Rec."Final Approved")
                {
                    ApplicationArea = All;
                }
                field("Final Approved Time"; Rec."Final Approved Time")
                {
                    ApplicationArea = All;
                }
                field("Issued Captured"; Rec."Issued Captured")
                {
                    ApplicationArea = All;
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(Facts; "Item Invoicing FactBox")
            {
                Provider = "Requisition Line";
                SubPageLink = "No." = FIELD("Item No."),
                              "Location Filter" = FIELD("Store Location");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Transfer Order")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.TransferOrder()
                end;
            }
            action("Create Adjustments")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CreateAdjSmt()
                end;
            }
            action("Create Sales Invoice")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CreatesalesInv();
                end;
            }
            action("Create Purchase Invoice")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CreatePurchInv();
                end;
            }
            action("Print Material Requisition")
            {
                Image = Print;
                Promoted = true;
                RunPageOnRec = true;
                PromotedCategory = Report;
                PromotedOnly= true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Userrec.Get(UserId);
                    if not Userrec."Print MR" then Error('Sorry you are not allowed to Print Store Material Requisition.');
                    REQREC.SetRange(REQREC."Req. No", Rec."Req. No");
                    if REQREC.FindFirst() then
                        REPORT.RunModal(50094, true, false, REQREC);
                end;
            }
            action("Copy TransferTemplate")
            {
                Image = Template;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.LoadTemplate();
                end;
            }
            action("Check Staff Replacement")
            {
                Image = StaleCheck;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CheckReplacement();
                end;
            }
            action("Revalidate Approved Quantity")
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Rec."Final Approved" <> Rec."Final Approved"::Approved then
                        Recline.SetRange(Recline."Req. No.", Rec."Req. No");
                    if Recline.FindFirst() then
                        repeat
                        begin
                            ItemRec.Get(Recline."Item No.");
                            ItemRec.SetFilter(ItemRec."Location Filter", '%1', Recline."Store Location");
                            ItemRec.CalcFields(ItemRec.Inventory);
                            Recline.CalcFields(Recline."Pending Approved Qty");
                            Recline."Available Quantity" := (ItemRec.Inventory - Recline."Pending Approved Qty");
                            if Recline."Available Quantity" < 0 then Recline."Available Quantity" := 0;
                        end;

                        if Recline."Requested Quantity" > Recline."Available Quantity" then
                            Recline."Approved Quantity" := Recline."Available Quantity"
                        else
                            Recline."Approved Quantity" := Recline."Requested Quantity";
                        Recline."Issued Quantity" := Recline."Approved Quantity";
                        Recline.Modify();
                        until Recline.Next() = 0;
                end;
            }
            action("Materia Reconciliation ")
            {
                Image = Recalculate;
                RunObject = Report "Material Req Reconciliation";
                ApplicationArea = All;
            }
        }
    }

    var
        REQREC: Record "Store Requisition Header New";
        Userrec: Record "User Setup";
        Recline: Record "Store Requisition Line New";
        ItemRec: Record Item;
}
