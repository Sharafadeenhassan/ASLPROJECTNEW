report 99192 "Vessel Performance Consolidax2"
{
    // "Period Start":=010103D; "Period End":= 010503D;
    // "Period Start":=CALCDATE('CM-2M+1D',030503D);  "Period End":=CALCDATE('CM-1M',030503D);//020503D;//
    //
    // A:: Actual B:: Budget C:: Variance
    // SubHdr1A:: Skipper
    // SubHdr2A:: Endurance   VessEndr:: Vessel Endurance
    // SubHdr3A:: ETA
    // SubHdr4A:: Fishing Day
    // SubHdr5A:: Lost at Sea
    // SubHdr6A:: Port Day
    //
    // Name
    //
    // CellDefLn :: Cell Definition Line
    // CellDefVT :: Cell Definition Value Totals
    // CellDefHd :: Cell Definition Headers
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/VesselPerformanceConsolidax2.rdlc';
    Caption = 'Vessel Performance Consolidax2';
    dataset
    {
        dataitem(Jobss; Job)
        {
            DataItemTableView = SORTING("Ending Date") WHERE("Voyage Ended" = CONST(true));
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
            column(GETFILTERS__; GetFilters())
            {
            }
            column(Text27; Text27)
            {
            }
            column(Text26; Text26)
            {
            }
            column(Text25; Text25)
            {
            }
            column(Text24; Text24)
            {
            }
            column(Text23; Text23)
            {
            }
            column(Text22; Text22)
            {
            }
            column(Text21; Text21)
            {
            }
            column(Jobss_Vessel; Vessel)
            {
            }
            column(PntStor_7_; PntStor[7])
            {
            }
            column(PntStor_6_; PntStor[6])
            {
                DecimalPlaces = 2 : 2;
            }
            column(PntStor_5_; PntStor[5])
            {
            }
            column(PntStor_4_; PntStor[4])
            {
            }
            column(PntStor_3_; PntStor[3])
            {
            }
            column(PntStor_2_; PntStor[2])
            {
            }
            column(PntStor_1_; PntStor[1])
            {
            }
            column(PortDay; PortDay)
            {
            }
            column(LostDay; LostDay)
            {
            }
            column(FishgDay; FishgDay)
            {
            }
            column(CycleDay; CycleDay)
            {
            }
            column(Jobss__Ending_Date_; "Ending Date")
            {
            }
            column(Jobss__Starting_Date_; "Starting Date")
            {
            }
            column(Jobss__No__; "No.")
            {
            }
            column(PntStor_7__Countrs; PntStor[7] / Countrs)
            {
            }
            column(PntStor_6__Control1000000233; PntStor[6])
            {
                DecimalPlaces = 2 : 2;
            }
            column(PntStor_5__Control1000000234; PntStor[5])
            {
            }
            column(PntStor_4__Control1000000235; PntStor[4])
            {
            }
            column(PntStor_3__Control1000000236; PntStor[3])
            {
            }
            column(PntStor_2__Control1000000237; PntStor[2])
            {
            }
            column(PntStor_1__Control1000000238; PntStor[1])
            {
            }
            column(PortDay_Control1000000239; PortDay)
            {
            }
            column(LostDay_Control1000000240; LostDay)
            {
            }
            column(FishgDay_Control1000000241; FishgDay)
            {
            }
            column(CycleDay_Control1000000242; CycleDay)
            {
            }
            column(TotalFor___FIELDCAPTION_Vessel_; TotalFor + FieldCaption(Vessel))
            {
            }
            column(PntStor_7__Countrs_Control1000000221; PntStor[7] / Countrs)
            {
            }
            column(PntStor_6__Control1000000222; PntStor[6])
            {
                DecimalPlaces = 2 : 2;
            }
            column(PntStor_5__Control1000000223; PntStor[5])
            {
            }
            column(PntStor_4__Control1000000224; PntStor[4])
            {
            }
            column(PntStor_3__Control1000000225; PntStor[3])
            {
            }
            column(PntStor_2__Control1000000226; PntStor[2])
            {
            }
            column(PntStor_1__Control1000000227; PntStor[1])
            {
            }
            column(PortDay_Control1000000228; PortDay)
            {
            }
            column(LostDay_Control1000000229; LostDay)
            {
            }
            column(FishgDay_Control1000000230; FishgDay)
            {
            }
            column(CycleDay_Control1000000231; CycleDay)
            {
            }
            column(Coutry_Name; Coutry.Name)
            {
            }
            column(Res_Name; Res.Name)
            {
            }
            column(Vess; Vess)
            {
            }
            column(SeaRange_20_; SeaRange[20])
            {
            }
            column(SeaRange_19_; SeaRange[19])
            {
            }
            column(SeaRange_18_; SeaRange[18])
            {
            }
            column(SeaRange_17_; SeaRange[17])
            {
            }
            column(SeaRange_16_; SeaRange[16])
            {
            }
            column(SeaRange_15_; SeaRange[15])
            {
            }
            column(SeaRange_14_; SeaRange[14])
            {
            }
            column(SeaRange_13_; SeaRange[13])
            {
            }
            column(SeaRange_12_; SeaRange[12])
            {
            }
            column(SeaRange_11_; SeaRange[11])
            {
            }
            column(SeaRange_10_; SeaRange[10])
            {
            }
            column(SeaRange_9_; SeaRange[9])
            {
            }
            column(SeaRange_8_; SeaRange[8])
            {
            }
            column(SeaRange_7_; SeaRange[7])
            {
            }
            column(SeaRange_6_; SeaRange[6])
            {
            }
            column(SeaRange_5_; SeaRange[5])
            {
            }
            column(SeaRange_4_; SeaRange[4])
            {
            }
            column(SeaRange_3_; SeaRange[3])
            {
            }
            column(SeaRange_2_; SeaRange[2])
            {
            }
            column(SubHdr6A_5_; SubHdr6A[5])
            {
            }
            column(SubHdr5A_5_; SubHdr5A[5])
            {
            }
            column(SubHdr4A_5_; SubHdr4A[5])
            {
            }
            column(SubHdr3A_5_; SubHdr3A[5])
            {
            }
            column(SubHdr2A_5_; SubHdr2A[5])
            {
            }
            column(SubHdr2A_4_; SubHdr2A[4])
            {
            }
            column(SubHdr3A_4_; SubHdr3A[4])
            {
            }
            column(SubHdr4A_4_; SubHdr4A[4])
            {
            }
            column(SubHdr5A_4_; SubHdr5A[4])
            {
            }
            column(SubHdr6A_4_; SubHdr6A[4])
            {
            }
            column(SubHdr1A_4_; SubHdr1A[4])
            {
            }
            column(SubHdr1A_5_; SubHdr1A[5])
            {
            }
            column(SubHdr1A_3_; SubHdr1A[3])
            {
            }
            column(SubHdr2A_3_; SubHdr2A[3])
            {
            }
            column(SubHdr3A_3_; SubHdr3A[3])
            {
            }
            column(SubHdr4A_3_; SubHdr4A[3])
            {
            }
            column(SubHdr5A_3_; SubHdr5A[3])
            {
            }
            column(SubHdr6A_3_; SubHdr6A[3])
            {
            }
            column(SubHdr1A_2_; SubHdr1A[2])
            {
            }
            column(SubHdr2A_2_; SubHdr2A[2])
            {
            }
            column(SubHdr3A_2_; SubHdr3A[2])
            {
            }
            column(SubHdr5A_2_; SubHdr5A[2])
            {
            }
            column(SubHdr4A_2_; SubHdr4A[2])
            {
            }
            column(SubHdr6A_2_; SubHdr6A[2])
            {
            }
            column(PortDay_Control1000000609; PortDay)
            {
            }
            column(LostDay_Control1000000611; LostDay)
            {
            }
            column(FishgDay_Control1000000613; FishgDay)
            {
            }
            column(ETACons; ETACons)
            {
            }
            column(VessEndr; VessEndr)
            {
            }
            column(SeaRange_1_; SeaRange[1])
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(FILTERSCaption; FILTERSCaptionLbl)
            {
            }
            column(Control1000000167Caption; Control1000000167CaptionLbl)
            {
            }
            column(Control1000000168Caption; Control1000000168CaptionLbl)
            {
            }
            column(Control1000000169Caption; Control1000000169CaptionLbl)
            {
            }
            column(Control1000000170Caption; Control1000000170CaptionLbl)
            {
            }
            column(Control1000000171Caption; Control1000000171CaptionLbl)
            {
            }
            column(Control1000000172Caption; Control1000000172CaptionLbl)
            {
            }
            column(Control1000000173Caption; Control1000000173CaptionLbl)
            {
            }
            column(Jobss_VesselCaption; FieldCaption(Vessel))
            {
            }
            column(VarianceCaption; VarianceCaptionLbl)
            {
            }
            column(ActualCaption; ActualCaptionLbl)
            {
            }
            column(BudgetCaption; BudgetCaptionLbl)
            {
            }
            column(VarianceCaption_Control1000000459; VarianceCaption_Control1000000459Lbl)
            {
            }
            column(ActualCaption_Control1000000460; ActualCaption_Control1000000460Lbl)
            {
            }
            column(BudgetCaption_Control1000000461; BudgetCaption_Control1000000461Lbl)
            {
            }
            column(VarianceCaption_Control1000000462; VarianceCaption_Control1000000462Lbl)
            {
            }
            column(ActualCaption_Control1000000463; ActualCaption_Control1000000463Lbl)
            {
            }
            column(BudgetCaption_Control1000000464; BudgetCaption_Control1000000464Lbl)
            {
            }
            column(VarianceCaption_Control1000000465; VarianceCaption_Control1000000465Lbl)
            {
            }
            column(ActualCaption_Control1000000466; ActualCaption_Control1000000466Lbl)
            {
            }
            column(BudgetCaption_Control1000000467; BudgetCaption_Control1000000467Lbl)
            {
            }
            column(VarianceCaption_Control1000000468; VarianceCaption_Control1000000468Lbl)
            {
            }
            column(ActualCaption_Control1000000469; ActualCaption_Control1000000469Lbl)
            {
            }
            column(BudgetCaption_Control1000000470; BudgetCaption_Control1000000470Lbl)
            {
            }
            column(VarianceCaption_Control1000000471; VarianceCaption_Control1000000471Lbl)
            {
            }
            column(ActualCaption_Control1000000472; ActualCaption_Control1000000472Lbl)
            {
            }
            column(BudgetCaption_Control1000000473; BudgetCaption_Control1000000473Lbl)
            {
            }
            column(VarianceCaption_Control1000000474; VarianceCaption_Control1000000474Lbl)
            {
            }
            column(ActualCaption_Control1000000475; ActualCaption_Control1000000475Lbl)
            {
            }
            column(BudgetCaption_Control1000000476; BudgetCaption_Control1000000476Lbl)
            {
            }
            column(VarianceCaption_Control1000000477; VarianceCaption_Control1000000477Lbl)
            {
            }
            column(ActualCaption_Control1000000478; ActualCaption_Control1000000478Lbl)
            {
            }
            column(BudgetCaption_Control1000000479; BudgetCaption_Control1000000479Lbl)
            {
            }
            column(VarianceCaption_Control1000000480; VarianceCaption_Control1000000480Lbl)
            {
            }
            column(ActualCaption_Control1000000481; ActualCaption_Control1000000481Lbl)
            {
            }
            column(BudgetCaption_Control1000000482; BudgetCaption_Control1000000482Lbl)
            {
            }
            column(VarianceCaption_Control1000000483; VarianceCaption_Control1000000483Lbl)
            {
            }
            column(ActualCaption_Control1000000484; ActualCaption_Control1000000484Lbl)
            {
            }
            column(BudgetCaption_Control1000000485; BudgetCaption_Control1000000485Lbl)
            {
            }
            column(VarianceCaption_Control1000000486; VarianceCaption_Control1000000486Lbl)
            {
            }
            column(ActualCaption_Control1000000487; ActualCaption_Control1000000487Lbl)
            {
            }
            column(BudgetCaption_Control1000000488; BudgetCaption_Control1000000488Lbl)
            {
            }
            column(VarianceCaption_Control1000000489; VarianceCaption_Control1000000489Lbl)
            {
            }
            column(ActualCaption_Control1000000490; ActualCaption_Control1000000490Lbl)
            {
            }
            column(BudgetCaption_Control1000000491; BudgetCaption_Control1000000491Lbl)
            {
            }
            column(VarianceCaption_Control1000000492; VarianceCaption_Control1000000492Lbl)
            {
            }
            column(ActualCaption_Control1000000493; ActualCaption_Control1000000493Lbl)
            {
            }
            column(BudgetCaption_Control1000000494; BudgetCaption_Control1000000494Lbl)
            {
            }
            column(VarianceCaption_Control1000000495; VarianceCaption_Control1000000495Lbl)
            {
            }
            column(ActualCaption_Control1000000496; ActualCaption_Control1000000496Lbl)
            {
            }
            column(BudgetCaption_Control1000000497; BudgetCaption_Control1000000497Lbl)
            {
            }
            column(VarianceCaption_Control1000000498; VarianceCaption_Control1000000498Lbl)
            {
            }
            column(ActualCaption_Control1000000499; ActualCaption_Control1000000499Lbl)
            {
            }
            column(BudgetCaption_Control1000000500; BudgetCaption_Control1000000500Lbl)
            {
            }
            column(VarianceCaption_Control1000000504; VarianceCaption_Control1000000504Lbl)
            {
            }
            column(ActualCaption_Control1000000505; ActualCaption_Control1000000505Lbl)
            {
            }
            column(BudgetCaption_Control1000000506; BudgetCaption_Control1000000506Lbl)
            {
            }
            column(QuantityCaption; QuantityCaptionLbl)
            {
            }
            column(BudgetCaption_Control1000000249; BudgetCaption_Control1000000249Lbl)
            {
            }
            column(ActualCaption_Control1000000244; ActualCaption_Control1000000244Lbl)
            {
            }
            column(VarianceCaption_Control1000000285; VarianceCaption_Control1000000285Lbl)
            {
            }
            column(VarianceCaption_Control1000000334; VarianceCaption_Control1000000334Lbl)
            {
            }
            column(ActualCaption_Control1000000447; ActualCaption_Control1000000447Lbl)
            {
            }
            column(BudgetCaption_Control1000000448; BudgetCaption_Control1000000448Lbl)
            {
            }
            column(VarianceCaption_Control1000000450; VarianceCaption_Control1000000450Lbl)
            {
            }
            column(ActualCaption_Control1000000451; ActualCaption_Control1000000451Lbl)
            {
            }
            column(BudgetCaption_Control1000000452; BudgetCaption_Control1000000452Lbl)
            {
            }
            column(VarianceCaption_Control1000000454; VarianceCaption_Control1000000454Lbl)
            {
            }
            column(ActualCaption_Control1000000455; ActualCaption_Control1000000455Lbl)
            {
            }
            column(BudgetCaption_Control1000000621; BudgetCaption_Control1000000621Lbl)
            {
            }
            column(PortDay_Control1000000609Caption; PortDay_Control1000000609CaptionLbl)
            {
            }
            column(LostDay_Control1000000611Caption; LostDay_Control1000000611CaptionLbl)
            {
            }
            column(FishgDay_Control1000000613Caption; FishgDay_Control1000000613CaptionLbl)
            {
            }
            column(ETAConsCaption; ETAConsCaptionLbl)
            {
            }
            column(VessEndrCaption; VessEndrCaptionLbl)
            {
            }
            column(SkipperCaption; SkipperCaptionLbl)
            {
            }
            column(BudgetCaption_Control1000000446; BudgetCaption_Control1000000446Lbl)
            {
            }
            column(ActualCaption_Control1000000445; ActualCaption_Control1000000445Lbl)
            {
            }
            column(VarianceCaption_Control1000000286; VarianceCaption_Control1000000286Lbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(QuantityCaption_Control1000000308; QuantityCaption_Control1000000308Lbl)
            {
            }
            column(Var___N_Caption; Var___N_CaptionLbl)
            {
            }
            column(Bud___N_Caption; Bud___N_CaptionLbl)
            {
            }
            column(Bud___Caption; Bud___CaptionLbl)
            {
            }
            column(Bud__Qty_Caption; Bud__Qty_CaptionLbl)
            {
            }
            column(RateCaption; RateCaptionLbl)
            {
            }
            column(N_Caption; N_CaptionLbl)
            {
            }
            column(VarianceCaption_Control1000000252; VarianceCaption_Control1000000252Lbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Mark(true);
                //VoyageFilter:=COPYSTR(VoyageFilter+"No."+'|',1,1024);
                //VoyageFilter:=VoyageFilter+"No."+'|';
                if (not Mark(true)) then Error('Not Marked');
                ;

                if Res.Get("Person Responsible") then;
                ETD := "Starting Date";
                ETA := "Ending Date";
                if (ETD <> 0D) and (ETD < ETDCons) then ETDCons := ETD;
                if (ETA <> 0D) and (ETA > ETACons) then ETACons := ETA;

                //Cycle Day
                Job2.Get("No.");
                Job2.SetCurrentKey(Job2.Vessel, Job2."Starting Date");
                Job2.SetRange(Job2.Vessel, Vessel);    //Find last voyage
                if Job2.Next(-1) <> 0 then
                    ETA2 := Job2."Ending Date"
                else
                    if Loc.Get(Vessel) then ETA2 := Loc."Begining ETA" else ETA2 := 20030101D;

                if "Cycle Day (Manual)" <> 0 then
                    CycleDay := "Cycle Day (Manual)"
                else
                    CycleDay := ETA - ETA2;

                CalcFields("Lost Days");
                if "Lost At Sea (Manual)" <> 0 then
                    LostDay := "Lost At Sea (Manual)"
                else
                    LostDay := "Lost Days";

                if "Fishing Day (Manual)" <> 0 then
                    FishgDay := "Fishing Day (Manual)"
                else
                    FishgDay := "Sea Days" - LostDay;

                if "Port Day (Manual)" <> 0 then
                    PortDay := "Port Day (Manual)"
                else
                    PortDay := CycleDay - (FishgDay + LostDay);
                SeaDay := FishgDay + LostDay;

                //Creating Sub Header for the columns
                Countx := MaxCount;
                repeat
                    if Vessel = SeaRange[Countx] then begin
                        CellDefHd();
                        ColumnNo := Countx * 3;
                        SubHdr2A[Countx] := Loc."Vessel Endurance";
                        EnterCell(8, ColumnNo, Format(SubHdr2A[Countx]), false, false, false);
                        SubHdr3A[Countx] := ETA;
                        EnterCell(9, ColumnNo, Format(SubHdr3A[Countx]), false, false, false);
                        SubHdr4A[Countx] := FishgDay;
                        EnterCell(10, ColumnNo, Format(SubHdr4A[Countx]), false, false, false);
                        SubHdr5A[Countx] := LostDay;
                        EnterCell(11, ColumnNo, Format(SubHdr5A[Countx]), false, false, false);
                        SubHdr6A[Countx] := PortDay;
                        EnterCell(12, ColumnNo, Format(SubHdr6A[Countx]), false, false, false);
                        VessEndr := VessEndr + SubHdr2A[Countx];
                    end;
                    Countx := Countx - 1;
                until Countx = 0;

                //AAA
                HDTd[1] := ETDCons;
                HDT[2] := HDT[2] + VessEndr;
                HDT[4] := HDT[4] + FishgDay;
                HDT[5] := HDT[5] + LostDay;
                HDT[6] := HDT[6] + PortDay;

                //Find Total Tonnage of Export
                //   SETFILTER("Task Filter",'SHR');
                CalcFields("Product Quantity", "Points Actual");
                ExpTonnage := "Product Quantity" / 1000;
                PntStor[1] := "Points Actual";

                //   SETFILTER("Task Filter",'');
                CalcFields("Points Actual");
                PntStor[3] := "Points Actual";
                PntStor[2] := PntStor[3] - PntStor[1];

                if SeaDay <> 0 then begin
                    PntStor[4] := PntStor[1] / SeaDay;
                    PntStor[5] := PntStor[2] / SeaDay;
                    PntStor[6] := PntStor[3] / SeaDay;
                end;
                Validate("Net Incentive Actual");
                DataStor[3] := "Net Incentive Actual";

                JobSetUp.Get();
                a := 100;

                //Calculate the Fixed Salaries
                JBudLn.SetRange(JBudLn."Job No.", "No.");
                //JBudLn.SETRANGE(JBudLn.Type,JBudLn.Type::Resource);
                if JBudLn.Find('-') then begin
                    JBudLn.CalcFields(JBudLn.Counter);
                    PeopleOnVoy := JBudLn.Counter;
                end
                else
                    PeopleOnVoy := "No. of Deck Hands" + 2;
                DataStor[4] := JobSetUp."Fixed Salary Rate" * CycleDay * (PeopleOnVoy);

                //Travelling Expenses for Expatriate
                expcnt := 0;
                repeat
                    Employee.SetCurrentKey(Employee."Resource No.");
                    Employee.SetRange(Employee."Resource No.", JBudLn."No.");
                    Employee.SetFilter(Employee."Country/Region Code", '<>NG');
                    if Employee.Find('-') then expcnt := expcnt + 1;
                    ResCount := ResCount + 1;
                until JBudLn.Next() = 0;
                expcntTot := expcnt;
                DataStor[5] := JobSetUp."Travelling Expenses Rate" * expcnt * CycleDay;

                //License Fee
                if Coutry.Get("Fishing Country Code") then
                    DataStor[6] := Coutry."License Fees Rate" * CycleDay
                else begin
                    DataStor[6] := JobSetUp."License Fee Rate" * CycleDay;
                    Coutry.Name := 'Nigeria';
                end;
                if Loc.Get(Vessel) then begin
                    DataStor[7] := Loc."Insurance Rate" * CycleDay;
                    DataStor[13] := Loc."Depreciation Rate" * CycleDay;
                    DataStor[14] := Loc."Interest Rate" * CycleDay;
                    Vess := Loc.Name;
                end;

                DataStor[8] := JobSetUp.Clearing_Fwrd_NPA * ExpTonnage;
                DataStor[12] := JobSetUp."Shore Overheads" * CycleDay;

                //Credit from G/L Entry
                CountGPPG := 0;
                if ProdPostGrp.Find('-') then
                    repeat
                        CountGPPG := CountGPPG + 1;
                        "GLGPP Caption"[CountGPPG] := ProdPostGrp.Code;
                        GLEntry.SetCurrentKey(GLEntry."G/L Account No.", GLEntry."Job No.", GLEntry."Gen. Prod. Posting Group");
                        GLEntry.SetRange(GLEntry."G/L Account No.", JobSetUp."Job Val Begin Account", JobSetUp."Job Val End Account");
                        GLEntry.SetRange(GLEntry."Job No.", "No.");
                        GLEntry.SetRange(GLEntry."Gen. Prod. Posting Group", ProdPostGrp.Code);
                        if GLEntry.Find('-') then
                            repeat
                                GLStr[CountGPPG] := GLStr[CountGPPG] + GLEntry.Amount;
                            until GLEntry.Next() = 0;
                    until ProdPostGrp.Next() = 0;

                CurrExc.SetRange(CurrExc."Currency Code", 'USD');
                CurrExc.SetRange(CurrExc."Starting Date", 0D, ETA);
                if CurrExc.Find('+') then
                    CurrRate := CurrExc."Relational Exch. Rate Amount"
                //MESSAGE('EXCHANGE VALUE IS %1',CurrExc."Relational Exch. Rate Amount")
                else
                    CurrRate := 1;
                PntStor[7] := CurrRate;
            end;

            trigger OnPostDataItem()
            begin
                if StrLen(VoyageFilter) > 1 then VoyageFilter := CopyStr(VoyageFilter, 1, StrLen(VoyageFilter) - 1);

                if ETDCons = "Period End" then ETDCons := "Period Start";
                if ETACons = "Period Start" then ETACons := "Period End";

                HDTd[1] := ETDCons;
                HDT[2] := VessEndr;
                HDT[4] := FishgDay;
                HDT[5] := LostDay;
                HDT[6] := PortDay;
            end;

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo(Vessel);
                SetRange("Ending Date", "Period Start", "Period End");
                SetFilter("Fishing Country Code", FC);
                SetFilter(Vessel, VesselSel);
                SetFilter("No.", JobsNo);
                SetFilter("Person Responsible", ResourceOn);

                CurrReport.CreateTotals(CycleDay, PortDay, LostDay, SeaDay, FishgDay);
                CurrReport.CreateTotals(PntStor[1], PntStor[2], PntStor[3], PntStor[4], PntStor[5], PntStor[6], PntStor[7]);
                CurrReport.CreateTotals(DataStor[3], DataStor[4], DataStor[5], DataStor[6], DataStor[7], DataStor[8], DataStor[9]);
                CurrReport.CreateTotals(DataStor[10], DataStor[11], DataStor[12], DataStor[13], DataStor[14], DataStor[15]);
                CurrReport.CreateTotals(TotDirExp, TotPrice);

                Countrs := Count;
                if Countrs = 0 then Countrs := 1;
                VoyageFilter := '';

                ETDCons := "Period End";
                ETACons := "Period Start";

                //AAA - June 2002
                locate.SetRange(locate."Location Type", 1);
                TotLoc := locate.Count;
                Countx := 2;
                repeat
                    locate.CalcFields(locate."Qty to Cold Room", locate."Qty Budgeted");
                    if (locate."Qty to Cold Room" <> 0) then begin
                        //MESSAGE('I am Location %1',locate.Code);
                        SeaRange[Countx] := locate.Code;
                        EnterCell(4, Countx * 3, SeaRange[Countx], false, false, false);
                        Countx := Countx + 1;
                    end;
                until locate.Next() = 0;

                MaxCount := Countx;
                repeat
                    CurrReport.CreateTotals(SubHdr2A[Countx]);
                    CurrReport.CreateTotals(SubHdr4A[Countx]);
                    CurrReport.CreateTotals(SubHdr5A[Countx]);
                    CurrReport.CreateTotals(SubHdr6A[Countx]);
                    Countx := Countx - 1;
                until Countx = 0;
            end;
        }
        dataitem(Jb; Job)
        {
            DataItemTableView = SORTING("Ending Date");
            column(Jb__No__; "No.")
            {
            }
            column(Jb__Search_Description_; "Search Description")
            {
            }
            column(Jb_Description; Description)
            {
            }
            column(Jb__Description_2_; "Description 2")
            {
            }
            column(Jb__Bill_to_Customer_No__; "Bill-to Customer No.")
            {
            }
            column(Jb__Creation_Date_; "Creation Date")
            {
            }
            column(Jb__No__Caption; FieldCaption("No."))
            {
            }
            column(Jb__Search_Description_Caption; FieldCaption("Search Description"))
            {
            }
            column(Jb_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Jb__Description_2_Caption; FieldCaption("Description 2"))
            {
            }
            column(Jb__Bill_to_Customer_No__Caption; FieldCaption("Bill-to Customer No."))
            {
            }
            column(Jb__Creation_Date_Caption; FieldCaption("Creation Date"))
            {
            }
            dataitem(JbLedMark; "Job Ledger Entry")
            {
                DataItemLink = "Job No." = FIELD("No.");
                DataItemTableView = SORTING("Job No.", "Posting Date") WHERE("Location Code" = CONST('CRM-ASL'), "Gen. Prod. Posting Group" = FILTER('FIS' | ''));
                column(JbLedMark__Entry_No__; "Entry No.")
                {
                }
                column(JbLedMark__Job_No__; "Job No.")
                {
                }
                column(JbLedMark__Posting_Date_; "Posting Date")
                {
                }
                column(JbLedMark__Document_No__; "Document No.")
                {
                }
                column(JbLedMark_Type; Type)
                {
                }
                column(JbLedMark__Entry_No__Caption; FieldCaption("Entry No."))
                {
                }
                column(JbLedMark__Job_No__Caption; FieldCaption("Job No."))
                {
                }
                column(JbLedMark__Posting_Date_Caption; FieldCaption("Posting Date"))
                {
                }
                column(JbLedMark__Document_No__Caption; FieldCaption("Document No."))
                {
                }
                column(JbLedMark_TypeCaption; FieldCaption(Type))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Marked Rec" := true;
                    Modify();
                end;
            }
            dataitem(JbCatchMark; "Job catch Default")
            {
                DataItemLink = "No." = FIELD("No.");
                DataItemTableView = SORTING("No.", GroupSort);
                column(JbCatchMark__Table_Name_; "Table Name")
                {
                }
                column(JbCatchMark__No__; "No.")
                {
                }
                column(JbCatchMark_Code; Code)
                {
                }
                column(JbCatchMark_Description; Description)
                {
                }
                column(JbCatchMark__Pack_Size_; "Pack Size")
                {
                }
                column(JbCatchMark_Brand; Brand)
                {
                }
                column(JbCatchMark__Table_Name_Caption; FieldCaption("Table Name"))
                {
                }
                column(JbCatchMark__No__Caption; FieldCaption("No."))
                {
                }
                column(JbCatchMark_CodeCaption; FieldCaption(Code))
                {
                }
                column(JbCatchMark_DescriptionCaption; FieldCaption(Description))
                {
                }
                column(JbCatchMark__Pack_Size_Caption; FieldCaption("Pack Size"))
                {
                }
                column(JbCatchMark_BrandCaption; FieldCaption(Brand))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Marked Rec" := true;
                    Modify();
                end;
            }
            dataitem(ValEntMark; "Value Entry")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.") WHERE("Gen. Prod. Posting Group" = FILTER(<> 'FIS'));
                column(ValEntMark__Entry_No__; "Entry No.")
                {
                }
                column(ValEntMark__Item_No__; "Item No.")
                {
                }
                column(ValEntMark__Posting_Date_; "Posting Date")
                {
                }
                column(ValEntMark__Item_Ledger_Entry_Type_; "Item Ledger Entry Type")
                {
                }
                column(ValEntMark__Source_No__; "Source No.")
                {
                }
                column(ValEntMark__Document_No__; "Document No.")
                {
                }
                column(ValEntMark__Entry_No__Caption; FieldCaption("Entry No."))
                {
                }
                column(ValEntMark__Item_No__Caption; FieldCaption("Item No."))
                {
                }
                column(ValEntMark__Posting_Date_Caption; FieldCaption("Posting Date"))
                {
                }
                column(ValEntMark__Item_Ledger_Entry_Type_Caption; FieldCaption("Item Ledger Entry Type"))
                {
                }
                column(ValEntMark__Source_No__Caption; FieldCaption("Source No."))
                {
                }
                column(ValEntMark__Document_No__Caption; FieldCaption("Document No."))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    "Marked Rec" := true;
                    Modify();
                end;
            }

            trigger OnPreDataItem()
            begin
                Copy(Jobss);
                MarkedOnly(true);
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

    trigger OnInitReport()
    begin
        GLSetup.Get();
    end;

    trigger OnPostReport()
    begin
        REPORT.Run(50195);
    end;

    trigger OnPreReport()
    begin
        TempExcelBuffer.DeleteAll();
        Clear(TempExcelBuffer);
        cnt := 13;
    end;

    var
        LastFieldNo: Integer;
        TotalFor: Label 'Total';
        Job2: Record Job;
        CurrExc: Record "Currency Exchange Rate";
        ProdPostGrp: Record "Gen. Product Posting Group";
        JobSetUp: Record "Jobs Setup";
        JBudLn: Record "Job Planning Line";
        Employee: Record Employee;
        Loc: Record Location;
        Coutry: Record "Country/Region";
        GLEntry: Record "G/L Entry";
        Res: Record Resource;
        GLSetup: Record "General Ledger Setup";
        CurrRate: Decimal;
        DataStor: array[15] of Decimal;
        PntStor: array[8] of Decimal;
        ETD: Date;
        ETA: Date;
        ETDCons: Date;
        ETACons: Date;
        ETA2: Date;
        CycleDay: Decimal;
        PortDay: Decimal;
        LostDay: Decimal;
        SeaDay: Decimal;
        FishgDay: Decimal;
        a: Decimal;
        expcnt: Integer;
        expcntTot: Integer;
        PeopleOnVoy: Integer;
        ResCount: Integer;
        TotDirExp: Decimal;
        TotPrice: Decimal;
        ExpTonnage: Decimal;
        Vess: Text[30];
        Text18: Label 'CONSOLIDATED VOYAGE P & L STATEMENT';
        Text21: Label 'Shrimp Points';
        Text22: Label 'Fish Points';
        Text23: Label 'Total Points';
        Text24: Label 'Avg. Shrimp Points';
        Text25: Label 'Avg. Fish Points';
        Text26: Label 'Avg. Total Points';
        Text27: Label 'Exchange Rate';
        UOM: Record "Unit of Measure";
        UOMCd: Code[10];
        ItemVar: Code[10];
        "No.B": Code[10];
        GLStr: array[25] of Decimal;
        "GLGPP Caption": array[25] of Code[10];
        CountGPPG: Integer;
        "Period Start": Date;
        "Period End": Date;
        FC: Code[10];
        VesselSel: Code[25];
        JobsNo: Code[250];
        ResourceOn: Code[30];
        VoyageFilter: Code[1024];
        Countrs: Integer;
        locate: Record Location;
        Countx: Integer;
        level: Integer;
        TotLoc: Integer;
        MaxCount: Integer;
        SeaRangeC: array[100] of Decimal;
        SeaRangeCBud: array[100] of Decimal;
        SeaRangeCVar: array[100] of Decimal;
        SeaRange: array[100] of Text[30];
        TempExcelBuffer: Record "Excel Buffer 4 P&L";
        cnt: Integer;
        RowNo: Integer;
        ColumnNo: Integer;
        T: array[3] of Decimal;
        VT: array[3, 3] of Decimal;
        HDT: array[6] of Decimal;
        HDTd: array[1] of Date;
        RwLabel: Text[50];
        SubHdr1A: array[120] of Text[30];
        SubHdr2A: array[120] of Decimal;
        SubHdr3A: array[120] of Date;
        SubHdr4A: array[120] of Decimal;
        SubHdr5A: array[120] of Decimal;
        SubHdr6A: array[120] of Decimal;
        VessEndr: Decimal;
        T0001: Label 'Budget';
        T0002: Label 'Actual';
        T0003: Label 'Variance';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        FILTERSCaptionLbl: Label 'FILTERS';
        Control1000000167CaptionLbl: Label 'Label1000000167';
        Control1000000168CaptionLbl: Label 'Label1000000168';
        Control1000000169CaptionLbl: Label 'Label1000000169';
        Control1000000170CaptionLbl: Label 'Label1000000170';
        Control1000000171CaptionLbl: Label 'Label1000000171';
        Control1000000172CaptionLbl: Label 'Label1000000172';
        Control1000000173CaptionLbl: Label 'Label1000000173';
        VarianceCaptionLbl: Label 'Variance';
        ActualCaptionLbl: Label 'Actual';
        BudgetCaptionLbl: Label 'Budget';
        VarianceCaption_Control1000000459Lbl: Label 'Variance';
        ActualCaption_Control1000000460Lbl: Label 'Actual';
        BudgetCaption_Control1000000461Lbl: Label 'Budget';
        VarianceCaption_Control1000000462Lbl: Label 'Variance';
        ActualCaption_Control1000000463Lbl: Label 'Actual';
        BudgetCaption_Control1000000464Lbl: Label 'Budget';
        VarianceCaption_Control1000000465Lbl: Label 'Variance';
        ActualCaption_Control1000000466Lbl: Label 'Actual';
        BudgetCaption_Control1000000467Lbl: Label 'Budget';
        VarianceCaption_Control1000000468Lbl: Label 'Variance';
        ActualCaption_Control1000000469Lbl: Label 'Actual';
        BudgetCaption_Control1000000470Lbl: Label 'Budget';
        VarianceCaption_Control1000000471Lbl: Label 'Variance';
        ActualCaption_Control1000000472Lbl: Label 'Actual';
        BudgetCaption_Control1000000473Lbl: Label 'Budget';
        VarianceCaption_Control1000000474Lbl: Label 'Variance';
        ActualCaption_Control1000000475Lbl: Label 'Actual';
        BudgetCaption_Control1000000476Lbl: Label 'Budget';
        VarianceCaption_Control1000000477Lbl: Label 'Variance';
        ActualCaption_Control1000000478Lbl: Label 'Actual';
        BudgetCaption_Control1000000479Lbl: Label 'Budget';
        VarianceCaption_Control1000000480Lbl: Label 'Variance';
        ActualCaption_Control1000000481Lbl: Label 'Actual';
        BudgetCaption_Control1000000482Lbl: Label 'Budget';
        VarianceCaption_Control1000000483Lbl: Label 'Variance';
        ActualCaption_Control1000000484Lbl: Label 'Actual';
        BudgetCaption_Control1000000485Lbl: Label 'Budget';
        VarianceCaption_Control1000000486Lbl: Label 'Variance';
        ActualCaption_Control1000000487Lbl: Label 'Actual';
        BudgetCaption_Control1000000488Lbl: Label 'Budget';
        VarianceCaption_Control1000000489Lbl: Label 'Variance';
        ActualCaption_Control1000000490Lbl: Label 'Actual';
        BudgetCaption_Control1000000491Lbl: Label 'Budget';
        VarianceCaption_Control1000000492Lbl: Label 'Variance';
        ActualCaption_Control1000000493Lbl: Label 'Actual';
        BudgetCaption_Control1000000494Lbl: Label 'Budget';
        VarianceCaption_Control1000000495Lbl: Label 'Variance';
        ActualCaption_Control1000000496Lbl: Label 'Actual';
        BudgetCaption_Control1000000497Lbl: Label 'Budget';
        VarianceCaption_Control1000000498Lbl: Label 'Variance';
        ActualCaption_Control1000000499Lbl: Label 'Actual';
        BudgetCaption_Control1000000500Lbl: Label 'Budget';
        VarianceCaption_Control1000000504Lbl: Label 'Variance';
        ActualCaption_Control1000000505Lbl: Label 'Actual';
        BudgetCaption_Control1000000506Lbl: Label 'Budget';
        QuantityCaptionLbl: Label 'Quantity';
        BudgetCaption_Control1000000249Lbl: Label 'Budget';
        ActualCaption_Control1000000244Lbl: Label 'Actual';
        VarianceCaption_Control1000000285Lbl: Label 'Variance';
        VarianceCaption_Control1000000334Lbl: Label 'Variance';
        ActualCaption_Control1000000447Lbl: Label 'Actual';
        BudgetCaption_Control1000000448Lbl: Label 'Budget';
        VarianceCaption_Control1000000450Lbl: Label 'Variance';
        ActualCaption_Control1000000451Lbl: Label 'Actual';
        BudgetCaption_Control1000000452Lbl: Label 'Budget';
        VarianceCaption_Control1000000454Lbl: Label 'Variance';
        ActualCaption_Control1000000455Lbl: Label 'Actual';
        BudgetCaption_Control1000000621Lbl: Label 'Budget';
        PortDay_Control1000000609CaptionLbl: Label 'Port Day';
        LostDay_Control1000000611CaptionLbl: Label 'Lost At Sea';
        FishgDay_Control1000000613CaptionLbl: Label 'Fishing Day';
        ETAConsCaptionLbl: Label 'ETA';
        VessEndrCaptionLbl: Label 'Endurance';
        SkipperCaptionLbl: Label 'Skipper';
        BudgetCaption_Control1000000446Lbl: Label 'Budget';
        ActualCaption_Control1000000445Lbl: Label 'Actual';
        VarianceCaption_Control1000000286Lbl: Label 'Variance';
        EmptyStringCaptionLbl: Label '$';
        QuantityCaption_Control1000000308Lbl: Label 'Quantity';
        Var___N_CaptionLbl: Label 'Var. =N=';
        Bud___N_CaptionLbl: Label 'Bud. =N=';
        Bud___CaptionLbl: Label 'Bud. $';
        Bud__Qty_CaptionLbl: Label 'Bud. Qty.';
        RateCaptionLbl: Label 'Rate';
        N_CaptionLbl: Label '=N=';
        VarianceCaption_Control1000000252Lbl: Label 'Variance';

    [Scope('OnPrem')]
    procedure Syntesis(Cd: Code[10]; Pk: Code[10]; Br: Code[10]) Itemno: Code[10]
    begin
        //Syntesis Item Code Name
        if UOM.Get(Pk) then UOMCd := UOM."Catch Code";  //Get Unit of measure Code
        ItemVar := Format(Cd) + UOMCd + CopyStr(Br, 1, 1);    //Requip Code Name
        "No.B" := ItemVar;
    end;

    local procedure EnterCell(RowNo: Integer; ColumnNo: Integer; CellValue: Text[50]; Bold: Boolean; Italic: Boolean; UnderLine: Boolean)
    begin
        TempExcelBuffer.Init();
        TempExcelBuffer.Validate("Row No.", RowNo);
        TempExcelBuffer.Validate("Column No.", ColumnNo);
        TempExcelBuffer."Cell Value as Text" := CellValue;
        TempExcelBuffer.Formula := '';
        TempExcelBuffer.Bold := Bold;
        TempExcelBuffer.Italic := Italic;
        TempExcelBuffer.Underline := UnderLine;
        if not TempExcelBuffer.Insert() then TempExcelBuffer.Modify();
    end;

    [Scope('OnPrem')]
    procedure CellDefLn()
    begin
        ColumnNo := 1 + (level * 3);
        if SeaRangeCVar[level] <> 0 then EnterCell(RowNo, ColumnNo, Format(SeaRangeCVar[level]), false, false, false);
        if SeaRangeC[level] <> 0 then EnterCell(RowNo, ColumnNo - 1, Format(SeaRangeC[level]), false, false, false);
        if SeaRangeCBud[level] <> 0 then EnterCell(RowNo, ColumnNo - 2, Format(SeaRangeCBud[level]), false, false, false);

        if level = 1 then begin
            if T[3] <> 0 then EnterCell(RowNo, ColumnNo, Format(T[3]), false, false, false);
            if T[2] <> 0 then EnterCell(RowNo, ColumnNo - 1, Format(T[2]), false, false, false);
            if T[1] <> 0 then EnterCell(RowNo, ColumnNo - 2, Format(T[1]), false, false, false);
            EnterCell(RowNo, 1, RwLabel, false, false, false); //Row Label (Caption)
        end;
    end;

    [Scope('OnPrem')]
    procedure CellDefVT(RowN: Integer; Varn: Decimal; Actl: Decimal; Budg: Decimal; TotNo: Integer)
    begin
        ColumnNo := 1 + (level * 3);
        if SeaRangeCVar[level] <> 0 then EnterCell(RowN, ColumnNo, Format(Varn), false, false, false);
        if SeaRangeC[level] <> 0 then EnterCell(RowN, ColumnNo - 1, Format(Actl), false, false, false);
        if SeaRangeCBud[level] <> 0 then EnterCell(RowN, ColumnNo - 2, Format(Budg), false, false, false);

        if level = 1 then begin
            if VT[TotNo, 3] <> 0 then EnterCell(RowN, ColumnNo, Format(VT[TotNo, 3]), false, false, false);
            if VT[TotNo, 2] <> 0 then EnterCell(RowN, ColumnNo - 1, Format(VT[TotNo, 2]), false, false, false);
            if VT[TotNo, 1] <> 0 then EnterCell(RowN, ColumnNo - 2, Format(VT[TotNo, 1]), false, false, false);
            EnterCell(RowN, 1, RwLabel, false, false, false); //Row Label (Caption)
        end;
    end;

    [Scope('OnPrem')]
    procedure CellDefHd()
    begin
        RowNo := 5;
        ColumnNo := 1 + (Countx * 3);
        EnterCell(RowNo, ColumnNo, T0003, false, false, false);
        EnterCell(RowNo, ColumnNo - 1, T0002, false, false, false);
        EnterCell(RowNo, ColumnNo - 2, T0001, false, false, false);

        if Countx = 2 then begin
            EnterCell(7, 1, 'Skipper', false, false, false);
            EnterCell(8, 1, 'Endurance', false, false, false);
            EnterCell(9, 1, 'ETA', false, false, false);
            EnterCell(10, 1, 'Fishing Day', false, false, false);
            EnterCell(11, 1, 'Lost At Sea', false, false, false);
            EnterCell(12, 1, 'Port Day', false, false, false);

            //EnterCell(7,2,FORMAT(T[]),FALSE,FALSE,FALSE);
            EnterCell(8, 2, Format(HDT[2]), false, false, false);
            EnterCell(9, 2, Format(HDTd[1]), false, false, false);
            EnterCell(10, 2, Format(HDT[4]), false, false, false);
            EnterCell(11, 2, Format(HDT[5]), false, false, false);
            EnterCell(12, 2, Format(HDT[6]), false, false, false);
        end;
    end;

    [Scope('OnPrem')]
    procedure BIN()
    begin
    end;

    [Scope('OnPrem')]
    procedure "Bin 2"()
    begin
    end;
}
