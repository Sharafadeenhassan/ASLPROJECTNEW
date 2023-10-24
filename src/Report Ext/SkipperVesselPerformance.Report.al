report 50049 "Skipper/Vessel Performance"
{
    // {EndDate
    // Consd_Deductible_Days
    // NetSeaDay
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/SkipperVesselPerformance.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Skipper/Vessel Performance';
    AllowScheduling = true; 
    dataset
    {
        dataitem("Jobs Point Validate"; Job)
        {
            DataItemTableView = SORTING("No.") WHERE("Sea Days" = FILTER(> 0), "Voyage Ended" = CONST(true));
            RequestFilterFields = "No.";
            column(Jobs_Point_Validate__No__; "No.")
            {
            }
            column(Jobs_Point_Validate__Points_Sort_Bay_; "Points Sort Bay")
            {
            }
            column(Jobs_Point_Validate__Points_Actual_; "Points Actual")
            {
            }
            column(Jobs_Point_Validate_Points; Points)
            {
            }
            column(Jobs_Point_Validate__Points_Actual_Caption; FieldCaption("Points Actual"))
            {
            }
            column(Jobs_Point_Validate__Points_Sort_Bay_Caption; FieldCaption("Points Sort Bay"))
            {
            }
            column(Jobs_Point_Validate_PointsCaption; FieldCaption(Points))
            {
            }
            column(Jobs_Point_Validate__No__Caption; FieldCaption("No."))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            dataitem(Job; Job)
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("Fishing Country Code", AvgPtSortBay) ORDER(Descending) WHERE("Sea Days" = FILTER(> 0), "Voyage Ended" = CONST(true));
                RequestFilterFields = "Voyage No.", "Ending Date";
                column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                {
                }
                column(CurrReport_PAGENO; CurrReport.PageNo())
                {
                }
                column(USERID; UserId)
                {
                }
                column(DataItem1000000002; 'Skipper / Vessel Performance from ' + Format(GetRangeMin("Ending Date"), 0, 4) + ' to ' + Format(GetRangeMax("Ending Date"), 0, 4))
                {
                }
                column(FCountry; FCountry)
                {
                }
                column(Rems; Rems)
                {
                }
                column(AvgFuel; AvgFuel)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Countz; Countz)
                {
                }
                column(Job_Vessel; Vessel)
                {
                }
                column(Job__Voyage_No__; "Voyage No.")
                {
                }
                column(Job__Starting_Date_; "Starting Date")
                {
                }
                column(Job__Ending_Date_; "Ending Date")
                {
                }
                column(NetSeaDay; NetSeaDay)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Job__Points_Actual_; "Points Actual")
                {
                }
                column(Points_Actual__NetSeaDay; "Points Actual" / NetSeaDay)
                {
                }
                column(Shrimp_2_; Shrimp[2])
                {
                }
                column(Fish_2_; Fish[2])
                {
                }
                column(Job__Fuel_Consumed_; "Fuel Consumed")
                {
                    DecimalPlaces = 0 : 0;
                }
                column(PResp; PResp)
                {
                }
                column(Countz_Control8; Countz)
                {
                }
                column(Job_Vessel_Control14; Vessel)
                {
                }
                column(Job__Voyage_No___Control17; "Voyage No.")
                {
                }
                column(Job__Starting_Date__Control26; "Starting Date")
                {
                }
                column(Job__Ending_Date__Control29; "Ending Date")
                {
                }
                column(NetSeaDay_Control32; NetSeaDay)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Job__Points_Actual__Control35; "Points Actual")
                {
                }
                column(Points_Actual__NetSeaDay_Control38; "Points Actual" / NetSeaDay)
                {
                }
                column(Shrimp_2__Control41; Shrimp[2])
                {
                }
                column(Fish_2__Control44; Fish[2])
                {
                }
                column(Job__Fuel_Consumed__Control1000000011; "Fuel Consumed")
                {
                    DecimalPlaces = 0 : 0;
                }
                column(AvgFuel_Control1000000013; AvgFuel)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(PResp_Control11; PResp)
                {
                }
                column(Rems_Control1000000015; Rems)
                {
                }
                column(Rems_Control1000000031; Rems)
                {
                }
                column(Job_Vessel_Control1000000042; Vessel)
                {
                }
                column(Job__Voyage_No___Control1000000043; "Voyage No.")
                {
                }
                column(Job__Starting_Date__Control1000000044; "Starting Date")
                {
                }
                column(Job__Ending_Date__Control1000000045; "Ending Date")
                {
                }
                column(NetSeaDay_Control1000000046; NetSeaDay)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Job__Points_Actual__Control1000000047; "Points Actual")
                {
                }
                column(Points_Actual__NetSeaDay_Control1000000048; "Points Actual" / NetSeaDay)
                {
                }
                column(Shrimp_2__Control1000000049; Shrimp[2])
                {
                }
                column(Fish_2__Control1000000050; Fish[2])
                {
                }
                column(Job__Fuel_Consumed__Control1000000051; "Fuel Consumed")
                {
                    DecimalPlaces = 0 : 0;
                }
                column(AvgFuel_Control1000000052; AvgFuel)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(PResp_Control1000000053; PResp)
                {
                }
                column(Countz_Control1000000054; Countz)
                {
                }
                column(NetSeaDay_Control1000000030; NetSeaDay)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(Fishdays_Manual; "Fishing Day (Manual)")
                {
                }
                column(Shrimp_2__Control1000000032; Shrimp[2])
                {
                }
                column(Fish_2__Control1000000033; Fish[2])
                {
                }
                column(Job__Points_Actual__Control1000000034; "Points Actual")
                {
                }
                column(Points_Actual__NetSeaDay_Control1000000035; "Points Actual" / NetSeaDay)
                {
                }
                column(Job__Fuel_Consumed__Control1000000036; "Fuel Consumed")
                {
                    DecimalPlaces = 0 : 0;
                }
                column(AvgFuel_Control1000000037; AvgFuel)
                {
                    DecimalPlaces = 0 : 0;
                }
                column(OperationCaption; OperationCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Countz_Control8Caption; Countz_Control8CaptionLbl)
                {
                }
                column(PResp_Control11Caption; PResp_Control11CaptionLbl)
                {
                }
                column(Job_Vessel_Control14Caption; FieldCaption(Vessel))
                {
                }
                column(Job__Voyage_No___Control17Caption; Job__Voyage_No___Control17CaptionLbl)
                {
                }
                column(Job__Starting_Date__Control26Caption; Job__Starting_Date__Control26CaptionLbl)
                {
                }
                column(Job__Ending_Date__Control29Caption; Job__Ending_Date__Control29CaptionLbl)
                {
                }
                column(NetSeaDay_Control32Caption; NetSeaDay_Control32CaptionLbl)
                {
                }
                column(TotalCaption; TotalCaptionLbl)
                {
                }
                column(Points_Actual__NetSeaDay_Control38Caption; Points_Actual__NetSeaDay_Control38CaptionLbl)
                {
                }
                column(Shrimp_Caption; Shrimp_CaptionLbl)
                {
                }
                column(Fish_Caption; Fish_CaptionLbl)
                {
                }
                column(Job__Fuel_Consumed__Control1000000011Caption; Job__Fuel_Consumed__Control1000000011CaptionLbl)
                {
                }
                column(AvgFuel_Control1000000013Caption; AvgFuel_Control1000000013CaptionLbl)
                {
                }
                column(Rems_Control1000000015Caption; Rems_Control1000000015CaptionLbl)
                {
                }
                column(FuelCaption; FuelCaptionLbl)
                {
                }
                column(PointsCaption; PointsCaptionLbl)
                {
                }
                column(FCountryCaption; FCountryCaptionLbl)
                {
                }
                column(Job_No_; "No.")
                {
                }
                column(Job_Fishing_Country_Code; "Fishing Country Code")
                {
                }

                trigger OnAfterGetRecord()
                begin

                    Asat := GetFilter("Ending Date");
                    EndDate := GetRangeMax("Ending Date");
                    Job.CalcFields("Deductible Lost Days");
                    if Consd_Deductible_Days then
                        NetSeaDay := "Sea Days" - "Deductible Lost Days"
                    else
                        NetSeaDay := "Sea Days";

                    SetRange("Task Filter", 'SHR'); ///AAA
                    //CALCFIELDS("Points Actual");
                    Points := Job.PointZ(Job."No.", '', Job.GetFilter("Posting Date Filter"), '', 'SHR', '', Job.Vessel);
                    "Points Actual" := Job.PointsActual(Job."No.", Job.GetFilter("Posting Date Filter"), '', 'SHR', '');
                    Shrimp[1] := Points;
                    Shrimp[2] := "Points Actual";

                    SetRange("Task Filter", 'FIS'); ///AAA

                    //CALCFIELDS(Points,"Points Actual");

                    Points := Job.PointZ(Job."No.", '', Job.GetFilter("Posting Date Filter"), '', 'FIS', '', Job.Vessel);
                    //MESSAGE(' %1',Job."No.");//dik
                    //MESSAGE(' %1',Job.Vessel);//dik
                    "Points Actual" := Job.PointsActual(Job."No.", Job.GetFilter("Posting Date Filter"), '', 'FIS', '');
                    Fish[1] := Points;
                    Fish[2] := "Points Actual";
                    SetRange("Task Filter");  ///AAA
                    //CALCFIELDS(Points,"Points Actual");
                    Points := Job.PointZ(Job."No.", '', Job.GetFilter("Posting Date Filter"), '', '', '', Job.Vessel);
                    "Points Actual" := Job.PointsActual(Job."No.", Job.GetFilter("Posting Date Filter"), '', '', '');
                    Countz := Countz + 1;
                    Counting := Counting + 1;

                    if Resource.Get("Person Responsible") then PResp := Resource.Name else PResp := "Person Responsible";
                    //IF  "Fuel Days"<>0 THEN AvgFuel:="Fuel Consumed"/"Fuel Days" ELSE  AvgFuel:=0;
                    AvgFuel := Job."Fuel Average";
                    //Remarks
                    Remark.SetFilter(Remark."Table Name", '=5');
                    Remark.SetFilter(Remark."No.", '=%1', "No.");
                    Remark.SetFilter(Remark.Type, '=%1', 0);
                    if Remark.Find('-') then Rems := Remark.Comment else Rems := '';

                    //CurrReport.CREATETOTALS(NetSeaDay,Shrimp[2],Fish[2],Points,"Points Actual");
                    //CurrReport.CREATETOTALS("Fuel Consumed",AvgFuel);

                    /*CurrReport.SHOWOUTPUT := FooterPrinted;
                    FooterPrinted := FALSE;*/

                    /*CurrReport.SHOWOUTPUT :=
                      CurrReport.TOTALSCAUSEDBY = Job.FIELDNO("Fishing Country Code");*/
                    if country.Get("Fishing Country Code") then FCountry := country.Name else FCountry := 'Nigerian';
                    if (CurrReport.TotalsCausedBy() = Job.FieldNo("Fishing Country Code")) then Counting := 1;

                    /*CurrReport.SHOWOUTPUT :=
                      CurrReport.TOTALSCAUSEDBY = LastFieldNo;*/
                    CurrReport.ShowOutput((StrLen(Rems) > 145));
                    CurrReport.ShowOutput((StrLen(Rems) > 73) and (StrLen(Rems) <= 145));
                    CurrReport.ShowOutput(StrLen(Rems) <= 73);
                    if AvgFuel <> 0 then AvgFuel := AvgFuel / Counting;
                end;

                trigger OnPreDataItem()
                begin

                    if country.Get("Fishing Country Code") then
                        FCountry := country.Name
                    else
                        FCountry := 'Nigerian';
                    /*IF (CurrReport.TOTALSCAUSEDBY = Job.FIELDNO("Fishing Country Code")) THEN Counting:=1;*/

                    /*CurrReport.SHOWOUTPUT :=
                      CurrReport.TOTALSCAUSEDBY = LastFieldNo;*/

                    CurrReport.ShowOutput((StrLen(Rems) > 145));
                    CurrReport.ShowOutput((StrLen(Rems) > 73) and (StrLen(Rems) <= 145));

                    CurrReport.ShowOutput(StrLen(Rems) <= 73);
                    if AvgFuel <> 0 then AvgFuel := AvgFuel / Counting;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                "Points Sort Bay" := "Points Actual";
                CalcFields("Deductible Lost Days");
                if Consd_Deductible_Days then
                    NetSeaDay := "Sea Days" - "Deductible Lost Days"
                else
                    NetSeaDay := "Sea Days";
                if NetSeaDay <> 0 then
                    AvgPtSortBay := "Points Actual" / NetSeaDay;
                Modify();
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
        CompanyInformation.Get();
    end;

    var
        Remark: Record "Comment Line";
        country: Record "Country/Region";
        Resource: Record Resource;
        Shrimp: array[2] of Decimal;
        Fish: array[2] of Decimal;
        Countz: Integer;
        Counting: Integer;
        Asat: Text[30];
        EndDate: Date;
        NetSeaDay: Decimal;
        Consd_Deductible_Days: Boolean;
        AvgFuel: Decimal;
        Rems: Text[225];
        FCountry: Text[30];
        PResp: Text[30];
        OperationCaptionLbl: Label 'Operation';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Countz_Control8CaptionLbl: Label 'S/No.';
        PResp_Control11CaptionLbl: Label 'Skipper';
        Job__Voyage_No___Control17CaptionLbl: Label 'Voyage';
        Job__Starting_Date__Control26CaptionLbl: Label 'From';
        Job__Ending_Date__Control29CaptionLbl: Label 'To';
        NetSeaDay_Control32CaptionLbl: Label 'Sea Days';
        TotalCaptionLbl: Label 'Total';
        Points_Actual__NetSeaDay_Control38CaptionLbl: Label 'Average';
        Shrimp_CaptionLbl: Label 'Shrimp ';
        Fish_CaptionLbl: Label 'Fish ';
        Job__Fuel_Consumed__Control1000000011CaptionLbl: Label 'Con''s';
        AvgFuel_Control1000000013CaptionLbl: Label 'Avg.';
        Rems_Control1000000015CaptionLbl: Label 'Remarks';
        FuelCaptionLbl: Label 'Fuel';
        PointsCaptionLbl: Label 'Points';
        FCountryCaptionLbl: Label 'Vessel :';
        CompanyInformation: Record "Company Information";
}
