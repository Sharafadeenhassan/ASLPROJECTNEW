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
            }
            group("Details Process")
            {
                grid(Details)
                {
                    GridLayout = Columns;
                    group(Lines)
                    {
                        part("Requested Line"; "Dynamic Purchase Req. SubPage")
                        {
                            Caption = 'Requested Items';
                            //SubPageLink =  = FIELD("DPS No.");                            
                            SubPageView = where("Security checked" = const(true), "QCC Check" = const(false));
                            ApplicationArea = All;
                            Editable = false;
                        }
                    }
                    group(Process)
                    {
                        part(Approval; "Dynamics Purchase SubPage")
                        {
                            Provider = "Requested Line";
                            SubPageLink = "Req. Line No." = FIELD("Req. Line No."),
                              "Req No." = FIELD("Req No."),"Puch.Req Line No." = field("Puch.Req Line No.");
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
