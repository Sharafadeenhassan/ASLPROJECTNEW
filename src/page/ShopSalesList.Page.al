page 50090 "Shop Sales List"
{
    ApplicationArea = All;
    Caption = ' Fish Shop Sales List';
    PageType = List;
    SourceTable = ShopHeader;
    UsageCategory = Lists;
    CardPageId = 50088;
    DeleteAllowed = false;
    ModifyAllowed = false;
    Editable = false;
    SourceTableView = order(descending);
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Editable = false;
                field("Shop Code"; Rec."Shop Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shop Code field.', Comment = '%';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice/Receipt No. field.', Comment = '%';
                }
                field("Posting date"; Rec."Posting date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting date field.', Comment = '%';
                }
                field("Cashier Code"; Rec."Cashier Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cashier Code field.', Comment = '%';
                }
                field("Invoice Total"; Rec."Invoice Total")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice Total field.', Comment = '%';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount Amount field.', Comment = '%';
                }
                field("Amount Due"; Rec."Amount Due")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Due field.', Comment = '%';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount Paid field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field(PayMode; Rec.PayMode)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PayMode field.', Comment = '%';
                }
                field("General Device"; Rec."General Device")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the General Device field.', Comment = '%';
                }
                field("Cash Pay"; Rec."Cash Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Pay field.', Comment = '%';
                    Visible = false;
                     Importance = Additional;
                    
                }
                field("Cash Device"; Rec."Cash Device")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Device field.', Comment = '%';
                     Visible = false;
                     Importance = Additional;
                }
                field("Transfer Pay"; Rec."Transfer Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Pay field.', Comment = '%';
                     Visible = false;
                     Importance = Additional;
                }
                field("Transfer Device"; Rec."Transfer Device")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transfer Device field.', Comment = '%';
                     Visible = false;
                     Importance = Additional;
                }
                field("Value card"; Rec."Value card")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value card field.', Comment = '%';
                    Visible = false;
                     Importance = Additional;
                }
                field("Value device"; Rec."Value device")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value device field.', Comment = '%';
                    Visible = false;
                    Importance = Additional;
                }
                field("Cash Change"; Rec."Cash Change")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Change field.', Comment = '%';
                    Visible = false;
                    Importance = Additional;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                    Visible = false;
                    Importance = Additional;
                }
                field(Paid;Paid)
                {
                    Caption = 'Paid Invoice';
                    ToolTip = 'This Invoice is fully Settled';
                    Visible = false;
                    Importance = Additional;
                }
                field(Post;Post)
                {
                    Caption = 'Posted Invoice';
                    ToolTip = 'This invoice is Paid and Posted';
                    Visible = false;
                    Importance = Additional;
                }
                field(Suspended;Suspended)
                {
                    Visible = false;
                    Importance = Additional;
                }
                field("Suspended By";"Suspended By")
                {
                    Visible = false;
                     Importance = Additional;
                }
                field(Cancelled;Cancelled)
                {
                    Visible = false;
                     Importance = Additional;
                }
                field("Cancelled By";rec."Cancelled By")
                {
                    Visible = false;
                     Importance = Additional;
                }
                field("Cancelled Date";rec."Cancelled Date")
                {
                    Visible = false;
                     Importance = Additional;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
          action("Update Post")
          {
            ApplicationArea = All;
            trigger OnAction()
            var SaleRec : Record ShopHeader;
            begin
                SaleRec.SetFilter(SaleRec.Post,'%1',false);
                SaleRec.SetFilter(SaleRec."Customer No.",'<>%1', '');
                if SaleRec.FindFirst() then                
                repeat
                SaleRec.CalcFields("Invoice Total");
                if SaleRec."Invoice Total" <> 0 then
                SaleRec.UpdatePostedIncomplete();
                until SaleRec.Next = 0;                
            end;
          }  
          }  
        }
        
    var
    userRec : Record "User Setup";
    DefShop : Code[20];
    DefTer : Code[20];
    
    trigger OnOpenPage()
    begin
        if userRec.Get(UserId) then begin
        userRec.TestField("FS Cashier",true); 
        rec.SetRange("Shop Code",userRec."Fish Shop Code");
        rec.SetRange("Terminal No.",userRec."Fish Shop Terminal");
        rec.SetRange("Cashier Code",UserId);
        //if rec.Find() then begin
        rec.FilterGroup(1);
        DefShop := userRec."Fish Shop Code";
        DefTer := userRec."Fish Shop Terminal";        
       // end;
        end; //else Error('User Not found Meet Administrator to Register You For FishShop Activities');
    end;
    

    
}