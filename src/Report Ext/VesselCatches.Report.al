report 50085 "Vessel Catches"
{
    // Job."Person Responsible"
    //
    // "Job."Ending Date"
    // Job."Sea Days"
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/VesselCatches.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Vessel Catches';

    dataset
    {
        dataitem("Job Journal Batch"; "Job Journal Batch")
        {
            DataItemTableView = SORTING("Journal Template Name", Name);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Journal Template Name", Name;
            column(Job_Journal_Batch_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Job_Journal_Batch_Name; Name)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                PrintOnlyIfDetail = true;
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
                column(Job_Journal_Batch___Journal_Template_Name_; "Job Journal Batch"."Journal Template Name")
                {
                }
                column(Job_Journal_Batch__Name; "Job Journal Batch".Name)
                {
                }
                column(Job_Journal_Line__TABLECAPTION__________JobJnlLineFilter; "Job Journal Line".TableCaption + ': ' + JobJnlLineFilter)
                {
                }
                column(Engr; Engr)
                {
                }
                column(Catch_Reconciliation_Statement__All_Values_in_Kilos_Caption; Catch_Reconciliation_Statement__All_Values_in_Kilos_CaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Job_Journal_Batch___Journal_Template_Name_Caption; Job_Journal_Batch___Journal_Template_Name_CaptionLbl)
                {
                }
                column(Job_Journal_Batch__NameCaption; Job_Journal_Batch__NameCaptionLbl)
                {
                }
                column(Control2Caption; Control2CaptionLbl)
                {
                }
                column(VesslCaption; VesslCaptionLbl)
                {
                }
                column(RESPCaption; RESPCaptionLbl)
                {
                }
                column(Job__Starting_Date_Caption; Job__Starting_Date_CaptionLbl)
                {
                }
                column(Job__Ending_Date_Caption; Job__Ending_Date_CaptionLbl)
                {
                }
                column(Job__Sea_Days_Caption; Job__Sea_Days_CaptionLbl)
                {
                }
                column(EngrCaption; EngrCaptionLbl)
                {
                }
                column(Quantity__1Caption; Quantity__1CaptionLbl)
                {
                }
                column(Job_Journal_Line__No__Caption; "Job Journal Line".FieldCaption("No."))
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(Vessel_Catch_Report__VCR_Caption; Vessel_Catch_Report__VCR_CaptionLbl)
                {
                }
                column(Quantity__Reconciliation_Catch_Quantity______1Caption; Quantity__Reconciliation_Catch_Quantity______1CaptionLbl)
                {
                }
                column(Integer_Number; Number)
                {
                }
                column(Skipper; RESP)
                {
                }
                column(KNOWING; KNOWINGLb1)
                {
                }
                dataitem("Job Journal Line"; "Job Journal Line")
                {
                    DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"), "Journal Batch Name" = FIELD(Name);
                    DataItemLinkReference = "Job Journal Batch";
                    DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Statistics Group", "Work Type Code Sort") ORDER(Ascending);
                    RequestFilterFields = "No.", "Journal Batch Name", "Posting Date", "Journal Template Name", "Statistics Group", "Work Type Code Sort";
                    column(Job_Journal_Line__Work_Type_Code_; "Work Type Code")
                    {
                    }
                    column(Job_Journal_Line__No__; "No.")
                    {
                    }
                    column(Quantity__1; Quantity)
                    {
                    }
                    column(S_G; "Job Journal Line"."Statistics Group")
                    {
                    }
                    column(Work_Types; "Job Journal Line"."Work Type Code")
                    {
                    }
                    column(Job_Journal_Line_Description; Description)
                    {
                    }
                    column(Reconciliation_Catch_Quantity___1; "Reconciliation Catch Quantity")
                    {
                    }
                    column(Quantity__Reconciliation_Catch_Quantity______1; Abs(Quantity) - Abs("Reconciliation Catch Quantity"))
                    {
                    }
                    column(Error_txt; Error_txt)
                    {
                    }
                    column(Job_Journal_Line_Type; Type)
                    {
                    }
                    column(Quantity__1_Control1000000004; Quantity)
                    {
                        DecimalPlaces = 2 : 5;
                    }
                    column(Total_For_Catch_Type_Code__; 'Total For Catch Type Code')
                    {
                    }
                    column(Reconciliation_Catch_Quantity___1_Control1000000007; "Reconciliation Catch Quantity")
                    {
                    }
                    column(Voyage_No; Job."Voyage No.")
                    {
                    }
                    column(Quantity__Reconciliation_Catch_Quantity______1_Control1000000013; Quantity - "Reconciliation Catch Quantity")
                    {
                        DecimalPlaces = 2 : 5;
                    }
                    column(Quantity__1_Control1000000002; Quantity)
                    {
                        DecimalPlaces = 2 : 5;
                    }
                    column(TotalFor____FIELDCAPTION__Statistics_Group__; 'TotalFor' + FieldCaption("Statistics Group"))
                    {
                    }
                    column(Reconciliation_Catch_Quantity___1_Control1000000006; "Reconciliation Catch Quantity")
                    {
                    }
                    column(Quantity__Reconciliation_Catch_Quantity_____1; Quantity - "Reconciliation Catch Quantity")
                    {
                        DecimalPlaces = 2 : 5;
                    }
                    column(Reconciliation_Catch_Quantity___1_Control1000000018; "Reconciliation Catch Quantity")
                    {
                    }
                    column(Quantity__1_Control1000000019; Quantity)
                    {
                        DecimalPlaces = 2 : 5;
                    }
                    column(Quantity__Reconciliation_Catch_Quantity_____1_Control1000000020; Quantity - "Reconciliation Catch Quantity")
                    {
                        DecimalPlaces = 2 : 5;
                    }
                    column(Capt0; Capt0)
                    {
                    }
                    column(Control1000000009Caption; Control1000000009CaptionLbl)
                    {
                    }
                    column(Catch_Type_CodeCaption; Catch_Type_CodeCaptionLbl)
                    {
                    }
                    column(Grand_TotalCaption; Grand_TotalCaptionLbl)
                    {
                    }
                    column(Port_CaptainCaption; Port_CaptainCaptionLbl)
                    {
                    }
                    column(SkipperCaption; SkipperCaptionLbl)
                    {
                    }
                    column(KNOWINGCa; KNOWINGLb1)
                    {
                    }
                    column(Job_Journal_Line_Journal_Template_Name; "Journal Template Name")
                    {
                    }
                    column(Job_Journal_Line_Journal_Batch_Name; "Journal Batch Name")
                    {
                    }
                    column(ReccatchQuantity1; ReccatchQuantity1)
                    {
                    }
                    column(RESP; Job."Person Responsible")
                    {
                    }
                    column(Job__Starting_Date_; Job."Starting Date")
                    {
                    }
                    column(Job__Ending_Date_; Job."Ending Date")
                    {
                    }
                    column(Job__Sea_Days_; Job."Sea Days")
                    {
                    }
                    column(Vessl; Vessl)
                    {
                    }
                    column(Job_Journal_Line_Line_No_; "Line No.")
                    {
                    }
                    dataitem(DimensionLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(DimText_Control42; DimText)
                        {
                        }
                        column(DimensionsCaption; DimensionsCaptionLbl)
                        {
                        }
                        column(DimensionLoop_Number; Number)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin

                            if Number = 1 then begin
                                if not JnlLineDim.Find('-') then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', JnlLineDim."Dimension Code", JnlLineDim."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText, JnlLineDim."Dimension Code", JnlLineDim."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until (JnlLineDim.Next() = 0);
                        end;

                        trigger OnPreDataItem()
                        begin

                            if not ShowDim then
                                CurrReport.Break();
                            JnlLineDim.SetRange("Table ID", DATABASE::"Job Journal Line");
                            //JnlLineDim.SETRANGE("Journal Template Name","Job Journal Line"."Journal Template Name");
                            //JnlLineDim.SETRANGE("Journal Batch Name","Job Journal Line"."Journal Batch Name");
                            //JnlLineDim.SETRANGE("Journal Line No.","Job Journal Line"."Line No.");
                        end;
                    }
                    dataitem(ErrorLoop; "Integer")
                    {
                        DataItemTableView = SORTING(Number);
                        column(ErrorText_Number_; ErrorText[Number])
                        {
                        }
                        column(ErrorText_Number_Caption; ErrorText_Number_CaptionLbl)
                        {
                        }
                        column(ErrorLoop_Number; Number)
                        {
                        }

                        trigger OnPostDataItem()
                        begin
                            ErrorCounter := 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            SetRange(Number, 1, ErrorCounter);
                        end;
                    }

                    trigger OnAfterGetRecord()
                    begin

                        if EmptyLine() then
                            exit;
                        MakeRecurringTexts("Job Journal Line");

                        if "Job No." = '' then
                            AddError(StrSubstNo(Text001, FieldCaption("Job No.")))
                        else
                            if not Job.Get("Job No.") then
                                AddError(StrSubstNo(Text002, "Job No."))
                            else begin
                                if Job.Blocked = Job.Blocked::All then
                                    AddError(StrSubstNo(Text003, Job.FieldCaption(Blocked), false, "Job No."));
                                if Job.Status <> Job.Status::Planning then begin
                                    Job.Status := Job.Status::Planning;
                                    AddError(StrSubstNo(Text003, Job.FieldCaption(Status), Job.Status, "Job No."));
                                end;
                            end;

                        if Type <> Type::"G/L Account" then
                            if "Gen. Prod. Posting Group" = '' then
                                AddError(StrSubstNo(Text001, FieldCaption("Gen. Prod. Posting Group")))
                            else
                                if not GenPostingSetup.Get("Gen. Bus. Posting Group", "Gen. Prod. Posting Group") then
                                    AddError(
                                      StrSubstNo(
                                        Text004, GenPostingSetup.TableCaption,
                                        "Gen. Bus. Posting Group", "Gen. Prod. Posting Group"));

                        if "No." = '' then
                            AddError(StrSubstNo(Text001, FieldCaption("No.")))
                        else
                            /*IF NOT Post Job Entry  THEN///
                               CASE Type OF
                                 Type::Resource :
                                   IF NOT Res.GET("No.") THEN
                                     AddError(STRSUBSTNO(Text005,"No."))
                                   ELSE
                                     IF Res.Blocked THEN
                                       AddError(STRSUBSTNO(Text006,Res.FIELDCAPTION(Blocked),FALSE,"No."));
                                 Type::Item :
                                   IF NOT Item.GET("No.") THEN
                                     AddError(STRSUBSTNO(Text007,"No."))
                                   ELSE
                                     IF Item.Blocked THEN
                                       AddError(STRSUBSTNO(Text008,Item.FIELDCAPTION(Blocked),FALSE,"No."));
                                 Type::"Account (G/L)" :;
                                END;*/

                        CheckRecurringLine("Job Journal Line");

                        if "Posting Date" = 0D then
                            AddError(StrSubstNo(Text001, FieldCaption("Posting Date")))
                        else begin
                            if "Posting Date" <> NormalDate("Posting Date") then
                                AddError(StrSubstNo(Text009, FieldCaption("Posting Date")));

                            if "Job Journal Batch"."No. Series" <> '' then
                                if NoSeries."Date Order" and ("Posting Date" < LastPostingDate) then
                                    AddError(Text010);
                            LastPostingDate := "Posting Date";

                            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                if UserId <> '' then
                                    if UserSetup.Get(UserId) then begin
                                        AllowPostingFrom := UserSetup."Allow Posting From";
                                        AllowPostingTo := UserSetup."Allow Posting To";
                                    end;
                                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                    GLSetup.Get();
                                    AllowPostingFrom := GLSetup."Allow Posting From";
                                    AllowPostingTo := GLSetup."Allow Posting To";
                                end;
                                if AllowPostingTo = 0D then
                                    AllowPostingTo := 99991231D;
                            end;
                            if ("Posting Date" < AllowPostingFrom) or ("Posting Date" > AllowPostingTo) then
                                AddError(StrSubstNo(Text011, Format("Posting Date")));
                        end;

                        if ("Document Date" <> 0D) then
                            if ("Document Date" <> NormalDate("Document Date")) then
                                AddError(StrSubstNo(Text009, FieldCaption("Document Date")));

                        if "Job Journal Batch"."No. Series" <> '' then begin
                            if LastDocNo <> '' then
                                if ("Document No." <> LastDocNo) and ("Document No." <> IncStr(LastDocNo)) then
                                    AddError(Text012);
                            LastDocNo := "Document No.";
                        end;

                        JnlLineDim.SetRange("Table ID", DATABASE::"Job Journal Line");
                        //JnlLineDim.SETRANGE("Journal Template Name","Journal Template Name");
                        //JnlLineDim.SETRANGE("Journal Batch Name","Journal Batch Name");
                        //JnlLineDim.SETRANGE("Journal Line No.","Line No.");
                        //IF NOT DimMgt.CheckJnlLineDimComb(JnlLineDim) THEN
                        //AddError(DimMgt.GetDimCombErr);

                        TableID[1] := DATABASE::Job;
                        No[1] := "Job No.";
                        TableID[2] := DimMgt.TypeToTableID2(Type);
                        No[2] := "No.";
                        TableID[3] := DATABASE::"Resource Group";
                        No[3] := "Resource Group No.";
                        //IF NOT DimMgt.CheckJnlLineDimValuePosting(JnlLineDim,TableID,No) THEN
                        //AddError(DimMgt.GetDimValuePostingErr);

                        IF Item.GET("No.") THEN BEGIN
                            IF InvtPostgGro.GET(Item."Inventory Posting Group") THEN
                                "Work Type Code Sort" := InvtPostgGro.Category;
                        END
                        ELSE
                            "Work Type Code Sort" := 'XX';
                        MODIFY();

                        if Catch = 0 then Validate(Catch);
                        //MODIFY;
                        Job.SetRange(Job."No.", "Job Journal Line"."Job No.");
                        if Job.FindFirst() then
                            Vessl := Job.Vessel;
                        if Res.Get(Job."Person Responsible") then RESP := Res.Name else RESP := Job."Person Responsible";

                        // Quantity := 199;
                    end;

                    trigger OnPreDataItem()
                    begin

                        //ReccatchQuantity1 += "Job Journal Line"."Reconciliation Catch Quantity";
                        JobJnlTemplate.Get("Job Journal Batch"."Journal Template Name");
                        if JobJnlTemplate.Recurring then begin
                            if GetFilter("Posting Date") <> '' then
                                AddError(
                                  StrSubstNo(
                                    Text000, FieldCaption("Posting Date")));
                            SetRange("Posting Date", 0D, WorkDate());
                            if GetFilter("Expiration Date") <> '' then
                                AddError(
                                  StrSubstNo(
                                    Text000, FieldCaption("Expiration Date")));
                            SetFilter("Expiration Date", '%1 | %2..', 0D, WorkDate());
                        end;

                        CurrReport.CreateTotals("Total Cost", "Total Price");

                        if "Job Journal Batch"."No. Series" <> '' then
                            NoSeries.Get("Job Journal Batch"."No. Series");
                        LastPostingDate := 0D;
                        LastDocNo := '';

                        if not UserSetup.Get(UserId) then Error('User Does Not Exist');
                        Capt0 := 'Export/Mrkt Manager';

                        if (UserSetup.Category = 1) then
                            Capt0 := 'Export Manager';
                        if (UserSetup.Category = 2) then
                            Capt0 := 'Mrkt Manager';
                    end;
                }

                trigger OnAfterGetRecord()
                begin

                    if Locat.Get(Job.Vessel) then
                        Vessl := Locat.Name
                    else
                        Vessl := Job.Vessel;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.PageNo := 1;
            end;

            trigger OnPreDataItem()
            begin
                if "Job Journal Line".GetFilter("Journal Template Name") <> '' then
                    SetRange("Journal Template Name", "Job Journal Line".GetFilter("Journal Template Name"));
                if "Job Journal Line".GetFilter("Journal Batch Name") <> '' then
                    SetRange(Name, "Job Journal Line".GetFilter("Journal Batch Name"));
            end;
        }
    }
    requestpage
    {
        SaveValues = true;

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    // field(Location; JobJnl."Location Code")
                    // {
                    //     ApplicationArea = All;
                    // }
                    field(Template; JobJnl."Journal Template Name")
                    {
                        ApplicationArea = All;
                        TableRelation = "Job Journal Template";
                    }
                    field(Batch; JobJnl."Journal Batch Name")
                    {
                        ApplicationArea = All;
                        TableRelation = "Job Journal Batch";
                    }
                }
            }
        }

        var
            JobJnl: Record "Job Journal Line";
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        g_Template := "Job Journal Line".GetFilter("Journal Template Name");
        g_Batch := "Job Journal Line".GetFilter("Journal Batch Name");
    end;

    trigger OnPreReport()
    begin
        JobJnlLineFilter := "Job Journal Line".GetFilters;
        g_Template := "Job Journal Line".GetFilter("Journal Template Name");
        g_Batch := "Job Journal Line".GetFilter("Journal Batch Name");
        JNo := "Job Journal Line".GetFilter("Job Journal Line"."Job No.");
        OpBudgLn.SetFilter(OpBudgLn."Job No.", JNo);
        OpBudgLn.SetFilter(OpBudgLn."Resource Group", '%1', 'CENG');
        if OpBudgLn.Find('-') then Engr := OpBudgLn.Description
        else
        Engr := '';
    end;

    var
        Text000: Label '%1 cannot be filtered when you post recurring journals.';
        Text001: Label '%1 must be specified.';
        Text002: Label 'Job %1 does not exist.';
        Text003: Label '%1 must be %2 for job %3.';
        Text004: Label '%1 %2 %3 does not exist.';
        Text009: Label '%1 must not be a closing date.';
        Text010: Label 'The lines are not listed according to Posting Date because they were not entered in that order.';
        Text011: Label '%1 is not within your allowed range of posting dates.';
        Text012: Label 'There is a gap in the number series.';
        Text013: Label '%1 cannot be specified.';
        Text014: Label '<Month Text>';
        Error_txt: Text[30];
        g_Template: Code[10];
        g_Batch: Code[20];
        UserSetup: Record "User Setup";
        GLSetup: Record "General Ledger Setup";
        AccountingPeriod: Record "Accounting Period";
        Res: Record Resource;
        Item: Record Item;
        JobJnlTemplate: Record "Job Journal Template";
        GenPostingSetup: Record "General Posting Setup";
        NoSeries: Record "No. Series";
        JnlLineDim: Record "Default Dimension";
        DimMgt: Codeunit DimensionManagement;
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        Day: Integer;
        Week: Integer;
        Month: Integer;
        MonthText: Text[30];
        ErrorCounter: Integer;
        ErrorText: array[50] of Text[250];
        JobJnlLineFilter: Text[250];
        LastPostingDate: Date;
        LastDocNo: Code[20];
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowDim: Boolean;
        Continue: Boolean;
        OpBudgLn: Record "Job Planning Line";
        Locat: Record Location;
        InvtPostgGro: Record "Inventory Posting Group";
        Capt0: Text;
        RESP: Text[50];
        Vessl: Text[50];
        JNo: Code[20];
        Engr: Code[50];
        Catch_Reconciliation_Statement__All_Values_in_Kilos_CaptionLbl: Label 'Catch Reconciliation Statement (All Values in Kilos)';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Job_Journal_Batch___Journal_Template_Name_CaptionLbl: Label 'Journal Template';
        Job_Journal_Batch__NameCaptionLbl: Label 'Journal Batch';
        Control2CaptionLbl: Label 'Label2';
        VesslCaptionLbl: Label 'Vessel Name:';
        RESPCaptionLbl: Label 'Skipper:';
        Job__Starting_Date_CaptionLbl: Label 'ETD:';
        Job__Ending_Date_CaptionLbl: Label 'ETA:';
        Job__Sea_Days_CaptionLbl: Label 'Sea Days:';
        EngrCaptionLbl: Label 'Engineer:';
        Quantity__1CaptionLbl: Label 'Actual Catch Landed (ACL)';
        DescriptionCaptionLbl: Label 'Description';
        Vessel_Catch_Report__VCR_CaptionLbl: Label 'Vessel Catch Report (VCR)';
        Quantity__Reconciliation_Catch_Quantity______1CaptionLbl: Label 'Variance (ACL-VCR)';
        Control1000000009CaptionLbl: Label 'Label1000000009';
        Catch_Type_CodeCaptionLbl: Label 'Catch Type Code';
        Grand_TotalCaptionLbl: Label 'Grand Total';
        Port_CaptainCaptionLbl: Label 'Port Captain';
        SkipperCaptionLbl: Label 'Skipper';
        KNOWINGLb1: Label 'KNOWING THAT WE CAN BE HELD LIABLE FOR FALSIFYING INFORMATION, WE CERTIFY THIS REPORT TO BE TRUE AND ACCURATE TO THE BEST OF OUR KNOWLEDGE';
        DimensionsCaptionLbl: Label 'Dimensions';
        ErrorText_Number_CaptionLbl: Label 'Warning!';
        ReccatchQuantity1: Decimal;
        Job: Record Job;

    local procedure CheckRecurringLine(JobJnlLine2: Record "Job Journal Line")
    begin

        if JobJnlTemplate.Recurring then begin
            if JobJnlLine2."Recurring Method" = 0 then
                AddError(StrSubstNo(Text001, JobJnlLine2.FieldCaption("Recurring Method")));
            if Format(JobJnlLine2."Recurring Frequency") = '' then
                AddError(StrSubstNo(Text001, JobJnlLine2.FieldCaption("Recurring Frequency")));
            if JobJnlLine2."Recurring Method" = JobJnlLine2."Recurring Method"::Variable then
                if JobJnlLine2.Quantity = 0 then
                    AddError(StrSubstNo(Text001, JobJnlLine2.FieldCaption(Quantity)));
        end else begin
            if JobJnlLine2."Recurring Method" <> 0 then
                AddError(StrSubstNo(Text013, JobJnlLine2.FieldCaption("Recurring Method")));
            if Format(JobJnlLine2."Recurring Frequency") <> '' then
                AddError(StrSubstNo(Text013, JobJnlLine2.FieldCaption("Recurring Frequency")));
        end;
    end;

    local procedure MakeRecurringTexts(var JobJnlLine2: Record "Job Journal Line")
    begin

        if (JobJnlLine2."Posting Date" <> 0D) and (JobJnlLine2."No." <> '') and (JobJnlLine2."Recurring Method" <> 0) then begin
            Day := Date2DMY(JobJnlLine2."Posting Date", 1);
            Week := Date2DWY(JobJnlLine2."Posting Date", 2);
            Month := Date2DMY(JobJnlLine2."Posting Date", 2);
            MonthText := Format(JobJnlLine2."Posting Date", 0, Text014);
            AccountingPeriod.SetRange("Starting Date", 0D, JobJnlLine2."Posting Date");
            if not AccountingPeriod.Find('+') then
                AccountingPeriod.Name := '';
            JobJnlLine2."Document No." :=
              DelChr(PadStr(StrSubstNo(JobJnlLine2."Document No.", Day, Week, Month, MonthText, AccountingPeriod.Name),
                MaxStrLen(JobJnlLine2."Document No.")), '>');
            JobJnlLine2.Description :=
              DelChr(PadStr(StrSubstNo(JobJnlLine2.Description, Day, Week, Month, MonthText, AccountingPeriod.Name),
                MaxStrLen(JobJnlLine2.Description)), '>');
        end;
    end;

    local procedure AddError(Text: Text[250])
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;
}
