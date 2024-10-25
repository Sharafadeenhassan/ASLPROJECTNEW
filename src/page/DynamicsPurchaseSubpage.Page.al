page 50131 "Dynamics Purchase SubPage"
{
    Caption = 'Dynamics Purchase SubPage';
    PageType = CardPart;
    SourceTable = "Purchase Requisition1";
    layout
    {
        
        area(Content)
        {
           /* field("DPS No.";rec."Req No.")
            {
                ApplicationArea = all;
            }
            field("Security Check Date";Rec."Security Check Time")
            {
                ApplicationArea = All;
            }*/
            field("Item No.";rec."Item No.")
            {
                Editable = false;
                Style = Favorable;
                StyleExpr = rec.Process;
            }
            field(Description;Description)
            {
                Editable = false;
            }
            group(Approvals)
            {
                Editable = "Sent to Security" = false;
                Caption = 'Approvals';
                field("Supply By"; Rec."Supply By")
                {
                    ApplicationArea = All;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = All;
                }
            }
            group(Security)
            {
                Editable = "Sent For QCC" = false;
                field("Security Check By"; Rec."Security Check By")
                {
                    ApplicationArea = All;
                    Editable = rec."Sent to Security" = false;
                }
                field("Security Checked By Name"; Rec."Security Checked By Name")
                {
                    Editable = false;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Sent to Security"; Rec."Sent to Security")
                {
                    ApplicationArea = All;
                    Editable = rec."Security checked" = false;
                }
                field("Security Check Quantity"; Rec."Security Check Quantity")
                {
                    Editable = false;
                    //Importance = Additional;
                    ApplicationArea = All;
                }
                field("Security checked"; Rec."Security checked")
                {
                   // Importance = Additional;
                    ApplicationArea = All;
                    Editable = rec."Sent For QCC" = false;

                }
                field("Security Check Time"; Rec."Security Check Time")
                {
                    Editable = false;
                    Importance = Additional;
                    ApplicationArea = All;
                }
            }
            group("Quality Control")
            {
                Visible = rec."Security checked";
                Editable = rec."Sent For Store Mgr Action" = false;
                field("QCC Check  By"; Rec."QCC Check  By")
                {
                    ApplicationArea = All;
                    Editable = rec."Sent For QCC" = false;
                }
                field("QCC Check  Name"; Rec."QCC Check  Name")
                {
                    Editable = false;
                    Importance = Additional;
                    ApplicationArea = All;
                }
                field("Sent For QCC"; Rec."Sent For QCC")
                {
                    ApplicationArea = All;
                    Editable = rec."QCC Check" = false;
                }
                field("QCC Check Quantity"; Rec."QCC Check Quantity")
                {
                    Editable = false;
                    //Importance = Additional;
                    ApplicationArea = All;
                }
                field("QCC Check"; Rec."QCC Check")
                {
                    //Importance = Additional;
                    ApplicationArea = All;
                }
                field("QCC Check Time"; Rec."QCC Check Time")
                {
                    Editable = false;
                    //Importance = Additional;
                    ApplicationArea = All;
                }
                field("Store Manager";"Store Manager")
                {
                    ApplicationArea = All;
                    //Importance = Additional;
                }
                field("Sent For Store Mgr Action";"Sent For Store Mgr Action")
                {
                    Editable = rec."QCC Check";
                    Importance = Standard;
                    ApplicationArea = All;   
                }
            }
            group("Return Security")
            {
                Visible = rec."QCC Rejected Quantity" <> 0;
                Editable = (rec."Security Returned" = false);
                field("Return to Security"; Rec."Return to Security")
                {
                    ApplicationArea = All;
                }
                field("Quantity To Return"; Rec."Quantity To Return")
                {
                    ApplicationArea = All;
                }
                field("Security Return Quantity"; Rec."Security Return Quantity")
                {
                    ApplicationArea = All;
                }
                field("Security Returned"; Rec."Security Returned")
                {
                    ApplicationArea = All;
                }
            }
            group(Store)
            {
                Visible = rec."Sent For Store Mgr Action";
                Editable = rec."Sent For Store Mgr Action";
                field("Procurement Mgr. Action"; Rec."Procurement Mgr. Action")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("QCC Rejected Quantity"; Rec."QCC Rejected Quantity")
                {
                    ApplicationArea = All;
                }
                field("Shortage Supplied  Quantity"; Rec."Shortage Supplied  Quantity")
                {
                    ApplicationArea = All;
                }
            }
            group("Store Process")
            {
                Visible = rec."Procurement Mgr. Action" <> 0;
                Editable = Rec."Invoice No." = '';
                field(Process; Rec.Process)
                {
                    ApplicationArea = All;
                }
                field("Process By"; Rec."Process By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Process By Name"; Rec."Process By Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }

        }
    }
    trigger OnAfterGetRecord()
    begin
        if Rec."Invoice No." <> '' then
        CurrPage.Editable := false
        else
        CurrPage.Editable := true;
    end;
}

