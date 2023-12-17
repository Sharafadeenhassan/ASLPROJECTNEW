page 50029 "Appraisal Entry Subform."
{
    AutoSplitKey = true;
    Caption = 'Appraisal Entry Subform';
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = Card;
    SourceTable = "Sales Line";
    SourceTableView = WHERE("Document Type" = FILTER("Return Order"));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Line No."; Rec."Line No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    Visible = true;
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                        NoOnAfterValidate();
                    end;
                }
                field("Document Type"; Rec."Document Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    BlankZero = true;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        QuantityOnAfterValidate();
                    end;
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Line")
            {
                Caption = '&Line';
                group("Item Availability by")
                {
                    Caption = 'Item Availability by';
                    Visible = false;
                    action(Period)
                    {
                        Caption = 'Period';
                        Visible = true;
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.FORM.*/
                            _ItemAvailability(0);
                        end;
                    }
                    action(Variant)
                    {
                        Caption = 'Variant';
                        Visible = true;
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.FORM.*/
                            _ItemAvailability(1);
                        end;
                    }
                    action(Location)
                    {
                        Caption = 'Location';
                        Visible = true;
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.FORM.*/
                            _ItemAvailability(2);
                        end;
                    }
                }
                action("Reservation Entries")
                {
                    Caption = 'Reservation Entries';
                    Image = ReservationLedger;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _ShowReservationEntries();
                    end;
                }
                action("Select Item Substitution")
                {
                    Caption = 'Select Item Substitution';
                    Image = SelectItemSubstitution;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _ShowItemSub();
                    end;
                }
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _ShowDimensions();
                    end;
                }
                action("Item Charge &Assignment")
                {
                    Caption = 'Item Charge &Assignment';
                    Ellipsis = true;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ItemChargeAssgnt();
                    end;
                }
                action("Item &Tracking Lines")
                {
                    Caption = 'Item &Tracking Lines';
                    Image = ItemTrackingLines;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _OpenItemTrackingLines();
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("Calculate &Invoice Discount")
                {
                    Caption = 'Calculate &Invoice Discount';
                    Enabled = true;
                    Image = CalculateInvoiceDiscount;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ApproveCalcInvDisc();
                    end;
                }
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';
                    Enabled = true;
                    Image = ExplodeBOM;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ExplodeBOM();
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _InsertExtendedText(true);
                    end;
                }
                group("Drop Shipment")
                {
                    Caption = 'Drop Shipment';
                    Enabled = false;
                    Visible = false;
                    action("Purchase &Order")
                    {
                        Caption = 'Purchase &Order';
                        Enabled = true;
                        Image = Document;
                        Visible = true;
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.FORM.*/
                            OpenPurchOrderForm();
                        end;
                    }
                }
                group("Special Order")
                {
                    Caption = 'Special Order';
                    Enabled = false;
                    Visible = false;
                    action(Action1902819104)
                    {
                        Caption = 'Purchase &Order';
                        Image = Document;
                        Visible = true;
                        ApplicationArea = All;

                        trigger OnAction()
                        begin
                            //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                            /*CurrPage.SalesLines.FORM.*/
                            OpenPurchOrderForm();
                        end;
                    }
                }
                action("&Reserve")
                {
                    Caption = '&Reserve';
                    Ellipsis = true;
                    Enabled = true;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        _ShowReservation();
                    end;
                }
                action("Order &Tracking")
                {
                    Caption = 'Order &Tracking';
                    Enabled = true;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //This functionality was copied from page #50028. Unsupported part was commented. Please check it.
                        /*CurrPage.SalesLines.FORM.*/
                        ShowTracking();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := xRec.Type;
        Clear(ShortcutDimCode);
    end;

    var
        TransferExtendedText: Codeunit "Transfer Extended Text";
        ShortcutDimCode: array[8] of Code[20];

    [Scope('OnPrem')]
    procedure _InsertExtendedText(Unconditionally: Boolean)
    begin
        if TransferExtendedText.SalesCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord();
            TransferExtendedText.InsertSalesExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate() then
            UpdateForm(true);
    end;

    [Scope('OnPrem')]
    procedure _ItemAvailability(AvailabilityType: Option Date,Variant,Location,Bin)
    begin
        ItemAvailability(AvailabilityType);
    end;

    [Scope('OnPrem')]
    procedure _OpenItemTrackingLines()
    begin
        Rec.OpenItemTrackingLines();
    end;

    [Scope('OnPrem')]
    procedure _ShowDimensions()
    begin
        Rec.ShowDimensions();
    end;

    [Scope('OnPrem')]
    procedure _ShowItemSub()
    begin
        Rec.ShowItemSub();
    end;

    [Scope('OnPrem')]
    procedure _ShowReservation()
    begin
        Rec.Find();
        Rec.ShowReservation();
    end;

    [Scope('OnPrem')]
    procedure _ShowReservationEntries()
    begin
        Rec.ShowReservationEntries(true);
    end;

    [Scope('OnPrem')]
    procedure ApproveCalcInvDisc()
    begin
        CODEUNIT.Run(CODEUNIT::"Sales-Disc. (Yes/No)", Rec);
    end;

    [Scope('OnPrem')]
    procedure CalcInvDisc()
    begin
        CODEUNIT.Run(CODEUNIT::"Sales-Calc. Discount", Rec);
    end;

    [Scope('OnPrem')]
    procedure ExplodeBOM()
    begin
        CODEUNIT.Run(CODEUNIT::"Sales-Explode BOM", Rec);
    end;

    [Scope('OnPrem')]
    procedure InsertExtendedText(Unconditionally: Boolean)
    begin
        if TransferExtendedText.SalesCheckIfAnyExtText(Rec, Unconditionally) then begin
            CurrPage.SaveRecord();
            TransferExtendedText.InsertSalesExtText(Rec);
        end;
        if TransferExtendedText.MakeUpdate() then
            UpdateForm(true);
    end;

    [Scope('OnPrem')]
    procedure ItemAvailability(AvailabilityType: Option Date,Variant,Location,Bin)
    begin
        ItemAvailability(AvailabilityType);
    end;

    [Scope('OnPrem')]
    procedure ItemChargeAssgnt()
    begin
        Rec.ShowItemChargeAssgnt();
    end;

    [Scope('OnPrem')]
    procedure OpenItemTrackingLines()
    begin
        Rec.OpenItemTrackingLines();
    end;

    [Scope('OnPrem')]
    procedure OpenPurchOrderForm()
    var
        PurchHeader: Record "Purchase Header";
        PurchOrder: Page "Purchase Order";
    begin
        PurchHeader.SetRange("No.", Rec."Purchase Order No.");
        PurchOrder.SetTableView(PurchHeader);
        PurchOrder.Editable := false;
        PurchOrder.Run();
    end;

    [Scope('OnPrem')]
    procedure ShowDimensions()
    begin
        Rec.ShowDimensions();
    end;

    [Scope('OnPrem')]
    procedure ShowItemSub()
    begin
        Rec.ShowItemSub();
    end;

    [Scope('OnPrem')]
    procedure ShowNonstockItems()
    begin
        Rec.ShowNonstock();
    end;

    /// <summary>
    /// ShowReservation.
    /// </summary>
    [Scope('OnPrem')]
    procedure ShowReservation()
    begin
        OnBeforeShowReservation();

        Rec.Find();
        Rec.ShowReservation();

        OnAfterShowReservation(Rec);
    end;

    [Scope('OnPrem')]
    procedure ShowReservationEntries()
    begin
        Rec.ShowReservationEntries(true);
    end;

    [Scope('OnPrem')]
    procedure ShowTracking()
    var
        TrackingPage: Page "Order Tracking";
    begin
        TrackingPage.SetSalesLine(Rec);
        TrackingPage.RunModal();
    end;

    [Scope('OnPrem')]
    procedure UpdateForm(SetSaveRecord: Boolean)
    begin
        CurrPage.Update(SetSaveRecord);
    end;

    local procedure NoOnAfterValidate()
    begin
        InsertExtendedText(false);
        if (Rec.Type = Rec.Type::"Charge (Item)") and (Rec."No." <> xRec."No.") and
           (xRec."No." <> '')
        then
            CurrPage.SaveRecord();
    end;

    local procedure QuantityOnAfterValidate()
    begin
        if Rec.Reserve = Rec.Reserve::Always then begin
            CurrPage.SaveRecord();
            Rec.AutoReserve();
            CurrPage.Update(false);
        end;
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterShowReservation(var Rec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnBeforeShowReservation()
    begin
    end;
}
