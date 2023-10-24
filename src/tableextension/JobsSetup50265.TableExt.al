tableextension 50265 "tableextension50265" extends "Jobs Setup"
{
    fields
    {
        field(50300; "Catch Nos."; Code[10])
        {
            Caption = 'Job Nos.';
            TableRelation = "No. Series";
        }
        field(50301; "Crew Share Percentage"; Decimal)
        {
        }
        field(50302; "Standard Sea Days"; Integer)
        {
        }
        field(50310; "Incentive Rate Code"; Code[10])
        {
            TableRelation = "Payroll-Lookup Header.";
        }
        field(50311; "Posting group"; Code[20])
        {
            TableRelation = "Job Posting Group";
        }
        field(50320; "Export Prouct Code"; Code[10])
        {
        }
        field(50329; Picture; BLOB)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(50330; "Dry Docking"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50331; "Fixed Salary Rate"; Decimal)
        {
            Description = 'Non Incentive: Salaries in cycle days multiplied with a daily salary in Naira';
        }
        field(50332; "Travelling Expenses Rate"; Decimal)
        {
            Description = 'Expatriate: Fixed rate per date';
        }
        field(50333; "License Fee Rate"; Decimal)
        {
        }
        field(50334; Clearing_Fwrd_NPA; Decimal)
        {
        }
        field(50335; "Shore Overheads"; Decimal)
        {
        }
        field(50336; "AGO Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50337; "AGO Posting Code"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
        }
        field(50338; "LUB.  Posting Code"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
        }
        field(50340; "Job Val Begin Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50341; "Job Val End Account"; Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(50502; "Default Price Group Code"; Code[10])
        {
            Description = 'P & L Reports Price to be Used when price not found in the price list';
            TableRelation = "Customer Price Group";
        }
        field(50532; "Fishing Day (Manual)"; Decimal)
        {
            CalcFormula = Sum(Job."Fishing Day (Manual)" WHERE("Ending Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
            Editable = false;
        }
        field(50533; "Lost At Sea (Manual)"; Decimal)
        {
            CalcFormula = Sum(Job."Lost At Sea (Manual)" WHERE("Ending Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
            Editable = false;
        }
        field(50534; "Port Day (Manual)"; Decimal)
        {
            CalcFormula = Sum(Job."Port Day (Manual)" WHERE("Ending Date" = FIELD("Date Filter")));
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
            Editable = false;
        }
        field(50910; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }
}
