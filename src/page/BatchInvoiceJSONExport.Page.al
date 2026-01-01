page 50145 "Batch Invoice JSON Export"
{
    PageType = NavigatePage;
    SourceTable = "Sales Header";
    UsageCategory = Tasks;
    Caption = 'Batch Invoice JSON Export';
    ApplicationArea = All;
    actions
    {
        area(processing)
        {
            action(ExportAll)
            {
                Caption = 'Export Selected Invoices';
                Image = Export;

                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.Copy(Rec);
                    if SalesHeader.FindSet() then
                        repeat
                            ExportInvoiceJsonToFile(SalesHeader); // ✅ This will work
                        until SalesHeader.Next() = 0;
                end;
            }
        }
    }

    procedure ExportInvoiceJsonToFile(SalesHeader: Record "Sales Header")
    var
        JsonBuilder: Codeunit "Sales Invoice JSON Builder";
        ExportBuffer: Record "JSON Export Buffer";
        OutStream: OutStream;
        JsonText: Text;
        InStream: InStream;
        FileName: Text;
    begin
        JsonText := JsonBuilder.BuildSalesInvoiceJson(SalesHeader);

        ExportBuffer.Init();
        //ExportBuffer.ID := SalesHeader."Document Type".AsInteger() * 100000 + SalesHeader."No.".AsInteger();
        ExportBuffer.FileName := GenerateTimestampId(SalesHeader) + '.json';

        //ExportBuffer.FileName := 'Invoice_' + SalesHeader."No." + '.json';
        ExportBuffer.Content.CreateOutStream(OutStream);
        OutStream.WriteText(JsonText);
        ExportBuffer.Insert();

        ExportBuffer.Content.CreateInStream(InStream);
        FileName := ExportBuffer.FileName;

        DownloadFromStream(
            InStream,
            'Download Invoice JSON',
            '',          // ToFolder
            '*.json',    // ToFilter
            FileName     // var ToFile
        );
    end;

    procedure GenerateTimestampId(SalesHeader: Record "Sales Header"): Text
    var
        DateTimeText: Text;
    begin
        DateTimeText := Format(SalesHeader."Document Date", 0, '<Year4><Month,2><Day,2>');
        exit(SalesHeader."No." + '_' + DateTimeText);
    end;

    procedure ExportFilteredInvoices(StartDate: Date; EndDate: Date; CustomerNo: Code[20])
    var
        PostedInvoiceHeader: Record "Sales Invoice Header";
    begin
        PostedInvoiceHeader.SetRange("Posting Date", StartDate, EndDate);
        if CustomerNo <> '' then
            PostedInvoiceHeader.SetRange("Sell-to Customer No.", CustomerNo);

        // Continue with export logic...
    end;

}
