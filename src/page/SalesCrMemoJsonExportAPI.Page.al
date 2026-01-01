page 50803 "Sales Cr.Memo JSON Export API"
{
    PageType = API;
    APIPublisher = 'ASL';
    APIGroup = 'export';
    APIVersion = 'v1.0';
    EntityName = 'salesCrMemoJson';
    EntitySetName = 'salesCrMemosJson';
    SourceTable = "Sales Cr.Memo Header";
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
        JsonText := JsonBuilder.BuildPostedSalesCrMemoJson(Rec);
    end;
}