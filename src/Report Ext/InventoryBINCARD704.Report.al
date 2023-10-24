report 50136 "Inventory - BINCARD 704"
{
    // Item."Unit Cost"
    // "Print Bin Card"
    // //
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/InventoryBINCARD704.rdlc';
    Caption = 'Inventory - Bincard Detail';
    Permissions = TableData "Sales Shipment Header" = rimd;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;

    dataset
    {
        dataitem(Item; Item)
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.", Description, "Assembly BOM", "Inventory Posting Group", "Shelf No.", "Statistics Group", "Date Filter", "Location Filter";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(STRSUBSTNO_Text000_ItemDateFilter_; StrSubstNo(Text000, ItemDateFilter))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(STRSUBSTNO___1___2__Item_TABLECAPTION_ItemFilter_; StrSubstNo('%1: %2', Item.TableCaption, ItemFilter))
            {
            }
            column(Item_Item__Unit_Cost_; Item."Unit Cost")
            {
            }
            column(Item_Item_Description; Item.Description)
            {
            }
            column(Item_Item__No__; Item."No.")
            {
            }
            column(Item_Item__Inventory_Posting_Group_; Item."Inventory Posting Group")
            {
            }
            column(Inventory___Transaction_DetailCaption; Inventory___Transaction_DetailCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Unit_CostCaption; Unit_CostCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Posting_Date_Caption; "Item Ledger Entry".FieldCaption("Posting Date"))
            {
            }
            column(TransToCaption; TransToCaptionLbl)
            {
            }
            column(TransFrCaption; TransFrCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Entry_No__Caption; "Item Ledger Entry".FieldCaption("Entry No."))
            {
            }
            column(ItemOnHandCaption; ItemOnHandCaptionLbl)
            {
            }
            column(DecreasesQtyCaption; DecreasesQtyCaptionLbl)
            {
            }
            column(IncreasesQtyCaption; IncreasesQtyCaptionLbl)
            {
            }
            column(Item_Ledger_Entry__Document_No__Caption; "Item Ledger Entry".FieldCaption("Document No."))
            {
            }
            column(Item_Ledger_Entry__Entry_Type_Caption; Item_Ledger_Entry__Entry_Type_CaptionLbl)
            {
            }
            column(Item_Variant_Filter; "Variant Filter")
            {
            }
            column(Item_Date_Filter; "Date Filter")
            {
            }
            column(Item_Location_Filter; "Location Filter")
            {
            }
            column(Item_Global_Dimension_1_Filter; "Global Dimension 1 Filter")
            {
            }
            column(Item_Global_Dimension_2_Filter; "Global Dimension 2 Filter")
            {
            }
            dataitem(PageCounter; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(Item__No__; Item."No.")
                {
                }
                column(Item_Description; Item.Description)
                {
                }
                column(Item__Unit_Cost_; Item."Unit Cost")
                {
                }
                column(StartOnHand; StartOnHand)
                {
                }
                column(Unit_CostCaption_Control1000000001; Unit_CostCaption_Control1000000001Lbl)
                {
                }
                column(PageCounter_Number; Number)
                {
                }
                column(RecordNo; RecordNo)
                {
                }
                dataitem("Item Ledger Entry"; "Item Ledger Entry")
                {
                    DataItemLink = "Item No." = FIELD("No."), "Variant Code" = FIELD("Variant Filter"), "Posting Date" = FIELD("Date Filter"), "Location Code" = FIELD("Location Filter"), "Global Dimension 1 Code" = FIELD("Global Dimension 1 Filter"), "Global Dimension 2 Code" = FIELD("Global Dimension 2 Filter");
                    DataItemLinkReference = Item;
                    DataItemTableView = SORTING("Item No.", "Variant Code", "Drop Shipment", "Location Code", "Posting Date") WHERE("Transport Method" = FILTER(<> '10'));
                    column(StartOnHand___Quantity; StartOnHand + Quantity)
                    {
                    }
                    column(Item_Ledger_Entry__Posting_Date_; "Posting Date")
                    {
                    }
                    column(Item_Ledger_Entry__Entry_Type_; "Entry Type")
                    {
                    }
                    column(Item_Ledger_Entry__Document_No__; "Document No.")
                    {
                    }
                    column(IssueNo; IssueNo)
                    {
                    }
                    column(IncreasesQty; IncreasesQty)
                    {
                    }
                    column(DecreasesQty; DecreasesQty)
                    {
                    }
                    column(ItemOnHand; ItemOnHand)
                    {
                    }
                    column(Item_Ledger_Entry__Entry_No__; "Entry No.")
                    {
                    }
                    column(TransFr; TransFr)
                    {
                    }
                    column(TransTo; TransTo)
                    {
                    }
                    column(StartOnHand___Quantity_Control31; StartOnHand + Quantity)
                    {
                    }
                    column(Item_Description_Control32; Item.Description)
                    {
                    }
                    Column(Requisition_No; IssueNo)
                    {
                    }
                    column(IncreasesQty_Control33; IncreasesQty)
                    {
                    }
                    column(DecreasesQty_Control34; DecreasesQty)
                    {
                    }
                    column(StartOnHand___Quantity_Control35; StartOnHand + Quantity)
                    {
                    }
                    Column(RequisitionNo; IssueNo)
                    {
                    }
                    column(DecreasesQty_Control1000000044; DecreasesQty)
                    {
                    }
                    column(IncreasesQty_Control1000000045; IncreasesQty)
                    {
                    }
                    column(Item_Description_Control1000000046; Item.Description)
                    {
                    }
                    column(ContinuedCaption; ContinuedCaptionLbl)
                    {
                    }
                    column(ContinuedCaption_Control30; ContinuedCaption_Control30Lbl)
                    {
                    }
                    column(Item_Ledger_Entry_Item_No_; "Item No.")
                    {
                    }
                    column(Item_Ledger_Entry_Variant_Code; "Variant Code")
                    {
                    }
                    column(Item_Ledger_Entry_Location_Code; "Location Code")
                    {
                    }
                    column(Item_Ledger_Entry_Global_Dimension_1_Code; "Global Dimension 1 Code")
                    {
                    }
                    column(Item_Ledger_Entry_Global_Dimension_2_Code; "Global Dimension 2 Code")
                    {
                    }
                   Column(PrintBin;"Print Bin Card")
                   {                    
                   }
                   column(HandQty;HandQty)
                   {}
                    column(ReqNo; IssueNo)
                    {
                    }

                    trigger OnAfterGetRecord()
                    var
                        
                    // IssueNo: Text[30];
                    begin
                        CurrReport.CreateTotals(Quantity, IncreasesQty, DecreasesQty);
                        HandQty := 0;
                        if "Print Bin Card" then begin
                            ItLentry.CopyFilters("Item Ledger Entry");
                            if ItLentry.Find('+') then
                                LastrecEntNo := ItLentry."Entry No.";
                            ItLentry.Next(-2);
                            SetRange("Entry No.", ItLentry."Entry No.", LastrecEntNo);
                        end;
                        "Item Ledger Entry".SETFILTER("Posting Date", ItemDateFilter);

                        IF InvtSetUp.GET() THEN;
                        TransTo := '';
                        TransFr := '';
                        //g_EntryFound := FALSE;
                        CASE "Entry Type" OF
                            0, 2:
                                BEGIN
                                    TransTo := InvtSetUp."Default Store";
                                    TransFr := "External Document No.";
                                END;
                            1, 3:
                                BEGIN
                                    TransTo := "External Document No.";
                                    TransFr := InvtSetUp."Default Store";//negative adjustment and sales
                                END;
                            4:

                                IF TransShip.GET("Document No.") THEN BEGIN
                                    TransTo := TransShip."Transfer-to Code";
                                    TransFr := TransShip."Transfer-from Code";
                                    IssueNo := TransShip."Transfer Order No.";
                                end;
                        end;
                        PurchRec.SETRANGE(PurchRec."No.", "Document No.");
                        IF PurchRec.FINDFIRST() THEN BEGIN
                            TransFr := PurchRec."Buy-from Vendor No.";
                            IssueNo := PurchRec."Order No.";
                        END;
                        SalesShi.SETRANGE(SalesShi."No.", "Document No.");
                        IF SalesShi.FINDFIRST() THEN BEGIN
                            TransTo := SalesShi."Sell-to Customer No.";
                            IssueNo := SalesShi."Order No.";
                        end;
                        ItemOnHand := ItemOnHand + Quantity;
                        IF Quantity > 0 THEN begin
                            IncreasesQty := Quantity;
                            DecreasesQty := 0;
                        end
                        ELSE begin
                            DecreasesQty := ABS(Quantity);
                            IncreasesQty := 0;
                        end;
                        HandQty := HandQty + "Item Ledger Entry".Quantity + StartOnHand;
                    end;

                    trigger OnPreDataItem()
                    begin
                        CurrReport.CreateTotals(Quantity, IncreasesQty, DecreasesQty);
                        HandQty := 0;
                    end;
                }
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 .. 35));
                column(Integer_Number; Number)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                StartOnHand := 0;
                if ItemDateFilter <> '' then
                    if GetRangeMin("Date Filter") > 00000101D then begin
                        SetRange("Date Filter", 0D, GetRangeMin("Date Filter") - 1);
                        CalcFields("Net Change");
                        StartOnHand := "Net Change";
                        SetFilter("Date Filter", ItemDateFilter);
                    end;
                ItemOnHand := StartOnHand;
                if PrintOnlyOnePerPage then
                    RecordNo := RecordNo + 1;
            end;

            trigger OnPreDataItem()
            begin
                CurrReport.NewPagePerRecord := PrintOnlyOnePerPage;
                RecordNo := 1;
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        ItemFilter := Item.GetFilters;
        ItemDateFilter := Item.GetFilter("Date Filter");
    end;

    var
        Text000: Label 'Period: %1';
        ItemFilter: Text[250];
        ItemDateFilter: Text[30];
        ItemOnHand: Decimal;
        StartOnHand: Decimal;
        IncreasesQty: Decimal;
        DecreasesQty: Decimal;
        RecordNo: Integer;
        PrintOnlyOnePerPage: Boolean;
        TransShip: Record "Transfer Shipment Header";
        InvtSetUp: Record "Inventory Setup";
        PurchRec: Record "Purch. Rcpt. Header";
        SalesShi: Record "Sales Shipment Header";
        ItLentry: Record "Item Ledger Entry";
        TransTo: Text[30];
        TransFr: Text[30];
        LastrecEntNo: Integer;
        "Print Bin Card": Boolean;
        Inventory___Transaction_DetailCaptionLbl: Label 'Inventory - Transaction Detail';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Unit_CostCaptionLbl: Label 'Unit Cost';
        TransToCaptionLbl: Label 'Transfer To';
        TransFrCaptionLbl: Label 'Transfer From';
        ItemOnHandCaptionLbl: Label 'Inventory';
        DecreasesQtyCaptionLbl: Label 'Decreases';
        IncreasesQtyCaptionLbl: Label 'Increases';
        Item_Ledger_Entry__Entry_Type_CaptionLbl: Label 'Entry Type';
        Unit_CostCaption_Control1000000001Lbl: Label 'Unit Cost';
        ContinuedCaptionLbl: Label 'Continued';
        ContinuedCaption_Control30Lbl: Label 'Continued';
        HandQty: Decimal;
        IssueNo: Text[30];
}
