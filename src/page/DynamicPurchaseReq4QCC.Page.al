page 50151 "DPS Purch. Req. for QCC"
{
    Caption = 'DPS From Security for QCC';
    PageType = Document;
    SourceTable = "Purchase Requisition1";
    ApplicationArea = all;
    UsageCategory = Documents;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                /*field("DPS No."; DPSNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the DPS No. field.', Comment = '%';
                    TableRelation = "Dynamics Procurement Header"."DPS No." where(Processed = const(true));
                    trigger OnValidate()
                    begin
                        if DPSNo <> '' then 
                        begin
                        Rec.SetRange(rec."Req No.",DPSNo);
                        rec.SetFilter("Security checked",'%1',true);
                        if Vendor <> '' then 
                        rec.SetRange("Supply By",Vendor);
                        rec.FindFirst()
                        end;
                    end;
                }
                field(Supplier; Vendor)
                {
                    ApplicationArea = All;
                    TableRelation = Vendor."No." where(Blocked = const(0));
                    trigger OnValidate()
                    var
                        VendRec: Record Vendor;
                    begin
                        if Vendor <> '' then begin
                        if VendRec.get(Vendor) then VenName := VendRec.Name
                        else VenName := '';
                        rec.SetRange("Supply By",Vendor);
                        rec.SetFilter("Security checked",'%1',true);
                        if DPSNo <> '' then                         
                        Rec.SetRange(rec."Req No.",DPSNo);
                        rec.FindFirst()
                        end else
                        rec.FindFirst();                        
                    end;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved field.', Comment = '%';
                }
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Store Approved field.', Comment = '%';
                }
                field("Req Department"; Rec."Req Department")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Req Department field.', Comment = '%';
                }
                field("Approved Line items"; Rec."Approved Line items")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Line items field.', Comment = '%';
                }*/
            }
            group("Details Process")
            {
                grid(Details)
                {
                    GridLayout = Columns;
                    group(Lines)
                    {
                        part("Requested Line"; "Dynamics Procurement SubPage")
                        {
                            Caption = 'Requested Items';
                            //SubPageLink =  = FIELD("DPS No.");                            
                            SubPageView = where("Security Check" = const(true), "Qcc Checked" = const(false));
                            ApplicationArea = All;
                            Editable = false;
                        }
                    }
                    group(Process)
                    {
                        part(Approval; "Dynamics Purchase SubPage")
                        {
                            Provider = "Requested Line";
                            SubPageLink = "Req. Line No." = FIELD("Line No."), "Req No." = FIELD("DPS Code");
                            ApplicationArea = All;
                            Editable = true;
                        }
                    }
                }
            }
        }
        /* area(FactBoxes)
         {
             part(Approvals; "Dynamics Purchase SubPage")
             {
                 Provider = "Requested Line";
                 SubPageLink = "Req. Line No." = FIELD("Req. Line No."),
                               "Req No." = FIELD("Req No.");
                 ApplicationArea = All;
                 Editable = true;
             }
         }*/
    }
    var
        DPSNo: Code[20];
        Vendor: Code[20];
        VenName: Text[50];



}
