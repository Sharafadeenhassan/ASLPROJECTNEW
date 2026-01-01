page 50142 "Sales Invoice JSON API"
{
    PageType = API;
    SourceTable = "Sales Header";
    DelayedInsert = true;
    APIPublisher = 'AtlanticShrimpersLtd';
    APIGroup = 'invoicing';
    APIVersion = 'v1.0';
    EntityName = 'invoicejson';
    EntitySetName = 'invoicejsons';
    UsageCategory = Administration;


    layout
    {
        area(content)
        {
            field(InvoiceJson; GetInvoiceJson())
            {
                ApplicationArea = All;
            }
        }
    }

    procedure GetInvoiceJson(): Text
    var
        JsonBuilder: Codeunit "Sales Invoice JSON Builder";
    begin
        exit(JsonBuilder.BuildSalesInvoiceJson(Rec));
    end;
}

