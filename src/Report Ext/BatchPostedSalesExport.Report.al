report 50249 "Batch Posted Sales Export"
{
    ApplicationArea = All;
    Caption = 'Batch Posted Sales Export';
    UsageCategory = ReportsAndAnalysis;
    

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.") WHERE("Posting Date" = FILTER(<> 0D), "Sell-to Customer No." = FILTER(<> ''));
        }

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
                        TableRelation = "Sales Invoice Header"."No.";
                        ApplicationArea = All;
                        ToolTip = 'Specify a specific invoice number to export (optional).';
                    }
                }
            }
        }
        trigger OnInit();
        var
            JSONExportBuffer: Record "JSON Export Buffer";
        begin
            JSONExportBuffer.DELETEALL;
        end;

        trigger OnAfterGetRecord();
        var
        EInvoice: Record "Sales Invoice Header";
        begin
            EInvoice.EInvoiceGenerateStatusText(SalesInvoiceHeader);
        end;
        /* var
            ExportBuffer: Record "JSON Export Buffer";
            JsonBuilder: Codeunit "Sales Invoice JSON Builder";
            OutStream: OutStream;
            JsonText: Text;
            InStream: InStream;
            FileName: Text;
            Buffer: Record "JSON Export Buffer";
            Rec: record "Sales Invoice Header";
        begin
            JsonText := JsonBuilder.BuildPostedSalesInvoiceJson(Rec);
            ExportBuffer.Init();
            ExportBuffer.ID := +1;
            ExportBuffer.FileName := 'Invoice_' + rec."No." + '.json';
            ExportBuffer.Content.CreateOutStream(OutStream);
            OutStream.WriteText(JsonText);
            ExportBuffer.Insert();
            Buffer.Content.CreateInStream(InStream);
            FileName := Buffer.FileName;
            DownloadFromStream(InStream, Buffer.FileName, 'application/json', '*.json', FileName);
        end;

        //    DownloadFromRecord(ExportBuffer); // ✅ Now this works
        //end;
        */
        var
            StartDate: Date;
            EndDate: Date;
            CustomerNo: Code[20];
            InvoiceNo: Code[20];
            Environment: Option Test,Live;
            FileName: Text[100];
            
    }
}


/*
procedure DownloadFromRecord(Buffer: Record "JSON Export Buffer")
var
    InStream: InStream;
    FileName: Text;
begin
    Buffer.Content.CreateInStream(InStream);
    FileName := Buffer.FileName;
    DownloadFromStream(InStream, Buffer.FileName, 'application/json','*.json',FileName);
end;
*/
