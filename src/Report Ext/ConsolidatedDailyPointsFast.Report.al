report 50218 "Consolidated Daily Points Fast"
{
    // UNL-ASL3.60.01.004 (Santus) May 11, 2005
    // -> modified report to write output data to the Entry/Exit Table. the data will be stored as historical data.
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/ConsolidatedDailyPointsFast.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'New Daily Points Report';

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));

            trigger OnAfterGetRecord()
            begin

                if not Historical then begin
                    JobsPointVal.SetCurrentKey(JobsPointVal.Vessel, JobsPointVal.Status);
                    JobsPointVal.SetRange(JobsPointVal.Status, 2);
                end;

                if RepDate <> 0D then
                    JobsPointVal.SetFilter(JobsPointVal."Posting Date Filter", '%1', RepDate)
                else
                    JobsPointVal.SetFilter(JobsPointVal."Posting Date Filter", '%1..%2', 19800101D, Today);

                //MESSAGE('Report Date is %1',RepDate);
                if JobsPointVal.Find('-') then
                    repeat
                        //JobsPointVal.CALCFIELDS(JobsPointVal.Points);
                        //IF JobsPointVal.Points <>0 THEN ; //MESSAGE('Val is %1',JobsPointVal.Points);
                        JobsPointVal."Points Sort Bay" := JobsPointVal.PointZ(JobsPointVal."No.", '',
                           JobsPointVal.GetFilter("Posting Date Filter"), '', '', '', JobsPointVal.Vessel);//JobsPointVal.Points;
                        JobsPointVal.Modify();
                    until JobsPointVal.Next() = 0;
            end;
        }
        dataitem(Job; Job)
        {
            DataItemTableView = SORTING("Points Sort Bay", Status) ORDER(Descending) WHERE("No." = FILTER('I' .. 'K'));
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(Consolidated_Daily_Points_Report_As_On_____FORMAT_Workdat_0_4_; 'Consolidated Daily Points Report As On : ' + Format(Workdat, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(USERID; UserId)
            {
            }
            column(Day_of_Tide____DOT; 'Day of Tide: ' + DOT)
            {
            }
            column(Countz; Countz)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Skipper; Skipper)
            {
            }
            column(ActFishDays; ActFishDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(AvgFishDays; AvgFishDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(pts_1_; pts[1])
            {
            }
            column(pts_3_; pts[3])
            {
            }
            column(pts_2_; pts[2])
            {
            }
            column(pts_9_; pts[9])
            {
            }
            column(pts_6_; pts[6])
            {
            }
            column(SeaDays; SeaDays)
            {
            }
            column(ChorCount; ChorCount)
            {
                DecimalPlaces = 0 : 2;
            }
            column(OthrCount; OthrCount)
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalLostDays; TotalLostDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(Job__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(TotPts_1_; TotPts[1])
            {
            }
            column(TotPts_2_; TotPts[2])
            {
            }
            column(TotPts_3_; TotPts[3])
            {
            }
            column(TotPts_6_; TotPts[6])
            {
            }
            column(TotPts_9_; TotPts[9])
            {
            }
            column(TotPtsA_1_; TotPtsA[1])
            {
            }
            column(TotPtsA_2_; TotPtsA[2])
            {
            }
            column(TotPtsA_3_; TotPtsA[3])
            {
            }
            column(TotPtsA_6_; TotPtsA[6])
            {
            }
            column(TotPtsA_9_; TotPtsA[9])
            {
            }
            column(SeaDaysTot; SeaDaysTot)
            {
            }
            column(SeaDayA; SeaDayA)
            {
            }
            column(ChorCountTot; ChorCountTot)
            {
                DecimalPlaces = 0 : 2;
            }
            column(OthrCountTot; OthrCountTot)
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalLostDaysTot; TotalLostDaysTot)
            {
                DecimalPlaces = 0 : 2;
            }
            column(ActFishDaysTot; ActFishDaysTot)
            {
                DecimalPlaces = 0 : 2;
            }
            column(AvgFishDaysTot; AvgFishDaysTot)
            {
                DecimalPlaces = 0 : 2;
            }
            column(ChorCountAvg; ChorCountAvg)
            {
                DecimalPlaces = 0 : 2;
            }
            column(OthrCountAvg; OthrCountAvg)
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalLostDaysAvg; TotalLostDaysAvg)
            {
                DecimalPlaces = 0 : 2;
            }
            column(ActFishDaysAvg; ActFishDaysAvg)
            {
                DecimalPlaces = 0 : 2;
            }
            column(AvgFishDaysAvg; AvgFishDaysAvg)
            {
                DecimalPlaces = 0 : 2;
            }
            column(OperationCaption; OperationCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Sr__No_Caption; Sr__No_CaptionLbl)
            {
            }
            column(VesselCaption; VesselCaptionLbl)
            {
            }
            column(SkipperCaption; SkipperCaptionLbl)
            {
            }
            column(Sea_DaysCaption; Sea_DaysCaptionLbl)
            {
            }
            column(ActFishDaysCaption; ActFishDaysCaptionLbl)
            {
            }
            column(AvgFishDaysCaption; AvgFishDaysCaptionLbl)
            {
            }
            column(PtsCaption; PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption; Fish_PtsCaptionLbl)
            {
            }
            column(Shrimp_PtsCaption; Shrimp_PtsCaptionLbl)
            {
            }
            column(Day_PtsCaption; Day_PtsCaptionLbl)
            {
            }
            column(PtsCaption_Control1000000031; PtsCaption_Control1000000031Lbl)
            {
            }
            column(DaysCaption; DaysCaptionLbl)
            {
            }
            column(AverageCaption; AverageCaptionLbl)
            {
            }
            column(Lost_DaysCaption; Lost_DaysCaptionLbl)
            {
            }
            column(ChorCountCaption; ChorCountCaptionLbl)
            {
            }
            column(OthrCountCaption; OthrCountCaptionLbl)
            {
            }
            column(TotalLostDaysCaption; TotalLostDaysCaptionLbl)
            {
            }
            column(CummulativeCaption; CummulativeCaptionLbl)
            {
            }
            column(CountryCaption; CountryCaptionLbl)
            {
            }
            column(AVERAGECaption_Control1000000043; AVERAGECaption_Control1000000043Lbl)
            {
            }
            column(TOTALCaption; TOTALCaptionLbl)
            {
            }
            column(Job_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                if res.Get(Job."Person Responsible") then Skipper := res.Name;
                if RepDate <> 0D then
                    Workdat := RepDate
                else
                    Workdat := Today;

                j := 1;
                repeat
                    pts[j] := 0;
                    j := j + 1;
                until j = 10;

                job1.Get(Job."No.");
                // job1.SETRANGE(job1."Task Filter");
                job1.SetRange(job1."Posting Date Filter");

                JobLdgr.SetCurrentKey(JobLdgr."Job No.", JobLdgr."Posting Date");
                JobLdgr.SetFilter(JobLdgr."Job No.", job1."No.");
                JobLdgr.SetRange(JobLdgr."Posting Date", 0D, Workdat);
                JobLdgr.SetRange(JobLdgr.Type, 0, 1);
                if JobLdgr.Find('+') then begin
                    //   SeTemp:= JobLdgr."Step Code";
                    // SeArea:=JobLdgr."Phase Code";
                end
                else begin
                    SeTemp := '';
                    SeArea := '';
                end;

                // Lost Days
                StmgCount := 0;
                ChorCount := 0;
                OthrCount := 0;
                TotalLostDays := 0;
                ActFishDays := 0;
                AvgFishDays := 0;

                CommentLine.Reset();
                CommentLine.SetCurrentKey("No.", "Table Name", Deductible, "Global Dimension 1 Code", "Global Dimension 2 Code",
                 Date, "Day Lost Cause", "Day Lost Location", Vessel);

                CommentLine.SetRange("No.", Job."No.");
                CommentLine.SetRange(Date, 0D, Workdat);
                CommentLine.SetFilter("Day Lost Cause", '<>%1&<>%2', 'STMG', 'CHOR');
                CommentLine.CalcSums(CommentLine."Days Lost");
                OthrCount := CommentLine."Days Lost";

                CommentLine.SetFilter("Day Lost Cause", 'CHOR');
                CommentLine.CalcSums(CommentLine."Days Lost");
                ChorCount := CommentLine."Days Lost";

                TotalLostDays := Round(ChorCount + OthrCount, 0.01);

                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job1.SetRange(job1."Posting Date Filter", 0D, Workdat);
                //job1.CALCFIELDS(job1.Points);
                pts[6] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', '', '', job1.Vessel);

                //job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[5] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'SHR', '', job1.Vessel);

                // job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[4] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'FIS', '', job1.Vessel);

                //Average
                //AAA* IF  job1."Starting Date"<>0D THEN SeaDays:=TODAY-job1."Starting Date" ELSE SeaDays:=0;
                if job1."Starting Date" <> 0D then SeaDays := Workdat - job1."Starting Date" else SeaDays := 0;
                if SeaDays <> 0 then begin
                    pts[9] := pts[6] / SeaDays;
                    pts[8] := pts[5] / SeaDays;
                    pts[7] := pts[4] / SeaDays
                end;
                AvgPtSortBay := pts[9];
                Modify();

                ActFishDays := Round(SeaDays - TotalLostDays, 0.01);
                if ActFishDays <> 0 then
                    AvgFishDays := Round(pts[6] / ActFishDays, 0.01)
                else
                    AvgFishDays := 0;

                //Daily
                job1.SetFilter(job1."Posting Date Filter", '=%1', Workdat);
                // job1.SETRANGE(job1."Task Filter");
                //job1.CALCFIELDS(job1.Points);
                pts[3] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', '', '', job1.Vessel);

                //job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[2] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'SHR', '', job1.Vessel);

                //job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[1] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'FIS', '', job1.Vessel);

                //No Catch Record Exist
                //job1.SETRANGE(job1."Task Filter");
                //job1.SETRANGE(job1."Type Filter",0);
                job1.CalcFields(job1.NoCatchExist);
                NoCatch := job1.NoCatchExist;

                //SeaDaysTot:=SeaDaysTot+SeaDays;

                if TotalLostDays <> 0 then
                    iCount := iCount + 1;
            end;

            trigger OnPostDataItem()
            begin
                SetFilter(AvgPtSortBay, '<>0');
                SetFilter("Points Sort Bay", '<>0');
                SetRange("Fishing Country Code", '');
                //MESSAGE('Total no of Rec %1',COUNT);
                Medn := Round(Count / 2, 1, '<');
                //Sort Data Based on Average Points
                SetCurrentKey(AvgPtSortBay);
                if Find('+') then;
                Next(-Medn);
                MednVoy[2] := "No.";
            end;

            trigger OnPreDataItem()
            begin
                if not Historical then SetRange(Status, 2);
                SetFilter(AvgPtSortBay, '<>0');
                if Find('-') then
                    repeat
                        AvgPtSortBay := 0;
                        Modify();
                    until Next() = 0;
                SetFilter(AvgPtSortBay, '');
                if Find('-') then;

                iCount := 0;
            end;
        }
        dataitem(Job2; Job)
        {
            DataItemTableView = SORTING("Fishing Country Code", AvgPtSortBay) ORDER(Descending) WHERE("No." = FILTER('I' .. 'K'));
            column(Job2__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(Job2_Vessel; Vessel)
            {
            }
            column(Job2__No__; "No.")
            {
            }
            column(CountJ; CountJ)
            {
            }
            column(pts_1__Control1000000064; pts[1])
            {
            }
            column(pts_2__Control1000000065; pts[2])
            {
            }
            column(pts_3__Control1000000066; pts[3])
            {
            }
            column(pts_6__Control1000000069; pts[6])
            {
            }
            column(pts_9__Control1000000072; pts[9])
            {
            }
            column(Job2__Fishing_Country_Code__Control1000000060; "Fishing Country Code")
            {
            }
            column(UPPERCASE_FishCountry_; UpperCase(FishCountry))
            {
            }
            column(CountJ_Control1000000050; CountJ)
            {
            }
            column(pts_10_; pts[10])
            {
            }
            column(ActFishDays_Control1000000117; ActFishDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(AvgFishDays_Control1000000118; AvgFishDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalLostDays_Control1000000116; TotalLostDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(OthrCount_Control1000000115; OthrCount)
            {
                DecimalPlaces = 0 : 2;
            }
            column(ChorCount_Control1000000114; ChorCount)
            {
                DecimalPlaces = 0 : 2;
            }
            column(pts_9__Control1000000059; pts[9])
            {
            }
            column(pts_2__Control1000000052; pts[2])
            {
            }
            column(pts_1__Control1000000051; pts[1])
            {
            }
            column(pts_3__Control1000000053; pts[3])
            {
            }
            column(pts_6__Control1000000056; pts[6])
            {
            }
            column(AverageCaption_Control1000000075; AverageCaption_Control1000000075Lbl)
            {
            }
            column(Job2__Fishing_Country_Code_Caption; FieldCaption("Fishing Country Code"))
            {
            }

            trigger OnAfterGetRecord()
            begin

                if RepDate <> 0D then
                    Workdat := RepDate
                else
                    Workdat := Today;

                j := 1;
                repeat
                    pts[j] := 0;
                    j := j + 1;
                until j = 11;

                job3.Get(Job2."No.");
                // job3.SETRANGE(job3."Task Filter");
                job3.SetRange(job3."Posting Date Filter");

                JobLdgr.SetCurrentKey(JobLdgr."Job No.", JobLdgr."Posting Date");
                JobLdgr.SetFilter(JobLdgr."Job No.", job3."No.");
                JobLdgr.SetRange(JobLdgr."Posting Date", 0D, Workdat);
                JobLdgr.SetRange(JobLdgr.Type, 0, 1);
                if JobLdgr.Find('+') then begin
                    // SeTemp:= JobLdgr."Step Code";
                    // SeArea:=JobLdgr."Phase Code";
                end
                else begin
                    SeTemp := '';
                    SeArea := '';
                end;

                // Lost Days
                StmgCount := 0;
                ChorCount := 0;
                OthrCount := 0;
                TotalLostDays := 0;
                ActFishDays := 0;
                AvgFishDays := 0;

                CommentLine.Reset();
                CommentLine.SetCurrentKey("No.", "Table Name", Deductible, "Global Dimension 1 Code", "Global Dimension 2 Code",
                 Date, "Day Lost Cause", "Day Lost Location", Vessel);

                CommentLine.SetRange("No.", Job2."No.");
                CommentLine.SetRange(Date, 0D, Workdat);
                CommentLine.SetFilter("Day Lost Cause", '<>%1&<>%2', 'STMG', 'CHOR');
                CommentLine.CalcSums(CommentLine."Days Lost");
                OthrCount := CommentLine."Days Lost";

                CommentLine.SetFilter("Day Lost Cause", 'CHOR');
                CommentLine.CalcSums(CommentLine."Days Lost");
                ChorCount := CommentLine."Days Lost";

                TotalLostDays := Round(ChorCount + OthrCount, 0.01);

                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job3.SetRange(job3."Posting Date Filter", 0D, Workdat);
                //job3.CALCFIELDS(job3.Points);
                pts[6] := job3.PointZ(job3."No.", '', job3.GetFilter("Posting Date Filter"), '', '', '', job3.Vessel);//job3.Points;

                //job3.SETFILTER(job3."Task Filter",'SHR');
                //job3.CALCFIELDS(job3.Points);
                pts[5] := job3.PointZ(job3."No.", '', job3.GetFilter("Posting Date Filter"), '', 'SHR', '', job3.Vessel);//job3.Points;

                //job3.SETFILTER(job3."Task Filter",'FIS');
                //job3.CALCFIELDS(job3.Points);
                pts[4] := job3.PointZ(job3."No.", '', job3.GetFilter("Posting Date Filter"), '', 'FIS', '', job3.Vessel);//job3.Points;

                //Average
                //AAA* IF  job3."Starting Date"<>0D THEN SeaDays:=TODAY-job3."Starting Date" ELSE SeaDays:=0;
                if job3."Starting Date" <> 0D then SeaDays := Workdat - job3."Starting Date" else SeaDays := 0;
                if SeaDays <> 0 then begin
                    pts[9] := pts[6] / SeaDays;
                    pts[8] := pts[5] / SeaDays;
                    pts[7] := pts[4] / SeaDays
                end;

                ActFishDays := Round(SeaDays - TotalLostDays, 0.01);
                if ActFishDays <> 0 then
                    AvgFishDays := Round(pts[6] / ActFishDays, 0.01)
                else
                    AvgFishDays := 0;

                //Daily
                job3.SetFilter(job3."Posting Date Filter", '=%1', Workdat);
                // job3.SETRANGE(job3."Task Filter");
                //job3.CALCFIELDS(job3.Points);
                pts[3] := job3.PointZ(job3."No.", '', job3.GetFilter("Posting Date Filter"), '', '', '', job3.Vessel);//job3.Points;

                // job3.SETFILTER(job3."Task Filter",'SHR');
                //job3.CALCFIELDS(job3.Points);
                pts[2] := job3.PointZ(job3."No.", '', job3.GetFilter("Posting Date Filter"), '', 'SHR', '', job3.Vessel);//job3.Points;

                // job3.SETFILTER(job3."Task Filter",'FIS');
                //job3.CALCFIELDS(job3.Points);
                pts[1] := job3.PointZ(job3."No.", '', job3.GetFilter("Posting Date Filter"), '', 'FIS', '', job3.Vessel);//job3.Points;

                if pts[3] = 0 then CurrReport.Skip();

                //No Catch Record Exist
                // job3.SETRANGE(job3."Task Filter");
                // job3.SETRANGE(job3."Type Filter",0);
                job3.CalcFields(job3.NoCatchExist);
                NoCatch := job3.NoCatchExist;

                pts[10] := SeaDays;
            end;

            trigger OnPreDataItem()
            begin
                if not Historical then SetRange(Status, 2);
                LastFieldNo := FieldNo("Fishing Country Code");
                //Job2.SETFILTER(Job2."Date Filter",'%1',040104D);
                j := 1;
                repeat CurrReport.CreateTotals(pts[j]); j := j + 1; until j = 11;
                CurrReport.CreateTotals(ChorCount, OthrCount, ActFishDays, AvgFishDays, TotalLostDays);
            end;
        }
        dataitem(VoyMedian; Job)
        {
            DataItemTableView = SORTING("Points Sort Bay", Status) ORDER(Descending) WHERE("No." = FILTER('I' .. 'K'));
            column(Desc_Control1000000077; Desc)
            {
            }
            column(VoyMedian__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(pts_9__Control1000000090; pts[9])
            {
            }
            column(ChorCount_Control1000000112; ChorCount)
            {
                DecimalPlaces = 0 : 2;
            }
            column(OthrCount_Control1000000111; OthrCount)
            {
                DecimalPlaces = 0 : 2;
            }
            column(TotalLostDays_Control1000000110; TotalLostDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(ActFishDays_Control1000000081; ActFishDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(AvgFishDays_Control1000000079; AvgFishDays)
            {
                DecimalPlaces = 0 : 2;
            }
            column(SeaDays_Control1000000080; SeaDays)
            {
            }
            column(pts_1__Control1000000082; pts[1])
            {
            }
            column(pts_2__Control1000000083; pts[2])
            {
            }
            column(pts_3__Control1000000084; pts[3])
            {
            }
            column(pts_6__Control1000000087; pts[6])
            {
            }
            column(pts_1__Control1000000091; pts[1])
            {
            }
            column(pts_2__Control1000000092; pts[2])
            {
            }
            column(pts_3__Control1000000093; pts[3])
            {
            }
            column(pts_6__Control1000000096; pts[6])
            {
            }
            column(pts_9__Control1000000099; pts[9])
            {
            }
            column(Median_NigeriaCaption; Median_NigeriaCaptionLbl)
            {
            }
            column(VoyMedian_No_; "No.")
            {
            }

            trigger OnAfterGetRecord()
            begin

                job1.Get("No.");
                //job1.SETRANGE(job1."Task Filter");
                job1.SetRange(job1."Posting Date Filter");

                JobLdgr.SetCurrentKey(JobLdgr."Job No.", JobLdgr."Posting Date");
                JobLdgr.SetFilter(JobLdgr."Job No.", job1."No.");
                JobLdgr.SetRange(JobLdgr."Posting Date", 0D, Workdat);
                JobLdgr.SetRange(JobLdgr.Type, 0, 1);
                if JobLdgr.Find('+') then begin
                    // SeTemp:= JobLdgr."Step Code";
                    // SeArea:=JobLdgr."Phase Code";
                end
                else begin
                    SeTemp := '';
                    SeArea := '';
                end;

                StmgCount := 0;
                ChorCount := 0;
                OthrCount := 0;
                TotalLostDays := 0;
                ActFishDays := 0;
                AvgFishDays := 0;

                // Lost Days
                CommentLine.Reset();
                CommentLine.SetCurrentKey("No.", "Table Name", Deductible, "Global Dimension 1 Code", "Global Dimension 2 Code",
                 Date, "Day Lost Cause", "Day Lost Location", Vessel);

                CommentLine.SetRange("No.", VoyMedian."No.");
                CommentLine.SetRange(Date, 0D, Workdat);
                CommentLine.SetFilter("Day Lost Cause", '<>%1&<>%2', 'STMG', 'CHOR');
                CommentLine.CalcSums(CommentLine."Days Lost");
                OthrCount := CommentLine."Days Lost";

                CommentLine.SetFilter("Day Lost Cause", 'CHOR');
                CommentLine.CalcSums(CommentLine."Days Lost");
                ChorCount := CommentLine."Days Lost";

                TotalLostDays := Round(ChorCount + OthrCount, 0.01);

                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job1.SetRange(job1."Posting Date Filter", 0D, Workdat);
                //job1.CALCFIELDS(job1.Points);
                pts[6] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', '', '', job1.Vessel);//job1.Points;

                // job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[5] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'SHR', '', job1.Vessel);//job1.Points;

                // job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[4] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'FIS', '', job1.Vessel);//job1.Points;

                //Average
                //AAA* IF  job1."Starting Date"<>0D THEN SeaDays:=TODAY-job1."Starting Date" ELSE SeaDays:=0;
                if job1."Starting Date" <> 0D then SeaDays := Workdat - job1."Starting Date" else SeaDays := 0;
                if SeaDays <> 0 then begin
                    pts[9] := pts[6] / SeaDays;
                    pts[8] := pts[5] / SeaDays;
                    pts[7] := pts[4] / SeaDays
                end;

                ActFishDays := Round(SeaDays - TotalLostDays, 0.01);
                if ActFishDays <> 0 then
                    AvgFishDays := Round(pts[6] / ActFishDays, 0.01)
                else
                    AvgFishDays := 0;

                //Daily
                job1.SetFilter(job1."Posting Date Filter", '=%1', Workdat);
                // job1.SETRANGE(job1."Task Filter");
                //job1.CALCFIELDS(job1.Points);
                pts[3] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', '', '', job1.Vessel);//job1.Points;

                // job1.SETFILTER(job1."Task Filter",'SHR');
                //job1.CALCFIELDS(job1.Points);
                pts[2] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'SHR', '', job1.Vessel);//job1.Points;

                //job1.SETFILTER(job1."Task Filter",'FIS');
                //job1.CALCFIELDS(job1.Points);
                pts[1] := job1.PointZ(job1."No.", '', job1.GetFilter("Posting Date Filter"), '', 'FIS', '', job1.Vessel);//job1.Points;
            end;

            trigger OnPreDataItem()
            begin
                if not Historical then SetRange(Status, 2);
                VoyMedian.SetFilter(VoyMedian."No.", '%1|%2', MednVoy[1], MednVoy[2]);
                j := 1;
                repeat CurrReport.CreateTotals(pts[j]); j := j + 1; until j = 10;
                CurrReport.CreateTotals(ChorCount, OthrCount, ActFishDays, AvgFishDays, TotalLostDays);
            end;
        }
    }

    requestpage
    {
        SaveValues = True;
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

    trigger OnInitReport()
    begin
        Bold := true;
        UnderLine := true;
        Italic := true;
        TopPage := true;
        PageOrientation := 1;
        FontSize := 7;
    end;

    var
        job1: Record Job;
        JobLdgr: Record "Job Ledger Entry";
        JobsPointVal: Record Job;
        NoCatch: Boolean;
        SeaDays: Integer;
        j: Integer;
        Countz: Integer;
        pts: array[10] of Decimal;
        TotPts: array[9] of Decimal;
        TotPtsA: array[9] of Decimal;
        SeaDaysTot: Decimal;
        SeaDayA: Integer;
        Skipper: Text[30];
        Desc: Text[30];
        SeTemp: Code[10];
        SeArea: Code[10];
        DOT: Code[15];
        Workdat: Date;
        RepDate: Date;
        job3: Record Job;
        LastFieldNo: Integer;
        FishCountry: Text[100];
        Medn: Decimal;
        MednVoy: array[2] of Code[10];
        CountJ: Integer;
        Historical: Boolean;
        StmgCount: Decimal;
        ChorCount: Decimal;
        OthrCount: Decimal;
        ActFishDays: Decimal;
        AvgFishDays: Decimal;
        TotalLostDays: Decimal;
        ChorCountTot: Decimal;
        OthrCountTot: Decimal;
        ActFishDaysTot: Decimal;
        AvgFishDaysTot: Decimal;
        TotalLostDaysTot: Decimal;
        ChorCountAvg: Decimal;
        OthrCountAvg: Decimal;
        ActFishDaysAvg: Decimal;
        AvgFishDaysAvg: Decimal;
        TotalLostDaysAvg: Decimal;
        iCount: Integer;
        CommentLine: Record "Comment Line";
        TopPage: Boolean;
        Bold: Boolean;
        UnderLine: Boolean;
        Italic: Boolean;
        FontSize: Integer;
        PageOrientation: Option "Excel Default",Portrait,Landscape;
        OperationCaptionLbl: Label 'Operation';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Sr__No_CaptionLbl: Label 'Sr. No.';
        VesselCaptionLbl: Label 'Vessel';
        SkipperCaptionLbl: Label 'Captain';
        Sea_DaysCaptionLbl: Label 'Sea Days';
        ActFishDaysCaptionLbl: Label 'Actual FIS Day';
        AvgFishDaysCaptionLbl: Label 'Avg Fish Days';
        PtsCaptionLbl: Label 'Pts';
        Fish_PtsCaptionLbl: Label 'Fish Pts';
        Shrimp_PtsCaptionLbl: Label 'Shrimp Pts';
        Day_PtsCaptionLbl: Label 'Day Pts';
        PtsCaption_Control1000000031Lbl: Label 'Pts';
        DaysCaptionLbl: Label 'Days';
        AverageCaptionLbl: Label 'Average';
        Lost_DaysCaptionLbl: Label 'Lost Days';
        ChorCountCaptionLbl: Label 'CHOR';
        OthrCountCaptionLbl: Label 'OTHR';
        TotalLostDaysCaptionLbl: Label 'Total';
        CummulativeCaptionLbl: Label 'Cummulative';
        CountryCaptionLbl: Label 'Country';
        AVERAGECaption_Control1000000043Lbl: Label 'AVERAGE';
        TOTALCaptionLbl: Label 'TOTAL';
        AverageCaption_Control1000000075Lbl: Label 'Average';
        Median_NigeriaCaptionLbl: Label 'Median Nigeria';
        res: Record Resource;

    /* [Scope('OnPrem')]
     procedure UpdateCell(Row: Integer; Col: Integer; ValueText: Text[200]; Bold: Boolean; Italic: Boolean; Underline: Boolean; FontSize: Integer)
     begin
         xlSheet.Range(GetCol(Col) + Format(Row)).Value := ValueText;
         if Bold then
             xlSheet.Range(GetCol(Col) + Format(Row)).Font.Bold := Bold;
         if Italic then
             xlSheet.Range(GetCol(Col) + Format(Row)).Font.Italic := Italic;
         if Underline then
             xlSheet.Range(GetCol(Col) + Format(Row)).Font.Underline := Underline;
         xlSheet.Range(GetCol(Col) + Format(Row)).Font.Size := FontSize;
     end;

     [Scope('OnPrem')]
     procedure GetCol(CN: Integer): Text[30]
     var
         xlColID: Text[10];
         x: Integer;
         c: Integer;
         i: Integer;
     begin
         xlColID := '';
         if CN <> 0 then begin
             x := CN - 1;
             c := 65 + x mod 26;
             xlColID[10] := c;
             i := 10;
             while x > 25 do begin
                 x := x div 26;
                 i := i - 1;
                 c := 64 + x mod 26;
                 xlColID[i] := c;
             end;
             for x := i to 10 do
                 xlColID[1 + x - i] := xlColID[x];
         end;
         exit(xlColID);
     end;*/
}
