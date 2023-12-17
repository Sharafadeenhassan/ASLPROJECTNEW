report 50062 "Payroll Report"
{
    // This report prints a salary schedule for employees. The user should enter
    // the Payroll period and if necessary also the specific Employee number(s) that
    // are ssrequired to appear in the report. The E/Ds that are to appear in the
    // schedule MUST be entered.(In this revised edition default EDs have been entered.
    // The schedule is a matrix of employees on the vertical axis and the required
    // E/Ds in the Horizontal axis.
    // The user can specify that the ED.Descriptions appear in the column headers
    // instead of the ED.Codes.
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PayrollReport.rdlc';
    UsageCategory = Lists;
    ApplicationArea = All, Basic, Suite;
    Caption = 'ASL Payroll Report';

    dataset
    {
        dataitem("Payroll-Payslip Lines."; "Payroll-Payslip Lines.")
        {
            DataItemTableView = SORTING("Payroll Period", "Employee No", "E/D Code") WHERE(Amount = FILTER(<> 0));
            RequestFilterFields = "Payroll Period", "Postg Group", "Employee No";
            column(S_No; S_no)
            {
            }
            column(CompanyData_Name; CompanyData.Name)
            {
            }
            column(Payroll_Payslip_Lines___GETFILTER__Payroll_Period___________PeriodTxt; "Payroll-Payslip Lines.".GetFilter("Payroll Period") + ' ' + PeriodTxt)
            {
            }
            column(EmplHeadTxt; EmplHeadTxt)
            {
            }
            column(TODAY; Today)
            {
            }
            column(Amount; "Payroll-Payslip Lines.".Amount)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(EDText_1_1_; EDText[1, 1]) { }
            column(EDText_1_2_; EDText[1, 2]) { }
            column(EDText_2_1_; EDText[2, 1]) { }
            column(EDText_2_2_; EDText[2, 2]) { }
            column(EDText_3_1_; EDText[3, 1]) { }
            column(EDText_3_2_; EDText[3, 2]) { }
            column(EDText_4_1_; EDText[4, 1]) { }
            column(EDText_4_2_; EDText[4, 2]) { }
            column(EDText_5_1_; EDText[5, 1]) { }
            column(EDText_5_2_; EDText[5, 2]) { }
            column(EDText_6_1_; EDText[6, 1]) { }
            column(EDText_6_2_; EDText[6, 2]) { }
            column(EDText_7_1_; EDText[7, 1]) { }
            column(EDText_7_2_; EDText[7, 2]) { }
            column(EDText_8_1_; EDText[8, 1]) { }
            column(EDText_8_2_; EDText[8, 2]) { }
            column(EDText_9_1_; EDText[9, 1]) { }
            column(EDText_9_2_; EDText[9, 2]) { }
            column(EDText_10_1_; EDText[10, 1]) { }
            column(EDText_10_2_; EDText[10, 2]) { }
            column(EDText_11_1_; EDText[11, 1]) { }
            column(EDText_11_2_; EDText[11, 2]) { }
            column(EDText_12_1_; EDText[12, 1]) { }
            column(EDText_12_2_; EDText[12, 2]) { }
            column(DELCHR__EmployeeName_______; DelChr(EmployeeName, '<>')) { }
            column(Payroll_Payslip_Lines___Employee_No_; "Employee No") { }
            column(GlobalDim1; "Global Dimension 1 Code") { }
            column(GlobalDim2; "Global Dimension 2 Code") { }
            column(EDAmountsArray_1_; EDAmountsArray[1]) { }
            column(EDAmountsArray_2_; EDAmountsArray[2]) { }
            column(EDAmountsArray_3_; EDAmountsArray[3]) { }
            column(EDAmountsArray_4_; EDAmountsArray[4]) { }
            column(EDAmountsArray_5_; EDAmountsArray[5]) { }
            column(EDAmountsArray_6_; EDAmountsArray[6]) { }
            column(EDAmountsArray_7_; EDAmountsArray[7]) { }
            column(EDAmountsArray_8_; EDAmountsArray[8]) { }
            column(EDAmountsArray_9_; EDAmountsArray[9]) { }
            column(EDAmountsArray_10_; EDAmountsArray[10]) { }
            column(EDAmountsArray_11_; EDAmountsArray[11]) { }
            column(EDAmountsArray_12_; EDAmountsArray[12]) { }
            column(CountZ; CountZ) { }
            column(EmplCount; EmplCount)
            {
            }
            column(EDAmountsArray_10__Control33; EDAmountsArray[10]) { }
            column(Total11; Total11) { }
            column(Total12; Total12) { }
            column(Salary_schedule_for_Period_Caption; Salary_schedule_for_Period_CaptionLbl)
            {
            }
            column(Report_print_date_Caption; Report_print_date_CaptionLbl)
            {
            }
            column(Report_page_Caption; Report_page_CaptionLbl)
            {
            }
            column(Employee_NumberCaption; Employee_NumberCaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(S_No_Caption; S_No_CaptionLbl)
            {
            }
            column(AmountsCaption; AmountsCaptionLbl)
            {
            }
            column(No__of_records_Processed_Caption; No__of_records_Processed_CaptionLbl)
            {
            }
            column(No__of_employees_Shown_Caption; No__of_employees_Shown_CaptionLbl)
            {
            }
            column(Payroll_Payslip_Lines__Payroll_Period; "Payroll Period")
            {
            }
            column(Payroll_Payslip_Lines__E_D_Code; "E/D Code")
            {
            }
            column(Payroll_Payslip_Lines__Global_Dimension_1_Code; "Global Dimension 1 Code")
            {
            }
            column(Payroll_Payslip_Lines__Global_Dimension_2_Code; "Global Dimension 2 Code")
            {
            }
            column(employee_name; EmployeeName)
            {
            }
            column(RowSum; EDAmountsArray[1] + EDAmountsArray[2] + EDAmountsArray[3] + EDAmountsArray[4] + EDAmountsArray[5] + EDAmountsArray[6] + EDAmountsArray[7] + EDAmountsArray[8] + EDAmountsArray[9] + EDAmountsArray[10] + EDAmountsArray[11] + EDAmountsArray[12])
            {
            }
            column(GrandTotals1; GrandTotals[1])
            {
            }
            column(GrandTotals2; GrandTotals[2])
            {
            }
            column(GrandTotals3; GrandTotals[3])
            {
            }
            column(GrandTotals4; GrandTotals[4])
            {
            }
            column(GrandTotals5; GrandTotals[5])
            {
            }
            column(GrandTotals6; GrandTotals[6])
            {
            }
            column(GrandTotals7; GrandTotals[7])
            {
            }
            column(GrandTotals8; GrandTotals[8])
            {
            }
            column(GrandTotals9; GrandTotals[9])
            {
            }
            column(GrandTotals10; GrandTotals[10])
            {
            }
            column(GrandTotals11; GrandTotals[11])
            {
            }
            column(GrandTotals12; GrandTotals[12])
            {
            }

            trigger OnAfterGetRecord()
            begin
                if "Payroll-Payslip Lines."."Employee No" <> g_EmpNo then begin
                    Clear(EDAmountsArray);
                    g_EmpNo := "Payroll-Payslip Lines."."Employee No";
                end;
                if not PayEmp.Get("Payroll-Payslip Lines."."Employee No") then CurrReport.Skip(); //Added by Adam to skip Deleted? Employees//
                EmployeeName := PayEmp."First Name" + ' ' + PayEmp."Last Name";                                                                               // Not: Employees are normally kept
                if PayEmp.Blocked then CurrReport.Skip(); //Added by Adam to skip Blocked Employees
                CountValue := 0;
                case "E/D Code" of
                    RequestEDsArray[1]."E/D Code":
                        begin
                            EDAmountsArray[1] := Amount;
                            GrandTotals[1] += EDAmountsArray[1];
                            if EDAmountsArray[1] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[2]."E/D Code":
                        begin
                            EDAmountsArray[2] := Amount;
                            GrandTotals[2] += EDAmountsArray[2];
                            if EDAmountsArray[2] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[3]."E/D Code":
                        begin
                            EDAmountsArray[3] := Amount;
                            GrandTotals[3] += EDAmountsArray[3];
                            if EDAmountsArray[3] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[4]."E/D Code":
                        begin
                            EDAmountsArray[4] := Amount;
                            GrandTotals[4] += EDAmountsArray[4];
                            if EDAmountsArray[4] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[5]."E/D Code":
                        begin
                            EDAmountsArray[5] := Amount;
                            GrandTotals[5] += EDAmountsArray[5];
                            if EDAmountsArray[5] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[6]."E/D Code":
                        begin
                            EDAmountsArray[6] := Amount;
                            GrandTotals[6] += EDAmountsArray[6];
                            if EDAmountsArray[6] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[7]."E/D Code":
                        begin
                            EDAmountsArray[7] := Amount;
                            GrandTotals[7] += EDAmountsArray[7];
                            if EDAmountsArray[7] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[8]."E/D Code":
                        begin
                            EDAmountsArray[8] := Amount;
                            GrandTotals[8] += EDAmountsArray[8];
                            if EDAmountsArray[8] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[9]."E/D Code":
                        begin
                            EDAmountsArray[9] := Amount;
                            GrandTotals[9] += EDAmountsArray[9];
                            if EDAmountsArray[9] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[10]."E/D Code":
                        begin
                            EDAmountsArray[10] := Amount;
                            GrandTotals[10] += EDAmountsArray[10];
                            if EDAmountsArray[10] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[11]."E/D Code":
                        begin
                            EDAmountsArray[11] := Amount;
                            GrandTotals[11] += EDAmountsArray[11];
                            Total11 := Total11 + Amount;
                            if EDAmountsArray[11] <> 0 then CountValue +=1;
                        end;
                    RequestEDsArray[ArrayTop]."E/D Code":
                        begin
                            EDAmountsArray[ArrayTop] := Amount;
                            GrandTotals[12] += EDAmountsArray[12];
                            Total12 := Total12 + Amount;
                            if EDAmountsArray[12] <> 0 then CountValue +=1;
                        end;
                end;
                if CountValue = 0 then CurrReport.skip;
                RecCount += 1;
            end;

            trigger OnPreDataItem()
            begin
                CompanyData.Get();
                if GetFilter("Employee No") <> '' then
                    EmplHeadTxt := 'Employee Filter: ' + GetFilter("Employee No")
                else
                    EmplHeadTxt := 'Schedule for All Employees.';

                EmplCount := EmplCount + 1;
                /* Create column header text*/
                for ArrayIndex := 1 to ArrayTop do
                    if (RequestEDsArray[ArrayIndex]."E/D Code") <> '' then begin
                        RequestEDsArray[ArrayIndex].Get(RequestEDsArray[ArrayIndex]."E/D Code");
                        EDString := CopyStr(RequestEDsArray[ArrayIndex]."Payslip Text", 1, 20);
                        for i := 1 to 10 do begin
                            CharTest := CopyStr(EDString, i, 1);
                            if CharTest = ' ' then begin
                                EDText[ArrayIndex, 1] := CopyStr(EDString, 1, 20);
                                EDText[ArrayIndex, 2] := CopyStr(EDString, i + 1, 10);
                                i := 10;
                            end;
                        end;
                        if EDText[ArrayIndex, 1] = '' then begin
                            EDText[ArrayIndex, 1] := CopyStr(EDString, 1, 10);
                            EDText[ArrayIndex, 2] := CopyStr(EDString, 11, 10);
                        end
                    end;
            end;

            trigger OnPostDataItem()
            begin
                // Message(Format(RecCount));
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    label("salary schedule for employees")
                    {
                        ApplicationArea = All;
                    }
                    field("1."; RequestEDsArray[1]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("2."; RequestEDsArray[2]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("3"; RequestEDsArray[3]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("4"; RequestEDsArray[4]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("5"; RequestEDsArray[5]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("6"; RequestEDsArray[6]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("7"; RequestEDsArray[7]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("8"; RequestEDsArray[8]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("9"; RequestEDsArray[9]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("10"; RequestEDsArray[10]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("11"; RequestEDsArray[11]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
                        ApplicationArea = All;
                    }
                    field("12"; RequestEDsArray[12]."E/D Code")
                    {
                        Lookup = true;
                        LookupPageID = "Payroll ED Survey.";
                        TableRelation = "Payroll-E/D Codes.";
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
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        SNo := 0;
    end;

    trigger OnPreReport()
    begin
        ArrayTop := 12;
        EmplCount := 0;

        /*Get Period Records within the delimitation*/
        "Payroll-Payslip Lines.".CopyFilter("Payroll Period", PeriodRec."Period Code");
        if PeriodRec.Count > 1 then
            PeriodTxt := StrSubstNo('(#1 periods)', PeriodRec.Count);
    end;

    var
        CompanyData: Record "Company Information";
        PeriodRec: Record "Payroll-Periods.";
        EmployeeName: Text[40];
        RequestEDsArray: array[12] of Record "Payroll-E/D Codes.";
        EDAmountsArray: array[12] of Decimal;
        EDText: array[12, 2] of Text[20];
        EDString: Text[20];
        ArrayIndex: Integer;
        ArrayTop: Integer;
        EmplCount: Integer;
        EmplHeadTxt: Text[60];
        PeriodTxt: Text[15];
        Total11: Decimal;
        Total12: Decimal;
        i: Integer;
        CharTest: Text[1];
        CountZ: Integer;
        Salary_schedule_for_Period_CaptionLbl: Label 'Salary schedule for Period:';
        Report_print_date_CaptionLbl: Label 'Report print date:';
        Report_page_CaptionLbl: Label 'Report page:';
        Employee_NumberCaptionLbl: Label 'Employee Number';
        NameCaptionLbl: Label 'Name';
        S_No_CaptionLbl: Label 'S/No.';
        AmountsCaptionLbl: Label 'Amounts';
        No__of_records_Processed_CaptionLbl: Label 'No. of record Processed:';
        No__of_employees_Shown_CaptionLbl: Label 'No. of employees Shown:';
        S_no: Integer;
        PayEmp: Record Employee;
        SNo: Integer;
        GrandTotals: array[12] of Decimal;
        g_EmpNo: Code[20];
        RecCount: Integer;
        CountValue : Integer;
}