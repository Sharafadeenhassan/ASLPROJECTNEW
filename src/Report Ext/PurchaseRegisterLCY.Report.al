report 50019 "Purchase Register(LCY)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PurchaseRegisterLCY.rdlc';
    Caption = 'Purchase Register(LCY)';
    UsageCategory = Lists;
    ApplicationArea = All;
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "Buy-from Vendor No.", "No.", "Posting Date";
            RequestFilterHeading = 'Purchase Invoice Filter';
            column(COMPANYNAME; CompanyName)
            {
            }
            column(USERID; UserId)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(Purch__Inv__Header__GETFILTERS; "Purch. Inv. Header".GetFilters)
            {
            }
            column(AmountCaption; AmountCaption)
            {
            }
            column(AmountCaption_Control1000000005; AmountCaption)
            {
            }
            column(InvAmount; InvAmount)
            {
            }
            column(VatAmount; VatAmount)
            {
            }
            column(InvAmount_Control1000000019; InvAmount)
            {
            }
            column(Location_Code; PurchInvHeader."Location Code")
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Purchase_RegisterCaption; Purchase_RegisterCaptionLbl)
            {
            }
            column(Unit_Cost_LCY_Caption; Unit_Cost_LCY_CaptionLbl)
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(PurchInvHeader__Posting_Date_Caption; PurchInvHeader__Posting_Date_CaptionLbl)
            {
            }
            column(Order_No_Caption; Order_No_CaptionLbl)
            {
            }
            column(Purch__Inv__Line__Unit_of_Measure_Caption; Purch__Inv__Line__Unit_of_Measure_CaptionLbl)
            {
            }
            column(Posted_Invoice_No_Caption; Posted_Invoice_No_CaptionLbl)
            {
            }
            column(Purch__Inv__Line__Location_Code_Caption; "Purch. Inv. Line".FieldCaption("Location Code"))
            {
            }
            column(Vendor_No_Caption; Vendor_No_CaptionLbl)
            {
            }
            column(Vendor_NameCaption; Vendor_NameCaptionLbl)
            {
            }
            column(VatAmount_Control1000000018Caption; VatAmount_Control1000000018CaptionLbl)
            {
            }
            column(PurchInvHeader__Currency_Code_Caption; PurchInvHeader__Currency_Code_CaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Order_No_Caption_Control1000000023; Order_No_Caption_Control1000000023Lbl)
            {
            }
            column(Vendor_No_Caption_Control1000000010; Vendor_No_Caption_Control1000000010Lbl)
            {
            }
            column(Posted_Invoice_No_Caption_Control1000000011; Posted_Invoice_No_Caption_Control1000000011Lbl)
            {
            }
            column(Vendor_NameCaption_Control1000000025; Vendor_NameCaption_Control1000000025Lbl)
            {
            }
            column(PurchInvHeader__Currency_Code__Control1000000037Caption; PurchInvHeader__Currency_Code__Control1000000037CaptionLbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(Grand_TotalCaption; Grand_TotalCaptionLbl)
            {
            }
            column(Purch__Inv__Header_No_; "No.")
            {
            }
            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                RequestFilterFields = Type, "No.";
                column(Purch__Inv__Line__No__; "No.")
                {
                }
                column(Purch__Inv__Line_Description; Description)
                {
                }
                column(UnitCost; UnitCost)
                {
                    DecimalPlaces = 0 : 5;
                }
                column(Purch__Inv__Line_Quantity; Quantity)
                {
                }
                column(InvAmount_Control12; InvAmount)
                {
                }
                column(PurchInvHeader__Posting_Date_; PurchInvHeader."Posting Date")
                {
                }
                column(PurchInvHeader__Order_No__; PurchInvHeader."Order No.")
                {
                }
                column(Purch__Inv__Line__Unit_of_Measure_; "Unit of Measure")
                {
                }
                column(Vendor_Name; VendorName)
                {
                }
                column(Purch__Inv__Line__Document_No__; "Document No.")
                {
                }
                column(Purch__Inv__Line__Location_Code_; "Location Code")
                {
                }
                column(Purch__Inv__Line__Buy_from_Vendor_No__; "Buy-from Vendor No.")
                {
                }
                column(VatAmount_Control1000000018; VatAmount)
                {
                }
                column(PurchInvHeader__Currency_Code_; PurchInvHeader."Currency Code")
                {
                }
                column(InvAmount_Control1000000006; InvAmount)
                {
                }
                column(VatAmount_Control1000000033; VatAmount)
                {
                }
                column(InvAmount_Control1000000014; InvAmount)
                {
                }
                column(PurchInvHeader__Posting_Date__Control1000000015; PurchInvHeader."Posting Date")
                {
                }
                column(PurchInvHeader__Order_No___Control1000000017; PurchInvHeader."Order No.")
                {
                }
                column(Vendor_Name_Control1000000027; Vendor.Name)
                {
                }
                column(Purch__Inv__Line__Buy_from_Vendor_No___Control1000000028; "Buy-from Vendor No.")
                {
                }
                column(Purch__Inv__Line__Document_No___Control1000000026; "Document No.")
                {
                }
                column(PurchInvHeader__Currency_Code__Control1000000037; PurchInvHeader."Currency Code")
                {
                }
                column(Total_for_Vendor_Caption; Total_for_Vendor_CaptionLbl)
                {
                }
                column(Purch__Inv__Line_Line_No_; "Line No.")
                {
                }
                column(Purch__Inv__Line_PostingDate; "Purch. Inv. Line"."Posting Date")
                {
                }
                column(CurrancyCode; CurrancyCode)
                {
                }
                column(OrderNo; OrderNo)
                {
                }
                column(ShowDetails; ShowDetails)
                {
                }
                column(GenBusPstngrup; GenBusPstngrup)
                {
                }
                column(GenPrdtPstngrup; GenPrdtPstngrup)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    UnitCost := 0;

                    if "Purch. Inv. Header"."Currency Code" = '' then begin
                        InvAmount := "Purch. Inv. Line"."Amount Including VAT";
                        UnitCost := "Purch. Inv. Line"."Direct Unit Cost";
                        VatAmount := "Purch. Inv. Line"."Amount Including VAT" - "Purch. Inv. Line".Amount;
                        ;
                        TotQty := TotQty + "Purch. Inv. Line".Quantity;
                    end else begin
                        InvAmount :=
                          CurrencyExchRate.ExchangeAmtFCYToLCY(
                            "Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code",
                            "Purch. Inv. Line"."Amount Including VAT", "Purch. Inv. Header"."Currency Factor");
                        UnitCost :=
                          CurrencyExchRate.ExchangeAmtFCYToLCY(
                            "Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code",
                            "Purch. Inv. Line"."Direct Unit Cost", "Purch. Inv. Header"."Currency Factor");
                        VatAmount :=
                          CurrencyExchRate.ExchangeAmtFCYToLCY(
                            "Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code",
                            ("Purch. Inv. Line"."Amount Including VAT" - "Purch. Inv. Line".Amount), "Purch. Inv. Header"."Currency Factor");
                        DiscAmount :=
                          CurrencyExchRate.ExchangeAmtFCYToLCY(
                            "Purch. Inv. Header"."Posting Date", "Purch. Inv. Header"."Currency Code",
                            "Purch. Inv. Line"."Line Discount Amount", "Purch. Inv. Header"."Currency Factor");
                        TotQty := TotQty + "Purch. Inv. Line".Quantity;
                    end;

                    if Vendor.Get("Purch. Inv. Line"."Buy-from Vendor No.") then
                        VendorName := Vendor.Name;
                    if "Purch. Inv. Header".Get("Purch. Inv. Line"."Document No.") then
                        OrderNo := "Purch. Inv. Header"."Order No.";
                    CurrancyCode := "Purch. Inv. Header"."Currency Code";
                    locationcode := PurchInvHeader."Location Code";
                    GenBusPstngrup := "Purch. Inv. Line"."Gen. Bus. Posting Group";
                    GenPrdtPstngrup := "Purch. Inv. Line"."Gen. Prod. Posting Group";
                end;

                trigger OnPreDataItem()
                begin
                    if ItemFilter <> '' then
                        "Purch. Inv. Line".SetFilter("Purch. Inv. Line"."No.", ItemFilter);
                    CurrReport.CreateTotals(InvAmount, VatAmount);
                end;
            }

            trigger OnPreDataItem()
            begin
                CurrReport.CreateTotals(InvAmount, VatAmount);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Option)
                {
                    field(ShowDetails; ShowDetails)
                    {
                        Caption = 'ShowDetails';
                        ApplicationArea = All;
                    }
                }
            }
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
        if ShowVat then
            AmountCaption := 'Amount Inc. VAT(LCY)'
        else
            AmountCaption := 'Amount(LCY)';
    end;

    var
        PurchInvHeader: Record "Purch. Inv. Header";
        Vendor: Record Vendor;
        CurrencyExchRate: Record "Currency Exchange Rate";
        DiscAmount: Decimal;
        ItemFilter: Code[250];
        TotQty: Decimal;
        UnitCost: Decimal;
        InvAmount: Decimal;
        VatAmount: Decimal;
        ShowDetails: Boolean;
        ShowVat: Boolean;
        AmountCaption: Text[30];
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Purchase_RegisterCaptionLbl: Label 'Purchase Register';
        Unit_Cost_LCY_CaptionLbl: Label 'Unit Cost(LCY)';
        QtyCaptionLbl: Label 'Qty';
        DescriptionCaptionLbl: Label 'Description';
        No_CaptionLbl: Label 'No.';
        PurchInvHeader__Posting_Date_CaptionLbl: Label 'Posting Date';
        Order_No_CaptionLbl: Label 'Order No.';
        Purch__Inv__Line__Unit_of_Measure_CaptionLbl: Label 'UOM';
        Posted_Invoice_No_CaptionLbl: Label 'Posted Invoice No.';
        Vendor_No_CaptionLbl: Label 'Vendor No.';
        Vendor_NameCaptionLbl: Label 'Vendor Name';
        VatAmount_Control1000000018CaptionLbl: Label 'Vat Amount';
        PurchInvHeader__Currency_Code_CaptionLbl: Label 'Currency Code';
        Posting_DateCaptionLbl: Label 'Posting Date';
        Order_No_Caption_Control1000000023Lbl: Label 'Order No.';
        Vendor_No_Caption_Control1000000010Lbl: Label 'Vendor No.';
        Posted_Invoice_No_Caption_Control1000000011Lbl: Label 'Posted Invoice No.';
        Vendor_NameCaption_Control1000000025Lbl: Label 'Vendor Name';
        PurchInvHeader__Currency_Code__Control1000000037CaptionLbl: Label 'Currency Code';
        TotalCaptionLbl: Label 'Total';
        Grand_TotalCaptionLbl: Label 'Grand Total';
        Total_for_Vendor_CaptionLbl: Label 'Total for Vendor:';
        VendorName: Text[50];
        OrderNo: Code[10];
        CurrancyCode: Code[10];
        locationcode: Code[10];
        GenPrdtPstngrup: Code[10];
        GenBusPstngrup: Code[10];
}
