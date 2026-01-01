report 50092 "Voyage Consumption2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/VoyageConsumption2.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Voyage Consumption2';
    dataset
    {
        dataitem("Job Ledger Entry"; "Job Ledger Entry")
        {
            DataItemTableView = SORTING("Job No.", "Entry Type", Type, "No.") WHERE("Entry Type" = CONST(Usage), Type = CONST(Item), "Gen. Prod. Posting Group" = FILTER(<> 'FIS'));
            RequestFilterFields = "Job No.", "Entry Type", Type, "Gen. Prod. Posting Group", "No.";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(USERID; UserId)
            {
            }
            column(Job_Ledger_Entry__Job_No__; "Job No.")
            {
            }
            column(Locatn_Name; Locatn.Name)
            {
            }
            column(Operatn__Voyage_No__; Operatn."Voyage No.")
            {
            }
            column(Operatn__Ending_Date_; Operatn."Ending Date")
            {
            }
            column(Operatn__Starting_Date_; Operatn."Starting Date")
            {
            }
            column(Resour_Name; Resour.Name)
            {
            }
            column(Job_Ledger_Entry__Entry_Type_; "Entry Type")
            {
            }
            column(Job_Ledger_Entry_Type; Type)
            {
            }
            column(Desc; Desc)
            {
            }
            column(Job_Ledger_Entry__No__; "No.")
            {
            }
            column(Job_Ledger_Entry__No___Control23; "No.")
            {
            }
            column(Job_Ledger_Entry_Description; Description)
            {
            }
            column(Job_Ledger_Entry_Quantity; Quantity)
            {
            }
            column(Job_Ledger_Entry__Unit_Cost_; "Unit Cost")
            {
            }
            column(Job_Ledger_Entry__Total_Cost_; "Total Cost")
            {
            }
            column(TotalFor___FIELDCAPTION__No___; TotalFor + FieldCaption("No."))
            {
            }
            column(Job_Ledger_Entry_Quantity_Control38; Quantity)
            {
            }
            column(Job_Ledger_Entry__Total_Cost__Control39; "Total Cost")
            {
            }
            column(Job_Ledger_Entry_Description_Control1000000001; Description)
            {
            }
            column(Job_Ledger_Entry__No___Control1000000002; "No.")
            {
            }
            column(Job_Ledger_Entry__Unit_Cost__Control1000000000; "Unit Cost")
            {
            }
            column(Job_Ledger_Entry__Total_Cost__Control42; "Total Cost")
            {
            }
            column(TotalFor___FIELDCAPTION__Gen__Prod__Posting_Group__; TotalFor + FieldCaption("Gen. Prod. Posting Group"))
            {
            }
            column(TotalFor___FIELDCAPTION_Type_; TotalFor + FieldCaption(Type))
            {
            }
            column(Job_Ledger_Entry__Total_Cost__Control45; "Total Cost")
            {
            }
            column(TotalFor___FIELDCAPTION__Entry_Type__; TotalFor + FieldCaption("Entry Type"))
            {
            }
            column(Job_Ledger_Entry__Total_Cost__Control48; "Total Cost")
            {
            }
            column(TotalFor___FIELDCAPTION__Job_No___; TotalFor + FieldCaption("Job No."))
            {
            }
            column(Job_Ledger_Entry__Total_Cost__Control51; "Total Cost")
            {
            }
            column(Voyage_Consumption_ReportCaption; Voyage_Consumption_ReportCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Job_Ledger_Entry__No___Control23Caption; FieldCaption("No."))
            {
            }
            column(Job_Ledger_Entry_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Job_Ledger_Entry_QuantityCaption; FieldCaption(Quantity))
            {
            }
            column(Job_Ledger_Entry__Unit_Cost_Caption; FieldCaption("Unit Cost"))
            {
            }
            column(Job_Ledger_Entry__Total_Cost_Caption; FieldCaption("Total Cost"))
            {
            }
            column(Job_Ledger_Entry__Job_No__Caption; FieldCaption("Job No."))
            {
            }
            column(Captain_Caption; Captain_CaptionLbl)
            {
            }
            column(ETD_Caption; ETD_CaptionLbl)
            {
            }
            column(ETA_Caption; ETA_CaptionLbl)
            {
            }
            column(Voyage_No__Caption; Voyage_No__CaptionLbl)
            {
            }
            column(Vessel_Name_Caption; Vessel_Name_CaptionLbl)
            {
            }
            column(Job_Ledger_Entry__Total_Cost_Caption_Control1000000013; FieldCaption("Total Cost"))
            {
            }
            column(Job_Ledger_Entry__Unit_Cost_Caption_Control1000000014; FieldCaption("Unit Cost"))
            {
            }
            column(Job_Ledger_Entry_QuantityCaption_Control1000000015; FieldCaption(Quantity))
            {
            }
            column(Job_Ledger_Entry_DescriptionCaption_Control1000000016; FieldCaption(Description))
            {
            }
            column(Job_Ledger_Entry__No___Control23Caption_Control1000000017; FieldCaption("No."))
            {
            }
            column(Job_Ledger_Entry__Entry_Type_Caption; FieldCaption("Entry Type"))
            {
            }
            column(Job_Ledger_Entry_TypeCaption; FieldCaption(Type))
            {
            }
            column(Category_Caption; Category_CaptionLbl)
            {
            }
            column(Job_Ledger_Entry__No__Caption; FieldCaption("No."))
            {
            }
            column(Job_Ledger_Entry_Gen__Prod__Posting_Group; "Gen. Prod. Posting Group")
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("No.");
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
        Operatn: Record Job;
        Locatn: Record Location;
        Resour: Record Resource;
        LastFieldNo: Integer;
        TotalFor: Label 'Total for ';
        Desc: Text[30];
        Voyage_Consumption_ReportCaptionLbl: Label 'Voyage Consumption Report';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Captain_CaptionLbl: Label 'Captain:';
        ETD_CaptionLbl: Label 'ETD:';
        ETA_CaptionLbl: Label 'ETA:';
        Voyage_No__CaptionLbl: Label 'Voyage No.:';
        Vessel_Name_CaptionLbl: Label 'Vessel Name:';
        Category_CaptionLbl: Label 'Category:';
}
