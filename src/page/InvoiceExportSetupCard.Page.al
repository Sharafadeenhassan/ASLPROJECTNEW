page 50143 "Invoice Export Setup Card"
{
    Caption = 'Invoice Export Setup Card';
    PageType = Card;
    SourceTable = "Invoice Export Setup";
    UsageCategory = Administration;
    ApplicationArea = All;
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("API Key"; rec."Primary Key")
                { ApplicationArea = All; }
              field("API URL"; rec."API URL") 
              { ApplicationArea = All; }
                field("Test URL"; rec."Test API URL") 
                { ApplicationArea = All; }
              field("Environment"; rec."Environment") 
              { ApplicationArea = All; }


            
            }
        }
    }
}
