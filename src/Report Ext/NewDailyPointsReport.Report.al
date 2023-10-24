report 50075 "New Daily Points Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/NewDailyPointsReport.rdlc';
    Caption = 'New Daily Points Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;

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
                    JobsPointVal.SetFilter(JobsPointVal."Date Filter", '%1', RepDate)
                else
                    JobsPointVal.SetFilter(JobsPointVal."Date Filter", '%1..%2', 19800101D, Today);

                //MESSAGE('Report Date is %1',RepDate);
                if JobsPointVal.Find('-') then
                    repeat
                        //JobsPointVal.CALCFIELDS(JobsPointVal.Points);
                        //IF JobsPointVal.Points <>0 THEN ; //MESSAGE('Val is %1',JobsPointVal.Points);
                        JobsPointVal."Points Sort Bay" := JobsPointVal.PointZ(JobsPointVal."No.", '',
                           JobsPointVal.GetFilter("Date Filter"), '', '', '', JobsPointVal.Vessel);//JobsPointVal.Points;
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
            column(Job__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(Skipper; Skipper)
            {
            }
            column(SeArea; SeArea)
            {
            }
            column(SeTemp; SeTemp)
            {
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
            column(pts_7_; pts[7])
            {
            }
            column(pts_8_; pts[8])
            {
            }
            column(pts_9_; pts[9])
            {
            }
            column(pts_4_; pts[4])
            {
            }
            column(pts_5_; pts[5])
            {
            }
            column(pts_6_; pts[6])
            {
            }
            column(SeaDays; SeaDays)
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
            column(TotPts_4_; TotPts[4])
            {
            }
            column(TotPts_5_; TotPts[5])
            {
            }
            column(TotPts_6_; TotPts[6])
            {
            }
            column(TotPts_7_; TotPts[7])
            {
            }
            column(TotPts_8_; TotPts[8])
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
            column(TotPtsA_4_; TotPtsA[4])
            {
            }
            column(TotPtsA_5_; TotPtsA[5])
            {
            }
            column(TotPtsA_6_; TotPtsA[6])
            {
            }
            column(TotPtsA_7_; TotPtsA[7])
            {
            }
            column(TotPtsA_8_; TotPtsA[8])
            {
            }
            column(TotPtsA_9_; TotPtsA[9])
            {
            }
            column(SeaDaysTot; SeaDaysTot)
            {
            }
            column(SeaTempA; SeaTempA)
            {
            }
            column(SeaDayA; SeaDayA)
            {
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
            column(CountryCaption; CountryCaptionLbl)
            {
            }
            column(SkipperCaption; SkipperCaptionLbl)
            {
            }
            column(Sea_DaysCaption; Sea_DaysCaptionLbl)
            {
            }
            column(AreaCaption; AreaCaptionLbl)
            {
            }
            column(Sea_Temp__CCaption; Sea_Temp__CCaptionLbl)
            {
            }
            column(Shrimp_PtsCaption; Shrimp_PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption; Fish_PtsCaptionLbl)
            {
            }
            column(PtsCaption; PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption_Control1000000010; Fish_PtsCaption_Control1000000010Lbl)
            {
            }
            column(Shrimp_PtsCaption_Control1000000011; Shrimp_PtsCaption_Control1000000011Lbl)
            {
            }
            column(Day_PtsCaption; Day_PtsCaptionLbl)
            {
            }
            column(Fish_PtsCaption_Control1000000016; Fish_PtsCaption_Control1000000016Lbl)
            {
            }
            column(Shrimp_PtsCaption_Control1000000017; Shrimp_PtsCaption_Control1000000017Lbl)
            {
            }
            column(PtsCaption_Control1000000031; PtsCaption_Control1000000031Lbl)
            {
            }
            column(DaysCaption; DaysCaptionLbl)
            {
            }
            column(CumulativeCaption; CumulativeCaptionLbl)
            {
            }
            column(AverageCaption; AverageCaptionLbl)
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
                //job1.SETRANGE(job1."Task Filter"); //#1
                job1.SetRange(job1."Date Filter");

                JobLdgr.SetCurrentKey(JobLdgr."Job No.", JobLdgr."Posting Date");
                JobLdgr.SetFilter(JobLdgr."Job No.", job1."No.");
                JobLdgr.SetRange(JobLdgr."Posting Date", 0D, Workdat);
                JobLdgr.SetRange(JobLdgr.Type, 0, 1);
                if JobLdgr.Find('+') then begin
                    //SeTemp:= JobLdgr."Step Code"; //#1
                    //SeArea:=JobLdgr."Phase Code"; //#1
                end
                else begin
                    SeTemp := '';
                    SeArea := '';
                end;

                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job1.SetRange(job1."Date Filter", 0D, Workdat);
                //job1.CALCFIELDS(job1.Points);
                pts[6] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', '', '', job1.Vessel);  //job1.Points;

                //job1.SETFILTER(job1."Task Filter",'SHR');//#1
                //job1.CALCFIELDS(job1.Points);
                pts[5] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'SHR', '', job1.Vessel);//job1.Points;

                //job1.SETFILTER(job1."Task Filter",'FIS');//#1
                //job1.CALCFIELDS(job1.Points);
                pts[4] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'FIS', '', job1.Vessel); //job1.Points;

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

                //Daily
                job1.SetFilter(job1."Date Filter", '=%1', Workdat);
                //job1.SETRANGE(job1."Task Filter"); //#1
                //job1.CALCFIELDS(job1.Points);
                pts[3] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', '', '', job1.Vessel);//job1.Points;

                pts[2] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'SHR', '', job1.Vessel);//job1.Points;
                pts[1] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'FIS', '', job1.Vessel);//job1.Points;

                job1.CalcFields(job1.NoCatchExist);
                NoCatch := job1.NoCatchExist;
                Desc := '';
                if Loc.Get(Vessel) then Desc := Loc.Name;
                //SeaDaysTot:=SeaDaysTot+SeaDays;

                if res.Get("Person Responsible") then
                    Skipper := res.Name
                else
                    Skipper := "Person Responsible";
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

                /*IF ((ROUND(COUNT/2,1,'>'))-(ROUND(COUNT/2,1,'<')))=0 THEN
                NEXT(-1);
                MednVoy[1]:="No.";
                //MESSAGE('Voyages are %1 and %2',MednVoy[1],MednVoy[2])
                */
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
            end;
        }
        dataitem(Job2; Job)
        {
            DataItemTableView = SORTING("Fishing Country Code", AvgPtSortBay) ORDER(Descending) WHERE("No." = FILTER('I' .. 'K'));
            column(Job2__Fishing_Country_Code_; "Fishing Country Code")
            {
            }
            column(Job2__Fishing_Country_Code__Control1000000060; "Fishing Country Code")
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
            column(pts_4__Control1000000067; pts[4])
            {
            }
            column(pts_5__Control1000000068; pts[5])
            {
            }
            column(pts_6__Control1000000069; pts[6])
            {
            }
            column(pts_7__Control1000000070; pts[7])
            {
            }
            column(pts_8__Control1000000071; pts[8])
            {
            }
            column(pts_9__Control1000000072; pts[9])
            {
            }
            column(UPPERCASE_FishCountry_; UpperCase(FishCountry))
            {
            }
            column(CountJ_Control1000000050; CountJ)
            {
            }
            column(pts_1__Control1000000051; pts[1])
            {
            }
            column(pts_2__Control1000000052; pts[2])
            {
            }
            column(pts_3__Control1000000053; pts[3])
            {
            }
            column(pts_4__Control1000000054; pts[4])
            {
            }
            column(pts_5__Control1000000055; pts[5])
            {
            }
            column(pts_6__Control1000000056; pts[6])
            {
            }
            column(pts_7__Control1000000057; pts[7])
            {
            }
            column(pts_8__Control1000000058; pts[8])
            {
            }
            column(pts_9__Control1000000059; pts[9])
            {
            }
            column(pts_10_; pts[10])
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
                //job3.SETRANGE(job3."Task Filter"); //#1
                job3.SetRange(job3."Date Filter");

                JobLdgr.SetCurrentKey(JobLdgr."Job No.", JobLdgr."Posting Date");
                JobLdgr.SetFilter(JobLdgr."Job No.", job3."No.");
                JobLdgr.SetRange(JobLdgr."Posting Date", 0D, Workdat);
                JobLdgr.SetRange(JobLdgr.Type, 0, 1);
                if JobLdgr.Find('+') then begin
                    //SeTemp:= JobLdgr."Step Code";//#1
                    //SeArea:=JobLdgr."Phase Code"; //#1
                end
                else begin
                    SeTemp := '';
                    SeArea := '';
                end;

                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job3.SetRange(job3."Date Filter", 0D, Workdat);
                //job3.CALCFIELDS(job3.Points);
                pts[6] := job3.PointZ(job3."No.", '', job3.GetFilter("Date Filter"), '', '', '', job3.Vessel);//job3.Points;

                //job3.SETFILTER(job3."Task Filter",'SHR'); //#1
                //job3.CALCFIELDS(job3.Points);
                pts[5] := job3.PointZ(job3."No.", '', job3.GetFilter("Date Filter"), '', 'SHR', '', job3.Vessel);//job3.Points;

                //job3.SETFILTER(job3."Task Filter",'FIS');//#1
                //job3.CALCFIELDS(job3.Points);
                pts[4] := job3.PointZ(job3."No.", '', job3.GetFilter("Date Filter"), '', 'FIS', '', job3.Vessel);//job3.Points;

                //Average
                //AAA* IF  job3."Starting Date"<>0D THEN SeaDays:=TODAY-job3."Starting Date" ELSE SeaDays:=0;
                if job3."Starting Date" <> 0D then SeaDays := Workdat - job3."Starting Date" else SeaDays := 0;
                if SeaDays <> 0 then begin
                    pts[9] := pts[6] / SeaDays;
                    pts[8] := pts[5] / SeaDays;
                    pts[7] := pts[4] / SeaDays
                end;

                //Daily
                job3.SetFilter(job3."Date Filter", '=%1', Workdat);
                //job3.SETRANGE(job3."Task Filter");//#1
                //job3.CALCFIELDS(job3.Points);
                pts[3] := job3.PointZ(job3."No.", '', job3.GetFilter("Date Filter"), '', '', '', job3.Vessel);//job3.Points;

                //job3.SETFILTER(job3."Task Filter",'SHR');//#1
                //job3.CALCFIELDS(job3.Points);
                pts[2] := job3.PointZ(job3."No.", '', job3.GetFilter("Date Filter"), '', 'SHR', '', job3.Vessel);//job3.Points;

                //job3.SETFILTER(job3."Task Filter",'FIS');
                //job3.CALCFIELDS(job3.Points);
                pts[1] := job3.PointZ(job3."No.", '', job3.GetFilter("Date Filter"), '', 'FIS', '', job3.Vessel);//job3.Points;

                if pts[3] = 0 then CurrReport.Skip();

                //No Catch Record Exist
                //job3.SETRANGE(job3."Task Filter");//31
                //job3.SETRANGE(job3."Type Filter",0);//#1
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
            column(Skipper_Control1000000079; Skipper)
            {
            }
            column(SeaDays_Control1000000080; SeaDays)
            {
            }
            column(SeArea_Control1000000081; SeArea)
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
            column(pts_4__Control1000000085; pts[4])
            {
            }
            column(pts_5__Control1000000086; pts[5])
            {
            }
            column(pts_6__Control1000000087; pts[6])
            {
            }
            column(pts_7__Control1000000088; pts[7])
            {
            }
            column(pts_8__Control1000000089; pts[8])
            {
            }
            column(pts_9__Control1000000090; pts[9])
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
            column(pts_4__Control1000000094; pts[4])
            {
            }
            column(pts_5__Control1000000095; pts[5])
            {
            }
            column(pts_6__Control1000000096; pts[6])
            {
            }
            column(pts_7__Control1000000097; pts[7])
            {
            }
            column(pts_8__Control1000000098; pts[8])
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
                //job1.SETRANGE(job1."Task Filter");//#1
                job1.SetRange(job1."Date Filter");

                JobLdgr.SetCurrentKey(JobLdgr."Job No.", JobLdgr."Posting Date");
                JobLdgr.SetFilter(JobLdgr."Job No.", job1."No.");
                JobLdgr.SetRange(JobLdgr."Posting Date", 0D, Workdat);
                JobLdgr.SetRange(JobLdgr.Type, 0, 1);
                if JobLdgr.Find('+') then begin
                    //SeTemp:= JobLdgr."Step Code";//#1
                    //SeArea:=JobLdgr."Phase Code"; //#1
                end
                else begin
                    SeTemp := '';
                    SeArea := '';
                end;

                // Cumulative
                //MESSAGE('Date is %1',Workdat);
                job1.SetRange(job1."Date Filter", 0D, Workdat);
                //job1.CALCFIELDS(job1.Points);
                pts[6] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', '', '', job1.Vessel);//job1.Points;

                //job1.SETFILTER(job1."Task Filter",'SHR'); //#1
                //job1.CALCFIELDS(job1.Points);
                pts[5] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'SHR', '', job1.Vessel);//job1.Points;

                //job1.SETFILTER(job1."Task Filter",'FIS');//#1
                //job1.CALCFIELDS(job1.Points);
                pts[4] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'FIS', '', job1.Vessel);//job1.Points;

                //Average
                //AAA* IF  job1."Starting Date"<>0D THEN SeaDays:=TODAY-job1."Starting Date" ELSE SeaDays:=0;
                if job1."Starting Date" <> 0D then SeaDays := Workdat - job1."Starting Date" else SeaDays := 0;
                if SeaDays <> 0 then begin
                    pts[9] := pts[6] / SeaDays;
                    pts[8] := pts[5] / SeaDays;
                    pts[7] := pts[4] / SeaDays
                end;

                //Daily
                job1.SetFilter(job1."Date Filter", '=%1', Workdat);
                //job1.SETRANGE(job1."Task Filter");//#1
                //job1.CALCFIELDS(job1.Points);
                pts[3] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', '', '', job1.Vessel);//job1.Points;

                //job1.SETFILTER(job1."Task Filter",'SHR');//#1
                //job1.CALCFIELDS(job1.Points);
                pts[2] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'SHR', '', job1.Vessel);//job1.Points;

                //job1.SETFILTER(job1."Task Filter",'FIS');//#1
                //job1.CALCFIELDS(job1.Points);
                pts[1] := job1.PointZ(job1."No.", '', job1.GetFilter("Date Filter"), '', 'FIS', '', job1.Vessel);//job1.Points;
            end;

            trigger OnPreDataItem()
            begin
                if not Historical then SetRange(Status, 2);
                VoyMedian.SetFilter(VoyMedian."No.", '%1|%2', MednVoy[1], MednVoy[2]);
                j := 1;
                repeat CurrReport.CreateTotals(pts[j]); j := j + 1; until j = 10;
            end;
        }
    }

    requestpage
    { SaveValues = true;
        layout
        {
            area(content)
            {
                field(RepDate; RepDate)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin

                        if DOTrec.Get(RepDate) then
                            DOT := DOTrec."Day of tide"
                        else begin
                            DOTrec.Date := RepDate;
                            DOT := ' ';
                            DOTrec.Insert();
                        end;
                    end;
                }
                field("Day Of Tide"; DOT)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin

                        if DOTrec.Get(RepDate) then begin
                            DOTrec."Day of tide" := DOT;
                            DOTrec.Modify();
                        end
                        else begin
                            DOTrec.Date := RepDate;
                            DOTrec."Day of tide" := DOT;
                            DOTrec.Insert();
                        end;
                    end;
                }
                field(Historical; Historical)
                {
                    ApplicationArea = All;
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

    var
        job1: Record Job;
        JobLdgr: Record "Job Ledger Entry";
        DOTrec: Record "Day of Tide";
        JobsPointVal: Record Job;
        Loc: Record Location;
        NoCatch: Boolean;
        SeaDays: Integer;
        j: Integer;
        Countz: Integer;
        pts: array[10] of Decimal;
        TotPts: array[9] of Decimal;
        TotPtsA: array[9] of Decimal;
        SeaDaysTot: Decimal;
        SeaDayA: Integer;
        SeaTempA: Decimal;
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
        OperationCaptionLbl: Label 'Operation';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Sr__No_CaptionLbl: Label 'Sr. No.';
        VesselCaptionLbl: Label 'Vessel';
        CountryCaptionLbl: Label 'Country';
        SkipperCaptionLbl: Label 'Skipper';
        Sea_DaysCaptionLbl: Label 'Sea Days';
        AreaCaptionLbl: Label 'Area';
        Sea_Temp__CCaptionLbl: Label 'Sea Temp. C';
        Shrimp_PtsCaptionLbl: Label 'Shrimp Pts';
        Fish_PtsCaptionLbl: Label 'Fish Pts';
        PtsCaptionLbl: Label 'Pts';
        Fish_PtsCaption_Control1000000010Lbl: Label 'Fish Pts';
        Shrimp_PtsCaption_Control1000000011Lbl: Label 'Shrimp Pts';
        Day_PtsCaptionLbl: Label 'Day Pts';
        Fish_PtsCaption_Control1000000016Lbl: Label 'Fish Pts';
        Shrimp_PtsCaption_Control1000000017Lbl: Label 'Shrimp Pts';
        PtsCaption_Control1000000031Lbl: Label 'Pts';
        DaysCaptionLbl: Label 'Days';
        CumulativeCaptionLbl: Label 'Cumulative';
        AverageCaptionLbl: Label 'Average';
        AVERAGECaption_Control1000000043Lbl: Label 'AVERAGE';
        TOTALCaptionLbl: Label 'TOTAL';
        AverageCaption_Control1000000075Lbl: Label 'Average';
        Median_NigeriaCaptionLbl: Label 'Median Nigeria';
        res: Record Resource;
}
