page 50802 "Sales Invoice JSON Export API"
{
    PageType = API;
    APIPublisher = 'ASL';
    APIGroup = 'export';
    APIVersion = 'v1.0';
    EntityName = 'salesInvoiceJson';
    EntitySetName = 'salesInvoicesJson';
    SourceTable = "Sales Invoice Header";
    DelayedInsert = true;
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            field(no; Rec."No.")
            {
                ApplicationArea = All;
            }
            field(jsonText; JsonText)
            {
                ApplicationArea = All;
                Caption = 'JSON Text';
            }
        }
    }

    var
        JsonText: Text;

    trigger OnAfterGetRecord()
    var
        JsonBuilder: Codeunit "Sales Invoice JSON Builder";
    begin
        JsonText := JsonBuilder.BuildPostedSalesInvoiceJson(Rec);
    end;
}