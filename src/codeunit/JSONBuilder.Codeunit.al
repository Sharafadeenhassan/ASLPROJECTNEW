codeunit 50014 "JSON Builder"
{
 procedure ExportPostedInvoicesAsJson()
var
    PostedInvoiceHeader: Record "Sales Invoice Header";
    JsonArray: JsonArray;
    JsonObject: JsonObject;
    JsonText: Text;
begin
    PostedInvoiceHeader.SetRange("Posting Date", CalcDate('-1D', Today), Today);
    if PostedInvoiceHeader.FindSet() then
        repeat
            JsonObject := BuildInvoiceJson(PostedInvoiceHeader);
            JsonArray.Add(JsonObject);
        until PostedInvoiceHeader.Next() = 0;

    JsonText := SerializeJsonArray(JsonArray);
    UploadJsonToExternalSystem(JsonText); // Optional: send to external system
end;

procedure SerializeJsonArray(JsonArray: JsonArray): Text
var
    WrapperObject: JsonObject;
    TempBlob: Codeunit "Temp Blob";
    OutStream: OutStream;
    InStream: InStream;
    Text: Text;
begin
    // Wrap the array inside a JsonObject
    WrapperObject.Add('Invoices', JsonArray);

    // Write to stream
    TempBlob.CreateOutStream(OutStream);
    WrapperObject.WriteTo(OutStream);

    // Read back as text
    TempBlob.CreateInStream(InStream);
    InStream.ReadText(Text);

    exit(Text);
end;

procedure BuildInvoiceJson(InvoiceHeader: Record "Sales Invoice Header"): JsonObject
var
    JsonObject: JsonObject;
    JsonLines: JsonArray;
    InvoiceLine: Record "Sales Invoice Line";
    LineObject: JsonObject;
begin
    JsonObject.Add('InvoiceNo', InvoiceHeader."No.");
    JsonObject.Add('CustomerName', InvoiceHeader."Bill-to Name");
    JsonObject.Add('InvoiceDate', InvoiceHeader."Posting Date");

    InvoiceLine.SetRange("Document No.", InvoiceHeader."No.");
    if InvoiceLine.FindSet() then
        repeat
            //LineObject := JsonObject.CreateObject();
            Clear(LineObject);
            LineObject.Add('Description', InvoiceLine.Description);
            LineObject.Add('Quantity', InvoiceLine.Quantity);
            LineObject.Add('Amount', InvoiceLine.Amount);
            JsonLines.Add(LineObject);
        until InvoiceLine.Next() = 0;

    JsonObject.Add('Lines', JsonLines);
    exit(JsonObject);
end;
 procedure SerializeJsonObject(JsonObj: JsonObject): Text
var
    TempBlob: Codeunit "Temp Blob";
    OutStream: OutStream;
    InStream: InStream;
    Text: Text;
begin
    TempBlob.CreateOutStream(OutStream);
    JsonObj.WriteTo(OutStream);

    TempBlob.CreateInStream(InStream);
    InStream.ReadText(Text);
    exit(Text);
end;
procedure UploadJsonToExternalSystem(JsonText: Text)
var
    Client: HttpClient;
    Request: HttpRequestMessage;
    Response: HttpResponseMessage;
    Content: HttpContent;
    Headers: HttpHeaders;
    URL: Text;
begin
    //URL := 'https://api.externalapp.com/upload'; // Replace with your actual endpoint
    
    URL := GetExportUrl();
    ValidateUrl(URL);
    Content.WriteFrom(JsonText);
    Content.GetHeaders(Headers); // ✅ Correct usage
    Headers.Add('Content-Type', 'application/json');

    Request.SetRequestUri(URL);
    Request.Method := 'POST';
    Request.Content := Content;

    Request.GetHeaders(Headers); // ✅ Also correct for request headers
    Headers.Add('Authorization', 'Bearer YOUR_TOKEN_HERE'); // Optional

    Client.Send(Request, Response);

    if not Response.IsSuccessStatusCode() then
        Error('Upload failed: %1', Response.HttpStatusCode());
end;

procedure GetExportUrl(): Text
var
    Setup: Record "Invoice Export Setup";
begin
    if Setup.Get('DEFAULT') then begin
        case Setup."Environment" of
            Setup."Environment"::Test:
                exit(Setup."Test API URL"); // Replace with your test URL
            Setup."Environment"::Live:
                exit(Setup."API URL");
        end;
    end else
        Error('Export URL not configured.');
end;

procedure ValidateUrl(URL: Text)
begin
    if (URL = '') or not (StrPos(URL, 'http') = 1) then
        Error('Invalid or missing URL. Please check your setup.');
end;

}
