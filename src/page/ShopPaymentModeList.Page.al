page 50113 "Shop Payment Mode List"
{
    ApplicationArea = All;
    Caption = 'Fish Shop Payment Mode List';
    PageType = List;
    SourceTable = "Shop Payment Mode";
    UsageCategory = Administration;
    ShowFilter = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Fish Shop Code";rec."Fish Shop Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the  Associated Fish Shop for Each of of the Devise this will enable correct Account to be picking',Comment = '%';
                }
                field("Payment Mode";rec."Payment Mode")
                {
                    Caption = 'PayMode';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the Associated PayMode field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Type field.', Comment = '%';
                }
                field("Account Code"; Rec."Account Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account Code field.', Comment = '%';
                }
                field("Total Sales";rec."Total Sales")
                {
                    ApplicationArea = all;
                    Visible = false;                    
                }
                field("Total Payment";rec."Total Payment")
                {
                    ApplicationArea = all;
                    Visible = false;
                }

            }
            
        }
    }
    actions
    {
        area(processing)
        {
                      action("Print Fish Shop Collection Report")
            {
                Image = Print;
                Promoted = true;
                ApplicationArea = All;
                Caption = 'Print Fish Shop Collection Report';
                RunObject = report "Shop Sales By Device/Location";

                trigger OnAction()
                var ShopPay: Record "Shop Payment Mode";
                ShopPayRep : Report "Shop Sales By Device/Location";
                UserRec : Record "User Setup";

                begin
                    UserRec.get(UserId);
                    ShopPay.SetRange(ShopPay."Fish Shop Code",UserRec."Fish Shop Code");
                    ShopPayRep.SetTableView(ShopPay);
                    //ShopPayRep.RunRequestPage("Fish Shop Code");
                    ShopPayRep.Print(rec."Fish Shop Code");

                end;
                              
            } 
            
        }
    }
}
