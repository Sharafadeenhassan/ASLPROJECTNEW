report 50251 "Container By Mth Shipment New"
{
    // LastFieldNo := FIELDNO(Category);
    // "Sales Shipment Header".GETFILTERS
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/ContainerByMonthShipment1.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Container By Month Shipment';
    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = SORTING("Shipment Month", "Order No.") WHERE("Currency Code" = FILTER(<> ''));
            RequestFilterFields = "Shipment Month", "Order No.", "Shipment Date";
            column(SelltoCustomerNo; "Sales Shipment Header"."Sell-to Customer No.")
            {
            }
            column(Billtoname; "Sales Shipment Header"."Bill-to Name")
            {
            }
            column(Order_No; "Sales Shipment Header"."Order No.")
            {
            }
            column(TL; 1)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(USERID; UserId)
            {
            }
            column(Sales_Shipment_Header__GETFILTERS; "Sales Shipment Header".GetFilters)
            {
            }

            // CatRange names (use safe getters)
            column(CatRange_1_; GetCatRange(1))
            {
            }
            column(CatRange_2_; GetCatRange(2))
            {
            }
            column(CatRange_3_; GetCatRange(3))
            {
            }
            column(CatRange_4_; GetCatRange(4))
            {
            }
            column(CatRange_5_; GetCatRange(5))
            {
            }
            column(CatRange_6_; GetCatRange(6))
            {
            }
            column(CatRange_7_; GetCatRange(7))
            {
            }
            column(CatRange_8_; GetCatRange(8))
            {
            }
            column(CatRange_9_; GetCatRange(9))
            {
            }
            column(CatRange_10_; GetCatRange(10))
            {
            }
            column(CatRange_11_; GetCatRange(11))
            {
            }
            column(CatRange_12_; GetCatRange(12))
            {
            }

            // Add alias names that some RDLCs reference (CatRanger_*) — map to getters
            
            column(Sales_Shipment_Header__Shipment_Month_; "Shipment Month")
            {
            }
            column(Sales_Shipment_Header__Order_No__; "Order No.")
            {
            }
            column(Sales_Shipment_Header__Order_No___Control1000000014; "Order No.")
            {
            }
            column(Sales_Shipment_Header__Shipped_Quantity_; "Shipped Quantity")
            {
            }
            column(Sales_Shipment_Header__Shipped_Quantity__Control1000000020; "Shipped Quantity")
            {
            }
            column(Sales_Shipment_Header__Order_No___Control1000000000; "Order No.")
            {
            }

            // CatRangeQ columns -> getters
            column(CatRangeQ_1_; GetCatRangeQ(1))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_2_; GetCatRangeQ(2))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_3_; GetCatRangeQ(3))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_4_; GetCatRangeQ(4))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_5_; GetCatRangeQ(5))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_6_; GetCatRangeQ(6))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_7_; GetCatRangeQ(7))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_8_; GetCatRangeQ(8))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_9_; GetCatRangeQ(9))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_10_; GetCatRangeQ(10))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_11_; GetCatRangeQ(11))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_12_; GetCatRangeQ(12))
            {
                DecimalPlaces = 0 : 0;
            }

            //
            //
            column(TotalFor; TotalFor)
            {
            }
            column(Sales_Shipment_Header__Shipped_Quantity__Control1000000022; "Shipped Quantity")
            {
            }

            // control variants -> getters
            column(CatRangeQ_1__Control1000000044; GetCatRangeQ(1))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_2__Control1000000045; GetCatRangeQ(2))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_3__Control1000000046; GetCatRangeQ(3))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_4__Control1000000047; GetCatRangeQ(4))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_5__Control1000000048; GetCatRangeQ(5))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_6__Control1000000049; GetCatRangeQ(6))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_7__Control1000000050; GetCatRangeQ(7))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_8__Control1000000051; GetCatRangeQ(8))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_9__Control1000000052; GetCatRangeQ(9))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_10__Control1000000053; GetCatRangeQ(10))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_11__Control1000000054; GetCatRangeQ(11))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_12__Control1000000055; GetCatRangeQ(12))
            {
                DecimalPlaces = 0 : 0;
            }
            //
            //
            column(Sales_Shipment_Header__Shipped_Quantity__Control1000000007; "Shipped Quantity")
            {
            }
            column(GrdTot; GrdTot)
            {
            }

            column(CatRangeQ_1__Control1000000058; GetCatRangeQ(1))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_2__Control1000000060; GetCatRangeQ(2))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_3__Control1000000061; GetCatRangeQ(3))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_4__Control1000000062; GetCatRangeQ(4))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_5__Control1000000063; GetCatRangeQ(5))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_6__Control1000000064; GetCatRangeQ(6))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_7__Control1000000065; GetCatRangeQ(7))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_8__Control1000000066; GetCatRangeQ(8))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_9__Control1000000067; GetCatRangeQ(9))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_10__Control1000000068; GetCatRangeQ(10))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_11__Control1000000069; GetCatRangeQ(11))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeQ_12__Control1000000070; GetCatRangeQ(12))
            {
                DecimalPlaces = 0 : 0;
            }
            //
            //
            column(Export_Order_StatisticCaption; Export_Order_StatisticCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Sales_Shipment_Header__Order_No___Control1000000014Caption; FieldCaption("Order No."))
            {
            }
            column(Sales_Shipment_Header__Shipped_Quantity_Caption; FieldCaption("Shipped Quantity"))
            {
            }
            column(Sales_Shipment_Header__Shipment_Month_Caption; FieldCaption("Shipment Month"))
            {
            }
            column(Sales_Shipment_Header__Order_No__Caption; FieldCaption("Order No."))
            {
            }
            column(Sales_Shipment_Header_No_; "No.")
            {
            }
            column(BillTo_CustomerNo; "Sales Shipment Header"."Bill-to Customer No.")
            {
            }
            column(BillTo_Name; "Sales Shipment Header"."Bill-to Name")
            {
            }

            trigger OnAfterGetRecord()
            var  idx: Integer;
            begin
                Level := TotLoc;
                //repeat
                if Level > 25 then
                    Level := 25; // clamp to array size

                if Level >= 1 then begin
                    for idx := Level downto 1 do begin
                        SetFilter("Item Category Code filter", CatRange[idx]);
                        CalcFields("Shipped Quantity");
                        SCMhead.SetFilter(SCMhead."Shipment Date", "Sales Shipment Header".GetFilter("Sales Shipment Header"."Shipment Date"));
                        SCMhead.SetFilter(SCMhead."Item Category Code filter", '%1', CatRange[idx]);
                        SCMhead.CalcFields(SCMhead."Return Quantity");
                        CatRangeQ[idx] := "Shipped Quantity";
                        CatRangeR[idx] := SCMhead."Return Quantity";
                    end;
                end;

                SetFilter("Item Category Code filter", '');
                CalcFields("Shipped Quantity");
                SCMhead.SetFilter(SCMhead."Item Category Code filter", '');
                SCMhead.CalcFields(SCMhead."Return Quantity");
            end;

            trigger OnPreDataItem()
            var idx: Integer;
            begin
                LastFieldNo := FieldNo("Order No.");
                //AAA - June 2004
                ItCat.SetCurrentKey(ItCat."No.");
                ItCat.SetRange(ItCat.Type, 0);
                ItCat.SetFilter(ItCat."Date Filter", "Sales Shipment Header".GetFilter("Sales Shipment Header"."Shipment Date"));
                ItCat.CalcFields(ItCat."Shipped Quantity");
                ItCat.CalcFields(ItCat."Return Quantity");
                ItCat.SetFilter(ItCat."Shipped Quantity", '>%1', 0);
                ItCat.SetFilter(ItCat."Return Quantity", '>0');

                TotLoc := 0;
                Countx := 1;
                for idx := 1 to 25 do begin
                    CatRange[idx] := '';
                    CatRangeQ[idx] := 0;
                    CatRangeR[idx] := 0;
                end;

                if ItCat.Find('-') then begin
                    repeat
                        if Countx > 25 then
                            break;
                        CatRange[Countx] := ItCat.Code;
                        Countx := Countx + 1;
                    until ItCat.Next() = 0;
                    TotLoc := Countx - 1; // actual number of categories stored
                end;
            end;
        }
        dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
        {
            DataItemTableView = SORTING("Shipment Date") WHERE("Currency Code" = FILTER(<> ''));
            RequestFilterFields = "Posting Date", "Item Category Code filter", "Shipment Date";

            column(Sales_Cr_Header_No__; "No.")
            {
            }
            column(Sales_Cr_Header_No___Control1000000014; "No.")
            {
            }
            column(Sales_Cr_Header__Return_Quantity_; "Return Quantity")
            {
            }
            column(Sales_Cr_Header__Return_Quantity__Control1000000020; "Return Quantity")
            {
            }
            column(Sales_Cr_Header_No_Control1000000000; "No.")
            {
            }

            // CatRangeR columns -> getters
            column(CatRangeR_1_; GetCatRangeR(1))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_2_; GetCatRangeR(2))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_3_; GetCatRangeR(3))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_4_; GetCatRangeR(4))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_5_; GetCatRangeR(5))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_6_; GetCatRangeR(6))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_7_; GetCatRangeR(7))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_8_; GetCatRangeR(8))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_9_; GetCatRangeR(9))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_10_; GetCatRangeR(10))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_11_; GetCatRangeR(11))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangeR_12_; GetCatRangeR(12))
            {
                DecimalPlaces = 0 : 0;
            }

            // CatRangerR aliases (RDLC may reference these)
            column(CatRangerR_1_; GetCatRangeR(1))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_2_; GetCatRangeR(2))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_3_; GetCatRangeR(3))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_4_; GetCatRangeR(4))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_5_; GetCatRangeR(5))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_6_; GetCatRangeR(6))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_7_; GetCatRangeR(7))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_8_; GetCatRangeR(8))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_9_; GetCatRangeR(9))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_10_; GetCatRangeR(10))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_11_; GetCatRangeR(11))
            {
                DecimalPlaces = 0 : 0;
            }
            column(CatRangerR_12_; GetCatRangeR(12))
            {
                DecimalPlaces = 0 : 0;
            }

            column(Sales_Cr_Header__Return_Quantity__Control1000000022; "Return Quantity")
            {
            }

            trigger OnAfterGetRecord()
            var  idx: Integer;
            begin
                Level := TotLoc;
                if Level > 25 then
                    Level := 25;
                if Level >=1 then begin
                    for idx := Level downto 1 do begin
                        setFilter("Shipment Date", "Sales Shipment Header".GetFilter("Sales Shipment Header"."Shipment Date"));
                        SetFilter("Item Category Code filter", CatRange[idx]);
                        CalcFields("Return Quantity");
                        CatRangeR[idx] := -"Return Quantity";
                    end;
                end;
                SetFilter("Item Category Code filter", '');
                CalcFields("Return Quantity");
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");
                //AAA - June 2004
                ItCat.SetCurrentKey(ItCat."No.");
                ItCat.SetRange(ItCat.Type, 0);
                ItCat.SetFilter(ItCat."Date Filter", "Sales Shipment Header".GetFilter("Sales Shipment Header"."Shipment Date"));
                ItCat.CalcFields(ItCat."Shipped Quantity");
                ItCat.CalcFields(ItCat."Return Quantity");
                ItCat.SetFilter(ItCat."Shipped Quantity", '>%1', 0);
                ItCat.SetFilter(ItCat."Return Quantity", '>0');

                TotLoc := 0;
                Countx := 1;
                for idx := 1 to 25 do begin
                   CatRange[idx] := '';
                   CatRangeQ[idx] := 0;
                   CatRangeR[idx] := 0;
               end;
                if ItCat.Find('-') then begin
                    repeat
                        if Countx > 25 then
                            break;
                        CatRange[Countx] := ItCat.Code;
                        Countx := Countx + 1;
                    until ItCat.Next() = 0;
                    TotLoc := Countx - 1;
                end;
            end;
        }
    }

    requestpage
    {
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

    var
        LastFieldNo: Integer;
        ItCat: Record "Item Category";
        CatRange: array[25] of Code[20];
        CatRangeQ: array[25] of Decimal;
        CatRangeR: array[25] of Decimal;
        TotLoc: Integer;
        Countx: Integer;
        Level: Integer;
        idx: Integer;
        TotalFor: Label 'Total';
        GrdTot: Label 'Grand Total';
        Export_Order_StatisticCaptionLbl: Label 'Export Order Statistic';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SCMhead: Record "Sales Cr.Memo Header";

procedure GetCatRange(index: Integer): Code[20]
begin
   if (index >= 1) and (index <= 25) then
        exit(CatRange[index]);
    exit('');
end;

procedure GetCatRangeQ(index: Integer): Decimal
begin
    if (index >= 1) and (index <= 25) then
        exit(CatRangeQ[index]);
    exit(0);
end;

procedure GetCatRangeR(index: Integer): Decimal
begin
    if (index >= 1) and (index <= 25) then
        exit(CatRangeR[index]);
    exit(0);
end;
}