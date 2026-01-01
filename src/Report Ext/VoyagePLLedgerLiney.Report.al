report 70151 "Voyage P&L Ledger Liney"
{
    // "Job Ledger Entry"."Total Price"
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/VoyagePLLedgerLiney.rdlc';
    Caption = 'Voyage P&L Ledger Liney';
    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            DataItemTableView = SORTING("Job No.", "Location Code", "Work Type Code") WHERE("Location Code" = CONST('CRM-ASL'));
            RequestFilterFields = "Job No.", "Work Type Code";
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
            column(Text18; Text18)
            {
            }
            column(a; a)
            {
            }
            column(Job__Lost_Days_; Job."Lost Days")
            {
            }
            column(Job_Ledger_Entry__Job_No__; "Job No.")
            {
            }
            column(ETA; ETA)
            {
            }
            column(ETD; ETD)
            {
            }
            column(CycleDay; CycleDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Job__Sea_Days_; Job."Sea Days")
            {
            }
            column(Job__Lost_Days__Control1000000030; Job."Lost Days")
            {
                DecimalPlaces = 0 : 0;
            }
            column(PortDay; PortDay)
            {
                DecimalPlaces = 0 : 0;
            }
            column(Vess; Vess)
            {
            }
            column(Job_Ledger_Entry__Work_Type_Code_; "Work Type Code")
            {
            }
            column(Job_Ledger_Entry__No__; "No.")
            {
            }
            column(Job_Ledger_Entry__Work_Type_Code__Control17; "Work Type Code")
            {
            }
            column(Qty; Qty)
            {
            }
            column(PrdPrc; PrdPrc)
            {
            }
            column(NairaVal; NairaVal)
            {
            }
            column(Qty_Control23; Qty)
            {
            }
            column(PrdPrc_Control1000000002; PrdPrc)
            {
            }
            column(Job_Ledger_Entry__Work_Type_Code__Control1000000004; "Work Type Code")
            {
            }
            column(NairaVal_Control1000000005; NairaVal)
            {
            }
            column(TotalFor; TotalFor)
            {
            }
            column(Qty_Control25; Qty)
            {
            }
            column(PrdPrc_Control1000000003; PrdPrc)
            {
            }
            column(NairaVal_Control1000000007; NairaVal)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Job_Ledger_Entry__No__Caption; FieldCaption("No."))
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(N_Caption; N_CaptionLbl)
            {
            }
            column(Job__Lost_Days_Caption; Job__Lost_Days_CaptionLbl)
            {
            }
            column(Job_Ledger_Entry__Job_No__Caption; FieldCaption("Job No."))
            {
            }
            column(ETACaption; ETACaptionLbl)
            {
            }
            column(ETDCaption; ETDCaptionLbl)
            {
            }
            column(CycleDayCaption; CycleDayCaptionLbl)
            {
            }
            column(Job__Sea_Days_Caption; Job__Sea_Days_CaptionLbl)
            {
            }
            column(Job__Lost_Days__Control1000000030Caption; Job__Lost_Days__Control1000000030CaptionLbl)
            {
            }
            column(PortDayCaption; PortDayCaptionLbl)
            {
            }
            column(QtyCaption_Control1000000082; QtyCaption_Control1000000082Lbl)
            {
            }
            column(EmptyStringCaption_Control1000000083; EmptyStringCaption_Control1000000083Lbl)
            {
            }
            column(N_Caption_Control1000000084; N_Caption_Control1000000084Lbl)
            {
            }
            column(Job_Ledger_Entry__No__Caption_Control1000000085; FieldCaption("No."))
            {
            }
            column(Job_Ledger_Entry_Entry_No_; "Job Ledger Entry"."Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                Qty:=Quantity*-1;
                Itempr.SETRANGE(Itempr."Item No.","No.");
                Itempr.SETRANGE(Itempr."Starting Date",0D,"Posting Date");
                IF Itempr.FIND('+') THEN Prc:=Itempr."Unit Price" ELSE Prc:=0;
                PrdPrc:=Qty*Prc;
                  */  //#1
            end;

            trigger OnPreDataItem()
            begin
                /*
                LastFieldNo := FIELDNO("Work Type Code");
                CurrReport.CREATETOTALS(PrdPrc,NairaVal,Qty);
                */  //#1
            end;
        }
        dataitem("Job Ledger Entry Rep"; "Job Ledger Entry")
        {
            DataItemTableView = SORTING("Job No.", "Location Code", GroupSort) WHERE("Location Code" = CONST('CRM-ASL'));
            column(Job_Ledger_Entry_Rep_GroupSort; GroupSort)
            {
            }
            column(Job_Ledger_Entry_Rep__No__; "No.")
            {
            }
            column(NairaVal2; NairaVal2)
            {
            }
            column(PrdPrc2; PrdPrc2)
            {
            }
            column(Qty_Control1000000068; Qty)
            {
            }
            column(Job_Ledger_Entry_Rep_GroupSort_Control1000000069; GroupSort)
            {
            }
            column(NairaVal2_Control1000000071; NairaVal2)
            {
            }
            column(PrdPrc2_Control1000000072; PrdPrc2)
            {
            }
            column(Qty_Control1000000073; Qty)
            {
            }
            column(COPYSTR_GroupSort_5_; CopyStr(GroupSort, 5))
            {
            }
            column(NairaVal2_Control1000000075; NairaVal2)
            {
            }
            column(PrdPrc2_Control1000000076; PrdPrc2)
            {
            }
            column(Qty_Control1000000077; Qty)
            {
            }
            column(TotalFor_Control1000000078; TotalFor)
            {
            }
            column(Job_Ledger_Entry_Rep_Entry_No_; "Job Ledger Entry Rep"."Entry No.")
            {
            }
            column(Job_Ledger_Entry_Rep_Job_No_; "Job No.")
            {
            }

            trigger OnAfterGetRecord()
            begin
                /*
                Qty:=Quantity*-1;
                Itempr.SETRANGE(Itempr."Item No.","No.");
                Itempr.SETRANGE(Itempr."Starting Date",0D,"Posting Date");
                IF Itempr.FIND('+') THEN Prc:=Itempr."Unit Price" ELSE Prc:=0;
                PrdPrc2:=Qty*Prc;
                  */  //#1
            end;

            trigger OnPreDataItem()
            begin
                /*
                "Job Ledger Entry".COPYFILTER("Job Ledger Entry"."Job No.","Job Ledger Entry Rep"."Job No.");
                LastFieldNo := FIELDNO(GroupSort);
                CurrReport.CREATETOTALS(PrdPrc2,NairaVal2,Qty);
                   */  //#1
            end;
        }
        dataitem("Job Ledger Entry2"; "Job Ledger Entry")
        {
            DataItemTableView = SORTING("Job No.", "Entry Type", Type, "No.") WHERE("Gen. Prod. Posting Group" = FILTER(<> 'FIS'), Type = CONST(Item));
            column(Job_Ledger_Entry2__Total_Price_; "Total Price")
            {
            }
            column(Job_Ledger_Entry2_Quantity; Quantity)
            {
            }
            column(Job_Ledger_Entry2__Work_Type_Code_; "Work Type Code")
            {
            }
            column(Job_Ledger_Entry2__No__; "No.")
            {
            }
            column(Job_Ledger_Entry2__Total_Price__Control1000000006; "Total Price")
            {
            }
            column(GPPGDesc; GPPGDesc)
            {
            }
            column(Job_Ledger_Entry2__Total_Price__Control1000000019; "Total Price")
            {
            }
            column(TotalFor_Control1000000020; TotalFor)
            {
            }
            column(Job_Ledger_Entry2_Entry_No_; "Job Ledger Entry2"."Entry No.")
            {
            }
            column(Job_Ledger_Entry2_Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {
            }

            trigger OnPreDataItem()
            begin
                //"Job Ledger Entry".COPYFILTER("Job Ledger Entry"."Job No.","Job Ledger Entry2"."Job No.");       #1
            end;
        }
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
            column(DataStor_3_; DataStor[3])
            {
            }
            column(Text03; Text03)
            {
            }
            column(Text04; Text04)
            {
            }
            column(DataStor_4_; DataStor[4])
            {
            }
            column(DataStor_5_; DataStor[5])
            {
            }
            column(Text05; Text05)
            {
            }
            column(Text06; Text06)
            {
            }
            column(DataStor_6_; DataStor[6])
            {
            }
            column(DataStor_7_; DataStor[7])
            {
            }
            column(DataStor_8_; DataStor[8])
            {
            }
            column(Text07; Text07)
            {
            }
            column(Text08; Text08)
            {
            }
            column(TotDirExp; TotDirExp)
            {
            }
            column(Text09; Text09)
            {
            }
            column(PeopleOnVoy; PeopleOnVoy)
            {
            }
            column(expcnt; expcnt)
            {
            }
            column(ResCount; ResCount)
            {
            }
            column(ExpTonnage; ExpTonnage)
            {
            }
            column(Text10; Text10)
            {
            }
            column(GrossPerct; GrossPerct)
            {
            }
            column(Text11; Text11)
            {
            }
            column(NairaVal_TotDirExp; NairaVal - TotDirExp)
            {
            }
            column(Text13; Text13)
            {
            }
            column(Text14; Text14)
            {
            }
            column(DataStor_13_; DataStor[13])
            {
            }
            column(DataStor_14_; DataStor[14])
            {
            }
            column(DataStor_12_; DataStor[12])
            {
            }
            column(Text12; Text12)
            {
            }
            column(TotIndirExp; TotIndirExp)
            {
            }
            column(Text17; Text17)
            {
            }
            column(NetProfit; NetProfit)
            {
            }
            column(Text15; Text15)
            {
            }
            column(GrossPerct_Control1000000063; GrossPerct)
            {
            }
            column(Text11_Control1000000064; Text11)
            {
            }
            column(Integer_Number; Number)
            {
            }
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
        TotalFor: Label 'Total';
        Job: Record Job;
        PrdPrc: Decimal;
        PrdPrc2: Decimal;
        NairaVal: Decimal;
        NairaVal2: Decimal;
        GPPGDesc: Text[30];
        DataStor: array[15] of Decimal;
        Text03: Label 'Catch Incentive';
        Text04: Label 'Salaries & Wages';
        Text05: Label 'Travelling Expenses';
        Text06: Label 'License Fees';
        Text07: Label 'Insurance';
        Text08: Label 'Clearing & FWRD. & NPA';
        Text09: Label 'Total Direct Expenses';
        ETD: Date;
        ETA: Date;
        CycleDay: Decimal;
        PortDay: Decimal;
        a: Decimal;
        expcnt: Integer;
        PeopleOnVoy: Integer;
        ResCount: Integer;
        Text10: Label 'Gross Margin';
        Text11: Label '% Of Revenue';
        Text12: Label 'Shore Overheads';
        Text13: Label 'Depreciation';
        Text14: Label 'Interest';
        Text15: Label 'Net Profit';
        Text17: Label 'Total Indirect Expenses';
        TotDirExp: Decimal;
        TotIndirExp: Decimal;
        GrossPerct: Decimal;
        NetProfit: Decimal;
        Qty: Decimal;
        ExpTonnage: Decimal;
        Vess: Text[30];
        Text18: Label 'VOYAGE PROFIT AND LOSS STATEMENT';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        QtyCaptionLbl: Label 'Quantity';
        EmptyStringCaptionLbl: Label '$';
        N_CaptionLbl: Label '=N=';
        Job__Lost_Days_CaptionLbl: Label 'Lost Days';
        ETACaptionLbl: Label 'Label1000000010';
        ETDCaptionLbl: Label 'Label1000000014';
        CycleDayCaptionLbl: Label 'Cycle Day';
        Job__Sea_Days_CaptionLbl: Label 'Fishing Day';
        Job__Lost_Days__Control1000000030CaptionLbl: Label 'Lost At Sea';
        PortDayCaptionLbl: Label 'Port Day';
        QtyCaption_Control1000000082Lbl: Label 'Quantity';
        EmptyStringCaption_Control1000000083Lbl: Label '$';
        N_Caption_Control1000000084Lbl: Label '=N=';
}
