report 50007 "Daily BreakUp by Vessel Rep 1"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/DailyBreakUpbyVesselRep1.rdlc';
    Caption = 'Daily BreakUp by Vessel Rep 1';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    dataset
    {
        dataitem("Inventory Posting G Cat Tot"; "Inventory Posting Group")
        {
            DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER(> 0), Category = FILTER(<> ''));
            // DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER('1..3'), Category = FILTER(<> ''));
            RequestFilterFields = "Statistics Group", Category, "Date Filter";
            column(test; Test)
            {
            }
            column(testc_18; testc[1])
            {
            }
            column(testc_19; testc[2])
            {
            }
            column(testc_20; testc[3])
            {
            }
            column(testc_21; testc[4])
            {
            }
            column(testc_22; testc[5])
            {
            }
            column(testc_23; testc[6])
            {
            }
            column(testc_24; testc[7])
            {
            }
            column(testc_25; testc[8])
            {
            }
            column(testc_26; testc[9])
            {
            }
            column(testc_27; testc[10])
            {
            }
            column(testc_28; testc[11])
            {
            }
            column(testc_29; testc[12])
            {
            }
            column(testc_30; testc[13])
            {
            }
            column(testc_31; testc[14])
            {
            }
            column(testc_32; testc[15])
            {
            }
            column(testc_33; testc[16])
            {
            }
            column(testc_34; testc[17])
            {
            }
            column(testc_35; testc[18])
            {
            }
            column(Total_Vessels; TotLoc)
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(USERID________; UserId + ' :  ')
            {
            }
            column(STRSUBSTNO_Text001_DateFilter_; StrSubstNo(Text001, DateFilter))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(Inventory_Posting_G_Cat_Tot__Inventory_total2_; Inventory2)
            {
            }
            column(ShrimpPoint_18_; ShrimpPoint[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_18_; FishPoint[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_19_; ShrimpPoint[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_19_; FishPoint[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_20_; ShrimpPoint[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_20_; FishPoint[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_21_; ShrimpPoint[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_21_; FishPoint[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_22_; ShrimpPoint[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_22_; FishPoint[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_23_; ShrimpPoint[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_23_; FishPoint[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_24_; ShrimpPoint[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_24_; FishPoint[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_25_; ShrimpPoint[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_25_; FishPoint[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_26_; ShrimpPoint[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_26_; FishPoint[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_27_; ShrimpPoint[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_27_; FishPoint[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_28_; ShrimpPoint[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_28_; FishPoint[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_29_; ShrimpPoint[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_29_; FishPoint[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_30_; ShrimpPoint[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_30_; FishPoint[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_31_; ShrimpPoint[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_31_; FishPoint[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_32_; ShrimpPoint[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_32_; FishPoint[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_33_; ShrimpPoint[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_33_; FishPoint[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_34_; ShrimpPoint[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_34_; FishPoint[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_35_; ShrimpPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_35_; FishPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_36_; ShrimpPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_36_; FishPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_37_; ShrimpPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_37_; FishPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_38_; ShrimpPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_38_; FishPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_39_; ShrimpPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_39_; FishPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_40_; ShrimpPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_40_; FishPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_41_; ShrimpPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_41_; FishPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_42_; ShrimpPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_42_; FishPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_43_; ShrimpPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_43_; FishPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_44_; ShrimpPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_44_; FishPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_45_; ShrimpPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_45_; FishPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_46_; ShrimpPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_46_; FishPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_47_; ShrimpPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_47_; FishPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_48_; ShrimpPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_48_; FishPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_49_; ShrimpPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_49_; FishPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_50_; ShrimpPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_50_; FishPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_51_; ShrimpPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_51_; FishPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_52_; ShrimpPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_52_; FishPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_53_; ShrimpPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_53_; FishPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_54_; ShrimpPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_54_; FishPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_55_; ShrimpPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_55_; FishPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_56_; ShrimpPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_56_; FishPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_57_; ShrimpPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_57_; FishPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_58_; ShrimpPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_58_; FishPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_59_; ShrimpPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_59_; FishPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_60_; ShrimpPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_60_; FishPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_61_; ShrimpPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_61_; FishPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_62_; ShrimpPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_62_; FishPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_63_; ShrimpPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_63_; FishPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_64_; ShrimpPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_64_; FishPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_65_; ShrimpPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_65_; FishPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_66_; ShrimpPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_66_; FishPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_67_; ShrimpPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_67_; FishPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_68_; ShrimpPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_68_; FishPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_69_; ShrimpPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_69_; FishPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_70_; ShrimpPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_70_; FishPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_71_; ShrimpPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_71_; FishPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_72_; ShrimpPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_72_; FishPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_73_; ShrimpPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_73_; FishPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_74_; ShrimpPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_74_; FishPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_75_; ShrimpPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_75_; FishPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_76_; ShrimpPoint[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_76_; FishPoint[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_77_; ShrimpPoint[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_77_; FishPoint[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_78_; ShrimpPoint[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_78_; FishPoint[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_79_; ShrimpPoint[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_79_; FishPoint[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_80_; ShrimpPoint[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_80_; FishPoint[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_81_; ShrimpPoint[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_81_; FishPoint[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_82_; ShrimpPoint[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_82_; FishPoint[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_83_; ShrimpPoint[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_83_; FishPoint[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_84_; ShrimpPoint[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_84_; FishPoint[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_85_; ShrimpPoint[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_85_; FishPoint[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_86_; ShrimpPoint[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_86_; FishPoint[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_87_; ShrimpPoint[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_87_; FishPoint[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_88_; ShrimpPoint[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_88_; FishPoint[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_89_; ShrimpPoint[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_89_; FishPoint[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_90_; ShrimpPoint[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_90_; FishPoint[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_18_; VesselPoint[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_19_; VesselPoint[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_20_; VesselPoint[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_21_; VesselPoint[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_22_; VesselPoint[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_23_; VesselPoint[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_24_; VesselPoint[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_25_; VesselPoint[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_26_; VesselPoint[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_27_; VesselPoint[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_28_; VesselPoint[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_29_; VesselPoint[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_30_; VesselPoint[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_31_; VesselPoint[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_32_; VesselPoint[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_33_; VesselPoint[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_34_; VesselPoint[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_35_; VesselPoint[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_36_; VesselPoint[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_37_; VesselPoint[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_38_; VesselPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_39_; VesselPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_40_; VesselPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_41_; VesselPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_42_; VesselPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_43_; VesselPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_44_; VesselPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_45_; VesselPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_46_; VesselPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_47_; VesselPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_48_; VesselPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_49_; VesselPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_50_; VesselPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_51_; VesselPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_52_; VesselPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_53_; VesselPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_54_; VesselPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_55_; VesselPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_56_; VesselPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_57_; VesselPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_58_; VesselPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_59_; VesselPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_60_; VesselPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_61_; VesselPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_62_; VesselPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_63_; VesselPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_64_; VesselPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_65_; VesselPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_66_; VesselPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_67_; VesselPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_68_; VesselPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_69_; VesselPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_70_; VesselPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_71_; VesselPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_72_; VesselPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_73_; VesselPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_74_; VesselPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_75_; VesselPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_76_; VesselPoint[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_77_; VesselPoint[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_78_; VesselPoint[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_79_; VesselPoint[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_80_; VesselPoint[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_81_; VesselPoint[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_82_; VesselPoint[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_83_; VesselPoint[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_84_; VesselPoint[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_85_; VesselPoint[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_86_; VesselPoint[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_87_; VesselPoint[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_88_; VesselPoint[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_89_; VesselPoint[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_90_; VesselPoint[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_91_; VesselPoint[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_91_; ShrimpPoint[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_91_; FishPoint[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_92_; VesselPoint[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_92_; ShrimpPoint[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_92_; FishPoint[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_93_; VesselPoint[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_93_; ShrimpPoint[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_93_; FishPoint[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_94_; VesselPoint[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_94_; ShrimpPoint[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_94_; FishPoint[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_95_; VesselPoint[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_95_; ShrimpPoint[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_95_; FishPoint[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_96_; VesselPoint[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_96_; ShrimpPoint[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_96_; FishPoint[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_18_; SeaRangeD[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_20_; SeaRangeD[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_19_; SeaRangeD[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_30_; SeaRangeD[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_29_; SeaRangeD[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_28_; SeaRangeD[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_27_; SeaRangeD[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_26_; SeaRangeD[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_25_; SeaRangeD[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_24_; SeaRangeD[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_23_; SeaRangeD[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_22_; SeaRangeD[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_21_; SeaRangeD[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_40_; SeaRangeD[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_39_; SeaRangeD[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_38_; SeaRangeD[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_37_; SeaRangeD[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_36_; SeaRangeD[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_35_; SeaRangeD[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_34_; SeaRangeD[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_33_; SeaRangeD[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_32_; SeaRangeD[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_31_; SeaRangeD[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_50_; SeaRangeD[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_49_; SeaRangeD[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_48_; SeaRangeD[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_47_; SeaRangeD[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_46_; SeaRangeD[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_45_; SeaRangeD[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_44_; SeaRangeD[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_43_; SeaRangeD[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_42_; SeaRangeD[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_41_; SeaRangeD[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_60_; SeaRangeD[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_59_; SeaRangeD[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_58_; SeaRangeD[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_57_; SeaRangeD[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_56_; SeaRangeD[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_55_; SeaRangeD[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_54_; SeaRangeD[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_53_; SeaRangeD[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_52_; SeaRangeD[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_51_; SeaRangeD[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_70_; SeaRangeD[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_69_; SeaRangeD[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_68_; SeaRangeD[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_67_; SeaRangeD[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_66_; SeaRangeD[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_65_; SeaRangeD[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_64_; SeaRangeD[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_63_; SeaRangeD[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_62_; SeaRangeD[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_61_; SeaRangeD[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_80_; SeaRangeD[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_79_; SeaRangeD[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_78_; SeaRangeD[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_77_; SeaRangeD[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_76_; SeaRangeD[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_75_; SeaRangeD[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_74_; SeaRangeD[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_73_; SeaRangeD[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_72_; SeaRangeD[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_71_; SeaRangeD[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_90_; SeaRangeD[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_89_; SeaRangeD[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_88_; SeaRangeD[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_87_; SeaRangeD[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_86_; SeaRangeD[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_85_; SeaRangeD[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_84_; SeaRangeD[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_83_; SeaRangeD[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_82_; SeaRangeD[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_81_; SeaRangeD[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_96_; SeaRangeD[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_95_; SeaRangeD[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_94_; SeaRangeD[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_93_; SeaRangeD[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_92_; SeaRangeD[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_91_; SeaRangeD[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_18_; SeaRange[1])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(SeaRange_19_; SeaRange[2])
            {
            }
            column(SeaRange_20_; SeaRange[3])
            {
            }
            column(SeaRange_21_; SeaRange[4])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(SeaRange_22_; SeaRange[5])
            {
            }
            column(SeaRange_23_; SeaRange[6])
            {
            }
            column(SeaRange_24_; SeaRange[7])
            {
            }
            column(SeaRange_25_; SeaRange[8])
            {
            }
            column(SeaRange_26_; SeaRange[9])
            {
            }
            column(SeaRange_27_; SeaRange[10])
            {
            }
            column(SeaRange_28_; SeaRange[11])
            {
            }
            column(SeaRange_29_; SeaRange[12])
            {
            }
            column(SeaRange_30_; SeaRange[13])
            {
            }
            column(SeaRange_31_; SeaRange[14])
            {
            }
            column(SeaRange_32_; SeaRange[15])
            {
            }
            column(SeaRange_33_; SeaRange[16])
            {
            }
            column(SeaRange_34_; SeaRange[17])
            {
            }
            column(SeaRange_35_; SeaRange[35])
            {
            }
            column(SeaRange_36_; SeaRange[36])
            {
            }
            column(SeaRange_37_; SeaRange[37])
            {
            }
            column(SeaRange_38_; SeaRange[38])
            {
            }
            column(SeaRange_39_; SeaRange[39])
            {
            }
            column(SeaRange_40_; SeaRange[40])
            {
            }
            column(SeaRange_41_; SeaRange[41])
            {
            }
            column(SeaRange_42_; SeaRange[42])
            {
            }
            column(SeaRange_43_; SeaRange[43])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(SeaRange_44_; SeaRange[44])
            {
            }
            column(SeaRange_45_; SeaRange[45])
            {
            }
            column(SeaRange_46_; SeaRange[46])
            {
            }
            column(SeaRange_47_; SeaRange[47])
            {
            }
            column(SeaRange_48_; SeaRange[48])
            {
            }
            column(SeaRange_49_; SeaRange[49])
            {
            }
            column(SeaRange_50_; SeaRange[50])
            {
            }
            column(SeaRange_51_; SeaRange[51])
            {
            }
            column(SeaRange_52_; SeaRange[52])
            {
            }
            column(SeaRange_53_; SeaRange[53])
            {
            }
            column(SeaRange_54_; SeaRange[54])
            {
            }
            column(SeaRange_55_; SeaRange[55])
            {
            }
            column(SeaRange_56_; SeaRange[56])
            {
            }
            column(SeaRange_57_; SeaRange[57])
            {
            }
            column(SeaRange_58_; SeaRange[58])
            {
            }
            column(SeaRange_59_; SeaRange[59])
            {
            }
            column(SeaRange_60_; SeaRange[60])
            {
            }
            column(SeaRange_61_; SeaRange[61])
            {
            }
            column(SeaRange_62_; SeaRange[62])
            {
            }
            column(SeaRange_63_; SeaRange[63])
            {
            }
            column(SeaRange_64_; SeaRange[64])
            {
            }
            column(SeaRange_65_; SeaRange[65])
            {
            }
            column(SeaRange_66_; SeaRange[66])
            {
            }
            column(SeaRange_67_; SeaRange[67])
            {
            }
            column(SeaRange_68_; SeaRange[68])
            {
            }
            column(SeaRange_69_; SeaRange[69])
            {
            }
            column(SeaRange_70_; SeaRange[70])
            {
            }
            column(SeaRange_71_; SeaRange[71])
            {
            }
            column(SeaRange_72_; SeaRange[72])
            {
            }
            column(SeaRange_73_; SeaRange[73])
            {
            }
            column(SeaRange_74_; SeaRange[74])
            {
            }
            column(SeaRange_75_; SeaRange[75])
            {
            }
            column(SeaRange_76_; SeaRange[76])
            {
            }
            column(SeaRange_77_; SeaRange[77])
            {
            }
            column(SeaRange_78_; SeaRange[78])
            {
            }
            column(SeaRange_79_; SeaRange[79])
            {
            }
            column(SeaRange_80_; SeaRange[80])
            {
            }
            column(SeaRange_81_; SeaRange[81])
            {
            }
            column(SeaRange_82_; SeaRange[82])
            {
            }
            column(SeaRange_83_; SeaRange[83])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(SeaRange_84_; SeaRange[84])
            {
            }
            column(SeaRange_85_; SeaRange[85])
            {
            }
            column(SeaRange_86_; SeaRange[86])
            {
            }
            column(SeaRange_87_; SeaRange[87])
            {
            }
            column(SeaRange_88_; SeaRange[88])
            {
            }
            column(SeaRange_89_; SeaRange[89])
            {
            }
            column(SeaRange_90_; SeaRange[90])
            {
            }
            column(SeaRange_91_; SeaRange[91])
            {
            }
            column(SeaRange_92_; SeaRange[92])
            {
            }
            column(SeaRange_93_; SeaRange[93])
            {
            }
            column(SeaRange_94_; SeaRange[94])
            {
            }
            column(SeaRange_95_; SeaRange[95])
            {
            }
            column(SeaRange_96_; SeaRange[96])
            {
            }
            column(COPYSTR_Category_5_; CopyStr(Category, 5))
            {
            }
            column(InvtTot; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36_; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35_; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34_; SeaRangeC[17])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33_; SeaRangeC[16])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32_; SeaRangeC[15])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31_; SeaRangeC[14])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30_; SeaRangeC[13])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29_; SeaRangeC[12])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28_; SeaRangeC[11])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27_; SeaRangeC[10])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26_; SeaRangeC[9])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_25_; SeaRangeC[8])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24_; SeaRangeC[7])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23_; SeaRangeC[6])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22_; SeaRangeC[5])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_21_; SeaRangeC[4])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20_; SeaRangeC[3])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19_; SeaRangeC[2])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18_; SeaRangeC[1])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37_; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38_; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39_; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40_; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41_; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42_; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43_; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44_; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45_; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46_; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47_; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48_; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49_; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_50_; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_51_; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52_; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53_; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54_; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55_; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56_; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57_; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58_; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59_; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60_; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61_; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62_; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63_; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64_; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65_; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66_; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67_; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68_; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69_; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70_; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71_; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72_; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73_; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74_; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75_; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_76_; SeaRangeC[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_77_; SeaRangeC[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_78_; SeaRangeC[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_79_; SeaRangeC[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_80_; SeaRangeC[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_81_; SeaRangeC[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_82_; SeaRangeC[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_83_; SeaRangeC[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_84_; SeaRangeC[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_85_; SeaRangeC[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_86_; SeaRangeC[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_87_; SeaRangeC[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_88_; SeaRangeC[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_89_; SeaRangeC[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_90_; SeaRangeC[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_91_; SeaRangeC[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_92_; SeaRangeC[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_93_; SeaRangeC[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_94_; SeaRangeC[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_95_; SeaRangeC[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_96_; SeaRangeC[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(T002; T002)
            {
            }
            column(InvtTot_Control1000000799; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000800; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000818; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000819; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_21__Control1000000820; SeaRangeC[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22__Control1000000821; SeaRangeC[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23__Control1000000822; SeaRangeC[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24__Control1000000823; SeaRangeC[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_25__Control1000000824; SeaRangeC[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26__Control1000000825; SeaRangeC[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27__Control1000000826; SeaRangeC[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28__Control1000000827; SeaRangeC[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29__Control1000000828; SeaRangeC[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30__Control1000000829; SeaRangeC[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31__Control1000000830; SeaRangeC[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32__Control1000000831; SeaRangeC[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33__Control1000000832; SeaRangeC[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34__Control1000000833; SeaRangeC[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35__Control1000000834; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36__Control1000000835; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37__Control1000000836; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38__Control1000000837; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39__Control1000000838; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40__Control1000000839; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41__Control1000000840; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42__Control1000000841; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43__Control1000000842; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44__Control1000000843; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45__Control1000000844; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46__Control1000000845; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47__Control1000000846; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48__Control1000000847; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49__Control1000000848; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_50__Control1000000849; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_51__Control1000000850; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52__Control1000000851; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53__Control1000000852; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54__Control1000000853; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55__Control1000000854; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56__Control1000000855; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57__Control1000000856; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58__Control1000000857; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59__Control1000000858; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60__Control1000000859; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61__Control1000000860; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62__Control1000000861; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63__Control1000000862; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64__Control1000000863; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65__Control1000000864; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66__Control1000000865; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67__Control1000000866; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68__Control1000000867; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69__Control1000000868; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70__Control1000000869; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71__Control1000000870; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72__Control1000000871; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73__Control1000000872; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74__Control1000000873; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75__Control1000000874; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_76__Control1000000875; SeaRangeC[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_77__Control1000000876; SeaRangeC[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_78__Control1000000877; SeaRangeC[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_79__Control1000000878; SeaRangeC[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_80__Control1000000879; SeaRangeC[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_81__Control1000000880; SeaRangeC[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_82__Control1000000881; SeaRangeC[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_83__Control1000000882; SeaRangeC[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_84__Control1000000883; SeaRangeC[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_85__Control1000000884; SeaRangeC[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_86__Control1000000885; SeaRangeC[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_87__Control1000000886; SeaRangeC[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_88__Control1000000887; SeaRangeC[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_89__Control1000000888; SeaRangeC[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_90__Control1000000889; SeaRangeC[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_91__Control1000000890; SeaRangeC[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_92__Control1000000891; SeaRangeC[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_93__Control1000000892; SeaRangeC[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_94__Control1000000893; SeaRangeC[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_95__Control1000000894; SeaRangeC[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_96__Control1000000895; SeaRangeC[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Daily_Break_Up_by_Vessel__2_Caption; Daily_Break_Up_by_Vessel__2_CaptionLbl)
            {
            }
            column(Inventory_Total_Caption; Inventory_Total_CaptionLbl)
            {
            }
            column(Inventory_Posting_Group_DescriptionCaption; "Inventory Posting Group".FieldCaption(Description))
            {
            }
            column(Sea_DaysCaption; Sea_DaysCaptionLbl)
            {
            }
            column(VesselsCaption; VesselsCaptionLbl)
            {
            }
            column(Shrimp_PointsCaption; Shrimp_PointsCaptionLbl)
            {
            }
            column(Vessel_PointsCaption; Vessel_PointsCaptionLbl)
            {
            }
            column(Fish_PointsCaption; Fish_PointsCaptionLbl)
            {
            }
            column(Inventory_Posting_G_Cat_Tot_Code; Code)
            {
            }
            column(Inventory_Posting_Group_Description; Description)
            {
            }
            column(Inventory_Posting_G_Statistics_Group; "Statistics Group")
            {
            }
            column(Inventory_Posting_G_Group_Category; Category)
            {
            }

            trigger OnAfterGetRecord()
            begin
                if (CopyStr(Category, 5) = 'SNB') or (CopyStr(Category, 5) = 'SOLE') or
                   (CopyStr(Category, 5) = 'CROAKER') or (CopyStr(Category, 5) = 'MIX') or
                   (CopyStr(Category, 5) = 'OTHER FISH') then
                    Test += InvtTot;
                if ("Inventory Posting G Cat Tot".Category = 'B12.OTHER FISH') or ("Inventory Posting G Cat Tot".Category = 'B08.SNB')
                 or ("Inventory Posting G Cat Tot".Category = 'B09.CROAKER') or ("Inventory Posting G Cat Tot".Category = 'B10.SOLE')
                  or ("Inventory Posting G Cat Tot".Category = 'B11.MIX') then begin
                    testing123 += Round(Inventory2, 2);
                    level := TotLoc;
                    while level > 0 do begin
                        SetFilter("Location Filter", SeaRange[level]);
                        CalcFields(Inventory1, Inventory2);
                        if ReportBy = 0 then
                            testc[level] := "Inventory Posting G Cat Tot".Inventory2
                        else
                            testc[level] := "Inventory Posting G Cat Tot".Inventory1;
                        level := level - 1;
                    end;
                end;

                level := TotLoc;
                while level > 0 do begin
                    SetFilter("Location Filter", SeaRange[level]);
                    CalcFields(Inventory1, Inventory2);
                    //Inventory2 := InventoryTwo(Code,SeaRange[level],DateFilter);

                    if ReportBy = 0 then
                        SeaRangeC[level] := Inventory2
                    else
                        SeaRangeC[level] := Inventory1;
                    level := level - 1;
                end;
                //Show Inventory for all location by releasing location filter
                SetFilter("Location Filter", '');  //OCT 10,2002 AAA
                CalcFields(Inventory1, Inventory2);

                // "Inventory total2" := InventoryTotal2(Code,DateFilter);
                if ReportBy = 0 then
                    InvtTot := Inventory2
                else
                    InvtTot := Inventory1;

                CurrReport.CreateTotals(InvtTot);
                if "Statistics Group" = 4 then
                    T002 := 'LOCAL PRODUCTS';
            end;

            trigger OnPreDataItem()
            begin
                TotLoc := 0;
                VesselCounter := 0;
                DateFilter := "Inventory Posting G Cat Tot".GetFilter("Date Filter");

                if DateFilter = '' then begin
                    SetRange("Date Filter", WorkDate());
                    DateFilter := GetFilter("Date Filter");
                end;
                locate2.Reset();
                locate2.SetRange("Location Type", 1);

                locate2.SetFilter("date filter", '%1', GetRangeMax("Date Filter"));//CH1
                if locate2.FindFirst() then
                    repeat
                        locate2."Last Rep Operation No. Val" := locate2.LastRepOpNo(locate2.Code, locate2.GetFilter("date filter"));
                        if locate2."Last Rep Operation No. Val" <> '' then begin
                            locate2.VSDVal := locate2.VoySeaAnyTime(LastRepOptNo, locate2.Code, locate2.GetFilter("date filter"));
                            if Operatn.Get(locate2."Last Rep Operation No. Val") then
                                Operatn.SetFilter(Operatn."Date Filter", '%1', "Date Filter");

                            locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);
                            Operatn.SetFilter(Operatn."Task Filter", 'SHR');
                            locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', 'SHR', '', Operatn.Vessel);
                            locate2."Fishing Area" := Operatn.FishingArea(Operatn."No.", locate2.Code, locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);
                            Operatn.SetRange(Operatn."Task Filter");
                            locate2.Modify();
                        end;
                    until locate2.Next() = 0;

                locate.Reset();
                locate.SetRange("Location Type", 1);
                TotLoc := locate.Count;
                if ArrangeBy = 0 then
                    locate.SetCurrentKey(locate."Last Reportd Vessel Pts")
                else
                    locate.SetCurrentKey(locate.VSDVal);
                locate.Ascending(false);

                Countx := 1;

                TotLoc := locate.Count;
                if locate.FindFirst() then
                    repeat
                        SeaRange[Countx] := locate.Code;
                        SeaRangeD[Countx] := locate.VSDVal;
                        VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                        ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                        FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];
                        locate.SetFilter(locate."date filter", '%1', GetRangeMax("Date Filter"));//CH1
                        FishgArea[Countx] := locate."Fishing Area";
                        SeaRangeDTot := SeaRangeDTot + SeaRangeD[Countx];
                        VesselPointTot := VesselPointTot + VesselPoint[Countx];
                        ShrimpPointTot := ShrimpPointTot + ShrimpPoint[Countx];
                        FishPointTot := FishPointTot + FishPoint[Countx];
                        if VesselPoint[Countx] = 0 then
                            PntLess := PntLess + 1
                        else
                            VesselCounter += 1;
                        Countx := Countx + 1;
                    until locate.Next() = 0;
            end;
        }
        dataitem("Inventory Posting Group"; "Inventory Posting Group")
        {
            DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER(> 0));
            // DataItemTableView = SORTING("Statistics Group", Category, "S/No.") WHERE("In Use" = CONST(true), "Statistics Group" = FILTER('1..3'));
            column(testing123; testing123)
            {
            }
            column(Inventory_Posting_G_Cat_Tot_Category; Category)
            {
            }
            column(VesselPoint_18__Control1000001208; VesselPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_18__Control1000001209; SeaRangeD[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_18__Control1000001210; SeaRange[18])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_18__Control1000001211; ShrimpPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_18__Control1000001213; FishPoint[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(t; ShrimpPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_19__Control1000001301; FishPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_19__Control1000001302; VesselPoint[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_19__Control1000001303; SeaRangeD[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_19__Control1000001304; SeaRange[19])
            {
            }
            column(ShrimpPoint_20__Control1000001305; ShrimpPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_20__Control1000001306; FishPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_20__Control1000001307; VesselPoint[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_20__Control1000001308; SeaRangeD[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_20__Control1000001309; SeaRange[20])
            {
            }
            column(ShrimpPoint_21__Control1000001310; ShrimpPoint[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_21__Control1000001311; FishPoint[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_21__Control1000001312; VesselPoint[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_21__Control1000001313; SeaRangeD[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_21__Control1000001314; SeaRange[21])
            {
                //DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_22__Control1000001315; ShrimpPoint[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_22__Control1000001316; FishPoint[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_22__Control1000001317; VesselPoint[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_22__Control1000001318; SeaRangeD[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_22__Control1000001319; SeaRange[22])
            {
            }
            column(ShrimpPoint_23__Control1000001320; ShrimpPoint[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_23__Control1000001321; FishPoint[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_23__Control1000001322; VesselPoint[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_23__Control1000001323; SeaRangeD[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_23__Control1000001324; SeaRange[23])
            {
            }
            column(ShrimpPoint_24__Control1000001325; ShrimpPoint[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_24__Control1000001326; FishPoint[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_24__Control1000001327; VesselPoint[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_24__Control1000001328; SeaRangeD[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_24__Control1000001329; SeaRange[24])
            {
            }
            column(ShrimpPoint_25__Control1000001330; ShrimpPoint[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_25__Control1000001331; FishPoint[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_25__Control1000001332; VesselPoint[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_25__Control1000001333; SeaRangeD[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_25__Control1000001334; SeaRange[25])
            {
            }
            column(ShrimpPoint_26__Control1000001335; ShrimpPoint[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_26__Control1000001336; FishPoint[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_26__Control1000001337; VesselPoint[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_26__Control1000001338; SeaRangeD[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_26__Control1000001339; SeaRange[26])
            {
            }
            column(ShrimpPoint_27__Control1000001340; ShrimpPoint[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_27__Control1000001341; FishPoint[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_27__Control1000001342; VesselPoint[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_27__Control1000001343; SeaRangeD[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_27__Control1000001344; SeaRange[27])
            {
            }
            column(ShrimpPoint_28__Control1000001345; ShrimpPoint[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_28__Control1000001346; FishPoint[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_28__Control1000001347; VesselPoint[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_28__Control1000001348; SeaRangeD[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_28__Control1000001349; SeaRange[28])
            {
            }
            column(ShrimpPoint_29__Control1000001350; ShrimpPoint[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_29__Control1000001351; FishPoint[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_29__Control1000001352; VesselPoint[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_29__Control1000001353; SeaRangeD[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_29__Control1000001354; SeaRange[29])
            {
            }
            column(ShrimpPoint_30__Control1000001355; ShrimpPoint[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_30__Control1000001356; FishPoint[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_30__Control1000001357; VesselPoint[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_30__Control1000001358; SeaRangeD[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_30__Control1000001359; SeaRange[30])
            {
            }
            column(ShrimpPoint_31__Control1000001360; ShrimpPoint[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_31__Control1000001361; FishPoint[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_31__Control1000001362; VesselPoint[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_31__Control1000001363; SeaRangeD[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_31__Control1000001364; SeaRange[31])
            {
            }
            column(ShrimpPoint_32__Control1000001365; ShrimpPoint[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_32__Control1000001366; FishPoint[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_32__Control1000001367; VesselPoint[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_32__Control1000001368; SeaRangeD[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_32__Control1000001369; SeaRange[32])
            {
            }
            column(ShrimpPoint_33__Control1000001370; ShrimpPoint[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_33__Control1000001371; FishPoint[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_33__Control1000001372; VesselPoint[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_33__Control1000001373; SeaRangeD[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_33__Control1000001374; SeaRange[33])
            {
            }
            column(ShrimpPoint_34__Control1000001375; ShrimpPoint[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_34__Control1000001376; FishPoint[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_34__Control1000001377; VesselPoint[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_34__Control1000001378; SeaRangeD[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_34__Control1000001379; SeaRange[34])
            {
            }
            column(ShrimpPoint_35__Control1000001380; ShrimpPoint[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_35__Control1000001381; FishPoint[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_35__Control1000001382; VesselPoint[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_35__Control1000001383; SeaRangeD[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_35__Control1000001384; SeaRange[35])
            {
            }
            column(ShrimpPoint_36__Control1000001385; ShrimpPoint[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_36__Control1000001386; FishPoint[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_36__Control1000001387; VesselPoint[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_36__Control1000001388; SeaRangeD[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_36__Control1000001389; SeaRange[36])
            {
            }
            column(ShrimpPoint_37__Control1000001390; ShrimpPoint[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_37__Control1000001391; FishPoint[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_37__Control1000001392; VesselPoint[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_37__Control1000001393; SeaRangeD[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_37__Control1000001394; SeaRange[37])
            {
            }
            column(ShrimpPoint_38__Control1000001395; ShrimpPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_38__Control1000001396; FishPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_38__Control1000001397; VesselPoint[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_38__Control1000001398; SeaRangeD[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_38__Control1000001399; SeaRange[38])
            {
            }
            column(ShrimpPoint_39__Control1000001400; ShrimpPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_39__Control1000001401; FishPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_39__Control1000001402; VesselPoint[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_39__Control1000001403; SeaRangeD[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_39__Control1000001404; SeaRange[39])
            {
            }
            column(ShrimpPoint_40__Control1000001405; ShrimpPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_40__Control1000001406; FishPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_40__Control1000001407; VesselPoint[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_40__Control1000001408; SeaRangeD[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_40__Control1000001409; SeaRange[40])
            {
            }
            column(ShrimpPoint_41__Control1000001410; ShrimpPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_41__Control1000001411; FishPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_41__Control1000001412; VesselPoint[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_41__Control1000001413; SeaRangeD[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_41__Control1000001414; SeaRange[41])
            {
            }
            column(ShrimpPoint_42__Control1000001415; ShrimpPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_42__Control1000001416; FishPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_42__Control1000001417; VesselPoint[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_42__Control1000001418; SeaRangeD[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_42__Control1000001419; SeaRange[42])
            {
            }
            column(ShrimpPoint_43__Control1000001420; ShrimpPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_43__Control1000001421; FishPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_43__Control1000001422; VesselPoint[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_43__Control1000001423; SeaRangeD[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_43__Control1000001424; SeaRange[43])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_44__Control1000001425; ShrimpPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_44__Control1000001426; FishPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_44__Control1000001427; VesselPoint[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_44__Control1000001428; SeaRangeD[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_44__Control1000001429; SeaRange[44])
            {
            }
            column(ShrimpPoint_45__Control1000001430; ShrimpPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_45__Control1000001431; FishPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_45__Control1000001432; VesselPoint[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_45__Control1000001433; SeaRangeD[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_45__Control1000001434; SeaRange[45])
            {
            }
            column(ShrimpPoint_46__Control1000001435; ShrimpPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_46__Control1000001436; FishPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_46__Control1000001437; VesselPoint[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_46__Control1000001438; SeaRangeD[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_46__Control1000001439; SeaRange[46])
            {
            }
            column(ShrimpPoint_47__Control1000001440; ShrimpPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_47__Control1000001441; FishPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_47__Control1000001442; VesselPoint[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_47__Control1000001443; SeaRangeD[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_47__Control1000001444; SeaRange[47])
            {
            }
            column(ShrimpPoint_48__Control1000001445; ShrimpPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_48__Control1000001446; FishPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_48__Control1000001447; VesselPoint[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_48__Control1000001448; SeaRangeD[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_48__Control1000001449; SeaRange[48])
            {
            }
            column(ShrimpPoint_49__Control1000001450; ShrimpPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_49__Control1000001451; FishPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_49__Control1000001452; VesselPoint[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_49__Control1000001453; SeaRangeD[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_49__Control1000001454; SeaRange[49])
            {
            }
            column(ShrimpPoint_50__Control1000001455; ShrimpPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_50__Control1000001456; FishPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_50__Control1000001457; VesselPoint[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_50__Control1000001458; SeaRangeD[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_50__Control1000001459; SeaRange[50])
            {
            }
            column(ShrimpPoint_51__Control1000001460; ShrimpPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_51__Control1000001461; FishPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_51__Control1000001462; VesselPoint[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_51__Control1000001463; SeaRangeD[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_51__Control1000001464; SeaRange[51])
            {
            }
            column(ShrimpPoint_52__Control1000001467; ShrimpPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_52__Control1000001468; FishPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_52__Control1000001469; VesselPoint[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_52__Control1000001470; SeaRangeD[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_52__Control1000001471; SeaRange[52])
            {
            }
            column(ShrimpPoint_53__Control1000001472; ShrimpPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_53__Control1000001473; FishPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_53__Control1000001474; VesselPoint[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_53__Control1000001475; SeaRangeD[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_53__Control1000001476; SeaRange[53])
            {
            }
            column(ShrimpPoint_54__Control1000001477; ShrimpPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_54__Control1000001478; FishPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_54__Control1000001479; VesselPoint[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_54__Control1000001480; SeaRangeD[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_54__Control1000001481; SeaRange[54])
            {
            }
            column(ShrimpPoint_55__Control1000001482; ShrimpPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_55__Control1000001483; FishPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_55__Control1000001484; VesselPoint[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_55__Control1000001485; SeaRangeD[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_55__Control1000001486; SeaRange[55])
            {
            }
            column(ShrimpPoint_56__Control1000001487; ShrimpPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_56__Control1000001488; FishPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_56__Control1000001489; VesselPoint[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_56__Control1000001490; SeaRangeD[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_56__Control1000001491; SeaRange[56])
            {
            }
            column(ShrimpPoint_57__Control1000001492; ShrimpPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_57__Control1000001493; FishPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_57__Control1000001494; VesselPoint[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_57__Control1000001495; SeaRangeD[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_57__Control1000001496; SeaRange[57])
            {
            }
            column(ShrimpPoint_58__Control1000001497; ShrimpPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_58__Control1000001498; FishPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_58__Control1000001499; VesselPoint[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_58__Control1000001500; SeaRangeD[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_58__Control1000001501; SeaRange[58])
            {
            }
            column(ShrimpPoint_59__Control1000001502; ShrimpPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_59__Control1000001503; FishPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_59__Control1000001504; VesselPoint[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_59__Control1000001505; SeaRangeD[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_59__Control1000001506; SeaRange[59])
            {
            }
            column(ShrimpPoint_60__Control1000001507; ShrimpPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_60__Control1000001508; FishPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_60__Control1000001509; VesselPoint[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_60__Control1000001510; SeaRangeD[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_60__Control1000001511; SeaRange[60])
            {
            }
            column(ShrimpPoint_61__Control1000001512; ShrimpPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_61__Control1000001513; FishPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_61__Control1000001514; VesselPoint[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_61__Control1000001515; SeaRangeD[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_61__Control1000001516; SeaRange[61])
            {
            }
            column(ShrimpPoint_62__Control1000001517; ShrimpPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_62__Control1000001518; FishPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_62__Control1000001519; VesselPoint[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_62__Control1000001520; SeaRangeD[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_62__Control1000001521; SeaRange[62])
            {
            }
            column(ShrimpPoint_63__Control1000001522; ShrimpPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_63__Control1000001523; FishPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_63__Control1000001524; VesselPoint[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_63__Control1000001525; SeaRangeD[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_63__Control1000001526; SeaRange[63])
            {
            }
            column(ShrimpPoint_64__Control1000001527; ShrimpPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_64__Control1000001528; FishPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_64__Control1000001529; VesselPoint[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_64__Control1000001530; SeaRangeD[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_64__Control1000001531; SeaRange[64])
            {
            }
            column(ShrimpPoint_65__Control1000001532; ShrimpPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_65__Control1000001533; FishPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_65__Control1000001534; VesselPoint[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_65__Control1000001535; SeaRangeD[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_65__Control1000001536; SeaRange[65])
            {
            }
            column(ShrimpPoint_66__Control1000001537; ShrimpPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_66__Control1000001538; FishPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_66__Control1000001539; VesselPoint[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_66__Control1000001540; SeaRangeD[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_66__Control1000001541; SeaRange[66])
            {
            }
            column(ShrimpPoint_67__Control1000001542; ShrimpPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_67__Control1000001543; FishPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_67__Control1000001544; VesselPoint[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_67__Control1000001545; SeaRangeD[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_67__Control1000001546; SeaRange[67])
            {
            }
            column(ShrimpPoint_68__Control1000001547; ShrimpPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_68__Control1000001548; FishPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_68__Control1000001549; VesselPoint[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_68__Control1000001550; SeaRangeD[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_68__Control1000001551; SeaRange[68])
            {
            }
            column(ShrimpPoint_69__Control1000001552; ShrimpPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_69__Control1000001553; FishPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_69__Control1000001554; VesselPoint[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_69__Control1000001555; SeaRangeD[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_69__Control1000001556; SeaRange[69])
            {
            }
            column(ShrimpPoint_70__Control1000001557; ShrimpPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_70__Control1000001558; FishPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_70__Control1000001559; VesselPoint[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_70__Control1000001560; SeaRangeD[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_70__Control1000001561; SeaRange[70])
            {
            }
            column(ShrimpPoint_71__Control1000001562; ShrimpPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_71__Control1000001563; FishPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_71__Control1000001564; VesselPoint[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_71__Control1000001565; SeaRangeD[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_71__Control1000001566; SeaRange[71])
            {
            }
            column(ShrimpPoint_72__Control1000001567; ShrimpPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_72__Control1000001568; FishPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_72__Control1000001569; VesselPoint[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_72__Control1000001570; SeaRangeD[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_72__Control1000001571; SeaRange[72])
            {
            }
            column(ShrimpPoint_73__Control1000001572; ShrimpPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_73__Control1000001573; FishPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_73__Control1000001574; VesselPoint[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_73__Control1000001575; SeaRangeD[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_73__Control1000001576; SeaRange[73])
            {
            }
            column(ShrimpPoint_74__Control1000001577; ShrimpPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_74__Control1000001578; FishPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_74__Control1000001579; VesselPoint[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_74__Control1000001580; SeaRangeD[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_74__Control1000001581; SeaRange[74])
            {
            }
            column(ShrimpPoint_75__Control1000001582; ShrimpPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_75__Control1000001583; FishPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_75__Control1000001584; VesselPoint[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_75__Control1000001585; SeaRangeD[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_75__Control1000001586; SeaRange[75])
            {
            }
            column(ShrimpPoint_76__Control1000001587; ShrimpPoint[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_76__Control1000001588; FishPoint[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_76__Control1000001589; VesselPoint[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_76__Control1000001590; SeaRangeD[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_76__Control1000001591; SeaRange[76])
            {
            }
            column(ShrimpPoint_77__Control1000001592; ShrimpPoint[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_77__Control1000001593; FishPoint[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_77__Control1000001594; VesselPoint[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_77__Control1000001595; SeaRangeD[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_77__Control1000001596; SeaRange[77])
            {
            }
            column(ShrimpPoint_78__Control1000001597; ShrimpPoint[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_78__Control1000001598; FishPoint[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_78__Control1000001599; VesselPoint[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_78__Control1000001600; SeaRangeD[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_78__Control1000001601; SeaRange[78])
            {
            }
            column(ShrimpPoint_79__Control1000001602; ShrimpPoint[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_79__Control1000001603; FishPoint[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_79__Control1000001604; VesselPoint[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_79__Control1000001605; SeaRangeD[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_79__Control1000001606; SeaRange[79])
            {
            }
            column(ShrimpPoint_80__Control1000001607; ShrimpPoint[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_80__Control1000001608; FishPoint[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_80__Control1000001609; VesselPoint[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_80__Control1000001610; SeaRangeD[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_80__Control1000001611; SeaRange[80])
            {
            }
            column(ShrimpPoint_81__Control1000001612; ShrimpPoint[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_81__Control1000001613; FishPoint[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_81__Control1000001614; VesselPoint[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_81__Control1000001615; SeaRangeD[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_81__Control1000001616; SeaRange[81])
            {
            }
            column(ShrimpPoint_82__Control1000001617; ShrimpPoint[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_82__Control1000001618; FishPoint[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_82__Control1000001619; VesselPoint[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_82__Control1000001620; SeaRangeD[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_82__Control1000001621; SeaRange[82])
            {
            }
            column(ShrimpPoint_83__Control1000001622; ShrimpPoint[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_83__Control1000001623; FishPoint[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_83__Control1000001624; VesselPoint[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_83__Control1000001625; SeaRangeD[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_83__Control1000001626; SeaRange[83])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_84__Control1000001627; ShrimpPoint[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_84__Control1000001628; FishPoint[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_84__Control1000001629; VesselPoint[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_84__Control1000001630; SeaRangeD[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_84__Control1000001631; SeaRange[84])
            {
            }
            column(ShrimpPoint_85__Control1000001632; ShrimpPoint[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_85__Control1000001633; FishPoint[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_85__Control1000001634; VesselPoint[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_85__Control1000001635; SeaRangeD[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_85__Control1000001636; SeaRange[85])
            {
            }
            column(ShrimpPoint_86__Control1000001637; ShrimpPoint[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_86__Control1000001638; FishPoint[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_86__Control1000001639; VesselPoint[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_86__Control1000001640; SeaRangeD[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_86__Control1000001641; SeaRange[86])
            {
            }
            column(ShrimpPoint_87__Control1000001642; ShrimpPoint[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_87__Control1000001643; FishPoint[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_87__Control1000001644; VesselPoint[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_87__Control1000001645; SeaRangeD[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_87__Control1000001646; SeaRange[87])
            {
            }
            column(ShrimpPoint_88__Control1000001647; ShrimpPoint[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_88__Control1000001648; FishPoint[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_88__Control1000001649; VesselPoint[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_88__Control1000001650; SeaRangeD[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_88__Control1000001651; SeaRange[88])
            {
            }
            column(ShrimpPoint_89__Control1000001652; ShrimpPoint[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_89__Control1000001653; FishPoint[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_89__Control1000001654; VesselPoint[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_89__Control1000001655; SeaRangeD[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_89__Control1000001656; SeaRange[89])
            {
            }
            column(ShrimpPoint_90__Control1000001657; ShrimpPoint[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_90__Control1000001658; FishPoint[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(VesselPoint_90__Control1000001659; VesselPoint[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_90__Control1000001660; SeaRangeD[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_90__Control1000001661; SeaRange[90])
            {
            }
            column(VesselPoint_91__Control1000001662; VesselPoint[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_91__Control1000001663; ShrimpPoint[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_91__Control1000001664; FishPoint[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_91__Control1000001665; SeaRangeD[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_91__Control1000001666; SeaRange[91])
            {
            }
            column(VesselPoint_92__Control1000001667; VesselPoint[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_92__Control1000001668; ShrimpPoint[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_92__Control1000001669; FishPoint[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_92__Control1000001670; SeaRangeD[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_92__Control1000001671; SeaRange[92])
            {
            }
            column(VesselPoint_93__Control1000001672; VesselPoint[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_93__Control1000001673; ShrimpPoint[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_93__Control1000001674; FishPoint[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_93__Control1000001675; SeaRangeD[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_93__Control1000001676; SeaRange[93])
            {
            }
            column(VesselPoint_94__Control1000001677; VesselPoint[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_94__Control1000001678; ShrimpPoint[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_94__Control1000001679; FishPoint[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_94__Control1000001680; SeaRangeD[94])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_94__Control1000001681; SeaRange[94])
            {
            }
            column(VesselPoint_95__Control1000001682; VesselPoint[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_95__Control1000001683; ShrimpPoint[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_95__Control1000001684; FishPoint[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_95__Control1000001685; SeaRangeD[95])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_95__Control1000001686; SeaRange[95])
            {
            }
            column(VesselPoint_96__Control1000001687; VesselPoint[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(ShrimpPoint_96__Control1000001688; ShrimpPoint[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FishPoint_96__Control1000001689; FishPoint[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeD_96__Control1000001690; SeaRangeD[96])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRange_96__Control1000001691; SeaRange[96])
            {
            }
            column(SeaRange_20__Control1000000139; SeaRange[20])
            {
            }
            column(SeaRange_19__Control1000000141; SeaRange[19])
            {
            }
            column(SeaRange_18__Control1000000159; SeaRange[18])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRange_21__Control1000000110; SeaRange[21])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRange_22__Control1000000117; SeaRange[22])
            {
            }
            column(SeaRange_23__Control1000000140; SeaRange[23])
            {
            }
            column(SeaRange_24__Control1000000168; SeaRange[24])
            {
            }
            column(SeaRange_25__Control1000000169; SeaRange[25])
            {
            }
            column(SeaRange_26__Control1000000170; SeaRange[26])
            {
            }
            column(SeaRange_27__Control1000000171; SeaRange[27])
            {
            }
            column(SeaRange_28__Control1000000172; SeaRange[28])
            {
            }
            column(SeaRange_29__Control1000000173; SeaRange[29])
            {
            }
            column(SeaRange_30__Control1000000174; SeaRange[30])
            {
            }
            column(SeaRange_31__Control1000000175; SeaRange[31])
            {
            }
            column(SeaRange_32__Control1000000176; SeaRange[32])
            {
            }
            column(SeaRange_33__Control1000000177; SeaRange[33])
            {
            }
            column(SeaRange_34__Control1000000178; SeaRange[34])
            {
            }
            column(SeaRange_35__Control1000000179; SeaRange[35])
            {
            }
            column(SeaRange_36__Control1000000180; SeaRange[36])
            {
            }
            column(SeaRange_37__Control1000000181; SeaRange[37])
            {
            }
            column(SeaRange_38__Control1000000182; SeaRange[38])
            {
            }
            column(SeaRange_39__Control1000000183; SeaRange[39])
            {
            }
            column(SeaRange_40__Control1000000184; SeaRange[40])
            {
            }
            column(SeaRange_41__Control1000000185; SeaRange[41])
            {
            }
            column(SeaRange_42__Control1000000186; SeaRange[42])
            {
            }
            column(SeaRange_43__Control1000000187; SeaRange[43])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRange_44__Control1000000190; SeaRange[44])
            {
            }
            column(SeaRange_45__Control1000000191; SeaRange[45])
            {
            }
            column(SeaRange_46__Control1000000192; SeaRange[46])
            {
            }
            column(SeaRange_47__Control1000000193; SeaRange[47])
            {
            }
            column(SeaRange_48__Control1000000194; SeaRange[48])
            {
            }
            column(SeaRange_49__Control1000000195; SeaRange[49])
            {
            }
            column(SeaRange_50__Control1000000196; SeaRange[50])
            {
            }
            column(SeaRange_51__Control1000000197; SeaRange[51])
            {
            }
            column(SeaRange_52__Control1000000198; SeaRange[52])
            {
            }
            column(SeaRange_53__Control1000000199; SeaRange[53])
            {
            }
            column(SeaRange_54__Control1000000200; SeaRange[54])
            {
            }
            column(SeaRange_55__Control1000000201; SeaRange[55])
            {
            }
            column(SeaRange_56__Control1000000202; SeaRange[56])
            {
            }
            column(SeaRange_57__Control1000000203; SeaRange[57])
            {
            }
            column(SeaRange_58__Control1000000204; SeaRange[58])
            {
            }
            column(SeaRange_59__Control1000000205; SeaRange[59])
            {
            }
            column(SeaRange_60__Control1000000206; SeaRange[60])
            {
            }
            column(SeaRange_61__Control1000000207; SeaRange[61])
            {
            }
            column(SeaRange_62__Control1000000208; SeaRange[62])
            {
            }
            column(SeaRange_83__Control1000000209; SeaRange[83])
            {
                // DecimalPlaces = 0 : 0;
            }
            column(SeaRange_84__Control1000000212; SeaRange[84])
            {
            }
            column(SeaRange_85__Control1000000213; SeaRange[85])
            {
            }
            column(SeaRange_86__Control1000000214; SeaRange[86])
            {
            }
            column(SeaRange_87__Control1000000215; SeaRange[87])
            {
            }
            column(SeaRange_88__Control1000000216; SeaRange[88])
            {
            }
            column(SeaRange_89__Control1000000217; SeaRange[89])
            {
            }
            column(SeaRange_90__Control1000000218; SeaRange[90])
            {
            }
            column(SeaRange_91__Control1000000219; SeaRange[91])
            {
            }
            column(SeaRange_92__Control1000000220; SeaRange[92])
            {
            }
            column(SeaRange_93__Control1000000221; SeaRange[93])
            {
            }
            column(SeaRange_94__Control1000000222; SeaRange[94])
            {
            }
            column(SeaRange_95__Control1000000223; SeaRange[95])
            {
            }
            column(SeaRange_96__Control1000000224; SeaRange[96])
            {
            }
            column(SeaRange_63__Control1000000233; SeaRange[63])
            {
            }
            column(SeaRange_64__Control1000000234; SeaRange[64])
            {
            }
            column(SeaRange_65__Control1000000235; SeaRange[65])
            {
            }
            column(SeaRange_66__Control1000000236; SeaRange[66])
            {
            }
            column(SeaRange_67__Control1000000237; SeaRange[67])
            {
            }
            column(SeaRange_68__Control1000000238; SeaRange[68])
            {
            }
            column(SeaRange_69__Control1000000239; SeaRange[69])
            {
            }
            column(SeaRange_70__Control1000000240; SeaRange[70])
            {
            }
            column(SeaRange_71__Control1000000241; SeaRange[71])
            {
            }
            column(SeaRange_72__Control1000000242; SeaRange[72])
            {
            }
            column(SeaRange_73__Control1000000243; SeaRange[73])
            {
            }
            column(SeaRange_74__Control1000000244; SeaRange[74])
            {
            }
            column(SeaRange_75__Control1000000245; SeaRange[75])
            {
            }
            column(SeaRange_76__Control1000000246; SeaRange[76])
            {
            }
            column(SeaRange_77__Control1000000247; SeaRange[77])
            {
            }
            column(SeaRange_78__Control1000000248; SeaRange[78])
            {
            }
            column(SeaRange_79__Control1000000249; SeaRange[79])
            {
            }
            column(SeaRange_80__Control1000000250; SeaRange[80])
            {
            }
            column(SeaRange_81__Control1000000251; SeaRange[81])
            {
            }
            column(SeaRange_82__Control1000000252; SeaRange[82])
            {
            }
            column(T001; T001)
            {
            }
            column(Cat; Cat)
            {
            }
            column(InvtTot_Control26; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000115; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000261; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000262; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_21__Control1000000263; SeaRangeC[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22__Control1000000264; SeaRangeC[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23__Control1000000265; SeaRangeC[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24__Control1000000266; SeaRangeC[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_25__Control1000000267; SeaRangeC[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26__Control1000000268; SeaRangeC[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27__Control1000000269; SeaRangeC[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28__Control1000000270; SeaRangeC[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29__Control1000000271; SeaRangeC[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30__Control1000000272; SeaRangeC[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31__Control1000000273; SeaRangeC[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32__Control1000000274; SeaRangeC[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33__Control1000000275; SeaRangeC[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34__Control1000000276; SeaRangeC[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35__Control1000000277; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36__Control1000000278; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37__Control1000000279; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38__Control1000000280; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39__Control1000000281; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40__Control1000000282; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41__Control1000000283; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42__Control1000000284; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43__Control1000000285; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44__Control1000000286; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45__Control1000000287; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46__Control1000000288; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47__Control1000000289; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48__Control1000000290; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49__Control1000000291; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_50__Control1000000292; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_51__Control1000000293; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52__Control1000000294; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53__Control1000000295; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54__Control1000000296; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55__Control1000000297; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56__Control1000000298; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57__Control1000000299; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58__Control1000000300; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59__Control1000000301; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60__Control1000000302; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61__Control1000000303; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62__Control1000000304; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63__Control1000000305; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64__Control1000000306; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65__Control1000000307; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66__Control1000000308; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67__Control1000000309; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68__Control1000000310; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69__Control1000000311; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70__Control1000000312; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71__Control1000000313; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72__Control1000000314; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73__Control1000000315; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74__Control1000000316; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75__Control1000000317; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_76__Control1000000318; SeaRangeC[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_77__Control1000000319; SeaRangeC[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_78__Control1000000320; SeaRangeC[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_79__Control1000000321; SeaRangeC[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_80__Control1000000322; SeaRangeC[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_81__Control1000000323; SeaRangeC[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_82__Control1000000324; SeaRangeC[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_83__Control1000000325; SeaRangeC[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_84__Control1000000326; SeaRangeC[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_85__Control1000000327; SeaRangeC[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_86__Control1000000328; SeaRangeC[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_87__Control1000000329; SeaRangeC[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_88__Control1000000330; SeaRangeC[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_89__Control1000000331; SeaRangeC[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_90__Control1000000332; SeaRangeC[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_91__Control1000000333; SeaRangeC[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_92__Control1000000334; SeaRangeC[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_93__Control1000000335; SeaRangeC[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(FIELDCAPTION_Category___TotalFor; FieldCaption(Category) + TotalFor)
            {
            }
            column(InvtTot_Control30; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_93__Control1000000503; SeaRangeC[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_92__Control1000000504; SeaRangeC[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_91__Control1000000505; SeaRangeC[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_90__Control1000000506; SeaRangeC[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_89__Control1000000507; SeaRangeC[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_88__Control1000000508; SeaRangeC[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_87__Control1000000509; SeaRangeC[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_86__Control1000000510; SeaRangeC[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_85__Control1000000511; SeaRangeC[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_84__Control1000000512; SeaRangeC[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_83__Control1000000513; SeaRangeC[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_82__Control1000000514; SeaRangeC[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_81__Control1000000515; SeaRangeC[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_80__Control1000000516; SeaRangeC[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_79__Control1000000517; SeaRangeC[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_78__Control1000000518; SeaRangeC[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_77__Control1000000519; SeaRangeC[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_76__Control1000000520; SeaRangeC[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75__Control1000000521; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74__Control1000000522; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73__Control1000000523; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72__Control1000000524; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71__Control1000000525; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70__Control1000000526; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69__Control1000000527; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68__Control1000000528; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67__Control1000000529; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66__Control1000000530; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65__Control1000000531; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64__Control1000000532; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63__Control1000000533; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62__Control1000000534; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61__Control1000000535; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60__Control1000000536; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59__Control1000000537; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58__Control1000000538; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57__Control1000000539; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56__Control1000000540; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55__Control1000000541; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54__Control1000000542; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53__Control1000000543; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52__Control1000000544; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_51__Control1000000545; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_50__Control1000000546; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49__Control1000000547; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48__Control1000000548; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47__Control1000000549; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46__Control1000000550; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45__Control1000000551; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44__Control1000000552; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43__Control1000000553; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42__Control1000000554; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41__Control1000000555; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40__Control1000000556; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39__Control1000000557; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38__Control1000000558; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37__Control1000000559; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36__Control1000000560; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35__Control1000000561; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34__Control1000000562; SeaRangeC[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33__Control1000000563; SeaRangeC[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32__Control1000000564; SeaRangeC[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31__Control1000000565; SeaRangeC[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30__Control1000000566; SeaRangeC[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29__Control1000000567; SeaRangeC[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28__Control1000000568; SeaRangeC[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27__Control1000000569; SeaRangeC[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26__Control1000000570; SeaRangeC[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_25__Control1000000571; SeaRangeC[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24__Control1000000572; SeaRangeC[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23__Control1000000573; SeaRangeC[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22__Control1000000574; SeaRangeC[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_21__Control1000000575; SeaRangeC[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000576; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000577; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000595; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(TotalFor___FIELDCAPTION__Statistics_Group__; TotalFor + FieldCaption("Statistics Group"))
            {
            }
            column(InvtTot_Control33; InvtTot)
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_18__Control1000000596; SeaRangeC[18])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_19__Control1000000614; SeaRangeC[19])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_20__Control1000000615; SeaRangeC[20])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_21__Control1000000616; SeaRangeC[21])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_22__Control1000000617; SeaRangeC[22])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_23__Control1000000618; SeaRangeC[23])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_24__Control1000000619; SeaRangeC[24])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_25__Control1000000620; SeaRangeC[25])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_26__Control1000000621; SeaRangeC[26])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_27__Control1000000622; SeaRangeC[27])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_28__Control1000000623; SeaRangeC[28])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_29__Control1000000624; SeaRangeC[29])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_30__Control1000000625; SeaRangeC[30])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_31__Control1000000626; SeaRangeC[31])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_32__Control1000000627; SeaRangeC[32])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_33__Control1000000628; SeaRangeC[33])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_34__Control1000000629; SeaRangeC[34])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_35__Control1000000630; SeaRangeC[35])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_36__Control1000000631; SeaRangeC[36])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_37__Control1000000632; SeaRangeC[37])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_38__Control1000000633; SeaRangeC[38])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_39__Control1000000634; SeaRangeC[39])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_40__Control1000000635; SeaRangeC[40])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_41__Control1000000636; SeaRangeC[41])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_42__Control1000000637; SeaRangeC[42])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_43__Control1000000638; SeaRangeC[43])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_44__Control1000000639; SeaRangeC[44])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_45__Control1000000640; SeaRangeC[45])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_46__Control1000000641; SeaRangeC[46])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_47__Control1000000642; SeaRangeC[47])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_48__Control1000000643; SeaRangeC[48])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_49__Control1000000644; SeaRangeC[49])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_50__Control1000000645; SeaRangeC[50])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_51__Control1000000646; SeaRangeC[51])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_52__Control1000000647; SeaRangeC[52])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_53__Control1000000648; SeaRangeC[53])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_54__Control1000000649; SeaRangeC[54])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_55__Control1000000650; SeaRangeC[55])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_56__Control1000000651; SeaRangeC[56])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_57__Control1000000652; SeaRangeC[57])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_58__Control1000000653; SeaRangeC[58])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_59__Control1000000654; SeaRangeC[59])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_60__Control1000000655; SeaRangeC[60])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_61__Control1000000656; SeaRangeC[61])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_62__Control1000000657; SeaRangeC[62])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_63__Control1000000658; SeaRangeC[63])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_64__Control1000000659; SeaRangeC[64])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_65__Control1000000660; SeaRangeC[65])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_66__Control1000000661; SeaRangeC[66])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_67__Control1000000662; SeaRangeC[67])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_68__Control1000000663; SeaRangeC[68])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_69__Control1000000664; SeaRangeC[69])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_70__Control1000000665; SeaRangeC[70])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_71__Control1000000666; SeaRangeC[71])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_72__Control1000000667; SeaRangeC[72])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_73__Control1000000668; SeaRangeC[73])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_74__Control1000000669; SeaRangeC[74])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_75__Control1000000670; SeaRangeC[75])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_76__Control1000000671; SeaRangeC[76])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_77__Control1000000672; SeaRangeC[77])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_78__Control1000000673; SeaRangeC[78])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_79__Control1000000674; SeaRangeC[79])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_80__Control1000000675; SeaRangeC[80])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_81__Control1000000676; SeaRangeC[81])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_82__Control1000000677; SeaRangeC[82])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_83__Control1000000678; SeaRangeC[83])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_84__Control1000000679; SeaRangeC[84])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_85__Control1000000680; SeaRangeC[85])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_86__Control1000000681; SeaRangeC[86])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_87__Control1000000682; SeaRangeC[87])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_88__Control1000000683; SeaRangeC[88])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_89__Control1000000684; SeaRangeC[89])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_90__Control1000000685; SeaRangeC[90])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_91__Control1000000686; SeaRangeC[91])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_92__Control1000000687; SeaRangeC[92])
            {
                DecimalPlaces = 0 : 0;
            }
            column(SeaRangeC_93__Control1000000688; SeaRangeC[93])
            {
                DecimalPlaces = 0 : 0;
            }
            column(Sea_DaysCaption_Control1000001204; Sea_DaysCaption_Control1000001204Lbl)
            {
            }
            column(VesselsCaption_Control1000001206; VesselsCaption_Control1000001206Lbl)
            {
            }
            column(Vessel_PointsCaption_Control1000001207; Vessel_PointsCaption_Control1000001207Lbl)
            {
            }
            column(Shrimp_PointsCaption_Control1000001212; Shrimp_PointsCaption_Control1000001212Lbl)
            {
            }
            column(Fish_PointsCaption_Control1000001214; Fish_PointsCaption_Control1000001214Lbl)
            {
            }
            column(Inventory_Total_Caption_Control1000001465; Inventory_Total_Caption_Control1000001465Lbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Inventory_TotalCaption; Inventory_TotalCaptionLbl)
            {
            }
            column(Inventory_Posting_Group_DescriptionCaption_Control1000000161; FieldCaption(Description))
            {
            }
            column(T001Caption; T001CaptionLbl)
            {
            }
            column(CatCaption; CatCaptionLbl)
            {
            }
            column(Inventory_Posting_Group_Code; Code)
            {
            }
            column(Inventory_Posting_Group_Category; Category)
            {
            }
            column(Inventory_Posting_Group_Statistics_Group; "Statistics Group")
            {
            }

            trigger OnAfterGetRecord()
            begin
                level := TotLoc;
                while level > 0 do begin
                    SetFilter("Location Filter", SeaRange[level]);
                    //CALCFIELDS(Inventory2);
                    //SeaRangeC[level]:=Inventory2;
                    CalcFields(Inventory1, Inventory2);
                    //Inventory2 := InventoryTwo(Code,SeaRange[level],DateFilter);
                    if ReportBy = 0 then
                        SeaRangeC[level] := Inventory2
                    else
                        SeaRangeC[level] := Inventory1;
                    CurrReport.CreateTotals(SeaRangeC[level]);
                    level := level - 1;
                end;
                //Show Inventory for all location by releasing location filter
                SetFilter("Location Filter", '');  //OCT 10,2002 AAA
                CalcFields(Inventory1, Inventory2);
                //"Inventory total2" := InventoryTotal2(Code,DateFilter);
                if ReportBy = 0 then
                    InvtTot := Inventory2
                else
                    InvtTot := Inventory1;
                CurrReport.CreateTotals(InvtTot);
                if "Statistics Group" = 4 then T002 := 'LOCAL PRODUCTS';
            end;

            trigger OnPreDataItem()
            begin
                TotLoc := 0;
                VesselCounter := 0;
                CopyFilters("Inventory Posting G Cat Tot");

                locate2.SetRange(locate2."Location Type", 1);
                locate2.SetFilter(locate2."date filter", '%1', GetRangeMax("Date Filter"));//CH1
                if locate2.Find('-') then
                    repeat
                        locate2."Last Rep Operation No. Val" :=
                          locate2.LastRepOpNo(locate2.Code, locate2.GetFilter("date filter"));//locate2."Last Rep Operation No.";
                        if locate2."Last Rep Operation No. Val" <> '' then begin
                            locate2.VSDVal :=
                              locate2.VoySeaAnyTime(locate2."Last Rep Operation No. Val", locate2.Code, locate2.GetFilter("date filter"));
                            if Operatn.Get(locate2."Last Rep Operation No. Val") then
                                Operatn.SetFilter(Operatn."Date Filter", '%1', "Date Filter");
                            locate2."Last Reportd Vessel Pts" := Operatn.PointZ(Operatn."No.", locate2.Code,
                              locate2.GetFilter("date filter"), '', '', '', Operatn.Vessel);//Operatn.Points;
                            Operatn.SetFilter(Operatn."Task Filter", 'SHR');
                            //Operatn.CALCFIELDS(Operatn.Points);
                            locate2."Last Reportd Shrimps Pts" := Operatn.PointZ(Operatn."No.", locate2.Code,
                              locate2.GetFilter("date filter"), '', 'SHR', '', Operatn.Vessel); //Operatn.Points;
                            Operatn.SetRange(Operatn."Task Filter");
                            locate2.Modify();
                        end;
                    until locate2.Next() = 0;

                //AAA - June 2002 Sort Entries accordg to SeaDays
                locate.SetRange(locate."Location Type", 1);
                TotLoc := locate.Count;
                if ArrangeBy = 0 then
                    locate.SetCurrentKey(locate."Last Reportd Vessel Pts")
                else
                    locate.SetCurrentKey(locate.VSDVal);
                locate.Ascending(false);

                Countx := 1;
                if locate.Find('-') then
                    repeat
                        if locate.VSDVal <> 0 then begin
                            SeaRange[Countx] := locate.Code;
                            SeaRangeD[Countx] := locate.VSDVal;     //Sea Day Assigned
                            VesselPoint[Countx] := locate."Last Reportd Vessel Pts";   //Vessel Points Assigned
                            ShrimpPoint[Countx] := locate."Last Reportd Shrimps Pts"; //Shrimp Points Assigned
                            FishPoint[Countx] := VesselPoint[Countx] - ShrimpPoint[Countx];

                            //Fishg Area
                            locate.SetFilter(locate."date filter", '%1', GetRangeMax("Date Filter"));//CH1
                                                                                                     //locate.CALCFIELDS(locate."Fishing Area");
                            locate."Fishing Area" := locate.FishingArea(locate."Current Operation",
                               locate.Code, locate.GetFilter("date filter"));
                            if locate."Fishing Area" <> '' then
                                if (Phase.Get(locate."Fishing Area")) and (Phase."Area Code" <> '') then
                                    FishgArea[Countx] := Phase."Area Code"
                                else
                                    FishgArea[Countx] := CopyStr(locate."Fishing Area", 1, 4);
                            if SeaRange[Countx] = '' then FishgArea[Countx] := '';

                            Countx := Countx + 1;
                        end;
                    until locate.Next() = 0;
                TotLoc := Countx - 1;
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
                group(Control2)
                {
                    ShowCaption = false;
                    field("Arrange Column by"; ArrangeBy)
                    {
                        ApplicationArea = All;
                    }
                    field("Report Mode"; ReportBy)
                    {
                        ApplicationArea = All;
                    }
                    field("Show Category total"; "Show Category total")
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
            //ArrangeBy := ArrangeBy::"Sea Days";   //Revisit;
            //ReportBy := ReportBy::Stock;
        end;
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        // DateFilter := "Inventory Posting G Cat Tot".GETFILTER("Date Filter");
    end;

    var
        TotalFor: Label ' Total';
        locate: Record Location;
        locate2: Record Location;
        Operatn: Record Job;
        Countx: Integer;
        level: Integer;
        TotLoc: Integer;
        SeaRangeC: array[100] of Decimal;
        T001: Text[80];
        T002: Text[80];
        SeaRange: array[100] of Text[30];
        SeaRangeD: array[100] of Decimal;
        ShrimpPoint: array[100] of Decimal;
        VesselPoint: array[100] of Decimal;
        FishPoint: array[100] of Decimal;
        Cat: Code[15];
        "Show Category total": Boolean;
        ArrangeBy: Option "Vessel Points","Sea Days";
        ReportBy: Option Catch,Stock;
        DateFilter: Text[50];
        Text001: Label 'Period: %1';
        InvtTot: Decimal;
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Daily_Break_Up_by_Vessel__2_CaptionLbl: Label 'Daily Break Up by Vessel (2)';
        Inventory_Total_CaptionLbl: Label 'Inventory Total ';
        Sea_DaysCaptionLbl: Label 'Sea Days';
        VesselsCaptionLbl: Label 'Vessels';
        Shrimp_PointsCaptionLbl: Label 'Shrimp Points';
        Vessel_PointsCaptionLbl: Label 'Vessel Points';
        Fish_PointsCaptionLbl: Label 'Fish Points';
        Sea_DaysCaption_Control1000001204Lbl: Label 'Sea Days';
        VesselsCaption_Control1000001206Lbl: Label 'Vessels';
        Vessel_PointsCaption_Control1000001207Lbl: Label 'Vessel Points';
        Shrimp_PointsCaption_Control1000001212Lbl: Label 'Shrimp Points';
        Fish_PointsCaption_Control1000001214Lbl: Label 'Fish Points';
        Inventory_Total_Caption_Control1000001465Lbl: Label 'Inventory Total ';
        DescriptionCaptionLbl: Label 'Description';
        Inventory_TotalCaptionLbl: Label 'Inventory Total';
        T001CaptionLbl: Label 'Statistics Group';
        CatCaptionLbl: Label 'Category';
        FishgArea: array[100] of Code[10];
        SeaRangeDTot: Decimal;
        ShrimpPointTot: Decimal;
        VesselPointTot: Decimal;
        FishPointTot: Decimal;
        PntLess: Integer;
        Phase: Record Task;
        VesselCounter: Integer;
        LastRepOptNo: Code[10];
        Test: Decimal;
        testing123: Decimal;
        testc: array[100] of Decimal;
}