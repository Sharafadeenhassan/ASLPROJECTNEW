/// <summary>
/// Report Periodic Landing Report (ID 50016).
/// </summary>
report 50016 "Periodic Landing Report"
{
    // UNL-ASL3.60.01.012 (Santus) 05 July, 2005
    // -> new report
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PeriodicLandingReport.rdlc';
    Caption = 'Periodic Landing Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem(Job; Job)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Starting Date", "Ending Date";
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
            column(Job_GETFILTERS; Job.GetFilters)
            {
            }
            column(Landings_for_the_PeriodCaption; Landings_for_the_PeriodCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Posting_DateCaption; Posting_DateCaptionLbl)
            {
            }
            column(Job_No_Caption; Job_No_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(Gen__Prod__Posting_GroupCaption; Gen__Prod__Posting_GroupCaptionLbl)
            {
            }
            column(Location_CodeCaption; Location_CodeCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Source_CodeCaption; Source_CodeCaptionLbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(Unit_of_Measure_CodeCaption; Unit_of_Measure_CodeCaptionLbl)
            {
            }
            column(Total_PriceCaption; Total_PriceCaptionLbl)
            {
            }
            column(Reason_CodeCaption; Reason_CodeCaptionLbl)
            {
            }
            column(Job_Posting_GroupCaption; Job_Posting_GroupCaptionLbl)
            {
            }
            column(GroupSortCaption; GroupSortCaptionLbl)
            {
            }
            column(Job_No_; "No.")
            {
            }
            dataitem("Job Ledger Entry"; "Job Ledger Entry")
            {
                DataItemLink = "Job No." = FIELD("No.");
                DataItemTableView = SORTING("Job No.", "Job Task No.", "Entry Type", "Posting Date") WHERE("Location Code" = CONST('CRM-ASL'), "Gen. Prod. Posting Group" = CONST('FIS'), "Reason Code" = CONST('CATCH'));
                RequestFilterFields = "Posting Date";
                column(Job_Ledger_Entry__Posting_Date_; "Posting Date")
                {
                }
                column(Job_Ledger_Entry__Job_No__; "Job No.")
                {
                }
                column(Job_Ledger_Entry__No__; "No.")
                {
                }
                column(Job_Ledger_Entry__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
                {
                }
                column(Job_Ledger_Entry__Location_Code_; "Location Code")
                {
                }
                column(Job_Ledger_Entry_Description; Description)
                {
                }
                column(Job_Ledger_Entry__Source_Code_; "Source Code")
                {
                }
                column(ABS_Quantity_; -Quantity)
                {
                }
                column(Job_Ledger_Entry__Unit_of_Measure_Code_; "Unit of Measure Code")
                {
                }
                column(ABS__Total_Price__; -"Total Price")
                {
                }
                column(Job_Ledger_Entry__Reason_Code_; "Reason Code")
                {
                }
                column(Job_Ledger_Entry__Job_Posting_Group_; "Job Posting Group")
                {
                }
                column(Job_Ledger_Entry_GroupSort; GroupSort)
                {
                }
            }

            trigger OnPreDataItem()
            begin
                if TopPage then
                    if Send2Excel then begin
                        Xr := 2;
                        Xc := 1;
                        UpdateCell(1, Xc, CompanyName, Bold, not Italic, not UnderLine, FontSize + 2);

                        Xc := 1;
                        Xr := Xr + 3;
                        if GetFilters() <> '' then
                            UpdateCell(Xr, Xc, 'Table Filter: ' + GetFilters(), Bold, not Italic, not UnderLine, FontSize + 2)
                        else
                            UpdateCell(Xr, Xc, 'Table Filter: (No Filter)', Bold, not Italic, not UnderLine, FontSize + 2);
                    end;

                if TopPage then
                    if Send2Excel then begin
                        Xr := Xr + 2;

                        UpdateCell(Xr, 1, 'Posting Date', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 2, 'Job No.', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 3, 'No.', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 4, 'Gen. Prod. Pst Grp', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 5, 'Location Code', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 6, 'Description', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 7, 'Source Code', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 8, 'Quantity', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 9, 'Unit of Measure', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 10, 'Total Price', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 11, 'Reason Code', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 12, 'Job Posting Grp', Bold, not Italic, not UnderLine, FontSize + 1);
                        UpdateCell(Xr, 13, 'GroupSort', Bold, not Italic, not UnderLine, FontSize + 1);

                        //xlSheet.Range(GetCol(1) + Format(Xr - 1) + ':' + GetCol(13) + Format(Xr)).Borders.LineStyle := 1;
                        //xlSheet.Range(GetCol(1) + Format(Xr - 1) + ':' + GetCol(13) + Format(Xr)).Interior.ColorIndex := 27;
                        TopPage := false;
                    end;
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
        TopPage := true;
        PageOrientation := 2;
        FontSize := 7;
    end;

    var
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
        Landings_for_the_PeriodCaptionLbl: Label 'Landings for the Period';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Posting_DateCaptionLbl: Label 'Posting Date';
        Job_No_CaptionLbl: Label 'Job No.';
        No_CaptionLbl: Label 'No.';
        Gen__Prod__Posting_GroupCaptionLbl: Label 'Gen. Prod. Posting Group';
        Location_CodeCaptionLbl: Label 'Location Code';
        DescriptionCaptionLbl: Label 'Description';
        Source_CodeCaptionLbl: Label 'Source Code';
        QuantityCaptionLbl: Label 'Quantity';
        Unit_of_Measure_CodeCaptionLbl: Label 'Unit of Measure Code';
        Total_PriceCaptionLbl: Label 'Total Price';
        Reason_CodeCaptionLbl: Label 'Reason Code';
        Job_Posting_GroupCaptionLbl: Label 'Job Posting Group';
        GroupSortCaptionLbl: Label 'GroupSort';

    [Scope('OnPrem')]
    procedure UpdateCell(Row: Integer; Col: Integer; ValueText: Text[200]; Bold: Boolean; Italic: Boolean; Underline: Boolean; FontSize: Integer)
    begin
        // //xlSheet.Range(GetCol(Col) + Format(Row)).Value := ValueText;
        // if Bold then
        //     //xlSheet.Range(GetCol(Col) + Format(Row)).Font.Bold := Bold;
        // if Italic then
        //     //xlSheet.Range(GetCol(Col) + Format(Row)).Font.Italic := Italic;
        // if Underline then
        //     //xlSheet.Range(GetCol(Col) + Format(Row)).Font.Underline := Underline;
        // //xlSheet.Range(GetCol(Col) + Format(Row)).Font.Size := FontSize;
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
    end;
}
