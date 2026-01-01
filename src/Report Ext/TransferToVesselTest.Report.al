report 99899 "Transfer To Vessel Test"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/TransferToVesselTest.rdlc';
    Caption = 'Transfer To Vessel Test';
    dataset
    {
        dataitem("Value Entry"; "Value Entry")
        {
            DataItemTableView = SORTING("Item Ledger Entry Type", "Item No.", "Posting Date") WHERE("Item Ledger Entry Type" = CONST(Transfer));
            RequestFilterFields = "Location Code", "External Document No.", "Gen. Prod. Posting Group";
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
            column(Value_Entry__Item_Ledger_Entry_Type_; "Item Ledger Entry Type")
            {
            }
            column(Value_Entry__Location_Code_; "Location Code")
            {
            }
            column(Value_Entry__External_Document_No__; "External Document No.")
            {
            }
            column(Value_Entry__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
            {
            }
            column(Value_Entry__Entry_No__; "Entry No.")
            {
            }
            column(Value_Entry__Posting_Date_; "Posting Date")
            {
            }
            column(Value_Entry__Document_No__; "Document No.")
            {
            }
            column(Value_Entry__Item_No__; "Item No.")
            {
            }
            column(Value_Entry_Description; Description)
            {
            }
            column(Value_Entry__Valued_Quantity_; "Valued Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual__; "Cost Amount (Actual)")
            {
            }
            column(TotalFor___FIELDCAPTION__Gen__Prod__Posting_Group__; TotalFor + FieldCaption("Gen. Prod. Posting Group"))
            {
            }
            column(Value_Entry__Valued_Quantity__Control41; "Valued Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control42; "Cost Amount (Actual)")
            {
            }
            column(TotalFor___FIELDCAPTION__External_Document_No___; TotalFor + FieldCaption("External Document No."))
            {
            }
            column(Value_Entry__Valued_Quantity__Control44; "Valued Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control45; "Cost Amount (Actual)")
            {
            }
            column(TotalFor___FIELDCAPTION__Location_Code__; TotalFor + FieldCaption("Location Code"))
            {
            }
            column(Value_Entry__Valued_Quantity__Control47; "Valued Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control48; "Cost Amount (Actual)")
            {
            }
            column(TotalFor___FIELDCAPTION__Item_Ledger_Entry_Type__; TotalFor + FieldCaption("Item Ledger Entry Type"))
            {
            }
            column(Value_Entry__Valued_Quantity__Control50; "Valued Quantity")
            {
            }
            column(Value_Entry__Cost_Amount__Actual___Control51; "Cost Amount (Actual)")
            {
            }
            column(Value_EntryCaption; Value_EntryCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Value_Entry__Entry_No__Caption; FieldCaption("Entry No."))
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
            column(Value_Entry_DescriptionCaption; FieldCaption(Description))
            {
            }
            column(Value_Entry__Valued_Quantity_Caption; FieldCaption("Valued Quantity"))
            {
            }
            column(Value_Entry__Cost_Amount__Actual__Caption; FieldCaption("Cost Amount (Actual)"))
            {
            }
            column(Value_Entry__Item_Ledger_Entry_Type_Caption; FieldCaption("Item Ledger Entry Type"))
            {
            }
            column(Value_Entry__Location_Code_Caption; FieldCaption("Location Code"))
            {
            }
            column(Value_Entry__External_Document_No__Caption; FieldCaption("External Document No."))
            {
            }
            column(Value_Entry__Gen__Prod__Posting_Group_Caption; FieldCaption("Gen. Prod. Posting Group"))
            {
            }

            trigger OnPreDataItem()
            begin
                LastFieldNo := FieldNo("Gen. Prod. Posting Group");

                if not FooterPrinted then
                    LastFieldNo := CurrReport.TotalsCausedBy();
                CurrReport.ShowOutput(not FooterPrinted);
                FooterPrinted := true;
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
        FooterPrinted: Boolean;
        TotalFor: Label 'Total for ';
        Value_EntryCaptionLbl: Label 'Value Entry';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
}
