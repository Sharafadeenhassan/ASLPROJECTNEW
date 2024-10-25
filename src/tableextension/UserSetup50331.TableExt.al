tableextension 50331 "tableextension50331" extends "User Setup"
{
    //
    // UNL-ASL3.60.01.009 (Santus) June 14, 2005
    // -> added new field "Pick Blocked Empl in Journal";
    fields
    {
        field(50000; "Store Req 1st Approval"; Boolean)
        {
        }
        field(50001; "Store Req Final Approval"; Boolean)
        {
        }
        field(50029; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50317; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50330; Category; Option)
        {
            Description = 'Categories for the Departments filter for View windows';
            OptionMembers = " ",Export,"Local",Consumption;
        }
        field(50331; "Create Loan"; Boolean)
        {
        }
        field(50332; "Unblock Employee"; Boolean)
        {
        }
        field(50333; "Periodic Activits/SetUp Access"; Boolean)
        {
            Description = 'Periodic Activities / Set Up Access';
        }
        field(50334; "Pick Blocked Empl in Journal"; Boolean)
        {
        }
        field(50335; "Job Catch"; Boolean)
        {
        }
        field(50336; "Confirm StockOutWarning"; Boolean)
        {
        }
        field(50337; "Edit Resource"; Boolean)
        {
        }
        field(50338; "JrnllineShowCRM-ASL"; Boolean)
        {
        }
        field(50339; "Sales Price"; Boolean)
        {
        }
        field(50340; "Print DN"; Boolean)
        {
            Description = 'Print Deleivery Note';
        }
        field(50341; "Reprint DN"; Boolean)
        {
            Description = 'Reprint Delivery Note';
        }
        field(50342; "Return Release To Open"; Boolean)
        {
            Description = 'Change Sales Status Back to Open';
        }
        field(50343; "Print MR"; Boolean)
        {
            Description = 'Print Store Material Requisition';
        }
        field(50344; "Reprint MR"; Boolean)
        {
            Description = 'Reprint Store Material Requisition';
        }
        field(50345; "Modify Item"; Boolean)
        {
        }
        field(50346; "Modify Customer"; Boolean)
        {
        }
        field(50347; "Modify Vendor"; Boolean)
        {
        }
        field(50348; "Modify Other Master Records"; Boolean)
        {
        }
        field(50349; "Use Item Journal"; Boolean)
        {
        }
        field(50350; "Fish Stk Req F.Approval"; Boolean)
        {
        }
        field(50351; "Allow Non FT Product"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Allow Non FT Product" = true then
                "Allow FT Product" := false;
            end;
        }
        field(50352;"Allow FT Product";Boolean)
        { 
            trigger OnValidate()
            begin
                if "Allow FT Product" = true then
                "Allow Non FT Product" := false;
            end;
        }
        field(50353;"FS Cashier";Boolean)
        {
            Description = 'Fish Shop Cashier/ Manager';

        }
        field(50534;"FS Suspend Sale";Boolean)
        {
            Description = 'This person will be able to suspend a Fish Shop Sales';
            trigger OnValidate()
            begin
                TestField("FS Cashier",true);
            end;
        }
        field(50535;"FS Cancel Sales";Boolean)
        {
            Description = 'This person will be able to cancel FS Sales';
            trigger OnValidate()
            begin
                TestField("FS Cashier",true);
            end;
        }
        field(50536;"Fish Shop Code";Code[20])
        {
            Description = 'Attached Fish Shop Code';
            TableRelation = "Shop Setup"."Shop Code";
            trigger OnValidate()
            begin
                TestField("FS Cashier",true);
            end;
        }
        field(50537;"Fish Shop Terminal";Code[20])
        {
            Description = 'Attached Fish Shop Terminal';
            TableRelation = "Shop Setup"."Terminal No." where("Shop Code"= field("Fish Shop Code"));
            trigger OnValidate()
            begin
                TestField("FS Cashier",true);                
            end;
        }
        field(50538;"Allow DPS Store Process";Boolean)
        {
        }
        field(50539;"Allow DPS Security Check";Boolean)
        {}
        field(50540;"StoreKeeper";Boolean)
        {}
        field(50541;"Allowed DPS QC Check";Boolean)
        {}
    }
}
