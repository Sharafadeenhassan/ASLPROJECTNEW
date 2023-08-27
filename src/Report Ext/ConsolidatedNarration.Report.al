report 50004 "Consolidated Narration"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/ConsolidatedNarration.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Consolidated Narration';
    dataset
    {
        dataitem("Comment Line"; "Comment Line")
        {
            DataItemTableView = SORTING("Hours Lost") ORDER(Descending) WHERE(Type = CONST(Narration));
            RequestFilterFields = Voyage, "Operation No.", Vessel, Type;
            column(No; "Comment Line"."No.")
            {
            }
            column(LineNo; "Comment Line"."Line No.")
            {
            }
            column(DayLostLocation; "Comment Line"."Day Lost Location")
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
            column(STRSUBSTNO_Text000_NarratnFilter_; StrSubstNo(Text000, NarratnFilter))
            {
            }
            column(Comment_Line_Comment; "Comment Temp")
            {
            }
            column(VessName; VessName)
            {
            }
            column(Comment_Line__Hours_Lost_; "Hours Lost")
            {
                DecimalPlaces = 1 : 1;
            }
            column(Comment_Line__Day_Lost_Cause_; "Day Lost Cause")
            {
            }
            column(Seadays; Seadays)
            {
            }
            column(Day1; Day1)
            {
            }
            column(Day2; Day2)
            {
            }
            column(Day3; Day3)
            {
            }
            column(OPSx_24; OPSx / 24)
            {
            }
            column(CHORx_24; CHORx / 24)
            {
            }
            column(ENGx_24; ENGx / 24)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Vessel_NameCaption; Vessel_NameCaptionLbl)
            {
            }
            column(NarrationCaption; NarrationCaptionLbl)
            {
            }
            column(Comment_Line__Hours_Lost_Caption; FieldCaption("Hours Lost"))
            {
            }
            column(Comment_Line__Day_Lost_Cause_Caption; Comment_Line__Day_Lost_Cause_CaptionLbl)
            {
            }
            column(SeadaysCaption; SeadaysCaptionLbl)
            {
            }
            column(Day1Caption; Day1CaptionLbl)
            {
            }
            column(Day2Caption; Day2CaptionLbl)
            {
            }
            column(Day3Caption; Day3CaptionLbl)
            {
            }
            column(OPSx_24Caption; OPSx_24CaptionLbl)
            {
            }
            column(ENGx_24Caption; ENGx_24CaptionLbl)
            {
            }
            column(CHORx_24Caption; CHORx_24CaptionLbl)
            {
            }
            column(Total_Days_LostCaption; Total_Days_LostCaptionLbl)
            {
            }
            column(Conolidated_Narration_Report_50087Caption; Conolidated_Narration_Report_50087CaptionLbl)
            {
            }
            column(Comment_Line_Table_Name; "Table Name")
            {
            }
            column(Comment_Line_No_; "No.")
            {
            }
            column(Comment_Line_Line_No_; "Line No.")
            {
            }
            column(EndDatess; EndDate)
            {
            }
            column(Dayprev1; Dayprev1)
            {
            }
            column(Dayprev2; Dayprev2)
            {
            }
            column(Dayprev3; Dayprev3)
            {
            }

            trigger OnAfterGetRecord()
            begin

                OPSx := 0;
                ENGx := 0;
                CHORx := 0;
                Seadays := 0;
                TotHrsLost := 0;
                Day1 := false;
                Day2 := false;
                Day3 := false;

                if Loc.Get("Comment Line".Vessel) then
                    VessName := Loc.Name;

                if Job.Get("Comment Line"."No.") then begin
                    Seadays := EndDate - Job."Starting Date";

                    CommentLine.SetRange("No.", "Comment Line"."No.");
                    CommentLine.SetRange(Date, Job."Starting Date", EndDate);
                    if CommentLine.Find('-') then
                        repeat
                            if LostDays.Get(CommentLine."Day Lost Cause") then
                                case LostDays.Category of
                                    LostDays.Category::OPS:
                                        OPSx := OPSx + CommentLine."Hours Lost";
                                    LostDays.Category::ENG:
                                        ENGx := ENGx + CommentLine."Hours Lost";
                                    LostDays.Category::CHOR:
                                        CHORx := CHORx + CommentLine."Hours Lost";
                                end;
                        //TotHrsLost := TotHrsLost + CommentLine."Hours Lost";
                        until CommentLine.Next() = 0;

                    for i := 1 to 3 do begin
                        CommentLine2.SetRange("No.", "Comment Line"."No.");
                        CommentLine2.SetFilter("Day Lost Cause", '<>%1', 'STMG');
                        CommentLine2.SetRange(Date, ComplaintDate[i]);
                        if CommentLine2.Find('-') then
                            case i of
                                1:
                                    Day1 := true;
                                2:
                                    Day2 := true;
                                3:
                                    Day3 := true;
                            end;
                    end;
                end;
                if "Comment Line".Comment = '' then CurrReport.ShowOutput(false);
            end;

            trigger OnPreDataItem()
            begin

                NarratnFilter := "Comment Line".GetFilter("Comment Line".Date);
                "Comment Line".SetRange("Comment Line".Date, StartDate, EndDate);
                if NarratnFilter = '' then
                    if StartDate = EndDate then
                        NarratnFilter := Format(StartDate) else
                        NarratnFilter := Format(StartDate) + ' To ' + Format(EndDate);
            end;
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
                    field("Current Date"; EndDate)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage()
        begin
            EndDate := Today;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin

        StartDate := EndDate;
        //EndDate := TODAY;
        for i := 1 to 3 do
            ComplaintDate[i] := EndDate - i;
        Dayprev1 := EndDate - 1;
        Dayprev2 := EndDate - 2;
        Dayprev3 := EndDate - 3;
    end;

    var
        Loc: Record Location;
        VessName: Code[50];
        NarratnFilter: Code[20];
        StartDate: Date;
        EndDate: Date;
        Seadays: Integer;
        TotHrsLost: Decimal;
        Job: Record Job;
        CommentLine: Record "Comment Line";
        CommentLine2: Record "Comment Line";
        LostDays: Record "Lost Days";
        Day1: Boolean;
        Day2: Boolean;
        Day3: Boolean;
        ComplaintDate: array[3] of Date;
        i: Integer;
        OPSx: Decimal;
        ENGx: Decimal;
        CHORx: Decimal;
        Text000: Label 'Consolidated Narration Report As of %1';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Vessel_NameCaptionLbl: Label 'Vessel Name';
        NarrationCaptionLbl: Label 'Narration';
        Comment_Line__Day_Lost_Cause_CaptionLbl: Label 'Loss Cause';
        SeadaysCaptionLbl: Label 'Sea Days';
        Day1CaptionLbl: Label 'Prev. Day';
        Day2CaptionLbl: Label 'Prev day';
        Day3CaptionLbl: Label 'Prev day';
        OPSx_24CaptionLbl: Label 'OPS';
        ENGx_24CaptionLbl: Label 'ENG';
        CHORx_24CaptionLbl: Label 'CHOR';
        Total_Days_LostCaptionLbl: Label 'Total Days Lost';
        Conolidated_Narration_Report_50087CaptionLbl: Label 'Conolidated Narration Report 50087';
        Dayprev1: Date;
        Dayprev2: Date;
        Dayprev3: Date;
}
