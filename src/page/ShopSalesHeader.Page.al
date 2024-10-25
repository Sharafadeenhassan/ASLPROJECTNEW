page 50088 "Shop Sales Header"
{
    Caption = 'Fish Shop Sales';
    PageType = Document;
    SourceTable = ShopHeader;
    UsageCategory = Documents;
    ApplicationArea = All;
    DataCaptionFields = "Shop Code", "Invoice No.", "Amount Due";
    //DelayedInsert = true;

    layout
    {

        area(Content)
        {
            group(General)
            {
                Editable = rec.Post = false;
                Caption = 'General';

                field("ShopCode"; Rec."Shop Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shop Code field.', Comment = '%';
                }
                field("Terminal No."; rec."Terminal No.")
                {
                    ApplicationArea = All;
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice/Receipt No. field.', Comment = '%';
                    Importance = Promoted;
                    Editable = false;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;

                }
                field("Cashier Code"; Rec."Cashier Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Posting date"; Rec."Posting date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting date field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    Editable = (rec.PayMode = 4);
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; rec."Customer Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                grid("Account Detail")
                {
                    GridLayout = Rows;

                    group(Account)
                    {
                        Editable = false;
                        field("Invoice Total"; Rec."Invoice Total")
                        {
                            ApplicationArea = All;
                            Importance = Promoted;
                            ToolTip = 'Specifies the value of the Invoice Total field.', Comment = '%';
                        }
                        field("Discount Amount"; Rec."Discount Amount")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Discount Amount field.', Comment = '%';
                            Importance = Additional;
                        }
                    }
                }
            }
            group("Payment Schedule")
            {
                group(Payments)
                {
                    Editable = rec.Post = false;

                    field(PayMode; Rec.PayMode)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the PayMode field.', Comment = '%';
                        trigger OnValidate()

                        begin
                            case PayMode OF
                                0:
                                    begin
                                        CashPay := true;
                                        TraPay := false;
                                        ValPay := false;
                                    end;
                                1:
                                    begin
                                        CashPay := false;
                                        TraPay := true;
                                        ValPay := false;
                                    end;
                                2:
                                    begin
                                        CashPay := false;
                                        TraPay := false;
                                        ValPay := true;
                                    end;
                                3:
                                    begin
                                        CashPay := true;
                                        TraPay := true;
                                        ValPay := true;
                                    end;
                                4:
                                    begin
                                        CashPay := false;
                                        TraPay := false;
                                        ValPay := false;
                                    end;
                            end;
                        end;
                    }
                    field("General Device"; Rec."General Device")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the General Device field.', Comment = '%';
                    }
                    field("Amount Due"; Rec."Amount Due")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Amount Due field.', Comment = '%';
                        Importance = Promoted;
                        Style = Unfavorable;
                        StyleExpr = (rec."Amount Paid" < rec."Amount Due");
                    }
                    field("Amount Paid"; Rec."Amount Paid")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Amount Paid field.', Comment = '%';
                        Editable = false;
                        Importance = Promoted;
                        Style = Favorable;
                        StyleExpr = rec."Cash Change" >= 0;

                    }
                }
                group("Posted Details")
                {
                    Editable = false;
                    Visible = rec.Post;

                    field("Document No."; rec."Document No.")
                    {
                        Caption = 'Posted Invoice No';
                        ApplicationArea = all;
                    }
                    field("Payment Ref"; rec."Payment Ref")
                    {
                        ApplicationArea = All;
                        Caption = 'Payment Receipt No.';
                    }
                    field("Cancel No."; rec."Cancel No.")
                    {
                        Caption = 'Posted Credit Memo';
                        Visible = Rec.Cancelled;
                    }
                    field("Payment Refund"; rec."Payment Refund")
                    {
                        ApplicationArea = All;
                        Caption = 'Payment Reversed No.';
                        Visible = rec.Cancelled;
                    }

                }
            }
            part("Shop Sale Line"; "Shop Sales Sub")
            {
                SubPageLink = Code = field("Shop Code"), "Invoice No." = field("Invoice No.");
                ApplicationArea = All;
                UpdatePropagation = both;
                Editable = rec.Post = false;
            }
            field("Invoice Amount"; rec."Invoice Total")
            {
                StyleExpr = true;
                Style = Attention;
                Importance = Promoted;
            }
            field("Cash Change"; Rec."Cash Change")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cash Change field.', Comment = '%';
                Visible = CashPay;
                Importance = Additional;
                Style = Unfavorable;
                StyleExpr = rec."Cash Change" <> 0;
            }
            field("Amount To Paid"; rec.Paid)
            {
                Caption = 'How Much Total';
                Importance = Promoted;
            }
            group("Pay Details")
            {
                Visible = rec.PayMode <> 4;
                grid(Pay)
                {
                    GridLayout = Rows;
                    group(Cash)
                    {
                        Visible = CashPay;
                        field("Cash Device"; Rec."Cash Device")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Cash Device field.', Comment = '%';
                        }
                        field("Cash Pay"; Rec."Cash Pay")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Cash Pay field.', Comment = '%';
                        }
                    }
                    group(Transfer)
                    {
                        Visible = TraPay;
                        field("Transfer Device"; Rec."Transfer Device")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Transfer Device field.', Comment = '%';
                            trigger OnValidate()
                            begin
                                CurrPage.Update(true);
                            end;
                        }
                        field("Transfer Pay"; Rec."Transfer Pay")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Transfer Pay field.', Comment = '%';
                            trigger OnValidate()
                            begin
                                CurrPage.Update(true);
                            end;
                        }
                    }
                    group(Value)
                    {
                        Visible = ValPay;
                        field("Value device"; Rec."Value device")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Value device field.', Comment = '%';
                        }
                        field("Value card"; Rec."Value card")
                        {
                            ApplicationArea = All;
                            ToolTip = 'Specifies the value of the Value card field.', Comment = '%';
                            trigger OnValidate()
                            begin
                                CurrPage.Update(true);
                            end;
                        }
                    }

                }
            }
            group(Process)
            {
                field(Paid; rec.Paid)
                {
                    ApplicationArea = All;
                    Editable = rec.Post = false; 
                }
                field(Post; rec.Post)
                {
                    ApplicationArea = All;
                    Editable = rec.Suspended = false;
                }
                field(Suspended; rec.Suspended)
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Suspended By"; rec."Suspended By")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                    Editable = Cancelled = false;
                }
                field(Cancelled; rec.Cancelled)
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
                field("Cancelled By"; rec."Cancelled By")
                {
                    ApplicationArea = All;
                    Importance = Additional;
                }
            }

        }
    }
    actions
    {
        area(Reporting)
        {
            action("Print Invoice")
            {
                trigger OnAction()
                var PSales: Record "Sales Invoice Header";
                    FSaleInv: Report "FishShopSales - Invoice";
                begin
                    rec.TestField(rec."Document No.");
                    rec.TestField(rec.Suspended,false);                    
                    if PSales.get(rec."Document No.") then                    
                    begin 
                    PSales.SetRecFilter();
                    FSaleInv.SetTableView(PSales);
                    FSaleInv.UseRequestPage(true);
                    FSaleInv.run();
                    end;       
                end;
            }
        }
        area(Processing)
        {
            action("Sales Post Update")
            {
                trigger OnAction()
                begin
                    Rec.UpdatePostedIncomplete();
                end;
            }
        }
    }
    var
        CashPay: Boolean;
        TraPay: Boolean;
        ValPay: Boolean;
        UserRec: Record "User Setup";


     trigger OnOpenPage()
     begin
         CashPay := true;
         TraPay := true;
         ValPay := true;
     end;

 trigger OnAfterGetCurrRecord()
 //trigger OnNextRecord(Steps: Integer): Integer
    begin
        //Steps := 1;
        Case rec.PayMode of
            0:
                begin
                    CashPay := true;
                    TraPay := false;
                    ValPay := false;
                end;
            1:
                begin
                    TraPay := true;
                    CashPay := false;
                    ValPay := false;
                end;
            2:
                begin
                    CashPay := false;
                    TraPay := false;
                    ValPay := true;
                end;
            3:
                begin
                    CashPay := true;
                    TraPay := true;
                    ValPay := true;
                end;
            4:
                if rec."Credit Cash" then begin
                    ValPay := true;
                    CashPay := true;
                    TraPay := true;
                end else begin
                    CashPay := false;
                    TraPay := false;
                    ValPay := false;
                end;
        End;
        //exit(Steps);
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    //trigger OnNewRecord(BelowxRec: Boolean)
    begin
        BelowxRec := true;
         UserRec.get(UserId);
        //if xRec."Shop Code" <> '' then begin
        Rec.Validate("Shop Code", UserRec."Fish Shop Code");
        Rec.Validate("Terminal No.", UserRec."Fish Shop Terminal");
        // end;
        Rec.Validate(PayMode, PayMode::Cash);
        CashPay := true;
        // Rec.Insert(true);
        //CurrPage.Update(true);
        exit(BelowxRec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        UserRec.get(UserId);
        //if xRec."Shop Code" <> '' then begin
        Rec.Validate("Shop Code", UserRec."Fish Shop Code");
        Rec.Validate("Terminal No.", UserRec."Fish Shop Terminal");
    end;

}
