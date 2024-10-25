page 50114 "Shop Management Menu"
{
    Caption = 'Shop Management Menu';
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    layout
    {
        area("RoleCenter")
        {
            group(Control22)
            {
                ShowCaption = false;
                part(Inventory; "Inventory Performance")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                part(Cashier; "Bookkeeper Activities")
                {
                    ApplicationArea = All;
                }
                part(Control19; "My Customers")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(Sales)
            {
                action("Fish Shop Sales")
                {
                    Caption = 'Fish Shop Sales';
                    ApplicationArea = All;
                    RunObject = page "Shop Sales List";
                    RunPageView = where(Post = const(false));
                }
                action("Posted Sales")
                {
                    Caption = 'Posted Fish Shop Sales';
                    ApplicationArea = All;
                    RunObject = page "Shop Sales List";
                    RunPageView = where(post = const(True), Suspended = const(false));
                    RunPageMode = View;
                }
                action("Suspended Sales")
                {
                    Caption = 'Suspended Sales';
                    ApplicationArea = All;
                    RunObject = page "Shop Sales List";
                    RunPageView = where(Suspended = const(true), Cancelled = const(false));
                    RunPageMode = Edit;
                }
                action("Cancelled Sales")
                {
                    Caption = 'Reversed Sales';
                    ApplicationArea = All;
                    RunObject = page "Shop Sales List";
                    RunPageView = where(Suspended = const(true), Cancelled = const(true));
                }
                action("Print Daily Collection")
                {
                    Image = Print;                    
                    ApplicationArea = All;                    
                    RunObject = report "Shop Sales By Device/Location";
                    
                }
                action("Print Sales and Collection")
                {
                  Image = Sales;                    
                    ApplicationArea = All;                    
                    RunObject = report "Shop Sales and Collection";  
                }
            }
            group(SetUp)
            {
                action("Fish Shop Setup")
                {
                    Caption = 'Fish Shop Setup';
                    ApplicationArea = All;
                    RunObject = page "Shop Cashier Setup";
                }
                action("Fish Shop Payment Mode")
                {
                    Caption = 'Fish Shop Payments';
                    ApplicationArea = All;
                    RunObject = page "Shop Payment Mode List";
                }
                action("Sea Food Categories")
                {
                    Caption= 'Sea Food Register';
                    Image = PrintForm;                    
                    ApplicationArea = All;                    
                    RunObject = page "Sea Food Categories List";
                }
            }
        }

    }

}


