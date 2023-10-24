tableextension 50332 "Inventory Posting Group Ext" extends "Inventory Posting Group"
{
    fields
    {
        field(50300; "Group Type"; Option)
        {
            OptionMembers = " ",Operation;
        }
        field(50301; Category; Code[15])
        {
            TableRelation = "Sea Food categories";
            ValidateTableRelation = false;
        }
        field(50302; "Statistics Group"; Integer)
        {
        }
        field(50303; "Group Code"; Code[10])
        {
        }
        field(50304; "Points/KG"; Decimal)
        {
        }
        field(50364; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(50365; "Global Dimension 1 Filter"; Code[20])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50366; "Global Dimension 2 Filter"; Code[20])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Filter';
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50367; "Location Filter"; Code[10])
        {
            Caption = 'Location Filter';
            FieldClass = FlowFilter;
            TableRelation = Location;
        }
        field(50368; Inventory; Decimal)
        {
            Caption = 'Inventory Total';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Job Ledger Entry".Quantity WHERE("Job Posting Group" = FIELD(Code),
                                                                 "Location Code" = FIELD("Location Filter"),
                                                                 "Posting Date" = FIELD("Date Filter"),
                                                                 "External Document No." = FILTER(''),
                                                                 "Reason Code" = FIELD(Reasoncodefilter)));
        }
        field(50369; Points; Decimal)
        {
            Editable = false;
        }
        field(50370; Value; Decimal)
        {
            Editable = false;
        }
        field(50378; Inventory1; Decimal)
        {
            Caption = 'Value Entry Valued Quantity';
            DecimalPlaces = 0 : 5;
            Description = 'Inventory Total Value';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("Value Entry"."Valued Quantity" WHERE("Inventory Posting Group" = FIELD(Code),
                                                                     "Location Code" = FIELD("Location Filter"),
                                                                     "Posting Date" = FIELD("Date Filter")));
        }
        field(50379; Inventory2; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Description = 'Inventory Total Job';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE("Job Posting Group" = FIELD(Code),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Posting Date" = FIELD("Date Filter"),
                                                                  "External Document No." = FILTER(''),
                                                                  "Vessel Type" = CONST(" ")));
        }
        field(50389; "Drop Shipment Filter"; Boolean)
        {
            Caption = 'Drop Shipment Filter';
            FieldClass = FlowFilter;
        }
        field(55423; "Bin Filter"; Code[10])
        {
            Caption = 'Bin Filter';
            FieldClass = FlowFilter;
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Filter"));
        }
        field(55424; "Variant Filter"; Code[10])
        {
            Caption = 'Variant Filter';
            FieldClass = FlowFilter;
            TableRelation = "Item Variant".Code;
        }
        field(55425; "Source Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(55426; "In Use"; Boolean)
        {
        }
        field(55427; "S/No."; Integer)
        {
        }
        field(55428; "Source No. Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = Job;
        }
        field(55429; "Inventory total1"; Decimal)
        {
            Caption = 'Inventory Total Vessel';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE("Location Code" = FILTER(<> 'CRM-ASL' & <> 'FISH-SHOP'),
                                                                  "Posting Date" = FIELD("Date Filter"),
                                                                  GroupSort = FIELD(Category)));
        }
        field(55430; "Inventory total2"; Decimal)
        {
            Caption = 'Inventory Total Fishing Grd';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE("Location Code" = FILTER(<> 'CRM-ASL' & <> 'FISH-SHOP'),
                                                                  "Posting Date" = FIELD("Date Filter"),
                                                                  GroupSort = FIELD(Category),
                                                                  "External Document No." = FILTER('')));
        }
        field(55431; Reasoncodefilter; Code[10])
        {
            Enabled = false;
            FieldClass = FlowFilter;
        }
        field(55432; Inventory3; Decimal)
        {
        }
        field(55433; "Inventory total3"; Decimal)
        {
        }
        field(55450; "Inventory Incentive"; Decimal)
        {
            Caption = 'Inventory Incentive';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE(GroupSort = FIELD(Category),
                                                                  "Location Code" = FIELD("Location Filter"),
                                                                  "Posting Date" = FIELD("Date Filter"),
                                                                  "Source Code" = FIELD("Source Filter"),
                                                                  "Reason Code" = FIELD(Reasoncodefilter)));
        }
        field(55462; Inventory4; Decimal)
        {
        }
        field(55463; "Inventory total4"; Decimal)
        {
        }
        field(55465; "Catch Budget"; Decimal)
        {
            CalcFormula = Sum("Job catch Default"."Budget Quantity" WHERE(Code = FIELD(Code),
                                                                           "Budget Quantity" = FILTER(<> 0)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(55466; "Category 2"; Code[15])
        {
            TableRelation = "Sea Food categories";
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(ASLKey1; "Statistics Group")
        {
        }
        key(Key2; Category)
        {
            enabled = true;
        }
        key(Key3; Category,"Statistics Group","S/No.")
        {
            Enabled = true;
        }
        key(Key4; "S/No.")
        {
        }
        key(Key5; "S/No.", "Statistics Group")
        {
        }
    }

    procedure InventoryTwo(InvtCode: Code[10]; LocFilter: Code[100]; DateFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey("Location Code", "Posting Date", GroupSort, "External Document No.");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        if LocFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Location Code", LocFilter);
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        ValuEntry.SetFilter(ValuEntry."External Document No.", '%1', '');
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;

    procedure InventoryTotal2(InvtCode: Code[10]; DateFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey("Location Code", "Posting Date", GroupSort, "External Document No.");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        ValuEntry.SetFilter(ValuEntry."Location Code", '<>%1&<>%2', 'CRM-ASL', 'FISH-SHOP');
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        ValuEntry.SetFilter(ValuEntry."External Document No.", '%1', '');
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;

    procedure InventoryThree(InvtCode: Code[10]; DateFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey("Location Code", "Posting Date", GroupSort, "External Document No.");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        ValuEntry.SetFilter(ValuEntry."Location Code", 'CRM-ASL');
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;

    procedure InventoryTotal3(InvtCode: Code[10]; DateFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey("Location Code", "Posting Date", GroupSort, "External Document No.");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        ValuEntry.SetFilter(ValuEntry."Location Code", '<>%1', 'CRM-ASL');
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;

    procedure InventoryFour(InvtCode: Code[10]; DateFilter: Text[100]; SourceCodeFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey("Location Code", "Posting Date", GroupSort, "External Document No.");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        ValuEntry.SetFilter(ValuEntry."Location Code", 'CRM-ASL');
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        if SourceCodeFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Source Code", SourceCodeFilter);
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;

    procedure InventoryTotal4(InvtCode: Code[10]; DateFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
        SourceCodeFilter: Text[100];
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey("Location Code", "Posting Date", GroupSort, "External Document No.", "Source Code");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        ValuEntry.SetFilter(ValuEntry."Location Code", 'CRM-ASL');
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        SourceCodeFilter := '<>PHYSINVJNL&<>TRANSFER&<>ITEMJNL&<>SALES&<>PURCHASES&<>PURCHJNL&<>SALESJNL&<>JOBJNL';
        ValuEntry.SetFilter(ValuEntry."Source Code", SourceCodeFilter);
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;

    procedure InvtIncentive(InvtCode: Code[10]; DateFilter: Text[100]; SourceCodeFilter: Text[100]; LocFilter: Text[100]; ReasonCodeFilter: Text[100]; SourceNoFilter: Text[100]): Decimal
    var
        ValuEntry: Record "Job Ledger Entry";
        ValuedQty: Decimal;
    begin
        ValuedQty := 0;
        ValuEntry.SetCurrentKey(GroupSort, "Location Code", "Source Code", "Reason Code");
        ValuEntry.SetFilter(ValuEntry.GroupSort, InvtCode);
        if LocFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Location Code", LocFilter);
        if DateFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Posting Date", DateFilter);
        if SourceCodeFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Source Code", SourceCodeFilter);
        if ReasonCodeFilter <> '' then
            ValuEntry.SetFilter(ValuEntry."Reason Code", ReasonCodeFilter);
        if ValuEntry.FindSet() then begin
            ValuEntry.CalcSums(Quantity);
            exit(ValuEntry.Quantity);
        end else
            exit(0);
    end;
}
