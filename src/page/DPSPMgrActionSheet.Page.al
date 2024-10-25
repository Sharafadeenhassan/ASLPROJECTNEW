page 50122 "Purch Request Mgr Action Sheet"
{
    Caption = 'Procurement Manager Action Sheet';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    SourceTable = "Purchase Requisition1";
    SourceTableView = WHERE("QCC Check" = CONST(true),
                            Process = CONST(false),
                            "Procurement Mgr. Action" = FILTER(<> Approved));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("Req No."; Rec."Req No.")
                {
                    ApplicationArea = All;
                }
                field("Req. Line No."; Rec."Req. Line No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Req Department"; Rec."Req Department")
                {
                    ApplicationArea = All;
                }
                field("Req Location"; Rec."Req Location")
                {
                    ApplicationArea = All;
                }
                field("Req. By"; Rec."Req. By")
                {
                    ApplicationArea = All;
                }
                field("Req. By Name"; Rec."Req. By Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Req. Date"; Rec."Req. Date")
                {
                    ApplicationArea = All;
                }                
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Shortage Supplied  Quantity"; Rec."Shortage Supplied  Quantity")
                {
                    ApplicationArea = All;
                }                
                field("Supplier"; Rec."Supplier Name")
                {
                    ApplicationArea = All;
                }
            }
            group("Security and Quality Check")
            {
                Editable = false;
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Rows;
                group(Security)
                {
                    field("Sent to Security"; Rec."Sent to Security")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Check Quantity"; Rec."Security Check Quantity")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Comment"; Rec."Security Comment")
                    {
                        ApplicationArea = All;
                    }
                    field("Security checked"; Rec."Security checked")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Check By"; Rec."Security Check By")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Checked By Name"; Rec."Security Checked By Name")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Check Time"; Rec."Security Check Time")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Returned"; Rec."Security Returned")
                    {
                        ApplicationArea = All;
                    }
                    field("Security Return Quantity"; Rec."Security Return Quantity")
                    {
                        ApplicationArea = All;
                    }
                }
                group("Quality Control")
                {
                    //The GridLayout property is only supported on controls of type Grid

                    field("Sent For QCC"; Rec."Sent For QCC")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Check Quantity"; Rec."QCC Check Quantity")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Comment"; Rec."QCC Comment")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Check"; Rec."QCC Check")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Check  By"; Rec."QCC Check  By")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Check  Name"; Rec."QCC Check  Name")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Check Time"; Rec."QCC Check Time")
                    {
                        ApplicationArea = All;
                    }
                    field("QCC Rejected Quantity"; Rec."QCC Rejected Quantity")
                    {
                        ApplicationArea = All;
                    }

                }
            }
            group("Procurement Manager Action")
            {
                //The GridLayout property is only supported on controls of type Grid
                //GridLayout = Columns;
                field("Supply By"; Rec."Supply By")
                {
                    ApplicationArea = All;
                }
                field("Supplier Name"; Rec."Supplier Name")
                {
                    ApplicationArea = All;
                }
                field("Quantity To Return"; Rec."Quantity To Return")
                {
                    ApplicationArea = All;
                }
                field("Return to Security"; Rec."Return to Security")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }

                field("Send To StoreKeeper"; "Send To StoreKeeper")
                {

                }
                field("Procurement Mgr. Action"; Rec."Procurement Mgr. Action")
                {
                    ApplicationArea = All;
                    Editable = rec."Send To StoreKeeper" <> '';
                }
            }
            group(Pricing)
            {
                Editable = false;
                field("LPrice1 InvoiceNo"; Rec."LPrice1 InvoiceNo")
                {
                    ApplicationArea = All;
                }
                field("LPrice1 Date"; Rec."LPrice1 Date")
                {
                    ApplicationArea = All;
                }
                field("Last Price1"; Rec."Last Price1")
                {
                    ApplicationArea = All;
                }
                field("LPrice2 Invoice No"; Rec."LPrice2 InvoiceNo")
                {
                    ApplicationArea = All;
                }
                field("LPrice2 Date"; Rec."LPrice2 Date")
                {
                    ApplicationArea = All;
                }
                field("Last Price2"; Rec."Last Price2")
                {
                    ApplicationArea = All;
                }
                field("LPrice3 Invoice No"; Rec."LPrice3 InvoiceNo")
                {
                    ApplicationArea = All;
                }
                field("LPrice3 Date"; Rec."LPrice3 Date")
                {
                    ApplicationArea = All;
                }
                field("Last Price3"; Rec."Last Price3")
                {
                    ApplicationArea = All;
                }
            }
            group("Process Action")
            {
                Editable = false;
                field(Process; Rec.Process)
                {
                    ApplicationArea = All;
                }
                field("Process By"; Rec."Process By")
                {
                    ApplicationArea = All;
                }
                field("Process By Name"; Rec."Process By Name")
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Store Manager", UserId);
        Rec.FilterGroup(2);
    end;


}
