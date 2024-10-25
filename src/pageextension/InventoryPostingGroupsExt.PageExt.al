pageextension 50207 "Inventory Posting Groups Ext" extends "Inventory Posting Groups"
{
    //Unsupported feature: Property Insertion (SourceTableView) on ""Inventory Posting Groups"(Page 112)".

    layout
    {
        //***modify(Control1900000007)
         addafter(Description)
         {
             field("Group Type"; "Group Type")
             {
                 ApplicationArea = All;
             }
             field(Category; Category)
             {
                 ApplicationArea = All;
             }
             field("Category 2"; "Category 2")
             {
                 ApplicationArea = All;
             }
             field("Statistics Group"; "Statistics Group")
             {
                 Visible = false;
                 ApplicationArea = All;
             }
             field("Group Code"; "Group Code")
             {
                 ApplicationArea = All;
             }
             field("In Use"; "In Use")
             {
                 Visible = true;
                 ApplicationArea = All;
             }
             field("S/No."; "S/No.")
             {
                 Visible = false;
                 ApplicationArea = All;
             }
            /*field(Inventory1; Inventory1)
             {
                 Visible = true;
                 ApplicationArea = All;
             }
             field(Inventory2; Inventory2)
             {
               Visible = true;
                ApplicationArea = All;
             }
             */
    }
    }
    actions
    {
        addafter("&Setup")
        {
            action("Inventory Posting Group Detail")
            {
                Caption = 'InV. Post. Group Details';
                ApplicationArea = All;
                RunObject = page "Inventory Posting Group Detail";
                RunPageOnRec = true;
            }
            action("Category List")
            {
                Caption = 'Categories';
                ApplicationArea = All;
                RunObject = page  "Item Category Card";
                RunPageOnRec = true;
            }
        }
    }
}
