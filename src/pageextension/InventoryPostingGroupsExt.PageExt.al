pageextension 50207 "Inventory Posting Groups Ext" extends "Inventory Posting Groups"
{
    //Unsupported feature: Property Insertion (SourceTableView) on ""Inventory Posting Groups"(Page 112)".

    layout
    {
        //***modify(Control1900000007)
        // {
        //    Visible = false;
        // }
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
        //     field(Inventory; Inventory)
        //     {
        //         Visible = false;
        //         Importance = Additional;
        //         ApplicationArea = All;
        //     }
        //     field("Location Filter"; "Location Filter")
        //     {
        //         ApplicationArea = All;
        //     }
             field("Statistics Group"; "Statistics Group")
             {
                 Visible = false;
                 ApplicationArea = All;
             }
        //     field("Date Filter"; "Date Filter")
        //     {
        //         ApplicationArea = All;
        //     }
             field("Group Code"; "Group Code")
             {
                 ApplicationArea = All;
             }
        //     field("Points/KG"; "Points/KG")
        //     {
        //         ApplicationArea = All;
        //     }
             field("In Use"; "In Use")
             {
                 Visible = true;
                 ApplicationArea = All;
             }
        //     field(Points; Points)
        //     {
        //         Visible = true;
        //         ApplicationArea = All;
        //     }
        //     field("Inventory Incentive"; "Inventory Incentive")
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
             field("S/No."; "S/No.")
             {
                 Visible = false;
                 ApplicationArea = All;
             }
        //     field("Catch Budget"; "Catch Budget")
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
            field(Inventory1; Inventory1)
             {
                 Visible = true;
                 ApplicationArea = All;
             }
             field(Inventory2; Inventory2)
             {
               Visible = true;
                ApplicationArea = All;
             }
        //     field("Inventory total2"; "Inventory total2")
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
        //     field("Inventory total4"; "Inventory total4")
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
        //     field(Inventory4; Inventory4)
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
        //     field("Inventory total3"; "Inventory total3")
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
        //     field(Inventory3; Inventory3)
        //     {
        //         Visible = false;
        //         ApplicationArea = All;
        //     }
        // }
    }
    // area(factboxes)
    //  {
    //  }
    // systempart(Control29;Links)
    // {
    //     Visible = false;
    // }
    // systempart(Control28;Notes)
    // {
    //     Visible = false;
    // }
    }
    actions
    {
        addafter("&Setup")
        {
            action("Inventory Posting Group Detail")
            {
                Caption = 'InV. Post. Group Detailes';
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
