table 50000 "ASL Payroll Setup"
{
    Caption = 'ASL Payroll Setup';
    fields
    {
        field(1; "Loan Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(2; "Employee Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(3; "Overtime Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
        }
        field(4; "OT Rate Ordinary Jnr"; Decimal)
        {
            BlankZero = true;
        }
        field(5; "OT Rate Special Jnr"; Decimal)
        {
            BlankZero = true;
        }
        field(6; "OT Rate Ordinary Grd3"; Decimal)
        {
            BlankZero = true;
        }
        field(7; "OT Rate Special Grd3"; Decimal)
        {
            BlankZero = true;
        }
        field(8; "OT Rate Ordinary Grd2"; Decimal)
        {
            BlankZero = true;
        }
        field(9; "OT Rate Special Grd2"; Decimal)
        {
            BlankZero = true;
        }
        field(10; "OT ED Ordinary Jnr"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(11; "OT ED Special Jnr"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(12; "OT ED Ordinary Grd3"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(13; "OT ED Special Grd3"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(14; "OT ED Ordinary Grd2"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(15; "OT ED Special Grd2"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(16; "Staff Loans Control Account"; Code[10])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(17; "Taxfree Pay ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(18; "Night Shift ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(19; "Day Shift ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(20; "Night Shift Rate"; Decimal)
        {
            BlankZero = true;
        }
        field(21; "Day Shift Rate"; Decimal)
        {
            BlankZero = true;
        }
        field(22; "Lost Hours ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(23; "Lost Hours Rate"; Decimal)
        {
            BlankZero = true;
        }
        field(24; "Commission ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(25; "Monthly Working Days"; Integer)
        {
            trigger OnValidate()
            begin
                "Total Monthly Hours" := "Monthly Working Days" * "Daily Working Hours";
            end;
        }
        field(26; "Productivity Bonus"; Decimal)
        {
        }
        field(27; "Productivity Bonus ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(28; "Daily Working Hours"; Integer)
        {
           trigger OnValidate()
            begin
                "Total Monthly Hours" := "Monthly Working Days" * "Daily Working Hours";
            end; 
        }
        field(29; "Total Taxable ED"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes."."E/D Code";
        }
        field(30; "Staff Loans Interest Account"; Code[10])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(31; "MD ID"; Code[10])
        {
            TableRelation = User;
        }
        field(32; "Accountant 1"; Code[10])
        {
            TableRelation = User;
        }
        field(33; "Accountant 2"; Code[10])
        {
            TableRelation = User;
        }
        field(34; "Accountant 3"; Code[10])
        {
            TableRelation = User;
        }
        field(35; "HR Officer"; Code[10])
        {
            Description = 'To be able to modify the Staff Grade and Scale at the end of the year';
            TableRelation = User;
        }
        field(36; "Allow HR Edit on"; Date)
        {
            Description = 'Date on which Grade and Scale can be edited';
        }
        field(40; "Total Monthly Hours"; Decimal)
        {
            Editable = false;
        }
        field(50000; "Basic+Hous+Transp"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";
        }
        field(50001; "NSITF(Employee)"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";
        }
        field(50002; "NSITF(Employer)"; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";
        }
        field(50003; Seniority; Code[10])
        {
            TableRelation = "Payroll-E/D Codes.";
        }
    }

    keys
    {
        key(Key1; "Loan Nos.")
        {
            Clustered = true;
        }
        key(Key2; "Employee Nos.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        GenSetup.Get();
        if UserId <> GenSetup.Administrator then Error(Text001);
    end;

    var
        Text001: Label 'You are not permitted to modify the set up;';
        GenSetup: Record "General Ledger Setup";
}
