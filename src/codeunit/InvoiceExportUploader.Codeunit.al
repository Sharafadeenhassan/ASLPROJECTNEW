codeunit 50043 "Invoice Export Uploader"
{
    procedure RunUpload(JsonText: Text; Environment: Option Test, Live): Boolean
    var
        Setup: Record "Invoice Export Setup";
        URL: Text;
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: HttpContent;
        Headers: HttpHeaders;
    begin
        if not Setup.Get('DEFAULT') then
            Error('Export setup not configured.');

        case Environment of
            Environment::Test: URL := Setup."Test API URL";
            Environment::Live: URL := Setup."API URL";
        end;

        if (URL = '') or not (StrPos(URL, 'http') = 1) then
            Error('Invalid or missing URL.');

        Content.WriteFrom(JsonText);
        Content.GetHeaders(Headers);
        Headers.Add('Content-Type', 'application/json');

        Request.SetRequestUri(URL);
        Request.Method := 'POST';
        Request.Content := Content;
        Request.GetHeaders(Headers);
        Headers.Add('Authorization', 'Bearer YOUR_TOKEN_HERE'); // Optional

        Client.Send(Request, Response);
        if not Response.IsSuccessStatusCode() then
            Error('Upload failed: %1', Response.HttpStatusCode());

        exit(true);
    end;
}
