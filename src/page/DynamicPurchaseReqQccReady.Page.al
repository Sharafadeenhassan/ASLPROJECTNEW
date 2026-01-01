page 50152 "DPS Purch. Req. Qcc Ready"
{
    Caption = 'QCC Ready Purchase Requisition';
    PageType = Document;
    //SourceTable = "Dynamics Procurement Header";
    //SourceTableView = where(Processed = const(true));
    ApplicationArea = all;
    UsageCategory = Documents;
    layout
    {
        area(Content)
        {           
            
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
                    //SubPageLink = "Req No." = FIELD("DPS No.");
                    SubPageView = where("Procurement Mgr. Action" = const(0),"QCC Check" = const(true));
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
}
