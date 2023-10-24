tableextension 50232 "Job Ledger Entry Ext" extends "Job Ledger Entry"
{
    fields
    {
        //Unsupported feature: Code Insertion on ""No."(Field 7)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        if Type = Type::Resource then
          Res.Get("No.");
          Description := Res.Name;
        */
        //end;
        field(50000; "Inventory Posting Group"; Code[10])
        {
            TableRelation = "Inventory Posting Group".Code;
        }
        field(50026; "Old External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(50301; "Marked Rec"; Boolean)
        {
            Description = 'For Voyage P&L Reporting Marked current entrie to be reported, cleared at the end of D Rep.';
        }
        field(50309; "Allocation %"; Decimal)
        {
            Caption = 'Allocation %';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                /*
                "Allocation Quantity" := 0;
                IF "Allocation %" = 0 THEN
                  Amount := 0;
                UpdateAllocations(GenJnlLine);
                */
            end;
        }
        field(50314; "Ending Date"; Date)
        {
            Caption = 'Ending Date';

            trigger OnValidate()
            begin

                case Type of
                    Type::Resource:

                        Validate(Quantity);
                // ("Ending Date" - "Starting Date"));
                end;
            end;
        }
        field(50315; "Resource Group"; Code[20])
        {
        }
        field(50318; "Ended Voyage"; Boolean)
        {
        }
        field(50321; ROB; Decimal)
        {
        }
        field(50324; "Catch Sea Days"; Decimal)
        {
            Description = 'Total sea day on a day that there is a catch';
        }
        field(50325; GroupSort; Code[15])
        {
            Description = 'Voyage P&L Reporting';
        }
        field(50351; "ROB By"; Code[10])
        {
            Editable = false;
            TableRelation = User;
        }
        field(50352; "Phase Code"; Code[10])
        {
        }
        field(50353; "Task Code"; Code[10])
        {
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionCaption = ' ,Short Voyage ';
            OptionMembers = " ","Short Voyage ";
        }
    }

    keys
    {
        key(ASLKey2; "Job No.", "Location Code", "Work Type Code") { Enabled = true; }
        key(ASLKey3; "Job No.", "Location Code") { Enabled = true; }
        key(ASLKey3a; GroupSort) { enabled = true; }
        key(ASLKey4; "External Document No.", "Job Posting Group", "Location Code", "Posting Date")
        {
             enabled = true; 
             SumIndexFields = Quantity; 
             }
        key(ASLKey5; "Job Posting Group") { }
        key(ASLKey6; Type, "No.", "Location Code", "Posting Date") { Enabled = true; }
        key(ASLKey7; "Catch Sea Days") { }
        Key(ASLKey9; GroupSort, "Inventory posting Group")
        {
            Enabled = true;
        }
        key(Key10; "Location Code", "Posting Date", "Source code", "Reason Code")
        {
        }
        // key(ASLKey1; "Job No.", "Location Code", "Posting Date", "Journal Batch Name", Type, "Gen. Prod. Posting Group", "Task Code");
        //   {SumIndexFields = "Total Price"; }
        // key(ASLKey3; "Job No.", "Location Code", GroupSort) {}
        // key(ASLKey4; GroupSort, "Location Code", "Posting Date", "External Document No.")
        //   {SumIndexFields = Quantity;}
        // key(ASLKey5; "Inventory Posting Group", "Location Code", "Posting Date", "External Document No.")
        //   {SumIndexFields = Quantity;}
    }
}