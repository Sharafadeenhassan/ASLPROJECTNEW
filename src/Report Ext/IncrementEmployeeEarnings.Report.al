report 50070 "Increment Employee Earnings"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/IncrementEmployeeEarnings.rdlc';
    Caption = 'Increment Employee Earnings';
    UsageCategory = Administration;
    ApplicationArea = All;
    dataset
    {
        dataitem("Payroll-Employee Group Header."; "Payroll-Employee Group Header.")
        {
            DataItemTableView = SORTING(Code) WHERE(Management = CONST(false));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Code";
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
            column(Payroll_Employee_Group_Lines_Caption; Payroll_Employee_Group_Lines_CaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Payroll_Employee_Group_Header__Code; Code)
            {
            }
            dataitem("Payroll-Employee Group Lines."; "Payroll-Employee Group Lines.")
            {
                DataItemLink = "Employee Group" = FIELD(Code);
                DataItemTableView = SORTING("Employee Group", "E/D Code");
                RequestFilterFields = "Employee Group", "E/D Code", "ED Category";
                column(Payroll_Employee_Group_Lines___Employee_Group_; "Employee Group")
                {
                }
                column(Payroll_Employee_Group_Lines___Employee_Group__Control11; "Employee Group")
                {
                }
                column(Payroll_Employee_Group_Lines___E_D_Code_; "E/D Code")
                {
                }
                column(Payroll_Employee_Group_Lines___Default_Amount_; "Default Amount")
                {
                }
                column(Payroll_Employee_Group_Lines___Old_Default_Amount_; "Old Default Amount")
                {
                }
                column(Payroll_Employee_Group_Lines___Date_Changed_; "Date Changed")
                {
                }
                column(EDRec__Payslip_Text_; EDRec."Payslip Text")
                {
                }
                column(Payroll_Employee_Group_Lines___Employee_Group__Control11Caption; FieldCaption("Employee Group"))
                {
                }
                column(Payroll_Employee_Group_Lines___E_D_Code_Caption; FieldCaption("E/D Code"))
                {
                }
                column(Payroll_Employee_Group_Lines___Default_Amount_Caption; FieldCaption("Default Amount"))
                {
                }
                column(Payroll_Employee_Group_Lines___Old_Default_Amount_Caption; FieldCaption("Old Default Amount"))
                {
                }
                column(Payroll_Employee_Group_Lines___Date_Changed_Caption; FieldCaption("Date Changed"))
                {
                }
                column(TextCaption; TextCaptionLbl)
                {
                }
                column(Payroll_Employee_Group_Lines___Employee_Group_Caption; FieldCaption("Employee Group"))
                {
                }

                trigger OnAfterGetRecord()
                begin
                    EDRec.Get("Payroll-Employee Group Lines."."E/D Code");

                    "Payroll-Employee Group Lines."."Old Default Amount" := "Payroll-Employee Group Lines."."Default Amount";
                    if EDRec.Prorate then begin
                        "Payroll-Employee Group Lines."."Default Amount" := "Payroll-Employee Group Lines."."Default Amount" * (Incpercent + 100) / 100;
                        "Payroll-Employee Group Lines."."Date Changed" := Today;
                    end
                    else
                        if not (EDRec."Monthly Variable") then
                            "Payroll-Employee Group Lines."."Default Amount" := "Payroll-Employee Group Lines."."Default Amount" * (Incpercent + 100) / 100
                        else
                            "Payroll-Employee Group Lines."."Default Amount" := 0;

                    "Payroll-Employee Group Lines.".Modify();
                end;

                trigger OnPreDataItem()
                begin
                    LastFieldNo := FieldNo("Employee Group");
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
        Incpercent: Decimal;
        EDRec: Record "Payroll-E/D Codes.";
        Payroll_Employee_Group_Lines_CaptionLbl: Label 'Payroll-Employee Group Lines.';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        TextCaptionLbl: Label 'Text';
}
