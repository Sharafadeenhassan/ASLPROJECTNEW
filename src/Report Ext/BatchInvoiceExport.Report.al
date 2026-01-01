report 50255 "Batch Invoice Export"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Batch Invoice Export Report';

    dataset
    {
        dataitem(Dummy; Integer) { DataItemTableView = SORTING(Number) WHERE(Number = CONST(1)); }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group("Export Filters")
                {
                    field("Start Date"; StartDate) { ApplicationArea = All; }
                    field("End Date"; EndDate) { ApplicationArea = All; }
                    field("Customer No."; CustomerNo) { ApplicationArea = All; TableRelation = Customer."No."; }
                    field("Environment"; Environment) { ApplicationArea = All; }
                    field(fileName; FileName)
                    {
                        ApplicationArea = All;
                        Caption = 'Export File Name';
                        ToolTip = 'Specifies the name of the export file.';
                    }
                    field("Invoice No."; InvoiceNo)
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specify a specific invoice number to export (optional).';
                    }


                }
            }
        }

        trigger OnAfterGetRecord();
        var
            Exporter: Codeunit "Invoice Export Handler";
        begin
            Exporter.ExportFilteredInvoices(StartDate, EndDate, CustomerNo, InvoiceNo, Environment);
        end;

        var
            StartDate: Date;
            EndDate: Date;
            CustomerNo: Code[20];
            InvoiceNo: Code[20];
            Environment: Option Test,Live;
            FileName: Text[100];
    }

}
