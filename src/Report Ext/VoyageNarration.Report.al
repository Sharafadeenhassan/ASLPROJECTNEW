report 50099 "Voyage Narration"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/VoyageNarration.rdl';
    Caption = 'Voyage Narration';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    dataset
    {
        dataitem(Job; Job)
        {
            RequestFilterFields = "No.";
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
            column(Job__Voyage_No__; "Voyage No.")
            {
            }
            column(Person_Resp; Job."Person Responsible")
            {
            }
            column(Skipper; Skipper)
            {
            }
            column(CountryText; CountryText)
            {
            }
            column(Job__Sea_Days_; "Sea Days")
            {
            }
            column(Job__Starting_Date_; "Starting Date")
            {
            }
            column(Job__Ending_Date_; "Ending Date")
            {
            }
            column(VessNam; VessNam)
            {
            }
            column(Voyage_Narration_ReportCaption; Voyage_Narration_ReportCaptionLbl)
            {
            }
            column(A; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Job__Voyage_No__Caption; FieldCaption("Voyage No."))
            {
            }
            column(SkipperCaption; SkipperCaptionLbl)
            {
            }
            column(CountryTextCaption; CountryTextCaptionLbl)
            {
            }
            column(Job__Ending_Date_Caption; FieldCaption("Ending Date"))
            {
            }
            column(Job__Starting_Date_Caption; FieldCaption("Starting Date"))
            {
            }
            column(Job__Sea_Days_Caption; FieldCaption("Sea Days"))
            {
            }
            column(Job_No_; "No.")
            {
            }
            dataitem("Comment Line"; "Comment Line")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("Table Name", "No.", Type, "Line No.") ORDER(Ascending) WHERE("Table Name" = CONST(Job), Type = FILTER(Narration));
                column(Comment_Line_Date; Date)
                {
                }
                column(Comment_Line__Hours_Lost_; "Hours Lost")
                {
                }
                column(Comment_Line__Day_Lost_Cause_; "Day Lost Cause")
                {
                }
                column(Comment_Line_Comment; Comment)
                {
                }
                column(ASLComment;"Comment Temp")
                {                    
                }
                column(Comment_Line_DateCaption; FieldCaption(Date))
                {
                }
                column(Comment_Line__Hours_Lost_Caption; FieldCaption("Hours Lost"))
                {
                }
                column(Comment_Line__Day_Lost_Cause_Caption; FieldCaption("Day Lost Cause"))
                {
                }
                column(Comment_Line_CommentCaption; FieldCaption(Comment))
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
            }

            trigger OnAfterGetRecord()
            begin
                if res.Get("Person Responsible") then
                    Skipper := res.Name
                else
                    Skipper := "Person Responsible";
                if Loc.Get(Vessel) then VessNam := Loc.Name;
                if "Fishing Country Code" = '' then "Fishing Country Code" := 'NG';
                if Country.Get("Fishing Country Code") then CountryText := Country.Name else CountryText := "Fishing Country Code";
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

    trigger OnInitReport()
    begin
        Bold := true;
        UnderLine := true;
        Italic := true;
        //TopPage := true;
        PageOrientation := 1;
        FontSize := 7;
    end;

    var
        res: Record Resource;
        Loc: Record Location;
        Country: Record "Country/Region";
        Skipper: Text[30];
        CountryText: Text[30];
        VessNam: Text[30];
        Bold: Boolean;
        UnderLine: Boolean;
        Italic: Boolean;
        FontSize: Integer;
        PageOrientation: Option "Excel Default",Portrait,Landscape;
        Voyage_Narration_ReportCaptionLbl: Label 'Voyage Narration Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        SkipperCaptionLbl: Label 'Skipper';
        CountryTextCaptionLbl: Label 'Country';

    /*[Scope('OnPrem')]
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
