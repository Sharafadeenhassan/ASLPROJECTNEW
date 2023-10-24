tableextension 50288 "tableextension50288" extends "Employee Absence"
{
    fields
    {
        //Unsupported feature: Code Modification on ""Employee No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Employee.Get("Employee No.");
        if Employee."Privacy Blocked" then
          Error(BlockedErr);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        Employee.Get("Employee No.");
        "Employee Contract code":= Employee."Empl Contr Uni Code";
        if Employee."Privacy Blocked" then
          Error(BlockedErr);
        */
        //end;

        //Unsupported feature: Code Insertion on ""From Date"(Field 3)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*

        "To Date":="From Date";
        if ("From Date"<="To Date") then Quantity:=("To Date"-"From Date")+1
        else
        Error('From Date should not be later than To Date');
        */
        //end;

        //Unsupported feature: Code Insertion on ""To Date"(Field 4)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*

        if ("From Date"<="To Date") then Quantity:=("To Date"-"From Date")+1
        else
        Error('From Date should not be later than To Date');
        */
        //end;

        //Unsupported feature: Code Modification on ""Cause of Absence Code"(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CauseOfAbsence.Get("Cause of Absence Code");
        Description := CauseOfAbsence.Description;
        Validate("Unit of Measure Code",CauseOfAbsence."Unit of Measure Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        "Deduct from Payroll":=CauseOfAbsence.Deductible;
        */
        //end;
        field(50000; "Region Code"; Code[10])
        {
        }
        field(50001; "Deduct from Payroll"; Boolean)
        {
            trigger OnValidate()
            begin
                //fieldval := FORMAT((FIELDNO("Deduct from Payroll")));
                //Autority(fieldval);
            end;
        }
        field(50002; "Employee Contract code"; Code[30])
        {
        }
    }

    procedure CheckMod()
    var
        GenSetUp: Record "General Ledger Setup";
        payPrd: Record "Payroll-Periods.";
        Text001: Label 'You are not permitted to modify the record';
        Text002: Label 'Record not found';
        PayrsetUp: Record "ASL Payroll Setup";
        Text003: Label 'You cannot edit date prior to %1';
    begin
        GenSetUp.Get();
        PayrsetUp.Get('LOAN');
        payPrd.SetRange(payPrd.Closed, true);
        if not payPrd.Find('+') then Error(Text002);
        if (UserId <> GenSetUp.Administrator) and (UserId <> PayrsetUp."HR Officer") then Error(Text001);
        if (UserId <> GenSetUp.Administrator) and ("From Date" < payPrd."Start Date") then Error(Text003, payPrd."Start Date");
    end;
}
