codeunit 50041 "Invoice Export Handler"
{

    procedure ExportFilteredInvoices(StartDate: Date; EndDate: Date; CustomerNo: Code[20];InvoiceNo: Code[20]; Environment: Option Test, Live)
    var
        Header: Record "Sales Invoice Header";
        JsonArray: JsonArray;
        JsonObject: JsonObject;
        JsonText: Text;
        //InvoiceNo: Code[20];
        Success: Boolean;
        ErrorMsg: Text;
        Uploader: Codeunit "Invoice Export Uploader";
    begin
        Header.SetRange("Posting Date", StartDate, EndDate);
        if CustomerNo <> '' then
            Header.SetRange("Sell-to Customer No.", CustomerNo);

        if Header.FindSet() then begin
            repeat
                InvoiceNo := Header."No.";
                JsonObject := BuildInvoiceJson(Header);
                JsonArray.Add(JsonObject);
            until Header.Next() = 0;

            JsonText := SerializeJsonArray(JsonArray);

            Success := true;
            ErrorMsg := '';
            if not Uploader.RunUpload(JsonText, Environment) then begin
                Success := false;
                ErrorMsg := GetLastErrorText();
            end;     
                       
            LogExportStatus(InvoiceNo, Success, ErrorMsg);
        end else
            Error('No posted invoices found for the selected filters.');
    end;

    procedure BuildInvoiceJson(Header: Record "Sales Invoice Header"): JsonObject
    var
        Obj: JsonObject;
    begin
        Obj.Add('InvoiceNo', Header."No.");
        Obj.Add('CustomerName', Header."Sell-to Customer Name");
        Obj.Add('PostingDate', Format(Header."Posting Date"));
        
        exit(Obj);
    end;

    procedure SerializeJsonArray(JsonArray: JsonArray): Text
    var
        Wrapper: JsonObject;
        TempBlob: Codeunit "Temp Blob";
        OutS: OutStream;
        InS: InStream;
        Text: Text;
    begin
        Wrapper.Add('Invoices', JsonArray);
        TempBlob.CreateOutStream(OutS);
        Wrapper.WriteTo(OutS);
        TempBlob.CreateInStream(InS);
        InS.ReadText(Text);
        exit(Text);
    end;

    procedure LogExportStatus(InvoiceNo: Code[20]; Success: Boolean; ErrorMessage: Text)
    var
        Log: Record "Invoice Export Log";
    begin
        Log.Init();
        Log."Invoice No." := InvoiceNo;
        Log."Export DateTime" := CurrentDateTime();
        Log."Success" := Success;
        Log."Error Message" := ErrorMessage;
        Log.Insert();
    end;
    procedure DownloadJsonFile(JsonText: Text; FileName: Text)
var
    TempBlob: Codeunit "Temp Blob";
    OutStream: OutStream;
    InStream: InStream;
begin
    TempBlob.CreateOutStream(OutStream);
    OutStream.WriteText(JsonText);

    TempBlob.CreateInStream(InStream);
    DownloadFromStream(InStream, '', '', '', FileName);
end;


}
