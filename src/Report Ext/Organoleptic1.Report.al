report 50209 "Organoleptic1"
{
    // "Comment Line"."Loose Shells%"
    // "Comment Line"."Loose Neck%"
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/Organoleptic1.rdlc';
    Caption = 'Organoleptic1';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    dataset
    {
        dataitem("Comment Line"; "Comment Line")
        {
            DataItemTableView = SORTING("Table Name", "No.", Type, "Line No.") WHERE("Table Name" = CONST(Job), Type = CONST(Organoleptic));
            RequestFilterFields = "No.", Vessel, Voyage, Captain, "Date Code", "Frozen Weight W/O I/C", "Drained Weight (KGS)", "Count/Kg", "TTL No. Pcs/Slab", "Upper Grade Count", "Lower Grade Count", "Uniformity Ratio", "Dehydration%", "Discolouration%", "Black Spot%", "Broken%", "Mech Damage%", "Foreign Matter", Odour;
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
            column(Comment_Line_Vessel; Vessel)
            {
            }
            column(Comment_Line__No__; "No.")
            {
            }
            column(Comment_Line_Voyage; Voyage)
            {
            }
            column(Loc_ETA; Loc.ETA)
            {
            }
            column(Loc_ETD; Loc.ETD)
            {
            }
            column(Batch; Batch)
            {
            }
            column(Comment_Line_Captain; Captain)
            {
            }
            column(SMSName; SMSName)
            {
            }
            column(Comment_Line_Date_; Date)
            {
            }
            column(Comment_Line_Comment; Comment)
            {
            }
            column(Comment_Line__Overall_Remark_; "Overall Remark")
            {
            }
            column(Comment_Line_Odour; Odour)
            {
            }
            column(Comment_Line__Foreign_Matter_; "Foreign Matter")
            {
            }
            column(Comment_Line__General_Appearance_; "General Appearance")
            {
            }
            column(Comment_Line__Mix_Up__; "Mix Up%")
            {
            }
            column(Comment_Line__Loose_Shells__; "Loose Shells%")
            {
            }
            column(Comment_Line__Broken__; "Broken%")
            {
            }
            column(Comment_Line__Black_Spot__; "Black Spot%")
            {
            }
            column(Comment_Line__Discolouration__; "Discolouration%")
            {
            }
            column(Comment_Line__Dehydration__; "Dehydration%")
            {
            }
            column(Comment_Line__Uniformity_Ratio_; "Uniformity Ratio")
            {
            }
            column(Comment_Line__Lower_Grade_Count_; "Lower Grade Count")
            {
            }
            column(Comment_Line__Upper_Grade_Count_; "Upper Grade Count")
            {
            }
            column(ROUND__TTL_No__Pcs_Slab__1______; Round("TTL No. Pcs/Slab", 1, '<'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(Comment_Line__Count_Kg_; "Count/Kg")
            {
            }
            column(Comment_Line__Drained_Weight__KGS__; "Drained Weight (KGS)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Comment_Line__Frozen_Weight_W_O_I_C_; "Frozen Weight W/O I/C")
            {
            }
            column(Comment_Line__Date_Code_; "Date Code")
            {
            }
            column(GradeTxt_______Pack_Size_______Brand; GradeTxt + '  ' + "Pack Size" + '  ' + Brand)
            {
            }
            column(Comment_Line__Frozen_Weight_W_O_I_C__Control1000000050; "Frozen Weight W/O I/C")
            {
            }
            column(Comment_Line__Drained_Weight__KGS___Control1000000051; "Drained Weight (KGS)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Comment_Line__Count_Kg__Control1000000052; "Count/Kg")
            {
            }
            column(ROUND__TTL_No__Pcs_Slab__1_______Control1000000053; Round("TTL No. Pcs/Slab", 1, '<'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(Comment_Line__Upper_Grade_Count__Control1000000054; "Upper Grade Count")
            {
            }
            column(Comment_Line__Lower_Grade_Count__Control1000000055; "Lower Grade Count")
            {
            }
            column(Comment_Line__Uniformity_Ratio__Control1000000056; "Uniformity Ratio")
            {
            }
            column(Comment_Line__Dehydration___Control1000000057; "Dehydration%")
            {
            }
            column(Comment_Line__Discolouration___Control1000000058; "Discolouration%")
            {
            }
            column(Comment_Line__Black_Spot___Control1000000059; "Black Spot%")
            {
            }
            column(Comment_Line__Broken___Control1000000060; "Broken%")
            {
            }
            column(Comment_Line__Loose_Shells___Control1000000061; "Loose Shells%")
            {
            }
            column(Comment_Line__General_Appearance__Control1000000062; "General Appearance")
            {
            }
            column(Comment_Line__Foreign_Matter__Control1000000063; "Foreign Matter")
            {
            }
            column(Comment_Line_Odour_Control1000000064; Odour)
            {
            }
            column(Comment_Line__Overall_Remark__Control1000000065; "Overall Remark")
            {
            }
            column(Comment_Line__Mix_Up___Control1000000066; "Mix Up%")
            {
            }
            column(Comment_Line_Comment_Control1000000067; Comment)
            {
            }
            column(Comment_Line__Date_Code__Control1000000069; "Date Code")
            {
            }
            column(GradeTxt_______Pack_Size_______Brand_Control1000000070; GradeTxt + '  ' + "Pack Size" + '  ' + Brand)
            {
            }
            column(Comment_Line__Frozen_Weight_W_O_I_C__Control26; "Frozen Weight W/O I/C")
            {
            }
            column(Comment_Line__Drained_Weight__KGS___Control29; "Drained Weight (KGS)")
            {
                DecimalPlaces = 2 : 2;
            }
            column(Comment_Line__Count_Kg__Control32; "Count/Kg")
            {
            }
            column(ROUND__TTL_No__Pcs_Slab__1_______Control35; Round("TTL No. Pcs/Slab", 1, '<'))
            {
                DecimalPlaces = 0 : 0;
            }
            column(Comment_Line__Upper_Grade_Count__Control38; "Upper Grade Count")
            {
            }
            column(Comment_Line__Lower_Grade_Count__Control41; "Lower Grade Count")
            {
            }
            column(Comment_Line__Uniformity_Ratio__Control44; "Uniformity Ratio")
            {
            }
            column(Comment_Line__Dehydration___Control47; "Dehydration%")
            {
            }
            column(Comment_Line__Discolouration___Control50; "Discolouration%")
            {
            }
            column(Comment_Line__Black_Spot___Control53; "Black Spot%")
            {
            }
            column(Comment_Line__Broken___Control56; "Broken%")
            {
            }
            column(Comment_Line__Mech_Damage__; "Mech Damage%")
            {
            }
            column(Comment_Line__General_Appearance__Control62; "General Appearance")
            {
            }
            column(Comment_Line__Foreign_Matter__Control65; "Foreign Matter")
            {
            }
            column(Comment_Line_Odour_Control68; Odour)
            {
            }
            column(Comment_Line__Overall_Remark__Control71; "Overall Remark")
            {
            }
            column(Comment_Line__Mix_Up___Control1000000011; "Mix Up%")
            {
            }
            column(Comment_Line_Comment_Control1000000001; Comment)
            {
            }
            column(Comment_Line__Date_Code__Control1000000013; "Date Code")
            {
            }
            column(GradeTxt_______Pack_Size_______Brand_Control11; GradeTxt + '  ' + "Pack Size" + '  ' + Brand)
            {
            }
            column(Quality_Control_Organoleptic_ReportCaption; Quality_Control_Organoleptic_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Comment_Line_VesselCaption; Comment_Line_VesselCaptionLbl)
            {
            }
            column(Comment_Line__No__Caption; Comment_Line__No__CaptionLbl)
            {
            }
            column(Comment_Line_VoyageCaption; Comment_Line_VoyageCaptionLbl)
            {
            }
            column(Loc_ETACaption; Loc_ETACaptionLbl)
            {
            }
            column(Loc_ETDCaption; Loc_ETDCaptionLbl)
            {
            }
            column(BatchCaption; BatchCaptionLbl)
            {
            }
            column(Comment_Line_CaptainCaption; Comment_Line_CaptainCaptionLbl)
            {
            }
            column(SMSNameCaption; SMSNameCaptionLbl)
            {
            }
            column(Comment_Line_Date_Caption; Comment_Line_Date_CaptionLbl)
            {
            }
            column(Comment_Line__Frozen_Weight_W_O_I_C__Control26Caption; FieldCaption("Frozen Weight W/O I/C"))
            {
            }
            column(Comment_Line__Drained_Weight__KGS___Control29Caption; FieldCaption("Drained Weight (KGS)"))
            {
            }
            column(Comment_Line__Count_Kg__Control32Caption; Comment_Line__Count_Kg__Control32CaptionLbl)
            {
            }
            column(ROUND__TTL_No__Pcs_Slab__1_______Control35Caption; ROUND__TTL_No__Pcs_Slab__1_______Control35CaptionLbl)
            {
            }
            column(Comment_Line__Upper_Grade_Count__Control38Caption; FieldCaption("Upper Grade Count"))
            {
            }
            column(Comment_Line__Lower_Grade_Count__Control41Caption; FieldCaption("Lower Grade Count"))
            {
            }
            column(Unifor_mity_RatioCaption; Unifor_mity_RatioCaptionLbl)
            {
            }
            column(Dehyd_ration_Caption; Dehyd_ration_CaptionLbl)
            {
            }
            column(Discolour_ation_Caption; Discolour_ation_CaptionLbl)
            {
            }
            column(Comment_Line__Black_Spot___Control53Caption; FieldCaption("Black Spot%"))
            {
            }
            column(Comment_Line__Broken___Control56Caption; FieldCaption("Broken%"))
            {
            }
            column(Mecha_nical_Damage_Caption; Mecha_nical_Damage_CaptionLbl)
            {
            }
            column(General_Appear_anceCaption; General_Appear_anceCaptionLbl)
            {
            }
            column(Comment_Line__Foreign_Matter__Control65Caption; FieldCaption("Foreign Matter"))
            {
            }
            column(Comment_Line_Odour_Control68Caption; FieldCaption(Odour))
            {
            }
            column(Comment_Line__Overall_Remark__Control71Caption; FieldCaption("Overall Remark"))
            {
            }
            column(Comment_Line__Mix_Up___Control1000000011Caption; FieldCaption("Mix Up%"))
            {
            }
            column(Comment_Line_Comment_Control1000000001Caption; Comment_Line_Comment_Control1000000001CaptionLbl)
            {
            }
            column(Comment_Line__Date_Code__Control1000000013Caption; FieldCaption("Date Code"))
            {
            }
            column(GradeTxt_______Pack_Size_______Brand_Control11Caption; GradeTxt_______Pack_Size_______Brand_Control11CaptionLbl)
            {
            }
            column(Comment_Line_Table_Name; "Table Name")
            {
            }
            column(Comment_Line_Line_No_; "Line No.")
            {
            }

            trigger OnPreDataItem()
            begin
                Rex := GetRangeMin("No.");

                if Loc.Get(Vessel) then;
                if Jobs.Get("No.") then;
                Batch := Loc.ExpCode + CopyStr(Voyage, StrLen(Voyage) - 1) + CopyStr(Format(Date2DMY("Date Code", 3)), 3);

                JbBudLn.SetRange(JbBudLn."Job No.", "No.");
                JbBudLn.SetRange(JbBudLn.Type, 0);
                //JbBudLn.SETRANGE(JbBudLn."Resource Group",'SMAS');  #1Error
                if JbBudLn.Find('+') then
                    SMSName := UpperCase(JbBudLn.Description);

                GradeTxt := '';
                if item.Get(Grade) then GradeTxt := item.Description
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
        Jobs: Record Job;
        item: Record Item;
        JbBudLn: Record "Job Ledger Entry";
        Loc: Record Location;
        GradeTxt: Text[30];
        Rex: Code[10];
        Batch: Code[20];
        SMSName: Text[30];
        Quality_Control_Organoleptic_ReportCaptionLbl: Label 'Quality Control Organoleptic Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Comment_Line_VesselCaptionLbl: Label 'VESSEL';
        Comment_Line__No__CaptionLbl: Label 'JOB';
        Comment_Line_VoyageCaptionLbl: Label 'VOYAGE';
        Loc_ETACaptionLbl: Label 'ETA';
        Loc_ETDCaptionLbl: Label 'ETD';
        BatchCaptionLbl: Label 'BATCH';
        Comment_Line_CaptainCaptionLbl: Label 'CAPTAIN';
        SMSNameCaptionLbl: Label 'SHRIMP MASTER';
        Comment_Line_Date_CaptionLbl: Label 'ANALYSIS DATE';
        Comment_Line__Count_Kg__Control32CaptionLbl: Label 'Count / Kg';
        ROUND__TTL_No__Pcs_Slab__1_______Control35CaptionLbl: Label '"TTL No. Pcs/Slab"';
        Unifor_mity_RatioCaptionLbl: Label 'Unifor mity Ratio';
        Dehyd_ration_CaptionLbl: Label 'Dehyd ration%';
        Discolour_ation_CaptionLbl: Label 'Discolour ation%';
        Mecha_nical_Damage_CaptionLbl: Label 'Mecha nical Damage%';
        General_Appear_anceCaptionLbl: Label 'General Appear ance';
        Comment_Line_Comment_Control1000000001CaptionLbl: Label 'Comments';
        GradeTxt_______Pack_Size_______Brand_Control11CaptionLbl: Label 'Description';
}
