report 50012 "Daily BreakUp by Vess Summary"
{
    //     SeaRangeDTot:=SeaRangeDTot+SeaRangeD[Countx];VesselPointTot:=VesselPointTot+VesselPoint[Countx];
    //     ShrimpPointTot:=ShrimpPointTot+ShrimpPoint[Countx];FishPointTot:=FishPointTot+FishPoint[Countx];
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/DailyBreakUpbyVessSummary.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Daily BreakUp by Vess Summary';
    dataset
    {
        dataitem("Inventory Posting G Cat Tot"; "Inventory Posting Group")
        {
            DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER(> 0));
            RequestFilterFields = "Statistics Group", Category, "Date Filter";
            column(Total_Vessels; TotLoc)
            {
            }
            column(Daily_Break_Up_by_Vessel__for_____STRSUBSTNO_Text001_DateFilter_; 'Daily Break Up by Vessel  for ' + StrSubstNo(Text001, DateFilter))
            {
            }
            column(USERID_________FORMAT_TODAY_0_4_________COMPANYNAME; UserId + ' :  ' + Format(Today, 0, 4) + '   ' + CompanyName)
            {
            }
            column(ShrimpPoint_1_; ShrimpPoint[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_1_; FishgArea[1])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_2_; ShrimpPoint[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_2_; FishgArea[2])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_3_; ShrimpPoint[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_3_; FishgArea[3])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_4_; ShrimpPoint[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_4_; FishgArea[4])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_5_; ShrimpPoint[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_5_; FishgArea[5])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_6_; ShrimpPoint[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_6_; FishgArea[6])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_7_; ShrimpPoint[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_7_; FishgArea[7])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_8_; ShrimpPoint[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_8_; FishgArea[8])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_9_; ShrimpPoint[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_9_; FishgArea[9])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_10_; ShrimpPoint[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_10_; FishgArea[10])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_11_; ShrimpPoint[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_11_; FishgArea[11])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_12_; ShrimpPoint[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_12_; FishgArea[12])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_13_; ShrimpPoint[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_13_; FishgArea[13])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_14_; ShrimpPoint[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_14_; FishgArea[14])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_15_; ShrimpPoint[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_15_; FishgArea[15])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_16_; ShrimpPoint[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_16_; FishgArea[16])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_17_; ShrimpPoint[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_17_; FishgArea[17])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_18_; ShrimpPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_18_; FishgArea[18])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_19_; ShrimpPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_19_; FishgArea[19])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_20_; ShrimpPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_20_; FishgArea[20])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_21_; ShrimpPoint[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_21_; FishgArea[21])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_22_; ShrimpPoint[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_22_; FishgArea[22])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_23_; ShrimpPoint[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_23_; FishgArea[23])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_24_; ShrimpPoint[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_24_; FishgArea[24])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_25_; ShrimpPoint[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_25_; FishgArea[25])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_1_; VesselPoint[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_2_; VesselPoint[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_3_; VesselPoint[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_4_; VesselPoint[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_5_; VesselPoint[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_6_; VesselPoint[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_7_; VesselPoint[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_8_; VesselPoint[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_9_; VesselPoint[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_10_; VesselPoint[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_11_; VesselPoint[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_12_; VesselPoint[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_13_; VesselPoint[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_14_; VesselPoint[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_15_; VesselPoint[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_16_; VesselPoint[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_17_; VesselPoint[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_18_; VesselPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_19_; VesselPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_20_; VesselPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_21_; VesselPoint[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_22_; VesselPoint[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_23_; VesselPoint[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_24_; VesselPoint[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_25_; VesselPoint[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_1_; SeaRangeD[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_2_; SeaRangeD[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_3_; SeaRangeD[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_4_; SeaRangeD[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_5_; SeaRangeD[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_6_; SeaRangeD[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_7_; SeaRangeD[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_8_; SeaRangeD[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_9_; SeaRangeD[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_10_; SeaRangeD[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_20_; SeaRangeD[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_19_; SeaRangeD[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_18_; SeaRangeD[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_17_; SeaRangeD[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_16_; SeaRangeD[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_15_; SeaRangeD[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_14_; SeaRangeD[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_13_; SeaRangeD[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_12_; SeaRangeD[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_11_; SeaRangeD[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_25_; SeaRangeD[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_24_; SeaRangeD[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_23_; SeaRangeD[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_22_; SeaRangeD[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_21_; SeaRangeD[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_15_; SeaRange[15])
            {
            }
            column(SeaRange_14_; SeaRange[14])
            {
            }
            column(SeaRange_13_; SeaRange[13])
            {
            }
            column(SeaRange_12_; SeaRange[12])
            {
            }
            column(SeaRange_11_; SeaRange[11])
            {
            }
            column(SeaRange_10_; SeaRange[10])
            {
            }
            column(SeaRange_9_; SeaRange[9])
            {
            }
            column(SeaRange_8_; SeaRange[8])
            {
            }
            column(SeaRange_7_; SeaRange[7])
            {
            }
            column(SeaRange_6_; SeaRange[6])
            {
            }
            column(SeaRange_5_; SeaRange[5])
            {
            }
            column(SeaRange_4_; SeaRange[4])
            {
            }
            column(SeaRange_3_; SeaRange[3])
            {
            }
            column(SeaRange_2_; SeaRange[2])
            {
            }
            column(SeaRange_1_; SeaRange[1])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRange_16_; SeaRange[16])
            {
            }
            column(SeaRange_17_; SeaRange[17])
            {
            }
            column(SeaRange_18_; SeaRange[18])
            {
            }
            column(SeaRange_19_; SeaRange[19])
            {
            }
            column(SeaRange_20_; SeaRange[20])
            {
            }
            column(SeaRange_21_; SeaRange[21])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRange_22_; SeaRange[22])
            {
            }
            column(SeaRange_23_; SeaRange[23])
            {
            }
            column(SeaRange_24_; SeaRange[24])
            {
            }
            column(SeaRange_25_; SeaRange[25])
            {
            }
            column(ROUND_SeaRangeDTot_1_____; Round(SeaRangeDTot, 1, '>'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(ROUND_FishPointTot_1_____; Round(FishPointTot, 1, '>'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(ROUND_ROUND_VesselPointTot_1______1_____; Round(Round(VesselPointTot, 1, '>'), 1, '>'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(ROUND_ShrimpPointTot_1_____; Round(ShrimpPointTot, 1, '>'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotLoc_PntLess; VesselCounter)
            {
                // DecimalPlaces = 0 : 0;
            }
            column(Inventory_Posting_G_Cat_Tot__Inventory_total2_; InvtTot)
            {
            }
            column(SeaRangeC_25_; SeaRangeC[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24_; SeaRangeC[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23_; SeaRangeC[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22_; SeaRangeC[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_21_; SeaRangeC[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20_; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19_; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18_; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17_; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16_; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15_; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14_; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13_; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12_; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11_; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10_; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9_; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8_; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7_; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6_; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5_; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4_; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3_; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2_; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_1_; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(T002; T002)
            {
            }
            column(Inventory_Posting_G_Cat_Tot__Inventory_total2__Control1000000799; Inventory2)
            {
            }
            column(Inventory_Total_Caption; Inventory_Total_CaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Sea_DaysCaption; Sea_DaysCaptionLbl)
            {
            }
            column(VesselsCaption; VesselsCaptionLbl)
            {
            }
            column(Shrimp_PointsCaption; Shrimp_PointsCaptionLbl)
            {
            }
            column(Vessel_PointsCaption; Vessel_PointsCaptionLbl)
            {
            }
            column(Fishing_AreaCaption; Fishing_AreaCaptionLbl)
            {
            }
            column(Inventory_Posting_G_Cat_Tot_Code; Code)
            {
            }
            column(Inventory_Posting_G_Cat_Tot_Statistics_Group; "Statistics Group")
            {
            }
            column(Inventory_Posting_G_Cat_Tot_Category; Category)
            {
            }
            column(Vessel1; 1)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /* level := TotLoc;
                 //IF Caterec = Category THEN CurrReport.SKIP;
                 while level > 0 do begin
                     SetFilter("Location Filter", SeaRange[level]);
                     CalcFields(Inventory1, Inventory2);
                     //Inventory2 := InventoryTwo(Code,SeaRange[level],DateFilter);
                     if ReportBy = 0 then
                         SeaRangeC[level] := Inventory2
                     else
                         SeaRangeC[level] := Inventory1;
                     level := level - 1;
                 end;
                 //Show Inventory for all location by releasing location filter
                 // SETFILTER("Location Filter",'<>CRM-ASL');  //16122020 shod
                 SetFilter("Location Filter", '');
                 CalcFields(Inventory1, Inventory2);

                 // Inventory2 := InventoryTotal2(Code,DateFilter);
                 if ReportBy = 0 then
                     InvtTot := Inventory2
                 else
                     InvtTot := Inventory1;

                 //CurrReport.CREATETOTALS(InvtTot);
                 if "Statistics Group" = 4 then
                     T002 := 'LOCAL PRODUCTS';*/
                level := TotLoc;
                //IF Caterec = Category THEN CurrReport.SKIP;
                WHILE level > 0 DO BEGIN
                    SETFILTER("Location Filter", SeaRange[level]);
                    CALCFIELDS(Inventory1, Inventory2);
                    //Inventory2 := InventoryTwo(Code,SeaRange[level],DateFilter);
                    IF ReportBy = 0 THEN
                        SeaRangeC[level] := Inventory2
                    ELSE
                        SeaRangeC[level] := Inventory1;
                    level := level - 1;
                END;
                //Show Inventory for all location by releasing location filter
                // SETFILTER("Location Filter",'<>CRM-ASL');  //16122020 shod
                SETFILTER("Location Filter", '');
                CALCFIELDS(Inventory1, Inventory2);

                // Inventory2 := InventoryTotal2(Code,DateFilter);
                IF ReportBy = 0 THEN
                    InvtTot := Inventory2
                ELSE
                    InvtTot := Inventory1;

                //CurrReport.CREATETOTALS(InvtTot);
                IF "Statistics Group" = 4 THEN
                    T002 := 'LOCAL PRODUCTS';


            end;

            trigger OnPreDataItem()
            var
                LastRepOptNo: Code[10];
            begin
                /* TotLoc := 0;
                 VesselCounter := 0;
                 DateFilter := "Inventory Posting G Cat Tot".GetFilter("Date Filter");

                 if DateFilter = '' then begin
                     SetRange("Date Filter", WorkDate());
                     DateFilter := GetFilter("Date Filter");
                 end;
                 locate2.Reset();
                 locate2.SetRange("Location Type", 1);
                 locate2.SetFilter("date filter", '%1', GetRangeMax("Date Filter"));
                 if locate2.FindFirst() then
                     repeat
                         locate2."Last Rep Operation No. Val" := locate2.LastRepOpNo(locate2.Code, locate2.GetFilter("date filter"));
                         locate2.VSDVal := locate2.VoySeaAnyTime(LastRepOptNo, locate2.Code, locate2.GetFilter("date filter"));
                         if Operatn.Get(locate2."Last Rep Operation No. Val") then
                             Operatn.SetFilter(Operatn."Date Filter", '%1', GetRangeMax("Date Filter"));

                         locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);
                         Operatn.SetFilter(Operatn."Task Filter", 'SHR');
                         locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', 'SHR', '', Operatn.Vessel);
                         locate2."Fishing Area" := Operatn.FishingArea(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);
                         Operatn.SetRange(Operatn."Task Filter");
                         locate2.Modify();
                     until locate2.Next() = 0;

                 locate.Reset();
                 locate.SetRange("Location Type", 1);
                 TotLoc := locate.Count;
                 if ArrangeBy = 0 then
                     locate.SetCurrentKey(locate."Last Reportd Vessel Pts")
                 else
                     locate.SetCurrentKey(locate.VSDVal);
                 locate.Ascending(false);

                 Countx := 1;

                 //locate.SETFILTER(locate."Catch Date",DateFilter);

                 TotLoc := locate.Count;
                 if locate.FindFirst() then
                     repeat
                         if locate.VSDVal <> 0 then begin
                             SeaRange[Countx] := locate.Code;
                             SeaRangeD[Countx] := locate.VSDVal;
                             VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                             ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                             FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];
                             //Fishg Area
                             locate.SetFilter(locate."date filter", '%1', GetRangeMax("Date Filter"));
                             FishgArea[Countx] := locate."Fishing Area";

                             //Totals
                             SeaRangeDTot := SeaRangeDTot + SeaRangeD[Countx];
                             VesselPointTot := VesselPointTot + VesselPoint[Countx];
                             ShrimpPointTot := ShrimpPointTot + ShrimpPoint[Countx];
                             FishPointTot := FishPointTot + FishPoint[Countx];
                             if VesselPoint[Countx] = 0 then
                                 PntLess := PntLess + 1
                             else
                                 VesselCounter += 1;
                             Countx := Countx + 1;
                         end
                     until locate.Next() = 0; */
                TotLoc := 0;
                VesselCounter := 0;
                DateFilter := "Inventory Posting G Cat Tot".GETFILTER("Date Filter");

                IF DateFilter = '' THEN BEGIN
                    SETRANGE("Date Filter", WORKDATE);
                    DateFilter := GETFILTER("Date Filter");
                END;
                locate2.RESET;
                locate2.SETRANGE("Location Type", 1);
                locate2.SETFILTER("date filter", '%1', GETRANGEMAX("Date Filter"));
                IF locate2.FINDFIRST THEN
                    REPEAT
                        locate2."Last Rep Operation No. Val" := locate2.LastRepOpNo(locate2.Code, locate2.GETFILTER("date filter"));
                        locate2.VSDVal := locate2.VoySeaAnyTime(LastRepOptNo, locate2.Code, locate2.GETFILTER("date filter"));
                        IF Operatn.GET(locate2."Last Rep Operation No. Val") THEN
                            Operatn.SETFILTER(Operatn."Date Filter", '%1', GETRANGEMAX("Date Filter"));

                        locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GETFILTER("date filter"), '', '', '', Operatn.Vessel);
                        Operatn.SETFILTER(Operatn."Task Filter", 'SHR');
                        locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GETFILTER("date filter"), '', 'SHR', '', Operatn.Vessel);
                        locate2."Fishing Area" := Operatn.FishingArea(Operatn."No.", locate2.Code, locate2.GETFILTER("date filter"), '', '', '', Operatn.Vessel);
                        Operatn.SETRANGE(Operatn."Task Filter");
                        locate2.MODIFY();
                    UNTIL locate2.NEXT = 0;

                locate.RESET;
                locate.SETRANGE("Location Type", 1);
                TotLoc := locate.COUNT;
                IF ArrangeBy = 0 THEN
                    locate.SETCURRENTKEY(locate."Last Reportd Vessel Pts")
                ELSE
                    locate.SETCURRENTKEY(locate.VSDVal);
                locate.ASCENDING(FALSE);

                Countx := 1;

                //locate.SETFILTER(locate."Catch Date",DateFilter);


                TotLoc := locate.COUNT;
                IF locate.FINDFIRST THEN
                    REPEAT
                        IF locate.VSDVal <> 0 THEN BEGIN
                            SeaRange[Countx] := locate.Code;
                            SeaRangeD[Countx] := locate.VSDVal;
                            VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                            ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                            FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];
                            //Fishg Area
                            locate.SETFILTER(locate."date filter", '%1', GETRANGEMAX("Date Filter"));
                            FishgArea[Countx] := locate."Fishing Area";
                            //locate.CALCFIELDS(locate."Fishing Area");

                            /*{IF locate."Fishing Area" <> '' THEN
                                                        IF (Phase.GET(locate."Fishing Area")) AND (Phase."Area Code" <> '') THEN
                                                            FishgArea[Countx] := Phase."Area Code"
                                                        ELSE
                                                            FishgArea[Countx] := COPYSTR(locate."Fishing Area", 1, 4);
                                                    IF SeaRange[Countx] = '' THEN FishgArea[Countx] := '';}*/

                            //Totals
                            SeaRangeDTot := SeaRangeDTot + SeaRangeD[Countx];
                            VesselPointTot := VesselPointTot + VesselPoint[Countx];
                            ShrimpPointTot := ShrimpPointTot + ShrimpPoint[Countx];
                            FishPointTot := FishPointTot + FishPoint[Countx];
                            IF VesselPoint[Countx] = 0 THEN
                                PntLess := PntLess + 1
                            ELSE
                                VesselCounter += 1;
                            Countx := Countx + 1;
                        END
                    UNTIL locate.NEXT = 0;


            end;
        }
        dataitem("Inventory Posting Group"; "Inventory Posting Group")
        {
            DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER(> 0));
            column(Vessel2; 2)
            {
            }
            column(ShrimpPoint_26_; ShrimpPoint[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_26_; FishgArea[26])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_26_; VesselPoint[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_26_; SeaRangeD[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_26_; SeaRange[26])
            {
            }
            column(ShrimpPoint_27_; ShrimpPoint[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_27_; FishgArea[27])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_27_; VesselPoint[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_27_; SeaRangeD[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_27_; SeaRange[27])
            {
            }
            column(ShrimpPoint_28_; ShrimpPoint[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_28_; FishgArea[28])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_28_; VesselPoint[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_28_; SeaRangeD[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_28_; SeaRange[28])
            {
            }
            column(ShrimpPoint_29_; ShrimpPoint[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_29_; FishgArea[29])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_29_; VesselPoint[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_29_; SeaRangeD[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_29_; SeaRange[29])
            {
            }
            column(ShrimpPoint_30_; ShrimpPoint[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_30_; FishgArea[30])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_30_; VesselPoint[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_30_; SeaRangeD[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_30_; SeaRange[30])
            {
            }
            column(ShrimpPoint_31_; ShrimpPoint[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_31_; FishgArea[31])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_31_; VesselPoint[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_31_; SeaRangeD[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_31_; SeaRange[31])
            {
            }
            column(ShrimpPoint_32_; ShrimpPoint[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_32_; FishgArea[32])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_32_; VesselPoint[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_32_; SeaRangeD[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_32_; SeaRange[32])
            {
            }
            column(ShrimpPoint_33_; ShrimpPoint[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_33_; FishgArea[33])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_33_; VesselPoint[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_33_; SeaRangeD[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_33_; SeaRange[33])
            {
            }
            column(ShrimpPoint_34_; ShrimpPoint[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_34_; FishgArea[34])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_34_; VesselPoint[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_34_; SeaRangeD[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_34_; SeaRange[34])
            {
            }
            column(ShrimpPoint_35_; ShrimpPoint[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_35_; FishgArea[35])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_35_; VesselPoint[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_35_; SeaRangeD[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_35_; SeaRange[35])
            {
            }
            column(ShrimpPoint_36_; ShrimpPoint[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_36_; FishgArea[36])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_36_; VesselPoint[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_36_; SeaRangeD[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_36_; SeaRange[36])
            {
            }
            column(ShrimpPoint_37_; ShrimpPoint[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_37_; FishgArea[37])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_37_; VesselPoint[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_37_; SeaRangeD[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_37_; SeaRange[37])
            {
            }
            column(ShrimpPoint_38_; ShrimpPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_38_; FishgArea[38])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_38_; VesselPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_38_; SeaRangeD[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_38_; SeaRange[38])
            {
            }
            column(ShrimpPoint_39_; ShrimpPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_39_; FishgArea[39])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_39_; VesselPoint[39])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_39_; SeaRangeD[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_39_; SeaRange[39])
            {
            }
            column(ShrimpPoint_40_; ShrimpPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_40_; FishgArea[40])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_40_; VesselPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_40_; SeaRangeD[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_40_; SeaRange[40])
            {
            }
            column(ShrimpPoint_41_; ShrimpPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_41_; FishgArea[41])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_41_; VesselPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_41_; SeaRangeD[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_41_; SeaRange[41])
            {
            }
            column(ShrimpPoint_42_; ShrimpPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_42_; FishgArea[42])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_42_; VesselPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_42_; SeaRangeD[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_42_; SeaRange[42])
            {
            }
            column(ShrimpPoint_43_; ShrimpPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_43_; FishgArea[43])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_43_; VesselPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_43_; SeaRangeD[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_43_; SeaRange[43])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_44_; ShrimpPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_44_; FishgArea[44])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_44_; VesselPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_44_; SeaRangeD[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_44_; SeaRange[44])
            {
            }
            column(ShrimpPoint_45_; ShrimpPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_45_; FishgArea[45])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_45_; VesselPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_45_; SeaRangeD[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_45_; SeaRange[45])
            {
            }
            column(ShrimpPoint_46_; ShrimpPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_46_; FishgArea[46])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_46_; VesselPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_46_; SeaRangeD[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_46_; SeaRange[46])
            {
            }
            column(ShrimpPoint_47_; ShrimpPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_47_; FishgArea[47])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_47_; VesselPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_47_; SeaRangeD[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_47_; SeaRange[47])
            {
            }
            column(ShrimpPoint_48_; ShrimpPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_48_; FishgArea[48])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_48_; VesselPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_48_; SeaRangeD[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_48_; SeaRange[48])
            {
            }
            column(ShrimpPoint_49_; ShrimpPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_49_; FishgArea[49])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_49_; VesselPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_49_; SeaRangeD[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_49_; SeaRange[49])
            {
            }
            column(ShrimpPoint_50_; ShrimpPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_50_; FishgArea[50])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_50_; VesselPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_50_; SeaRangeD[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_50_; SeaRange[50])
            {
            }
            column(InvtTot; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_50_; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49_; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48_; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47_; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46_; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45_; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44_; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43_; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42_; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41_; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40_; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39_; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38_; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37_; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36_; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35_; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34_; SeaRangeC[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33_; SeaRangeC[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32_; SeaRangeC[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31_; SeaRangeC[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30_; SeaRangeC[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29_; SeaRangeC[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28_; SeaRangeC[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27_; SeaRangeC[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26_; SeaRangeC[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(COPYSTR_Category_5__Control1000000026; CopyStr(Category, 5))
            {
            }
            column(InvtTot_Control1000000046; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(T002_Control1000000184; T002)
            {
            }
            column(SeaRangeC_50__Control1000000020; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49__Control1000000021; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48__Control1000000024; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47__Control1000000032; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46__Control1000000033; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45__Control1000000034; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44__Control1000000035; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43__Control1000000036; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42__Control1000000037; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41__Control1000000038; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40__Control1000000045; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39__Control1000000067; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38__Control1000000090; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37__Control1000000091; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36__Control1000000092; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35__Control1000000115; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34__Control1000000152; SeaRangeC[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33__Control1000000153; SeaRangeC[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32__Control1000000154; SeaRangeC[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31__Control1000000155; SeaRangeC[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30__Control1000000156; SeaRangeC[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29__Control1000000157; SeaRangeC[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28__Control1000000158; SeaRangeC[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27__Control1000000159; SeaRangeC[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26__Control1000000160; SeaRangeC[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotalFor___FIELDCAPTION__Statistics_Group__; TotalFor + FieldCaption("Statistics Group"))
            {
            }
            column(InvtTot_Control33; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_1__Control1000000596; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_2__Control1000000597; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_3__Control1000000598; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_4__Control1000000599; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_5__Control1000000600; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_6__Control1000000601; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_7__Control1000000602; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_8__Control1000000603; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_9__Control1000000604; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_10__Control1000000605; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11__Control1000000606; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_12__Control1000000607; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_13__Control1000000608; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_14__Control1000000609; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_15__Control1000000610; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_16__Control1000000611; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_17__Control1000000612; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000613; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000614; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000615; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_11__Control1000000616; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22__Control1000000617; SeaRangeC[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23__Control1000000618; SeaRangeC[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24__Control1000000619; SeaRangeC[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_25__Control1000000620; SeaRangeC[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sea_DaysCaption_Control1000001204; Sea_DaysCaption_Control1000001204Lbl)
            {
            }
            column(VesselsCaption_Control1000001206; VesselsCaption_Control1000001206Lbl)
            {
            }
            column(Vessel_PointsCaption_Control1000001207; Vessel_PointsCaption_Control1000001207Lbl)
            {
            }
            column(Shrimp_PointsCaption_Control1000001212; Shrimp_PointsCaption_Control1000001212Lbl)
            {
            }
            column(Fishing_AreaCaption_Control1000001214; Fishing_AreaCaption_Control1000001214Lbl)
            {
            }
            column(Inventory_Total_Caption_Control1000001465; Inventory_Total_Caption_Control1000001465Lbl)
            {
            }
            column(DescriptionCaption_Control1000001466; DescriptionCaption_Control1000001466Lbl)
            {
            }
            column(Inventory_Posting_Group_Code; Code)
            {
            }
            column(Inventory_Posting_Group_Statistics_Group; "Statistics Group")
            {
            }
            column(Inventory_Posting_Group_Category; Category)
            {
            }

            trigger OnAfterGetRecord()
            begin

                /*level := TotLoc;
                //IF Caterec = Category THEN CurrReport.SKIP;
                while level > 0 do begin
                    SetFilter("Location Filter", SeaRange[level]);
                    CalcFields(Inventory1, Inventory2);
                    if ReportBy = 0 then
                        SeaRangeC[level] := Inventory2
                    else
                        SeaRangeC[level] := Inventory1;
                    level := level - 1;
                end;
                //Show Inventory for all location by releasing location filter
                SetFilter("Location Filter", '');
                CalcFields(Inventory1, Inventory2);
                if ReportBy = 0 then
                    InvtTot := Inventory2
                else
                    InvtTot := Inventory1;*/

                level := TotLoc;
                //IF Caterec = Category THEN CurrReport.SKIP;
                WHILE level > 0 DO BEGIN
                    SETFILTER("Location Filter", SeaRange[level]);
                    CALCFIELDS(Inventory1, Inventory2);
                    IF ReportBy = 0 THEN
                        SeaRangeC[level] := Inventory2
                    ELSE
                        SeaRangeC[level] := Inventory1;
                    level := level - 1;
                END;
                //Show Inventory for all location by releasing location filter
                SETFILTER("Location Filter", '');
                CALCFIELDS(Inventory1, Inventory2);
                IF ReportBy = 0 THEN
                    InvtTot := Inventory2
                ELSE
                    InvtTot := Inventory1;

            end;

            trigger OnPreDataItem()
            begin

                /* TotLoc := 0;
                 VesselCounter := 0;
                 CopyFilters("Inventory Posting G Cat Tot");

                 locate2.SetRange(locate2."Location Type", 1);
                 locate2.SetFilter(locate2."date filter", '%1', GetRangeMax("Date Filter"));
                 if locate2.Find('-') then
                     repeat
                         locate2."Last Rep Operation No. Val" :=
                           locate2.LastRepOpNo(locate2.Code, locate2.GetFilter("date filter"));//locate2."Last Rep Operation No.";
                         locate2.VSDVal :=
                           locate2.VoySeaAnyTime(locate2."Last Rep Operation No. Val", locate2.Code, locate2.GetFilter("date filter"));
                         if Operatn.Get(locate2."Last Rep Operation No. Val") then
                             Operatn.SetFilter(Operatn."Date Filter", '%1', GetRangeMax("Date Filter"));
                         locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code,
                           locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);//Operatn.Points;
                         Operatn.SetFilter(Operatn."Task Filter", 'SHR');
                         //Operatn.CALCFIELDS(Operatn.Points);
                         locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code,
                           locate2.GetFilter("date filter"), '', 'SHR', '', Operatn.Vessel); //Operatn.Points;
                         Operatn.SetRange(Operatn."Task Filter");
                         locate2.Modify();
                     until locate2.Next() = 0;

                 //AAA - June 2002 Sort Entries accordg to SeaDays
                 locate.SetRange(locate."Location Type", 1);
                 TotLoc := locate.Count;
                 if ArrangeBy = 0 then
                     locate.SetCurrentKey(locate."Last Reportd Vessel Pts")
                 else
                     locate.SetCurrentKey(locate.VSDVal);
                 locate.Ascending(false);

                 Countx := 1;
                 if locate.Find('-') then
                     repeat
                         if locate.VSDVal <> 0 then begin
                             SeaRange[Countx] := locate.Code;
                             SeaRangeD[Countx] := locate.VSDVal;     //Sea Day Assigned
                             VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                             ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                             FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];

                             //Fishg Area
                             locate.SetFilter(locate."date filter", '%1', GetRangeMax("Date Filter"));
                             locate."Fishing Area" := locate.FishingArea(locate."Current Operation",
                                locate.Code, locate.GetFilter("date filter"));
                             if locate."Fishing Area" <> '' then
                                 if (Phase.Get(locate."Fishing Area")) and (Phase."Area Code" <> '') then
                                     FishgArea[Countx] := Phase."Area Code"
                                 else
                                     FishgArea[Countx] := CopyStr(locate."Fishing Area", 1, 4);
                             if SeaRange[Countx] = '' then FishgArea[Countx] := '';

                             Countx := Countx + 1;
                         end;
                     until locate.Next() = 0;
                 TotLoc := Countx - 1;

                 if locate.VSDVal = 0 then
                     CurrReport.Skip();*/

                TotLoc := 0;
                VesselCounter := 0;
                COPYFILTERS("Inventory Posting G Cat Tot");

                locate2.SETRANGE(locate2."Location Type", 1);
                locate2.SETFILTER(locate2."date filter", '%1', GETRANGEMAX("Date Filter"));
                IF locate2.FIND('-') THEN
                    REPEAT
                        locate2."Last Rep Operation No. Val" :=
                          locate2.LastRepOpNo(locate2.Code, locate2.GETFILTER("date filter"));//locate2."Last Rep Operation No.";
                        locate2.VSDVal :=
                          locate2.VoySeaAnyTime(locate2."Last Rep Operation No. Val", locate2.Code, locate2.GETFILTER("date filter"));
                        IF Operatn.GET(locate2."Last Rep Operation No. Val") THEN
                            Operatn.SETFILTER(Operatn."Date Filter", '%1', GETRANGEMAX("Date Filter"));
                        locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code,
                          locate2.GETFILTER("date filter"), '', '', '', Operatn.Vessel);//Operatn.Points;
                        Operatn.SETFILTER(Operatn."Task Filter", 'SHR');
                        //Operatn.CALCFIELDS(Operatn.Points);
                        locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code,
                          locate2.GETFILTER("date filter"), '', 'SHR', '', Operatn.Vessel); //Operatn.Points;
                        Operatn.SETRANGE(Operatn."Task Filter");
                        locate2.MODIFY();
                    UNTIL locate2.NEXT = 0;

                //AAA - June 2002 Sort Entries accordg to SeaDays
                locate.SETRANGE(locate."Location Type", 1);
                TotLoc := locate.COUNT;
                IF ArrangeBy = 0 THEN
                    locate.SETCURRENTKEY(locate."Last Reportd Vessel Pts")
                ELSE
                    locate.SETCURRENTKEY(locate.VSDVal);
                locate.ASCENDING(FALSE);

                Countx := 1;
                IF locate.FIND('-') THEN
                    REPEAT
                        IF locate.VSDVal <> 0 THEN BEGIN
                            SeaRange[Countx] := locate.Code;
                            SeaRangeD[Countx] := locate.VSDVal;     //Sea Day Assigned
                            VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                            ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                            FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];

                            //Fishg Area
                            locate.SETFILTER(locate."date filter", '%1', GETRANGEMAX("Date Filter"));
                            locate."Fishing Area" := locate.FishingArea(locate."Current Operation",
                               locate.Code, locate.GETFILTER("date filter"));
                            IF locate."Fishing Area" <> '' THEN
                                IF (Phase.GET(locate."Fishing Area")) AND (Phase."Area Code" <> '') THEN
                                    FishgArea[Countx] := Phase."Area Code"
                                ELSE
                                    FishgArea[Countx] := COPYSTR(locate."Fishing Area", 1, 4);
                            IF SeaRange[Countx] = '' THEN FishgArea[Countx] := '';

                            Countx := Countx + 1;
                        END;
                    UNTIL locate.NEXT = 0;
                TotLoc := Countx - 1;

                IF locate.VSDVal = 0 THEN
                    CurrReport.SKIP;

            end;
        }
        dataitem("Inventory Posting Group 2"; "Inventory Posting Group")
        {
            DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER(> 0));
            column(TESTING123; TESTING123)
            {
            }
            column(testc_1; TestC[1])
            {
            }
            column(testc_2; TestC[2])
            {
            }
            column(testc_3; TestC[3])
            {
            }
            column(testc_4; TestC[4])
            {
            }
            column(testc_5; TestC[5])
            {
            }
            column(testc_6; TestC[6])
            {
            }
            column(testc_7; TestC[7])
            {
            }
            column(testc_8; TestC[8])
            {
            }
            column(testc_9; TestC[9])
            {
            }
            column(testc_10; TestC[10])
            {
            }
            column(testc_11; TestC[11])
            {
            }
            column(testc_12; TestC[12])
            {
            }
            column(testc_13; TestC[13])
            {
            }
            column(testc_14; TestC[14])
            {
            }
            column(testc_15; TestC[15])
            {
            }
            column(testc_16; TestC[16])
            {
            }
            column(testc_17; TestC[17])
            {
            }
            column(testc_18; TestC[18])
            {
            }
            column(testc_19; TestC[19])
            {
            }
            column(testc_20; TestC[20])
            {
            }
            column(testc_21; TestC[21])
            {
            }
            column(testc_22; TestC[22])
            {
            }
            column(testc_23; TestC[23])
            {
            }
            column(testc_24; TestC[24])
            {
            }
            column(testc_25; TestC[25])
            {
            }
            column(testc_26; TestC[26])
            {
            }
            column(testc_27; TestC[27])
            {
            }
            column(testc_28; TestC[28])
            {
            }
            column(testc_29; TestC[29])
            {
            }
            column(testc_30; TestC[30])
            {
            }
            column(testc_31; TestC[31])
            {
            }
            column(testc_32; TestC[32])
            {
            }
            column(testc_33; TestC[33])
            {
            }
            column(testc_34; TestC[34])
            {
            }
            column(testc_35; TestC[35])
            {
            }
            column(testc_36; TestC[36])
            {
            }
            column(testc_37; TestC[37])
            {
            }
            column(testc_38; TestC[38])
            {
            }
            column(testc_39; TestC[39])
            {
            }
            column(testc_40; TestC[40])
            {
            }
            column(testc_41; TestC[41])
            {
            }
            column(testc_42; TestC[42])
            {
            }
            column(testc_43; TestC[43])
            {
            }
            column(testc_44; TestC[44])
            {
            }
            column(testc_45; TestC[45])
            {
            }
            column(testc_46; TestC[46])
            {
            }
            column(testc_47; TestC[47])
            {
            }
            column(testc_48; TestC[48])
            {
            }
            column(testc_49; TestC[49])
            {
            }
            column(testc_50; TestC[50])
            {
            }
            column(testc_51; TestC[51])
            {
            }
            column(testc_52; TestC[52])
            {
            }
            column(testc_53; TestC[53])
            {
            }
            column(testc_54; TestC[54])
            {
            }
            column(testc_55; TestC[55])
            {
            }
            column(testc_56; TestC[56])
            {
            }
            column(testc_57; TestC[57])
            {
            }
            column(testc_58; TestC[58])
            {
            }
            column(testc_59; TestC[59])
            {
            }
            column(testc_60; TestC[60])
            {
            }
            column(testc_61; TestC[61])
            {
            }
            column(testc_62; TestC[62])
            {
            }
            column(testc_63; TestC[63])
            {
            }
            column(testc_64; TestC[64])
            {
            }
            column(testc_65; TestC[65])
            {
            }
            column(testc_66; TestC[66])
            {
            }
            column(testc_67; TestC[67])
            {
            }
            column(testc_68; TestC[68])
            {
            }
            column(testc_69; TestC[69])
            {
            }
            column(testc_70; TestC[70])
            {
            }
            column(testc_71; TestC[71])
            {
            }
            column(testc_72; TestC[72])
            {
            }
            column(testc_73; TestC[73])
            {
            }
            column(testc_74; TestC[74])
            {
            }
            column(testc_75; TestC[75])
            {
            }
            column(ShrimpPoint_51_; ShrimpPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_51_; FishgArea[51])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_51_; VesselPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_51_; SeaRangeD[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_51_; SeaRange[51])
            {
            }
            column(ShrimpPoint_52_; ShrimpPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_52_; FishgArea[52])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_52_; VesselPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_52_; SeaRangeD[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_52_; SeaRange[52])
            {
            }
            column(ShrimpPoint_53_; ShrimpPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_53_; FishgArea[53])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_53_; VesselPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_53_; SeaRangeD[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_53_; SeaRange[53])
            {
            }
            column(ShrimpPoint_54_; ShrimpPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_54_; FishgArea[54])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_54_; VesselPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_54_; SeaRangeD[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_54_; SeaRange[54])
            {
            }
            column(ShrimpPoint_55_; ShrimpPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_55_; FishgArea[55])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_55_; VesselPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_55_; SeaRangeD[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_55_; SeaRange[55])
            {
            }
            column(ShrimpPoint_56_; ShrimpPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_56_; FishgArea[56])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_56_; VesselPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_56_; SeaRangeD[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_56_; SeaRange[56])
            {
            }
            column(ShrimpPoint_57_; ShrimpPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_57_; FishgArea[57])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_57_; VesselPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_57_; SeaRangeD[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_57_; SeaRange[57])
            {
            }
            column(ShrimpPoint_58_; ShrimpPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_58_; FishgArea[58])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_58_; VesselPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_58_; SeaRangeD[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_58_; SeaRange[58])
            {
            }
            column(ShrimpPoint_59_; ShrimpPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_59_; FishgArea[59])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_59_; VesselPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_59_; SeaRangeD[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_59_; SeaRange[59])
            {
            }
            column(ShrimpPoint_60_; ShrimpPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_60_; FishgArea[60])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_60_; VesselPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_60_; SeaRangeD[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_60_; SeaRange[60])
            {
            }
            column(ShrimpPoint_61_; ShrimpPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_61_; FishgArea[61])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_61_; VesselPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_61_; SeaRangeD[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_61_; SeaRange[61])
            {
            }
            column(ShrimpPoint_62_; ShrimpPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_62_; FishgArea[62])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_62_; VesselPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_62_; SeaRangeD[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_62_; SeaRange[62])
            {
            }
            column(ShrimpPoint_63_; ShrimpPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_63_; FishgArea[63])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_63_; VesselPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_63_; SeaRangeD[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_63_; SeaRange[63])
            {
            }
            column(ShrimpPoint_64_; ShrimpPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_64_; FishgArea[64])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_64_; VesselPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_64_; SeaRangeD[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_64_; SeaRange[64])
            {
            }
            column(ShrimpPoint_65_; ShrimpPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_65_; FishgArea[65])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_65_; VesselPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_65_; SeaRangeD[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_65_; SeaRange[65])
            {
            }
            column(ShrimpPoint_66_; ShrimpPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_66_; FishgArea[66])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_66_; VesselPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_66_; SeaRangeD[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_66_; SeaRange[66])
            {
            }
            column(ShrimpPoint_67_; ShrimpPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_67_; FishgArea[67])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_67_; VesselPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_67_; SeaRangeD[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_67_; SeaRange[67])
            {
            }
            column(ShrimpPoint_68_; ShrimpPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_68_; FishgArea[68])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_68_; VesselPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_68_; SeaRangeD[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_68_; SeaRange[68])
            {
            }
            column(ShrimpPoint_69_; ShrimpPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_69_; FishgArea[69])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_69_; VesselPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_69_; SeaRangeD[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_69_; SeaRange[69])
            {
            }
            column(ShrimpPoint_70_; ShrimpPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_70_; FishgArea[70])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_70_; VesselPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_70_; SeaRangeD[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_70_; SeaRange[70])
            {
            }
            column(ShrimpPoint_71_; ShrimpPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_71_; FishgArea[71])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_71_; VesselPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_71_; SeaRangeD[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_71_; SeaRange[71])
            {
            }
            column(ShrimpPoint_72_; ShrimpPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_72_; FishgArea[72])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_72_; VesselPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_72_; SeaRangeD[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_72_; SeaRange[72])
            {
            }
            column(ShrimpPoint_73_; ShrimpPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_73_; FishgArea[73])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_73_; VesselPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_73_; SeaRangeD[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_73_; SeaRange[73])
            {
            }
            column(ShrimpPoint_74_; ShrimpPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_74_; FishgArea[74])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_74_; VesselPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_74_; SeaRangeD[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_74_; SeaRange[74])
            {
            }
            column(ShrimpPoint_75_; ShrimpPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishgArea_75_; FishgArea[75])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_75_; VesselPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_75_; SeaRangeD[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_75_; SeaRange[75])
            {
            }
            column(COPYSTR_Category_5__Control1000002269; CopyStr(Category, 5))
            {
            }
            column(Inventory_Posting_Group_2__Inventory_total2_; InvtTot)
            {
            }
            column(SeaRangeC_51_; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52_; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53_; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54_; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55_; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56_; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57_; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58_; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59_; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60_; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61_; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62_; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63_; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64_; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65_; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66_; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67_; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68_; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69_; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70_; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71_; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72_; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73_; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74_; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75_; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(T002_Control1000002165; T002)
            {
            }
            column(Inventory_Posting_Group_2__Inventory_total2__Control1000002166; Inventory2)
            {
            }
            column(SeaRangeC_51__Control1000002219; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52__Control1000002220; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53__Control1000002221; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54__Control1000002222; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55__Control1000002223; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56__Control1000002224; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57__Control1000002225; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58__Control1000002226; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59__Control1000002227; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60__Control1000002228; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61__Control1000002229; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62__Control1000002230; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63__Control1000002231; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64__Control1000002232; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65__Control1000002233; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66__Control1000002234; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67__Control1000002235; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68__Control1000002236; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69__Control1000002237; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70__Control1000002238; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71__Control1000002239; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72__Control1000002240; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73__Control1000002241; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74__Control1000002242; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75__Control1000002243; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselsCaption_Control1000000185; VesselsCaption_Control1000000185Lbl)
            {
            }
            column(Sea_DaysCaption_Control1000000186; Sea_DaysCaption_Control1000000186Lbl)
            {
            }
            column(Vessel_PointsCaption_Control1000000187; Vessel_PointsCaption_Control1000000187Lbl)
            {
            }
            column(Shrimp_PointsCaption_Control1000000197; Shrimp_PointsCaption_Control1000000197Lbl)
            {
            }
            column(Fishing_AreaCaption_Control1000000212; Fishing_AreaCaption_Control1000000212Lbl)
            {
            }
            column(Inventory_Total_Caption_Control1000000219; Inventory_Total_Caption_Control1000000219Lbl)
            {
            }
            column(DescriptionCaption_Control1000000220; DescriptionCaption_Control1000000220Lbl)
            {
            }
            column(Inventory_Posting_Group_2_Code; Code)
            {
            }
            column(Inventory_Posting_Group_2_Statistics_Group; "Statistics Group")
            {
            }
            column(Inventory_Posting_Group_2_Category; Category)
            {
            }
            column(Vessel3; 3)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*level := TotLoc;
                //IF Caterec = Category THEN CurrReport.SKIP;
                Clear(TestC);

                if Category in ['B08.SNB', 'B09.CROAKER', 'B10.SOLE', 'B11.MIX', 'B12.OTHER FISH'] then begin
                    CalcFields(Inventory1, Inventory2);
                    level := TotLoc;
                    while level > 0 do begin
                        SetFilter("Location Filter", SeaRange[level]);
                        CalcFields(Inventory1, Inventory2);
                        if ReportBy = 0 then
                            TestC[level] := Inventory2
                        else
                            TestC[level] := Inventory1;
                        TestCVal := TestC[level];
                        level := level - 1;
                    end;
                end;

                while level > 0 do begin
                    SetFilter("Location Filter", SeaRange[level]);
                    CalcFields(Inventory1, Inventory2);
                    if ReportBy = 0 then
                        SeaRangeC[level] := Inventory2
                    else
                        SeaRangeC[level] := Inventory1;
                    SearangeVal := SeaRangeC[level];
                    level := level - 1;
                end;
                //Show Inventory for all location by releasing location filter
                // SETFILTER("Location Filter",'<>CRM-ASL');  //16122020

                SetFilter("Location Filter", '');
                CalcFields(Inventory1, Inventory2);

                // Inventory2 := InventoryTotal2(Code,DateFilter);
                if ReportBy = 0 then
                    InvtTot := Inventory2
                else
                    InvtTot := Inventory1;

                //IF Caterec <> Category THEN

                if Category in ['B08.SNB', 'B09.CROAKER', 'B10.SOLE', 'B11.MIX', 'B12.OTHER FISH'] then
                    TESTING123 += Round(InvtTot, 2);

                Caterec := Category;
                */
                level := TotLoc;
                //IF Caterec = Category THEN CurrReport.SKIP;
                CLEAR(TestC);

                IF Category IN ['B08.SNB', 'B09.CROAKER', 'B10.SOLE', 'B11.MIX', 'B12.OTHER FISH'] THEN BEGIN
                    CALCFIELDS(Inventory1, Inventory2);
                    level := TotLoc;
                    WHILE level > 0 DO BEGIN
                        SETFILTER("Location Filter", SeaRange[level]);
                        CALCFIELDS(Inventory1, Inventory2);
                        IF ReportBy = 0 THEN
                            TestC[level] := Inventory2
                        ELSE
                            TestC[level] := Inventory1;
                        TestCVal := TestC[level];
                        level := level - 1;
                    END;
                END;


                WHILE level > 0 DO BEGIN
                    SETFILTER("Location Filter", SeaRange[level]);
                    CALCFIELDS(Inventory1, Inventory2);
                    IF ReportBy = 0 THEN
                        SeaRangeC[level] := Inventory2
                    ELSE
                        SeaRangeC[level] := Inventory1;
                    SearangeVal := SeaRangeC[level];
                    level := level - 1;
                END;
                //Show Inventory for all location by releasing location filter
                // SETFILTER("Location Filter",'<>CRM-ASL');  //16122020

                SETFILTER("Location Filter", '');
                CALCFIELDS(Inventory1, Inventory2);

                // Inventory2 := InventoryTotal2(Code,DateFilter);
                IF ReportBy = 0 THEN
                    InvtTot := Inventory2
                ELSE
                    InvtTot := Inventory1;

                //IF Caterec <> Category THEN 

                IF Category IN ['B08.SNB', 'B09.CROAKER', 'B10.SOLE', 'B11.MIX', 'B12.OTHER FISH'] THEN
                    TESTING123 += ROUND(InvtTot, 2);

                Caterec := Category;

            end;

            trigger OnPreDataItem()
            var
                LastRepOptNo: Code[10];
            begin

                /*  TotLoc := 0;
                  VesselCounter := 0;
                  CopyFilters("Inventory Posting G Cat Tot");
                  locate2.Reset();
                  locate2.SetRange("Location Type", 1);
                  locate2.SetFilter("date filter", '%1', GetRangeMax("Date Filter"));
                  if locate2.FindFirst() then
                      repeat
                          locate2."Last Rep Operation No. Val" := locate2.LastRepOpNo(locate2.Code, locate2.GetFilter("date filter"));
                          locate2.VSDVal := locate2.VoySeaAnyTime(LastRepOptNo, locate2.Code, locate2.GetFilter("date filter"));
                          if Operatn.Get(locate2."Last Rep Operation No. Val") then
                              locate2."Fishing Area" := Operatn.FishingArea(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);
                          Operatn.SetFilter(Operatn."Date Filter", '%1', GetRangeMax("Date Filter"));
                          locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);
                          Operatn.SetFilter(Operatn."Task Filter", 'SHR');
                          locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', 'SHR', '', Operatn.Vessel);
                          Operatn.SetRange(Operatn."Task Filter");

                          locate2.Modify();
                      until locate2.Next() = 0;

                  //IF SeaRange[33]='' THEN
                  //CurrReport.SKIP;

                  locate.Reset();
                  locate.SetRange("Location Type", 1);
                  TotLoc := locate.Count;
                  if ArrangeBy = 0 then
                      locate.SetCurrentKey(locate."Last Reportd Vessel Pts")
                  else
                      locate.SetCurrentKey(locate.VSDVal);
                  locate.Ascending(false);

                  Countx := 1;

                  //locate.SETFILTER(locate."Catch Date",DateFilter);
                  TotLoc := locate.Count;
                  if locate.FindFirst() then
                      repeat
                          if locate.VSDVal <> 0 then begin
                              SeaRange[Countx] := locate.Code;
                              SeaRangeD[Countx] := locate.VSDVal;
                              VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                              ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                              FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];
                              //Fishg Area
                              locate.SetFilter(locate."date filter", '%1', GetRangeMax("Date Filter"));
                              FishgArea[Countx] := locate."Fishing Area";
                              //locate.CALCFIELDS(locate."Fishing Area");

                              {IF locate."Fishing Area"<>'' THEN
                                IF (Phase.GET(locate."Fishing Area")) AND (Phase."Area Code"<>'') THEN
                                   FishgArea[Countx]:=Phase."Area Code"
                                ELSE
                                   FishgArea[Countx]:=COPYSTR(locate."Fishing Area",1,4);
                                IF SeaRange[Countx]='' THEN FishgArea[Countx]:='';}

                              //Totals
                              SeaRangeDTot := SeaRangeDTot + SeaRangeD[Countx];
                              VesselPointTot := VesselPointTot + VesselPoint[Countx];
                              ShrimpPointTot := ShrimpPointTot + ShrimpPoint[Countx];
                              FishPointTot := FishPointTot + FishPoint[Countx];
                              if VesselPoint[Countx] = 0 then
                                  PntLess := PntLess + 1
                              else
                                  VesselCounter += 1;
                              Countx := Countx + 1;
                          end;
                      until locate.Next() = 0;

                  if locate.VSDVal = 0 then
                      CurrReport.Skip();
                  //InvtTot := 0;
                  TESTING123 := 0;
                  //CLEAR(TestC);
                  //CLEAR(SeaRangeC);*/

                TotLoc := 0;
                VesselCounter := 0;
                COPYFILTERS("Inventory Posting G Cat Tot");
                locate2.RESET;
                locate2.SETRANGE("Location Type", 1);
                locate2.SETFILTER("date filter", '%1', GETRANGEMAX("Date Filter"));
                IF locate2.FINDFIRST THEN
                    REPEAT
                        locate2."Last Rep Operation No. Val" := locate2.LastRepOpNo(locate2.Code, locate2.GETFILTER("date filter"));
                        locate2.VSDVal := locate2.VoySeaAnyTime(LastRepOptNo, locate2.Code, locate2.GETFILTER("date filter"));
                        IF Operatn.GET(locate2."Last Rep Operation No. Val") THEN
                            locate2."Fishing Area" := Operatn.FishingArea(Operatn."No.", locate2.Code, locate2.GETFILTER("date filter"), '', '', '', Operatn.Vessel);
                        Operatn.SETFILTER(Operatn."Date Filter", '%1', GETRANGEMAX("Date Filter"));
                        locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GETFILTER("date filter"), '', '', '', Operatn.Vessel);
                        Operatn.SETFILTER(Operatn."Task Filter", 'SHR');
                        locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GETFILTER("date filter"), '', 'SHR', '', Operatn.Vessel);
                        Operatn.SETRANGE(Operatn."Task Filter");

                        locate2.MODIFY();
                    UNTIL locate2.NEXT = 0;

                /*IF SeaRange[33] = '' THEN
                                    CurrReport.SKIP;*/


                locate.RESET;
                locate.SETRANGE("Location Type", 1);
                TotLoc := locate.COUNT;
                IF ArrangeBy = 0 THEN
                    locate.SETCURRENTKEY(locate."Last Reportd Vessel Pts")
                ELSE
                    locate.SETCURRENTKEY(locate.VSDVal);
                locate.ASCENDING(FALSE);

                Countx := 1;

                //locate.SETFILTER(locate."Catch Date",DateFilter);
                TotLoc := locate.COUNT;
                IF locate.FINDFIRST THEN
                    REPEAT
                        IF locate.VSDVal <> 0 THEN BEGIN
                            SeaRange[Countx] := locate.Code;
                            SeaRangeD[Countx] := locate.VSDVal;
                            VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                            ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                            FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];
                            //Fishg Area
                            locate.SETFILTER(locate."date filter", '%1', GETRANGEMAX("Date Filter"));
                            FishgArea[Countx] := locate."Fishing Area";
                            //locate.CALCFIELDS(locate."Fishing Area");

                            /*IF locate."Fishing Area"<>'' THEN
                              IF (Phase.GET(locate."Fishing Area")) AND (Phase."Area Code"<>'') THEN
                                 FishgArea[Countx]:=Phase."Area Code"
                              ELSE
                                 FishgArea[Countx]:=COPYSTR(locate."Fishing Area",1,4);
                              IF SeaRange[Countx]='' THEN FishgArea[Countx]:='';*/

                            //Totals
                            SeaRangeDTot := SeaRangeDTot + SeaRangeD[Countx];
                            VesselPointTot := VesselPointTot + VesselPoint[Countx];
                            ShrimpPointTot := ShrimpPointTot + ShrimpPoint[Countx];
                            FishPointTot := FishPointTot + FishPoint[Countx];
                            IF VesselPoint[Countx] = 0 THEN
                                PntLess := PntLess + 1
                            ELSE
                                VesselCounter += 1;
                            Countx := Countx + 1;
                        END;
                    UNTIL locate.NEXT = 0;

                IF locate.VSDVal = 0 THEN
                    CurrReport.SKIP;
                //InvtTot := 0;
                TESTING123 := 0;
                //CLEAR(TestC);
                //CLEAR(SeaRangeC);


            end;
        }
    }

    requestpage
    {
        SaveValues = True;
        layout
        {
            area(content)
            {
                field("Arrange Column By"; ArrangeBy)
                {
                    ApplicationArea = All;
                }
                field("Report Mode"; ReportBy)
                {
                    ApplicationArea = All;
                }
                field("Show Category Total"; "Show Category total")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    var
        TotalFor: Label ' Total';
        locate: Record Location;
        locate2: Record Location;
        Operatn: Record Job;
        Countx: Integer;
        level: Integer;
        TotLoc: Integer;
        TestC: array[100] of Decimal;
        SeaRangeC: array[100] of Decimal;
        T002: Text[80];
        SeaRange: array[100] of Text[30];
        SeaRangeD: array[100] of Decimal;
        ShrimpPoint: array[100] of Decimal;
        VesselPoint: array[100] of Decimal;
        FishPoint: array[100] of Decimal;
        FishgArea: array[100] of Code[10];
        "Show Category total": Boolean;
        ArrangeBy: Option "Vessel Points","Sea Days";
        ReportBy: Option Catch,Stock;
        DateFilter: Text[50];
        Text001: Label 'Period: %1';
        InvtTot: Decimal;
        SeaRangeDTot: Decimal;
        ShrimpPointTot: Decimal;
        VesselPointTot: Decimal;
        FishPointTot: Decimal;
        PntLess: Integer;
        Inventory_Total_CaptionLbl: Label 'Inventory Total ';
        DescriptionCaptionLbl: Label 'Description';
        Sea_DaysCaptionLbl: Label 'Sea Days';
        VesselsCaptionLbl: Label 'Vessels';
        Shrimp_PointsCaptionLbl: Label 'Shrimp Points';
        Vessel_PointsCaptionLbl: Label 'Vessel Points';
        Fishing_AreaCaptionLbl: Label 'Fishing Area';
        Sea_DaysCaption_Control1000001204Lbl: Label 'Sea Days';
        VesselsCaption_Control1000001206Lbl: Label 'Vessels';
        Vessel_PointsCaption_Control1000001207Lbl: Label 'Vessel Points';
        Shrimp_PointsCaption_Control1000001212Lbl: Label 'Shrimp Points';
        Fishing_AreaCaption_Control1000001214Lbl: Label 'Fishing Area';
        Inventory_Total_Caption_Control1000001465Lbl: Label 'Inventory Total ';
        DescriptionCaption_Control1000001466Lbl: Label 'Description';
        VesselsCaption_Control1000000185Lbl: Label 'Vessels';
        Sea_DaysCaption_Control1000000186Lbl: Label 'Sea Days';
        Vessel_PointsCaption_Control1000000187Lbl: Label 'Vessel Points';
        Shrimp_PointsCaption_Control1000000197Lbl: Label 'Shrimp Points';
        Fishing_AreaCaption_Control1000000212Lbl: Label 'Fishing Area';
        Inventory_Total_Caption_Control1000000219Lbl: Label 'Inventory Total ';
        DescriptionCaption_Control1000000220Lbl: Label 'Description';
        Phase: Record Task;
        VesselCounter: Integer;
        TESTING123: Integer;
        TestCVal: Decimal;
        SearangeVal: Decimal;
        Caterec: Code[20];
}
