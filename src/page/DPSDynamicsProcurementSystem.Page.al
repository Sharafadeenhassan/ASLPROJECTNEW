page 50120 "Dynamics Procurement System"
{
    PageType = Document;
    SourceTable = "Dynamics Procurement Header";
    UsageCategory = Administration;
    ApplicationArea = All, Basic;
    Caption = 'Dynamics Procurement System';
    layout
    {
        area(content)
        {
            group(General)
            {
                field("DPS No."; Rec."DPS No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Base Date"; Rec."Base Date")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;                    
                }
                field("Req Department"; rec."Req Department")
                {
                    ApplicationArea = All;
                }
                field("Item Filter"; Rec."Item Filter")
                {
                    Importance = Additional;
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Maxmum Order Period"; Rec."Maxmum Order Period")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Inventory Group Filter"; Rec."Inventory Group Filter")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Suggest Items"; Rec."Suggest Items")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Update Record"; Rec."Update Record")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Gen. Product Posting Group"; Rec."Gen. Product Posting Group")
                {
                    Importance = Additional;
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            part("Requested Items"; "Dynamics Procurement SubPage")
            {
                Editable = rec.Processed = false;
                Caption = 'Requested Items';
                SubPageLink = "DPS Code" = FIELD("DPS No.");
                ApplicationArea = All;
            }
            group(Approval)
            {
                Editable = rec.Processed = false;
                field("Sent For 1st Approval (HOD)"; Rec."Sent To For Approval")
                {
                    //Caption = 'Send  To for HOD Approval';
                    ApplicationArea = All;
                    Editable = rec."Send For Approval" = false;
                }
                field("Sent For 2nd Approval (Store)"; rec."Return To For Process")
                {
                    ApplicationArea = All;
                    //Caption = 'Sent To For Store Process';
                    Editable = rec."Send For Approval" = false;
                }
                field("For 1st Approval (HOD)"; Rec."Send For Approval")
                {
                    //Caption = 'Send for HOD Approval';
                    ApplicationArea = All;
                    Editable = rec.Approved = false;
                }
                field("1st Approval (HOD) By"; Rec."Send For Approval By")
                {
                    ApplicationArea = All;
                    Editable = false;
                    //Caption = 'Sent For HOD Approved By';
                }
                field("For 1st Approval (HOD) Time"; Rec."Send for Approval Time")
                {
                    ApplicationArea = All;
                    //Caption = 'Sent for HOD Approved Time';
                }
                field("1st Approved (HOD)"; Rec.Approved)
                {
                    ApplicationArea = All;
                    //Caption = 'HOD Approved';
                }
                field("1st Approved (HOD) By"; Rec."Approved By")
                {
                    ApplicationArea = All;
                    //Caption = 'HOD Approved By';
                }
                field("1st Approved (HOD)Time"; Rec."Approved Time")
                {
                    ApplicationArea = All;
                    //Caption = 'HOD Approved Time';
                }
            }

            group("Continue Process")
            {
                Editable = rec."Approved";
                ShowCaption = true;
                group("Line Analysis")
                {
                    Editable = false;
                    field("Total Line Items"; Rec."Total Line Items")
                    {
                        ApplicationArea = All;
                    }
                    field("Approved Line items"; Rec."Approved Line items")
                    {
                        ApplicationArea = All;
                    }
                    field("Unapproved Line Items"; Rec."Unapproved Line Items")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Generate Order")
                {
                    field("Send to StoreKeeper";rec."Send to StoreKeeper")
                    {
                        ApplicationArea = all;
                        Editable = rec.Processed = false;
                    }

                    field("Store Approval"; Rec.Processed)
                    {
                        ApplicationArea = All;
                        Editable = rec."Send to StoreKeeper" <>'';
                    }
                    field("Store Approved Date"; Rec."Process Date")
                    {
                        Caption = 'Store approved Date';
                        ApplicationArea = All;
                        Editable = False;
                    }
                    field("Store Approved By"; Rec."Process By")
                    {
                        ApplicationArea = All;
                        Editable = false;
                                            }
                    field("Store Approved By Name"; Rec."Process By Name")
                    {
                        Visible = false;
                        ApplicationArea = All;
                    }
                    field("Average Consumption Base"; rec."Average Consumption Base")
                    {
                        ApplicationArea = all;
                        Visible = false;
                    }
                }
            }
        }
        area(FactBoxes)
        {
            part(Details; "DPS SubPage Part")
            {
                Provider = "Requested Items";
                SubPageLink = "Line No." = FIELD("Line No."),
                              "DPS Code" = FIELD("DPS Code");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Purchase Order")
            {
                Visible = false;
                Image = Invoice;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.CreatePurchInv();
                end;
            }
            action("Create Purchase Requisition")
            {
                Image = Invoice;
                Promoted = true;
                ApplicationArea = All;
                Caption = 'Transfer Lines for Store Process';

                trigger OnAction()
                begin
                    Rec.UpdatePurReq();
                end;
            }
            action("Print Purchase Requisition")
            {
                Image = Print;
                Promoted = true;
                ApplicationArea = All;
                Caption = 'Print Requisition for MD Approval';
                //RunObject = report "DPS Request List";
                //RunPageOnRec = true;   

                trigger OnAction()
                var
                    DPSRec: Record "Dynamics Procurement Header";
                begin
                    DPSRec := Rec;
                    if rec."Sent To For Approval" <> UserId then
                        Error('You are not allowed to print This Document');
                    if not DPSRec.Approved then Error('Please Approve this Document Before you Print');
                    Report.Run(50219, true, true, DPSRec);
                end;
            }

        }
    }
}
