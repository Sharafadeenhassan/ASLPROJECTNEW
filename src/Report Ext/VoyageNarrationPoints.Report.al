/// <summary>
/// Report Voyage Narration (Points) (ID 50214).
/// </summary>
report 50214 "Voyage Narration (Points)"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/VoyageNarrationPoints.rdlc';
    Caption = 'Voyage Narration (Points)';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    dataset
    {
        dataitem(Date; Date)
        {
            DataItemTableView = SORTING("Period Type", "Period Start") WHERE("Period Type" = CONST(Date));
            RequestFilterFields = "Period Start";
            column(COMPANYNAME; CompanyName)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(USERID; UserId)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(Date_Period_Type; "Period Type")
            {
            }
            dataitem(Job; Job)
            {
                column(Job__Voyage_No__; JobRec."Voyage No.")
                {
                }
                column(Skipper; Skipper)
                {
                }
                column(CountryText; CountryText)
                {
                }
                column(Job__Sea_Days_; JobRec."Sea Days")
                {
                }
                column(Job__Starting_Date_; JobRec."Starting Date")
                {
                }
                column(Job__Ending_Date_; JobRec."Ending Date")
                {
                }
                column(VessNam; VessNam)
                {
                }
                column(Date_Date__Period_Start_; Date."Period Start")
                {
                }
                column(HoursLost; HoursLost)
                {
                }
                column(DaysLost; DaysLost)
                {
                }
                column(Comments; Comments)
                {
                }
                column(Points; Points)
                {
                }
                column(DayofTide__Day_of_tide_; DayofTide."Day of tide")
                {
                }
                column(Voyage_Narration_ReportCaption; Voyage_Narration_ReportCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Job__Voyage_No__Caption; Job__Voyage_No__CaptionLbl)
                {
                }
                column(SkipperCaption; SkipperCaptionLbl)
                {
                }
                column(CountryTextCaption; CountryTextCaptionLbl)
                {
                }
                column(Job__Ending_Date_Caption; Job__Ending_Date_CaptionLbl)
                {
                }
                column(Job__Starting_Date_Caption; Job__Starting_Date_CaptionLbl)
                {
                }
                column(Job__Sea_Days_Caption; Job__Sea_Days_CaptionLbl)
                {
                }
                column(Date_Date__Period_Start_Caption; Date_Date__Period_Start_CaptionLbl)
                {
                }
                column(Hours_LostCaption; Hours_LostCaptionLbl)
                {
                }
                column(DaysLostCaption; DaysLostCaptionLbl)
                {
                }
                column(CommentsCaption; CommentsCaptionLbl)
                {
                }
                column(PointsCaption; PointsCaptionLbl)
                {
                }
                column(DayofTide__Day_of_tide_Caption; DayofTide__Day_of_tide_CaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    Points := 0;

                    CommentRec.SetCurrentKey("Table Name", "No.", Type, "Line No.");
                    CommentRec.SetRange(CommentRec."Table Name", CommentRec."Table Name"::Job);
                    CommentRec.SetRange(CommentRec."No.", JobNo);
                    CommentRec.SetRange(CommentRec.Type, CommentRec.Type::Narration);
                    CommentRec.SetRange(CommentRec.Date, Date."Period Start");
                    if CommentRec.Find('-') then begin
                        HoursLost := CommentRec."Hours Lost";
                        DaysLost := CommentRec."Day Lost Cause";
                        Comments := CommentRec.Comment;
                    end else begin
                        HoursLost := 0;
                        DaysLost := '';
                        Comments := '';
                    end;

                    JobLedgEntry.SetCurrentKey("Posting Date", "Job No.");
                    JobLedgEntry.SetRange(JobLedgEntry."Posting Date", Date."Period Start");
                    JobLedgEntry.SetRange(JobLedgEntry."Job No.", JobNo);
                    JobLedgEntry.SetFilter(JobLedgEntry."Location Code", '<>%1', 'CRM-ASL');
                    JobLedgEntry.SetRange(JobLedgEntry."Gen. Prod. Posting Group", 'FIS');
                    JobLedgEntry.SetRange(JobLedgEntry."Reason Code", 'CATCH');
                    if JobLedgEntry.Find('-') then
                        repeat
                            Points := Points + JobLedgEntry."Total Price (LCY)" * (-1)
                        until JobLedgEntry.Next() = 0
                    else
                        Points := 0;

                    // if DayofTide.Get(JobLedgEntry."Posting Date") then;
                end;

                trigger OnPostDataItem()
                begin
                    if Send2Excel then begin
                        Xr := Xr + 2;

                        UpdateCell(Xr, 1, VessNam, Bold, not Italic, not UnderLine, FontSize + 1);

                        Xr := Xr + 1;
                        UpdateCell(Xr, 1, 'Skipper', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 2, Skipper, Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 4, 'ETD', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 5, Format(Job."Starting Date"), Bold, not Italic, not UnderLine, FontSize + 1);

                        Xr := Xr + 1;
                        UpdateCell(Xr, 1, 'Country', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 2, CountryText, Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 4, 'ETA', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 5, Format(Job."Ending Date"), Bold, not Italic, not UnderLine, FontSize + 1);

                        Xr := Xr + 1;
                        UpdateCell(Xr, 1, 'Voyage No.', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 2, Format(Job."Voyage No."), Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 4, 'Sea Days', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 5, Format(Job."Sea Days"), Bold, not Italic, not UnderLine, FontSize + 1);

                        //     xlSheet.Range(GetCol(1) + Format(Xr) + ':' + GetCol(9) + Format(Xr)).Borders.LineStyle := 1;
                        //     xlSheet.Range(GetCol(1) + Format(Xr) + ':' + GetCol(9) + Format(Xr)).Interior.ColorIndex := 27;
                    end;

                    if Send2Excel then begin
                        Xr := Xr + 1;
                        UpdateCell(Xr, 2, 'Date', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 3, 'Hours Lost', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 4, 'Days Lost', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 5, 'Points', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 6, 'Day of Tide', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 7, 'Comment', Bold, not Italic, not UnderLine, FontSize + 1);

                        //     xlSheet.Range(GetCol(1) + Format(Xr) + ':' + GetCol(9) + Format(Xr)).Borders.LineStyle := 1;
                        //     xlSheet.Range(GetCol(1) + Format(Xr) + ':' + GetCol(9) + Format(Xr)).Interior.ColorIndex := 27;
                    end;

                    if Send2Excel then begin
                        Xr := Xr + 1;
                        UpdateCell(Xr, 2, 'Date', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 3, 'Hours Lost', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 4, 'Days Lost', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 5, 'Points', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 6, 'Day of Tide', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 7, 'Comment', Bold, not Italic, not UnderLine, FontSize + 1);

                        //     xlSheet.Range(GetCol(1) + Format(Xr) + ':' + GetCol(9) + Format(Xr)).Borders.LineStyle := 1;
                        //     xlSheet.Range(GetCol(1) + Format(Xr) + ':' + GetCol(9) + Format(Xr)).Interior.ColorIndex := 27;
                    end;
                end;

                trigger OnPreDataItem()
                begin
                    Job.Get(JobNo);
                    Date.SetRange(Date."Period Start", Job."Starting Date", Job."Ending Date");

                    if res.Get(Job."Person Responsible") then
                        Skipper := res.Name
                    else
                        Skipper := Job."Person Responsible";

                    if Loc.Get(Job.Vessel) then VessNam := Loc.Name;
                    if Job."Fishing Country Code" = '' then Job."Fishing Country Code" := 'NG';
                    if Country.Get(Job."Fishing Country Code") then CountryText := Country.Name else CountryText := Job."Fishing Country Code";

                    if TopPage then
                        if Send2Excel then begin
                            Xr := 1;
                            Xc := 1;
                            UpdateCell(Xr, Xc, CompanyName, Bold, not Italic, not UnderLine, FontSize + 2);

                            if GetFilters() <> '' then
                                UpdateCell(Xr + 2, 1, 'Table Filter: ' + GetFilters(), Bold, not Italic, not UnderLine, FontSize + 2)
                            else
                                UpdateCell(Xr + 2, 1, 'Table Filter: (No Filter)', Bold, not Italic, not UnderLine, FontSize + 2);
                        end;
                    Xr := Xr + 1;
                    TopPage := false;

                    if res.Get(Job."Person Responsible") then
                        Skipper := res.Name
                    else
                        Skipper := Job."Person Responsible";

                    if Loc.Get(Job.Vessel) then VessNam := Loc.Name;
                    if Job."Fishing Country Code" = '' then Job."Fishing Country Code" := 'NG';
                    if Country.Get(Job."Fishing Country Code") then CountryText := Country.Name else CountryText := Job."Fishing Country Code";
                end;
            }
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Control2)
                {
                    ShowCaption = false;
                    field(JobNo; JobNo)
                    {
                        ApplicationArea = All;
                    }
                    field(Send2Excel; Send2Excel)
                    {
                        ApplicationArea = All;
                    }
                    field(PageOrientation; PageOrientation)
                    {
                        ApplicationArea = All;
                    }
                    field(FontSize; FontSize)
                    {
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

    trigger OnInitReport()
    begin
        Bold := true;
        UnderLine := true;
        Italic := true;
        TopPage := true;
        PageOrientation := 1;
        FontSize := 7;
    end;

    trigger OnPostReport()
    begin
        // if Send2Excel then
        //     Clear(xlApp);
    end;

    var
        res: Record Resource;
        Loc: Record Location;
        Country: Record "Country/Region";
        JobLedgEntry: Record "Job Ledger Entry";
        DayofTide: Record "Day of Tide";
        CommentRec: Record "Comment Line";
        JobRec: Record Job;
        JobNo: Code[10];
        Skipper: Text[30];
        CountryText: Text[30];
        VessNam: Text[30];
        HoursLost: Decimal;
        DaysLost: Code[10];
        Comments: Text[250];
        // xlApp: Automation BC;
        // xlBook: Automation BC;
        // xlSheet: Automation BC;
        Send2Excel: Boolean;
        TopPage: Boolean;
        Xr: Integer;
        Xc: Integer;
        Bold: Boolean;
        UnderLine: Boolean;
        Italic: Boolean;
        FontSize: Integer;
        PageOrientation: Option "Excel Default",Portrait,Landscape;
        Voyage_Narration_ReportCaptionLbl: Label 'Voyage Narration Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Job__Voyage_No__CaptionLbl: Label 'Voyage No.';
        SkipperCaptionLbl: Label 'Skipper';
        CountryTextCaptionLbl: Label 'Country';
        Job__Ending_Date_CaptionLbl: Label 'ETA';
        Job__Starting_Date_CaptionLbl: Label 'ETD';
        Job__Sea_Days_CaptionLbl: Label 'Sea Days';
        Date_Date__Period_Start_CaptionLbl: Label 'Date';
        Hours_LostCaptionLbl: Label 'Hours Lost';
        DaysLostCaptionLbl: Label 'Day Lost Cause';
        CommentsCaptionLbl: Label 'Comment';
        PointsCaptionLbl: Label 'Points';
        DayofTide__Day_of_tide_CaptionLbl: Label 'Day of Tide';

    [Scope('OnPrem')]
    procedure UpdateCell(Row: Integer; Col: Integer; ValueText: Text[200]; Bold: Boolean; Italic: Boolean; Underline: Boolean; FontSize: Integer)
    begin
        // xlSheet.Range(GetCol(Col) + Format(Row)).Value := ValueText;
        // if Bold then
        //     xlSheet.Range(GetCol(Col) + Format(Row)).Font.Bold := Bold;
        // if Italic then
        //     xlSheet.Range(GetCol(Col) + Format(Row)).Font.Italic := Italic;
        // if Underline then
        //     xlSheet.Range(GetCol(Col) + Format(Row)).Font.Underline := Underline;
        // xlSheet.Range(GetCol(Col) + Format(Row)).Font.Size := FontSize;
    end;

    [Scope('OnPrem')]
    procedure GetCol(CN: Integer): Text[30]
    var
        c: Integer;
        i: Integer;
        x: Integer;
        xlColID: Text[10];
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
    end;
}
