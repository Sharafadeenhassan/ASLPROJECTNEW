table 50033 "Sea Food categories"
{
    LookupPageID = "Sea Food Categories list";
    DrillDownPageId = "Sea Food Categories List";
    Caption = 'Sea Food categories';
    fields
    {
        field(1; "Sea food code"; Code[15])
        {
        }
        field(2; "Sea food Description"; Text[30])
        {
        }
        field(3; "Entry code"; Code[10])
        {
        }
        field(4; "Landed Value"; Decimal)
        {
        }
        field(5; "Do not show"; Boolean)
        {
        }
        field(6; Export; Boolean)
        {
        }
        field(7; "Inventory."; Decimal)
        {
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE(GroupSort = FIELD("Sea food code"),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Inventory 1"; Decimal)
        {
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE(GroupSort = FIELD("Sea food code"),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Posting Date" = FIELD("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Inventory 2"; Decimal)
        {
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE(GroupSort = FIELD("Sea food code"),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Posting Date" = FIELD("Date Filter"),
                                                                  "External Document No." = FILTER('')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(10; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(11; "Location Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Location.Code;
        }
        field(12; "Source Filter"; Code[10])
        {
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Sea food code")
        {
            Clustered = true;
        }
        key(Key2; Export)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Dropdown; "Sea food code", "Sea food Description") { }
        fieldgroup(bricks; "Sea food code", "Sea food Description", "Inventory.", "Inventory 1", "Inventory 2") { }
    }
}
