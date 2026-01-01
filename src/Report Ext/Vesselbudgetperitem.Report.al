report 50178 "Vessel budget per item"
{
    // Item."Gen. Prod. Posting Group"
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/Vesselbudgetperitem.rdlc';
    Caption = 'Vessel budget per item';
    dataset
    {
        dataitem(Location; Location)
        {
            DataItemTableView = WHERE("Location Type" = CONST(Vessel));
            RequestFilterFields = "Code";
            column(Location_Code; Code)
            {
            }
            dataitem(Item; Item)
            {
                DataItemTableView = SORTING("No.") WHERE("Gen. Prod. Posting Group" = FILTER(<> 'FIS'));
                RequestFilterFields = "Gen. Prod. Posting Group";
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
                column(Location_Name; Location.Name)
                {
                }
                column(Location__Budgeted_Voyages_; Location."Budgeted Voyages")
                {
                }
                column(VoyNo_1_; VoyNo[1])
                {
                }
                column(VoyNo_2_; VoyNo[2])
                {
                }
                column(VoyNo_3_; VoyNo[3])
                {
                }
                column(VoyNo_4_; VoyNo[4])
                {
                }
                column(VoyNo_5_; VoyNo[5])
                {
                }
                column(VoyNo_6_; VoyNo[6])
                {
                }
                column(VoyNo_7_; VoyNo[7])
                {
                }
                column(ETA_1_; ETA[1])
                {
                }
                column(ETA_2_; ETA[2])
                {
                }
                column(ETA_3_; ETA[3])
                {
                }
                column(ETA_4_; ETA[4])
                {
                }
                column(ETA_5_; ETA[5])
                {
                }
                column(ETA_6_; ETA[6])
                {
                }
                column(ETA_7_; ETA[7])
                {
                }
                column(VoyNo_8_; VoyNo[8])
                {
                }
                column(ETA_8_; ETA[8])
                {
                }
                column(Item__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
                {
                }
                column(STot_3_; STot[3])
                {
                }
                column(STot_2_; STot[2])
                {
                }
                column(STot_1_; STot[1])
                {
                }
                column(Suppld_8_; Suppld[8])
                {
                }
                column(Suppld_7_; Suppld[7])
                {
                }
                column(Suppld_6_; Suppld[6])
                {
                }
                column(Suppld_5_; Suppld[5])
                {
                }
                column(Suppld_4_; Suppld[4])
                {
                }
                column(Suppld_3_; Suppld[3])
                {
                }
                column(Suppld_2_; Suppld[2])
                {
                }
                column(Suppld_1_; Suppld[1])
                {
                }
                column(BudTyp_4_; BudTyp[4])
                {
                }
                column(Item__Base_Unit_of_Measure_; "Base Unit of Measure")
                {
                }
                column(Item__No__; "No.")
                {
                }
                column(Item_Description; Description)
                {
                }
                column(Sn; Sn)
                {
                }
                column(STot_3__Control1000000068; STot[3])
                {
                }
                column(STot_2__Control1000000069; STot[2])
                {
                }
                column(STot_1__Control1000000070; STot[1])
                {
                }
                column(Suppld_8__Control1000000071; Suppld[8])
                {
                }
                column(Suppld_7__Control1000000072; Suppld[7])
                {
                }
                column(Suppld_6__Control1000000073; Suppld[6])
                {
                }
                column(Suppld_5__Control1000000074; Suppld[5])
                {
                }
                column(Suppld_4__Control1000000075; Suppld[4])
                {
                }
                column(Suppld_3__Control1000000076; Suppld[3])
                {
                }
                column(Suppld_2__Control1000000077; Suppld[2])
                {
                }
                column(Suppld_1__Control1000000078; Suppld[1])
                {
                }
                column(BudTyp_4__Control1000000079; BudTyp[4])
                {
                }
                column(Item__Base_Unit_of_Measure__Control1000000080; "Base Unit of Measure")
                {
                }
                column(Item__No___Control1000000081; "No.")
                {
                }
                column(Item_Description_Control1000000082; Description)
                {
                }
                column(Sn_Control1000000083; Sn)
                {
                }
                column(Sn_Control1000000046; Sn)
                {
                }
                column(Item_Description_Control1000000047; Description)
                {
                }
                column(Item__No___Control1000000048; "No.")
                {
                }
                column(Item__Base_Unit_of_Measure__Control1000000055; "Base Unit of Measure")
                {
                }
                column(BudTyp_4__Control1000000056; BudTyp[4])
                {
                }
                column(Suppld_2__Control1000000057; Suppld[2])
                {
                }
                column(Suppld_3__Control1000000058; Suppld[3])
                {
                }
                column(Suppld_4__Control1000000059; Suppld[4])
                {
                }
                column(Suppld_5__Control1000000060; Suppld[5])
                {
                }
                column(Suppld_6__Control1000000061; Suppld[6])
                {
                }
                column(Suppld_1__Control1000000062; Suppld[1])
                {
                }
                column(STot_3__Control1000000063; STot[3])
                {
                }
                column(STot_2__Control1000000064; STot[2])
                {
                }
                column(STot_1__Control1000000065; STot[1])
                {
                }
                column(Suppld_7__Control1000000066; Suppld[7])
                {
                }
                column(Suppld_8__Control1000000067; Suppld[8])
                {
                }
                column(Sn_Control1000000011; Sn)
                {
                }
                column(Item_Description_Control1000000014; Description)
                {
                }
                column(Item__No___Control1000000017; "No.")
                {
                }
                column(Item__Base_Unit_of_Measure__Control1000000020; "Base Unit of Measure")
                {
                }
                column(BudTyp_4__Control1000000007; BudTyp[4])
                {
                }
                column(Suppld_2__Control1000000013; Suppld[2])
                {
                }
                column(Suppld_3__Control1000000016; Suppld[3])
                {
                }
                column(Suppld_4__Control1000000019; Suppld[4])
                {
                }
                column(Suppld_5__Control1000000022; Suppld[5])
                {
                }
                column(Suppld_6__Control1000000025; Suppld[6])
                {
                }
                column(Suppld_1__Control1000000023; Suppld[1])
                {
                }
                column(STot_3__Control1000000010; STot[3])
                {
                }
                column(STot_2__Control1000000050; STot[2])
                {
                }
                column(STot_1__Control1000000053; STot[1])
                {
                }
                column(Suppld_7__Control1000000054; Suppld[7])
                {
                }
                column(Suppld_8__Control1000000033; Suppld[8])
                {
                }
                column(End_____Gen__Prod__Posting_Group_; 'End ' + "Gen. Prod. Posting Group")
                {
                }
                column(ItemCaption; ItemCaptionLbl)
                {
                }
                column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
                {
                }
                column(Location__Budgeted_Voyages_Caption; Location.FieldCaption("Budgeted Voyages"))
                {
                }
                column(Sn_Control1000000011Caption; Sn_Control1000000011CaptionLbl)
                {
                }
                column(Item_Description_Control1000000014Caption; FieldCaption(Description))
                {
                }
                column(Item__No___Control1000000017Caption; FieldCaption("No."))
                {
                }
                column(Item__Base_Unit_of_Measure__Control1000000020Caption; Item__Base_Unit_of_Measure__Control1000000020CaptionLbl)
                {
                }
                column(BudTyp_4__Control1000000007Caption; BudTyp_4__Control1000000007CaptionLbl)
                {
                }
                column(TotalCaption; TotalCaptionLbl)
                {
                }
                column(ProjectedCaption; ProjectedCaptionLbl)
                {
                }
                column(VarianceCaption; VarianceCaptionLbl)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    BudTyp[1] := "Ves Budg Type 1";
                    BudTyp[2] := "Ves Budg Type 2";
                    BudTyp[3] := "Ves Budg Type 3";
                    if "Annual Budget Method" then
                        BudTyp[4] := BudTyp[VesTyp]
                    else
                        BudTyp[4] := BudTyp[VesTyp] * Location."Budgeted Voyages";

                    SetFilter("Location Filter", Vess);
                    Countx := 1;
                    STot[1] := 0;
                    repeat
                        if Countx = 1 then
                            SetFilter("Date Filter", '%1..%2', CalcDate('-5D', ETD[Countx]), ETA[Countx])
                        else
                            SetFilter("Date Filter", '%1..%2', CalcDate('+1D', ETA[Countx - 1]), ETA[Countx]);
                        CalcFields("Transferred (Qty.)");
                        Suppld[Countx] := "Transferred (Qty.)";
                        STot[1] := STot[1] + Suppld[Countx];
                        Countx := Countx + 1;
                    until Countx = Job.Count + 1;

                    STot[2] := BudTyp[4] - STot[1];
                    if CompVoy <> 0 then STot[3] := (STot[1] / CompVoy) * Location."Budgeted Voyages";

                    if (("Ves Budg Type 1" + "Ves Budg Type 2" + "Ves Budg Type 3") > 0) then Sn := Sn + 1;
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo("Inventory Posting Group");
                    Vess := Location.Code;
                    VesTyp := Location."Sea Days";
                    //MESSAGE('Vessel Type is %1',VesTyp);
                    VoyHdr();
                end;
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
        LastFieldNo: Integer;
        Sn: Integer;
        BudTyp: array[4] of Decimal;
        VesTyp: Integer;
        Vess: Code[10];
        ETA: array[15] of Date;
        ETD: array[15] of Date;
        VoyNo: array[15] of Code[10];
        Suppld: array[15] of Decimal;
        STot: array[3] of Decimal;
        Job: Record Job;
        TotVoy: Integer;
        Countx: Integer;
        CompVoy: Integer;
        ItemCaptionLbl: Label 'Item';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Sn_Control1000000011CaptionLbl: Label 'SNo.';
        Item__Base_Unit_of_Measure__Control1000000020CaptionLbl: Label 'Base UOM';
        BudTyp_4__Control1000000007CaptionLbl: Label 'Budgeted Supply';
        TotalCaptionLbl: Label 'Total';
        ProjectedCaptionLbl: Label 'Projected';
        VarianceCaptionLbl: Label 'Variance';

    [Scope('OnPrem')]
    procedure VoyHdr()
    begin
        Job.SetCurrentKey(Job.Vessel, Job."Starting Date");
        Job.SetFilter(Job."Ending Date", '%1..%2', CalcDate('CY-1Y+1D', WorkDate()), CalcDate('CY', WorkDate()));
        Job.SetFilter(Job.Vessel, Vess);
        TotVoy := Job.Count;
        Job.Find('-');
        Countx := 1;

        repeat
            VoyNo[Countx] := Job."Voyage No.";
            ETA[Countx] := Job."Ending Date";
            ETD[Countx] := Job."Starting Date";
            if ETA[Countx] <> 0D then CompVoy := CompVoy + 1;    //No of completed Voyages
            Countx := Countx + 1;
            Job.Next();
        until Countx = Job.Count + 1;
    end;

    [Scope('OnPrem')]
    procedure bin()
    begin
        /*  Job.SETFILTER(Job."date filter",'%1..%2',010180D,DatoUppr);
          Job.CALCFIELDS(Job."Roll Back Current Operation");
          SeaRange[Countx]:=Job.Code;
          SeaRangeFl[Countx]:=Job."Roll Back Current Operation";   //Job filter
          IF Job."Roll Back Current Operation"<>'' THEN
              CurrOper:=Job."Roll Back Current Operation" ELSE
              CurrOper:='';//Job."Current Operation";
          OperDetails;
        */
    end;
}
