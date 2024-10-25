page 50124 "DPS SubPage Part"
{
    PageType = CardPart;
    RefreshOnActivate = true;
    SourceTable = "Dynamics Procurement Register";
    Caption = 'DPS SubPage Part';
    
    layout
    {
        area(content)
        {
            group("Item History")
            {
                field("Item No.";rec."Item No.")
                {
                    Editable = false;
                }
                field("Available Quantity"; Rec."Available Quantity")
                {
                    ApplicationArea = All;
                }
                field("Pending Quantity"; Rec."Pending Quantity")
                {
                    ApplicationArea = All;
                }
                field("Pending Requisition"; Rec."Pending Requisition")
                {
                    ApplicationArea = All;
                }
            }
            group("Monthly Averages Consumption")
            {
                //Visible = false;
                field("Ave. 3 Month Consumption"; Rec."Ave. 3 Month Consumption")
                {
                    Caption = 'Ave. 3 Month';
                    ApplicationArea = All;
                }
                field("Ave. 6 Month Consumption"; Rec."Ave. 6 Month Consumption")
                {
                    Caption = 'Ave. 6 Month';
                    ApplicationArea = All;
                }
                field("Ave. One Year Consumption"; Rec."Ave. One Year Consumption")
                {
                    Caption = 'Ave. 1 Year';
                    ApplicationArea = All;
                }
                field("Last 2 Years Monthly Average"; Rec."Last 2 Years Monthly Average")
                {
                    Caption = 'Ave. 2 Years';
                    ApplicationArea = All;
                }
                field("Last 3 Years Monthly Average"; Rec."Last 3 Years Monthly Average")
                {
                    Caption = 'Ave. 3 Years';
                    ApplicationArea = All;
                }
                field("Last 4 Years Monthly Average"; Rec."Last 4 Years Monthly Average")
                {
                    Caption = 'Ave. 4 Years';
                    ApplicationArea = All;
                }
                field("Last 5 Years Monthly Average"; Rec."Last 5 Years Monthly Average")
                {
                    Caption = 'Ave. 5 Years';
                    ApplicationArea = All;
                }
            }          
            group("Consumption Pattern")
            {
                
                field("Last Month Consumption"; Rec."Last Month Consumption")
                {
                    Caption = 'Last Month';
                    ApplicationArea = All;
                    
                }
                field("Last 3 Months Consumption"; Rec."Last 3 Months Consumption")
                {
                    Caption = '3 Months';
                    ApplicationArea = All;
                }
                field("Last 6 Month Consumption"; Rec."Last 6 Month Consumption")
                {
                    Caption = '6 Months';
                    ApplicationArea = All;
                }
                field("Last One Year Consumption"; Rec."Last One Year Consumption")
                {
                    Caption = '1 Year';
                    ApplicationArea = All;
                }
                field("Last 2 Years Consumption"; Rec."Last 2 Years Consumption")
                {
                    Caption = '2 Years';
                    ApplicationArea = All;
                }
                field("Last 3 Years Consumption"; Rec."Last 3 Years Consumption")
                {
                    Caption = '3 Years';
                    ApplicationArea = All;
                }
                field("Last 4 Years Consumption"; Rec."Last 4 Years Consumption")
                {
                    Caption = '4 Years';
                    ApplicationArea = All;
                }
                field("Last 5 Years Consumption"; Rec."Last 5 Years Consumption")
                {
                    Caption = '5 Years';
                    ApplicationArea = All;
                }
            }
            
        }
    }
}
