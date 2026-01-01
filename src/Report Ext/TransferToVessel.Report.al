report 50006 "Transfer To Vessel"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/TransferToVessel.rdlc';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    Caption = 'Transfer To Vessel';
    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            DataItemTableView = SORTING("Item Ledger Entry Type", "Item No.", "Posting Date") WHERE("Item Ledger Entry Type" = CONST(Transfer));
            RequestFilterFields = "Location Code", "External Document No.", "Gen. Prod. Posting Group", "Posting Date", "Item No.";
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
            column(Value_Entry__GETFILTERS; "Value Entry".GetFilters)
            {
            }
            column(Value_Entry__Location_Code_; "Location Code")
            {
            }
            column(Value_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Date_Filter; ValueEntry."Date Filter")
            {
            }
            column(Value_Entry__Document_No__; "Document No.")
            {
            }
            column(Value_Entry__Item_No__; "Item No.")
            {
            }
            column(Value_Entry__Valued_Quantity_; "Valued Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual__; "Cost Amount (Actual)")
            {
            }
            column(ITEM_REC_Description; ITEM_REC.Description)
            {
            }
            column(Value_Entry__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control1000000021; "Cost Amount (Actual)")
            {
            }
            column(Value_Entry__Valued_Quantity__Control1000000006; "Valued Quantity")
            {
            }
            column(Value_Entry__External_Document_No__; "External Document No.")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control1000000020; "Cost Amount (Actual)")
            {
            }
            column(Value_Entry__Valued_Quantity__Control1000000007; "Valued Quantity")
            {
            }
            column(Value_Entry__Location_Code__Control1000000002; "Location Code")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control1000000012; "Cost Amount (Actual)")
            {
            }
            column(Value_Entry__Valued_Quantity__Control1000000008; "Valued Quantity")
            {
            }
            column(Transfer_to_VesselCaption; Transfer_to_VesselCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Value_Entry__Posting_Date_Caption; FieldCaption("Posting Date"))
            {
            }
            column(Value_Entry__Document_No__Caption; FieldCaption("Document No."))
            {
            }
            column(Value_Entry__Item_No__Caption; FieldCaption("Item No."))
            {
            }
            column(Value_Entry__Valued_Quantity_Caption; FieldCaption("Valued Quantity"))
            {
            }
            column(Value_Entry__Cost_Amount__Actual__Caption; FieldCaption("Cost Amount (Actual)"))
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Value_Entry__Location_Code_Caption; FieldCaption("Location Code"))
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }
            column(GroupCaption; GroupCaptionLbl)
            {
            }
            column(TotalCaption_Control1000000015; TotalCaption_Control1000000015Lbl)
            {
            }
            column(VoyageCaption; VoyageCaptionLbl)
            {
            }
            column(Value_Entry__Location_Code__Control1000000002Caption; FieldCaption("Location Code"))
            {
            }
            column(TotalCaption_Control1000000013; TotalCaption_Control1000000013Lbl)
            {
            }
            column(Value_Entry_Entry_No_; "Entry No.")
            {
            }

            trigger OnAfterGetRecord()
            begin

                if ITEM_REC.Get("Value Entry"."Item No.") then
                    ITEM_REC.Description := ITEM_REC.Description else
                    ITEM_REC.Description := '';
            end;

            trigger OnPreDataItem()
            begin
                "Value Entry".SetFilter("Value Entry"."Gen. Prod. Posting Group", '<>%1', 'FIS');
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

    trigger OnPreReport()
    begin
        //DateFilter_ValueEntry := "Value Entry".GETFILTER("Date Filter"); //dik
    end;

    var
        ITEM_REC: Record Item;
        Transfer_to_VesselCaptionLbl: Label 'Transfer to Vessel';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        DescriptionCaptionLbl: Label 'Description';
        TotalCaptionLbl: Label 'Total';
        GroupCaptionLbl: Label 'Group';
        TotalCaption_Control1000000015Lbl: Label 'Total';
        VoyageCaptionLbl: Label 'Voyage';
        TotalCaption_Control1000000013Lbl: Label 'Total';
        ValueEntry: Record "Value Entry";
}
