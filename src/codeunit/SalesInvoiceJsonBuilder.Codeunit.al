codeunit 50042 "Sales Invoice JSON Builder"
{
    procedure BuildSalesInvoiceJson(SalesHeader: Record "Sales Header"): Text
    var
        JsonText: Text;
        JsonObject: JsonObject;
        JsonLines: JsonArray;
        SalesLine: Record "Sales Line";
        LineObject: JsonObject; // Declare outside the loop
    begin
        JsonObject.Add('InvoiceNo', SalesHeader."No.");
        JsonObject.Add('CustomerName', SalesHeader."Sell-to Customer Name");
        JsonObject.Add('InvoiceDate', Format(SalesHeader."Posting Date"));
        JsonObject.Add('TotalAmount', SalesHeader."Amount Including VAT");

        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then begin
            repeat
                Clear(LineObject); // Reset the object before reuse
                LineObject.Add('Item', SalesLine.Description);
                LineObject.Add('Quantity', SalesLine.Quantity);
                LineObject.Add('UnitPrice', SalesLine."Unit Price");
                LineObject.Add('LineTotal', SalesLine."Line Amount");
                JsonLines.Add(LineObject);
            until SalesLine.Next() = 0;
        end;

        JsonObject.Add('InvoiceLines', JsonLines);

        JsonObject.WriteTo(JsonText);
        exit(JsonText);
    end;

    procedure BuildPostedSalesInvoiceJson(PostedSalesHeader: Record "Sales Invoice Header"): Text
    var
        JsonText: Text;
        JsonObject: JsonObject;
        JsonLines: JsonArray;
        PSalesLine: Record "Sales Invoice Line";
        LineObject: JsonObject; // Declare outside the loop
    begin
        JsonObject.Add('InvoiceNo', PostedSalesHeader."No.");
        JsonObject.Add('CustomerName', PostedSalesHeader."Sell-to Customer Name");
        JsonObject.Add('InvoiceDate', Format(PostedSalesHeader."Posting Date"));
        JsonObject.Add('TotalAmount', PostedSalesHeader."Amount Including VAT");

        PSalesLine.SetRange("Document No.", PostedSalesHeader."No.");
        if PSalesLine.FindSet() then begin
            repeat
                Clear(LineObject); // Reset the object before reuse
                LineObject.Add('Item', PSalesLine.Description);
                LineObject.Add('Quantity', PSalesLine.Quantity);
                LineObject.Add('UnitPrice', PSalesLine."Unit Price");
                LineObject.Add('LineTotal', PSalesLine."Line Amount");
                JsonLines.Add(LineObject);
            until PSalesLine.Next() = 0;
        end;

        JsonObject.Add('InvoiceLines', JsonLines);

        JsonObject.WriteTo(JsonText);
        exit(JsonText);
    end;

    procedure BuildPostedSalesCrMemoJson(PostedSalesCrMemoHeader: Record "Sales Cr.Memo Header"): Text
    var
        JsonText: Text;
        JsonObject: JsonObject;
        JsonLines: JsonArray;
        PSalesCrMemoLine: Record "Sales Cr.Memo Line";
        LineObject: JsonObject; // Declare outside the loop
    begin
        JsonObject.Add('CreditMemoNo', PostedSalesCrMemoHeader."No.");
        JsonObject.Add('CustomerName', PostedSalesCrMemoHeader."Sell-to Customer Name");
        JsonObject.Add('CreditMemoDate', Format(PostedSalesCrMemoHeader."Posting Date"));
        JsonObject.Add('TotalAmount', PostedSalesCrMemoHeader."Amount Including VAT");

        PSalesCrMemoLine.SetRange("Document No.", PostedSalesCrMemoHeader."No.");
        if PSalesCrMemoLine.FindSet() then begin
            repeat
                Clear(LineObject); // Reset the object before reuse
                LineObject.Add('Item', PSalesCrMemoLine.Description);
                LineObject.Add('Quantity', PSalesCrMemoLine.Quantity);
                LineObject.Add('UnitPrice', PSalesCrMemoLine."Unit Price");
                LineObject.Add('LineTotal', PSalesCrMemoLine."Line Amount");
                JsonLines.Add(LineObject);
            until PSalesCrMemoLine.Next() = 0;
        end;

        JsonObject.Add('CreditMemoLines', JsonLines);

        JsonObject.WriteTo(JsonText);
        exit(JsonText);
    end;

}
