report 50039 "New Trial Balance"
{
    // UNL-ASL3.60.01.002 (Santus) May 03, 2005
    // -> new report on trial balance
    //
    // UNL-ASL3.60.01.010 (Santus) June 21, 2005
    // -> modified report to change the way balances are computed
    //
    // BalAtDat
    // BalB4Per
    //  "Debit Amount (LCY)"
    //  "Credit Amount (LCY)"
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/NewTrialBalance.rdlc';
    Caption = 'New Trial Balance';
    ApplicationArea = All;
    UsageCategory = Lists;
    dataset
    {
        dataitem("G/L Account"; "G/L Account")
        {
            CalcFields = "Net Change";
            DataItemTableView = SORTING("No.") WHERE("Account Type" = CONST(Posting));
            RequestFilterFields = "No.", "Date Filter";
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
            column(Filters_________GETFILTERS__; 'Filters  := ' + GetFilters())
            {
            }
            column(G_L_Account__No__; "No.")
            {
            }
            column(G_L_Account_Name; Name)
            {
            }
            column(BalAtDat; BalAtDat)
            {
            }
            column(G_L_Account___Credit_Amount_; "Credit Amount")
            {
            }
            column(BalB4Per; BalB4Per)
            {
            }
            column(G_L_Account__Debit_Amount_; "Debit Amount")
            {
            }
            column(CurrReport_PAGENO_Control1000000056; CurrReport.PageNo())
            {
            }
            column(USERID_Control1000000058; UserId)
            {
            }
            column(Continued_on_next_page____; 'Continued on next page...')
            {
            }
            column(Totals___; 'Totals :')
            {
            }
            column(BalAtDat_Control1000000003; BalAtDat)
            {
            }
            column(G_L_Account___Credit_Amount__Control1000000010; "Credit Amount")
            {
            }
            column(G_L_Account__Debit_Amount__Control1000000011; "Debit Amount")
            {
            }
            column(BalB4Per_Control1000000012; BalB4Per)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Balance_At_DateCaption; Balance_At_DateCaptionLbl)
            {
            }
            column(Trial_BalanceCaption; Trial_BalanceCaptionLbl)
            {
            }
            column(G_L_Account__No__Caption; FieldCaption("No."))
            {
            }
            column(G_L_Account_NameCaption; FieldCaption(Name))
            {
            }
            column(Balance_At_DateCaption_Control18; Balance_At_DateCaption_Control18Lbl)
            {
            }
            column(Opening_Balance_Caption; Opening_Balance_CaptionLbl)
            {
            }
            column(DebitCaption; DebitCaptionLbl)
            {
            }
            column(CreditCaption; CreditCaptionLbl)
            {
            }
            column(Balance_At_DateCaption_Control1000000049; Balance_At_DateCaption_Control1000000049Lbl)
            {
            }
            column(CreditCaption_Control1000000050; CreditCaption_Control1000000050Lbl)
            {
            }
            column(DebitCaption_Control1000000051; DebitCaption_Control1000000051Lbl)
            {
            }
            column(Opening_Balance_Caption_Control1000000052; Opening_Balance_Caption_Control1000000052Lbl)
            {
            }
            column(G_L_Account_NameCaption_Control1000000053; FieldCaption(Name))
            {
            }
            column(G_L_Account__No__Caption_Control1000000054; FieldCaption("No."))
            {
            }
            column(CurrReport_PAGENO_Control1000000056Caption; CurrReport_PAGENO_Control1000000056CaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*SETRANGE("Date Filter",0D,ToDate);
                CALCFIELDS("Net Change");
                BalAtDat := "Net Change";*/

                //SETRANGE("Date Filter",0D,CALCDATE('-1D',FrDate));
                SetRange("Date Filter", 0D, IncludeClosingDate(CalcDate('<-1D>', FrDate), true));
                CalcFields("Net Change");
                BalB4Per := "Net Change";

                SetRange("Date Filter", FrDate, ToDate);

                CalcFields("Net Change", "Debit Amount", "Credit Amount");

                BalAtDat := BalB4Per + "Debit Amount" - "Credit Amount";
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");

                CurrReport.CreateTotals(BalAtDat, BalB4Per, "Debit Amount", "Credit Amount");

                ToDate := GetRangeMax("Date Filter");
                FrDate := GetRangeMin("Date Filter");

                if ((BalAtDat = 0) and (not ShowZero)) then CurrReport.ShowOutput(false);
            end;
        }
    }

    requestpage
    {
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

    var
        LastFieldNo: Integer;
        ToDate: Date;
        ShowZero: Boolean;
        FrDate: Date;
        BalAtDat: Decimal;
        BalB4Per: Decimal;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Balance_At_DateCaptionLbl: Label 'Balance At Date';
        Trial_BalanceCaptionLbl: Label 'Trial Balance';
        Balance_At_DateCaption_Control18Lbl: Label 'Balance At Date';
        Opening_Balance_CaptionLbl: Label 'Opening Balance ';
        DebitCaptionLbl: Label 'Debit';
        CreditCaptionLbl: Label 'Credit';
        Balance_At_DateCaption_Control1000000049Lbl: Label 'Balance At Date';
        CreditCaption_Control1000000050Lbl: Label 'Credit';
        DebitCaption_Control1000000051Lbl: Label 'Debit';
        Opening_Balance_Caption_Control1000000052Lbl: Label 'Opening Balance ';
        CurrReport_PAGENO_Control1000000056CaptionLbl: Label 'Page';

    local procedure IncludeClosingDate(Date: Date; UseClosingDate: Boolean): Date
    begin
        if UseClosingDate then
            exit(ClosingDate(Date));
        exit(Date);
    end;
}
