table 50006 "Payroll-Payslip Lines."
{
    DrillDownPageID = "Payslip Lines.";
    Caption = 'Payroll-Payslip Lines.';
    fields
    {
        field(1; "Payroll Period"; Code[10])
        {
            Editable = false;
            TableRelation = "Payroll-Periods.";

            trigger OnValidate()
            begin
                GetParam();
            end;
        }
        field(2; "Employee No"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                GetParam();
            end;
        }
        field(3; "E/D Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "Payroll-E/D Codes.";

            trigger OnValidate()
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                if CheckClosed() then
                    Error('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                "E/DFileRec".Get("E/D Code");
                "Payslip Text" := "E/DFileRec"."Payslip Text";

                /* Transfer Units, Rate, Payslip Group ID. and Pos in Payslip Group */
                begin
                    "Payslip Group ID" := "E/DFileRec"."Payslip Group ID";
                    "Pos. In Payslip Grp." := "E/DFileRec"."Pos. In Payslip Grp.";
                    "Payslip appearance" := "E/DFileRec"."Payslip appearance";
                    "Payslip Print Column" := "E/DFileRec"."Payslip Print Column";
                    "Payslip Text" := "E/DFileRec"."Payslip Text";
                    Units := "E/DFileRec".Units;
                    Rate := "E/DFileRec".Rate;
                    "Overline Column" := "E/DFileRec"."Overline Column";
                    "Underline Amount" := "E/DFileRec"."Underline Amount";
                    "Variable Unit" := "E/DFileRec"."Variable Unit";
                    "Monthly Variable" := "E/DFileRec"."Monthly Variable";
                end;

                /* Calculate the amount if neither quantities nor yes flag are required*/
                if (Units = '') and not ("E/DFileRec"."Yes/No Req.?") then begin

                    Amount := CalcAmount("E/DFileRec", Rec, Amount, "E/D Code");
                    if Rec.Amount <> xRec.Amount then begin
                        /* Change the entries that are computed using this new amount */
                        CalcCompute(Rec, Amount, true, "E/D Code");
                        /*BDC*/

                        /* If this new entry contributes to the value of another line
                          then compute that other line's value and insert it appropriately*/
                        CalcFactor1(Rec);

                        /* Go through all the lines and change where necessary */
                        ChangeAllOver(Rec, false);

                        /* Reset the ChangeOthers flag in all lines */
                        ResetChangeFlags(Rec);
                    end
                end;

                /* Transfer from Booking Group Lines */
                EmployeeRec.Get("Employee No");
                if BookGrLinesRec.Get(EmployeeRec."Posting Group", "E/D Code") then begin
                    begin
                        "Debit Account" := BookGrLinesRec."Debit Account No.";
                        "Credit Account" := BookGrLinesRec."Credit Account No.";
                        "Debit Acc. Type" := BookGrLinesRec."Debit Acc. Type";
                        "Credit Acc. Type" := BookGrLinesRec."Credit Acc. Type";
                        /*BDC
                            "Department Code" := BookGrLinesRec.Department;
                            "Project Code" := BookGrLinesRec.Project;
                        */
                    end;
                    /*BDC
                      IF NOT BookGrLinesRec."Transfer Department" THEN
                        "Department Code" := ''
                      ELSE
                      IF "Department Code" = '' THEN
                          "Department Code" := EmployeeRec.Department;

                      IF NOT BookGrLinesRec."Transfer Project" THEN
                        "Project Code" := ''
                      ELSE
                      IF "Project Code" = '' THEN
                        "Project Code" := EmployeeRec.Project;

                      IF BookGrLinesRec."Debit Acc. Type" = 1 THEN
                        IF "Debit Account" = '' THEN
                          IF EmployeeRec."Customer Number" <> '' THEN
                            "Debit Account" := EmployeeRec."Customer Number" ;

                      IF BookGrLinesRec."Credit Acc. Type" = 1 THEN
                        IF "Credit Account" = '' THEN
                          IF EmployeeRec."Customer Number"  <> '' THEN
                            "Credit Account" := EmployeeRec."Customer Number" ;
                    */

                    if BookGrLinesRec."Transfer Department" then
                        "Global Dimension 1 Code" := EmployeeRec."Global Dimension 1 Code";
                    if BookGrLinesRec."Transfer Business Units" then
                        "Global Dimension 2 Code" := EmployeeRec."Global Dimension 2 Code";
                end;
            end;
        }
        field(4; Units; Text[10])
        {
            Editable = false;
        }
        field(5; Rate; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                GetParam();

                /* If Period+Employee has already been closed then stop edit */
                if CheckClosed() then
                    Error('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                if (Units = '') then
                    /* User cannot edit the rate if the E/D code has no units*/
                  Rec.Rate := xRec.Rate
                else begin
                    Amount := Quantity * Rate;

                    /*Check for rounding, Maximum and minimum */
                    "E/DFileRec".Get("E/D Code");
                end
            end;
        }
        field(6; Quantity; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                /* If Period+Employee has already been closed then stop edit */
                if CheckClosed() then
                    Error('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                if (Units = '') then
                    /* User cannot enter quantity if the E/D code has no units*/
                  Rec.Quantity := xRec.Quantity
                else begin
                    Amount := Quantity * Rate;

                    /*Check for rounding, Maximum and minimum */
                    "E/DFileRec".Get("E/D Code");
                    //  Amount := ChkRoundMaxMin ("E/DFileRec", Amount);
                    /////////////
                    GetParam();
                    if ("Variable Unit" = "Variable Unit"::Hours) then
                        Amount := Round((BasicPay * Rate * Quantity) / (HrsInDay * DaysInMonth));

                    if ("Variable Unit" = "Variable Unit"::Days) then
                        Amount := Round((BasicPay * Rate * Quantity) / DaysInMonth);

                    /////////////
                end
            end;
        }
        field(7; Flag; Boolean)
        {
            trigger OnValidate()
            begin
                /* If Period+Employee has already been closed then stop edit */
                if CheckClosed() then
                    Error('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                "E/DFileRec".Get("E/D Code");
                if not ("E/DFileRec"."Yes/No Req.?") then
                    Flag := false
                else
                    Amount := CalcAmount("E/DFileRec", Rec, Amount, "E/D Code");
            end;
        }
        field(8; Amount; Decimal)
        {
            trigger OnValidate()
            begin
                /* If Period+Employee has already been closed then stop edit */
                if CheckClosed() then
                    Error('Entries for Employee %1 for period %2 ' +
                           'have already been closed.', "Employee No", "Payroll Period");

                if "E/D Code" <> '' then "E/DFileRec".Get("E/D Code");
                if not ("E/DFileRec"."Edit Amount?") then
                    Rec.Amount := xRec.Amount
                else
                    /*Check for rounding, Maximum and minimum */
                  Amount := ChkRoundMaxMin("E/DFileRec", Amount);
            end;
        }
        field(9; "Debit Account"; Code[20])
        {
            TableRelation = IF ("Debit Acc. Type" = CONST(Finance)) "G/L Account"
            ELSE
            IF ("Debit Acc. Type" = CONST(Customer)) Customer;

            trigger OnValidate()
            begin
                if "Debit Account" <> '' then
                    case "Debit Acc. Type" of
                        0:
                            FinanceAccRec.Get("Debit Account");
                        1:
                            CustomerAccRec.Get("Debit Account");
                        2:
                            SupplierAccRec.Get("Debit Account");
                    end;
            end;
        }
        field(10; "Credit Account"; Code[20])
        {
            TableRelation = IF ("Credit Acc. Type" = CONST(Finance)) "G/L Account"
            ELSE
            IF ("Credit Acc. Type" = CONST(Customer)) Customer;

            trigger OnValidate()
            begin
                if "Credit Account" <> '' then
                    case "Credit Acc. Type" of
                        0:
                            FinanceAccRec.Get("Credit Account");
                        1:
                            CustomerAccRec.Get("Credit Account");
                        2:
                            SupplierAccRec.Get("Credit Account");
                    end;
            end;
        }
        field(11; "Global Dimension 1 Code"; Code[10])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(12; "Global Dimension 2 Code"; Code[10])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(13; AmountToBook; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
        field(14; "Payslip Group ID"; Option)
        {
            OptionMembers = " ","GROSS PAY","TAXABLE PAY","TAX CHARGED","TAX DEDUCTED","TOTAL DEDUCTIONS","NET PAY DUE";
        }
        field(15; "Pos. In Payslip Grp."; Integer)
        {
        }
        field(16; "Payslip appearance"; Option)
        {
            OptionMembers = "Non-zero & Code","Always & Code","Always & Text","Non-zero & Text","Does not appear",Heading;
        }
        field(17; "Debit Acc. Type"; Option)
        {
            OptionMembers = Finance,Customer,Supplier;
        }
        field(18; "Credit Acc. Type"; Option)
        {
            OptionMembers = Finance,Customer,Supplier;
        }
        field(19; ChangeOthers; Boolean)
        {
            Editable = false;
            InitValue = false;
        }
        field(20; HasBeenChanged; Boolean)
        {
            Editable = false;
            InitValue = false;
        }
        field(21; ChangeCounter; Integer)
        {
            InitValue = 0;
        }
        field(22; "Payslip Column"; Option)
        {
            InitValue = "2";
            OptionMembers = "1","2","3";
        }
        field(23; "S. Report appearance"; Option)
        {
            OptionMembers = "Non-zero & Code","Always & Code","Always & Text","Non-zero & Text","Does not appear",Heading;
        }
        field(24; "Overline Column"; Option)
        {
            InitValue = "None";
            OptionMembers = "None","1","2","3","1-2","2-3","1-3";
        }
        field(25; "Underline Amount"; Option)
        {
            InitValue = "None";
            OptionMembers = "None",Underline,"Double Underline";
        }
        field(26; "Loan ID"; Code[10])
        {
            TableRelation = "Monthly Variables Header.";
        }
        field(27; "Payslip Print Column"; Option)
        {
            OptionMembers = " ",Postive,Negative,"Total Earning","Total Deduction","Net Earning";
        }
        field(28; "Payslip Text"; Text[100])
        {
        }
        field(29; "Variable Unit"; Option)
        {
            Editable = false;
            OptionMembers = " ",Hours,Days;

            trigger OnValidate()
            begin
                if not "Monthly Variable" then "Variable Unit" := 0;
            end;
        }
        field(30; "Monthly Variable"; Boolean)
        {
            Description = 'Added for Overtime';
            Editable = false;
        }
        field(50000; "Postg Group"; Code[10])
        {
            TableRelation = "Payroll-Posting Group Header.";
        }
    }

    keys
    {
        key(Key1; "Payroll Period", "Employee No", "E/D Code")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Payroll Period", "Global Dimension 1 Code", "Global Dimension 2 Code", "Debit Acc. Type", "Debit Account", "Credit Acc. Type", "Credit Account", "Loan ID")
        {
        }
        key(Key3; "Payroll Period", "Employee No", "Payslip Group ID", "Pos. In Payslip Grp.")
        {
        }
        key(Key4; "E/D Code", "Employee No", "Payroll Period")
        {
        }
        key(Key5; "Employee No", "Payroll Period")
        {
        }
        key(Key6; "Payroll Period", "Employee No", "Global Dimension 1 Code", "Global Dimension 2 Code")
        {
        }
        key(Key7; "Global Dimension 2 Code", "Global Dimension 1 Code")
        {
        }
        key(Key8; "Payslip Print Column", "E/D Code")
        {
        }
        key(Key9; "Debit Account", "Credit Account")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        //ProllHeader.GET( "Payroll Period", "Employee No");

        if ProllHeader."Closed?" then
            Error('Entries for Employee %1/ in Period %2/ are closed. ' +
                  'Nothing can be deleted', "Employee No", "Payroll Period");

        /*Go through all the lines and make any appropriate Changes */
        ChangeOthers := false;
        ChangeDueToDelete(Rec);

        /* Set the 'Change' flags to false in all the lines */
        ResetChangeFlags(Rec);
    end;

    trigger OnModify()
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ This trigger is called if any of the fields in "KI03b P.Roll Entry" is     ‚
        ‚ not equal to the corresponding field in "xKI03b P.Roll Entry"              ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        if (Rec.Amount <> xRec.Amount) or ("Loan ID" <> '') or (Rec."Payslip Column" <> 0) then begin
            Mark(true);
            /* If this new entry contributes in computing another, then compute that value
              for that computed entry and insert it appropriately*/
            CalcCompute(Rec, Rec.Amount, false, "E/D Code");
            /*BDC*/

            /* If this new entry is a contributory factor for the value of another line,
              then compute that other line's value and insert it appropriately */
            CalcFactor1(Rec);

            /* The two functions above have used this line to change others */
            ChangeOthers := false;

            /* Go through all the lines and change where necessary */
            ChangeAllOver(Rec, false);

            /* Reset the ChangeOthers flag in all lines */
            /*    ResetChangeFlags (Rec);*/

            /*BDC
               MARK( FALSE);*/
        end;
    end;

    var
        "E/DFileRec": Record "Payroll-E/D Codes.";
        ConstEDFileRec: Record "Payroll-E/D Codes.";
        EDRec2: Record "Payroll-E/D Codes.";
        ProllHeader: Record "Payroll-Payslip Header.";
        ProllRecStore: Record "Payroll-Payslip Lines.";
        ProllFactorRec: Record "Payroll-Payslip Lines.";
        ProllEntryRec: Record "Payroll-Payslip Lines.";
        ChangeOthersRec: Record "Payroll-Payslip Lines.";
        LookHeaderRec: Record "Payroll-Lookup Header.";
        LookLinesRec: Record "Payroll-Lookup Lines.";
        BackOneRec: Integer;
        ReturnAmount: Decimal;
        PrevLookRec: Record "Payroll-Lookup Lines.";
        InputAmount: Decimal;
        ComputedTotal: Decimal;
        AmountToAdd: Decimal;
        FactorRecAmount: Decimal;
        AmtToAdd: Decimal;
        EmployeeRec: Record Employee;
        BookGrLinesRec: Record "Payroll-Posting Group Line.";
        RoundPrec: Decimal;
        RoundDir: Text[1];
        IsComputed: Boolean;
        FinanceAccRec: Record "G/L Account";
        CustomerAccRec: Record Customer;
        SupplierAccRec: Record Vendor;
        MaxChangeCount: Integer;
        PayLines2: Record "Payroll-Payslip Lines.";
        CurYear: Integer;
        PeriodRec: Record "Payroll-Periods.";
        PerStart: Date;
        Per1: Code[10];
        YearStart: Date;
        PaySetup: Record "ASL Payroll Setup";
        HrsInDay: Integer;
        DaysInMonth: Integer;
        BasicPay: Decimal;
        TaxableED: Code[10];
        TaxfreeED: Code[10];
        TaxFreeYTD: Decimal;
        TaxableYTD: Decimal;
        TaxYTD: Decimal;
        AmountToTax: Decimal;
        TaxED: Code[10];
        CurrTaxable: Decimal;
        NewEmpRec: Record Employee;

    procedure GetParam()
    begin
        PaySetup.Reset();
        PaySetup.Find('-');
        DaysInMonth := PaySetup."Monthly Working Days";
        HrsInDay := PaySetup."Daily Working Hours";

        if ("Employee No" <> '') then BasicPay := EmployeeRec.GetBasic("Employee No");
    end;

    procedure CheckClosed(): Boolean
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Return the value of ProllHeader."Closed?" for this Period + Employee       ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/
        ProllHeader.Get("Payroll Period", "Employee No");
        exit(ProllHeader."Closed?");
    end;

    procedure CalcCompute(EntryRecParam: Record "Payroll-Payslip Lines."; AmountInLine: Decimal; "CalledFromEdCode?": Boolean; EDCode: Code[20])
    begin
        /*”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Depending on the value of the Compute field for the E/D File record that  ‚
        ‚ corresponds to the current P.Roll Entry Line record                       ‚
        ‚ Parameters :                                                              ‚
        ‚   EntryRecParam           : Current entry line                            ‚
        ‚   Amount in current line  : The figure in the amount field in this line   ‚
        ‚   "CalledFromEdCode?"     : True if the trigger code was called from the  ‚
        ‚                            "E/D Code" field                               ‚
        ”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        ConstEDFileRec.Get(EntryRecParam."E/D Code");
        "E/DFileRec" := ConstEDFileRec;
        if "E/DFileRec".Compute = '' then
            exit;

        ProllEntryRec.Init();
        ProllEntryRec.SetRange("Payroll Period", EntryRecParam."Payroll Period");
        ProllEntryRec.SetRange("Employee No", EntryRecParam."Employee No");

        /* If the entry line to be computed does not exist then EXIT */
        ProllEntryRec := EntryRecParam;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        if not ProllEntryRec.Find('=') then
            exit;

        /* Initialise the variable to store the computed total. Note if the trigger
          code was called from the "E/D Code" field then that record is a new one.
          This implies that a search of the records in the file will not find this
          new record. Therefore for it's amount to be used in the computation
          we initialise the computed total to that amount*/
        if "CalledFromEdCode?" then begin
            if "E/DFileRec"."Add/Subtract" = 2 then
                /* Subtract */
            ComputedTotal := -AmountInLine
            else
                /* Add */
            ComputedTotal := AmountInLine
        end
        else
            ComputedTotal := 0;

        /*Get first record in P.Roll Entry file for this Period/Employee combination*/
        ProllEntryRec := EntryRecParam;
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.Find('>');

        /* Go through all the entry lines for this Period/Employee record and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        repeat
        begin
            /*BDC
              IF  ProllEntryRec.MARK THEN
              */
            if EDCode = ProllEntryRec."E/D Code" then
                /* We are at the record where the function was called from */
            AmountToAdd := AmountInLine
            else
                AmountToAdd := ProllEntryRec.Amount;

            "E/DFileRec".Get(ProllEntryRec."E/D Code");
            if "E/DFileRec".Compute = ConstEDFileRec.Compute then
                if "E/DFileRec"."Add/Subtract" = 2 then
                    /* Subtract */
              ComputedTotal := ComputedTotal - AmountToAdd
                else
                    /* Add */
              ComputedTotal := ComputedTotal + AmountToAdd;
        end
        until (ProllEntryRec.Next(1) = 0);

        /* Move the computed amount to the line whose E/D Code is the one that has
          just been calculated.*/
        ProllEntryRec.Init();
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        "E/DFileRec".Get(ConstEDFileRec.Compute);
        /*FTN No Need
        dbTRANSFERFIELDS ("E/DFileRec", ProllEntryRec);
        */

        /*Check for rounding, Maximum and minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        /*ProllEntryRec.Amount := ComputedTotal;
        ProllRecStore := ProllEntryRec;*/
        ProllEntryRec.LockTable();
        if ProllEntryRec.Find('=') then begin
            /*ProllRecStore.ChangeOthers := TRUE;
            ProllRecStore.HasBeenChanged := TRUE;
            dbMODIFYREC (ProllRecStore);*/
            ProllEntryRec.Amount := ComputedTotal;
            ProllEntryRec.ChangeOthers := true;
            ProllEntryRec.HasBeenChanged := true;
            ProllEntryRec.Modify();
        end;
        Commit();

        ProllEntryRec.SetRange("Payroll Period");
        ProllEntryRec.SetRange("Employee No");
    end;

    procedure CalcFactor1(CurrentEntryLine: Record "Payroll-Payslip Lines.")
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ If an entry is a contributory factor for the value of another line, then   ‚
        ‚ compute that other line's value and insert it appropriately                ‚
        ‚ Parameters :                                                               ‚
        ‚   CurrentEntryLine        : Current entry line                             ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /* Get first record in Entry Lines file for this Employee/Period */
        ProllEntryRec := CurrentEntryLine;
        ProllEntryRec.Init();
        ProllEntryRec.SetRange("Employee No", ProllEntryRec."Employee No");
        ProllEntryRec.SetRange("Payroll Period", ProllEntryRec."Payroll Period");
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.Find('>');

        /* Go through all the entry lines for this Period/Employee record and where
          the current entry line's value is a factor, calculate that amount. */
        repeat

            "E/DFileRec".Get(ProllEntryRec."E/D Code");

            if "E/DFileRec"."Factor Of" = CurrentEntryLine."E/D Code" then begin

                FactorRecAmount := ProllEntryRec.Amount;
                ProllEntryRec.Amount := "CalcFactor1.1"(CurrentEntryLine,
                                                           ProllEntryRec, "E/DFileRec");
                /*The new entry in this line should now be used to Compute another and
                also entries where it is a Factor, therefore set ChangeOthers to True*/
                if FactorRecAmount <> ProllEntryRec.Amount then begin
                    ProllEntryRec.ChangeOthers := true;
                    ProllEntryRec.Modify();
                end
            end;
        until (ProllEntryRec.Next(1) = 0);
        Commit();
    end;

    procedure ChangeAllOver(CurrentRec: Record "Payroll-Payslip Lines."; CurrWasDeleted: Boolean)
    begin
        /*”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Go through all the lines and where a line is supposed to Change others    ‚
        ‚ then change those others.                                                 ‚
        ‚ Parameters :                                                              ‚
        ‚   CurrentRec      : Current Entry line                                    ‚
        ‚   CurrWasDeleted  : True if the current record was deleted                ‚
        ”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        ChangeOthersRec := CurrentRec;
        ChangeOthersRec.SetRange("Payroll Period", CurrentRec."Payroll Period");
        ChangeOthersRec.SetRange("Employee No", CurrentRec."Employee No");
        ChangeOthersRec.SetRange(ChangeOthers, true);

        ChangeOthersRec."E/D Code" := '';
        if not ChangeOthersRec.Find('>') then
            exit;

        /*Set the maximum number of times the Amount can be changed for any one line.
         This will be used to ensure that this function does not execute 'forever',
         when the user has defined 'cyclic' E/Ds*/
        MaxChangeCount := 50;

        repeat

            /* Process the record to change others only if it isn't the deleted one */
            if not (CurrWasDeleted and (ChangeOthersRec."E/D Code" =
                                        CurrentRec."E/D Code"))
            then begin
                ComputeAgain(ChangeOthersRec, CurrentRec, CurrWasDeleted);
                CalcFactorAgain(ChangeOthersRec, CurrentRec, CurrWasDeleted);
            end;
            ChangeOthersRec.ChangeOthers := false;
            ChangeOthersRec.ChangeCounter := ChangeOthersRec.ChangeCounter + 1;
            ChangeOthersRec.Modify();
            ProllRecStore := ChangeOthersRec;
            ChangeOthersRec."E/D Code" := '';
        until ((ProllRecStore.ChangeCounter > MaxChangeCount) or
               (ChangeOthersRec.Next(1) = 0));
        Commit();
        ChangeOthersRec.SetRange("Payroll Period");
        ChangeOthersRec.SetRange("Employee No");
        ChangeOthersRec.SetRange(ChangeOthers);

        if (ProllRecStore.ChangeCounter > MaxChangeCount) then
            Message('The E/D Code %1, / seems to have been defined with CYCLIC' +
                     ' characteristics', ProllRecStore."E/D Code");

        exit;
    end;

    procedure ResetChangeFlags(CurrentRec: Record "Payroll-Payslip Lines.")
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Reset ChangeOthers to false for all lines in this Period/Employee          ‚
        ‚ Parameters :                                                               ‚
        ‚   CurrentRec  : Current entry line                                         ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/
        /*Get first record in Employee Group Lines file for this Employee group*/
        ProllEntryRec := CurrentRec;
        ProllEntryRec.Init();
        ProllEntryRec.SetRange("Payroll Period", CurrentRec."Payroll Period");
        ProllEntryRec.SetRange("Employee No", CurrentRec."Employee No");
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.Find('>');

        /* Reset ChangeOthers for this Employee Group */
        repeat

            ProllEntryRec.ChangeOthers := false;
            ChangeOthersRec.ChangeCounter := 0;
            /*BDC - Do not modify the one to be deleted*/
            if ProllEntryRec."E/D Code" <> CurrentRec."E/D Code" then
                ProllEntryRec.Modify();
        until (ProllEntryRec.Next(1) = 0);
        Commit();

        ProllEntryRec.Reset();
    end;

    procedure SpecialRelation("FieldNo.": Integer)
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Special Relations code for the field, E/D Code                             ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /* Force NO-EDIT of field already has a value or if Employee payroll details
          for the period are already closed*/
        if "E/D Code" <> '' then
            exit;

        /* If Period+Employee has already been closed then stop edit */
        if CheckClosed() then
            Error('Entries for Employee %1 for period %2 ' +
                   'have already been closed.', "Employee No", "Payroll Period");
    end;

    procedure CalcAmount(EDFileRec: Record "Payroll-E/D Codes."; EntryLineRec: Record "Payroll-Payslip Lines."; EntryLineAmount: Decimal; EDCode: Code[20]): Decimal
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Calculate the amount based on Factor Of and Percentage fields in the file  ‚
        ‚ E/D file, alternatively calculate if the current line is computed by others‚
        ‚  Parameters:                                                               ‚
        ‚    EDFileRec    : EDFile Record for the E/D Code of the current entry line ‚
        ‚    EntryLineRec : The current entry line record                            ‚
        ‚    EntryLineAmount: The amount in the current entry line. Note this        ‚
        ‚    parameter is important if this trigger is called from the SAVE trigger  ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /* If NO is in the flag field return amount to 0*/
        if (EDFileRec."Yes/No Req.?") and not (EntryLineRec.Flag) then
            exit(0);

        /* If Factor Of is Nil then do not change then check if amount is computed by others*/
        if EDFileRec."Factor Of" = '' then
            if not AmountIsComputed(ReturnAmount, EntryLineRec, EDFileRec,
                                     EntryLineAmount, EDCode) then
                exit(EntryLineRec.Amount)
            else begin  /*Check for rounding, Maximum and minimum */
                ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);
                exit(ReturnAmount);
            end;

        /* Get the record from the current file based on Factor Of */
        if not ProllFactorRec.Get(EntryLineRec."Payroll Period",
                         EntryLineRec."Employee No", EDFileRec."Factor Of") then
            exit(EntryLineRec.Amount)
        else
            if ProllFactorRec."E/D Code" = EDCode then
                ProllFactorRec.Amount := EntryLineAmount;

        /* Calculate the amount based on values in Table Look Up or Percentage fields of E/D file */
        if EDFileRec."Table Look Up" = '' then
            ReturnAmount := (ProllFactorRec.Amount * EDFileRec.Percentage) / 100
        else /* Extract relevant amount from Table Look Up */
            if not LookHeaderRec.Get(EDFileRec."Table Look Up") then begin
                Message('Table Lookup Not Registered Yet');
                exit(EntryLineRec.Amount)
            end
            else begin /* Table lookup exists*/
                /* Filter Lookupline records to those of current Table Id Only*/
                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SetRange(TableId, EDFileRec."Table Look Up");
                /* Depending on whether input parameter is code or numeric, set dbSETRANGE
                  appropraitely and initialise the record to use as a parameter to
                  dbFINDREC */

                case LookHeaderRec.Type of
                    0, 2:

                        /* Lookup table is searched with numeric variables */
                        if ProllFactorRec.Amount > -1 then begin
                            LookLinesRec."Lower Code" := '';
                            InputAmount := ProllFactorRec.Amount * LookHeaderRec."Input Factor";
                            LookLinesRec."Lower Amount" := InputAmount;
                            LookLinesRec.SetRange("Lower Code", '');
                        end
                        else
                            exit(LookHeaderRec."Min. Extract Amount");
                    else  /*Lookup table is searched with variables of type code*/
                      begin
                        LookLinesRec."Lower Amount" := 0;
                        LookLinesRec."Lower Code" := EDFileRec."E/D Code";
                        LookLinesRec.SetRange("Upper Amount", 0);
                        LookLinesRec.SetRange("Lower Amount", 0);
                    end
                end; /* Case*/

                case LookHeaderRec.Type of
                    0, 1:

                        /* Extract amount as follows; First find line where Lower Amount or
                          lower code is just greater than the Factor Amount then move one
                          line back.*/

                        if LookLinesRec.Find('=') then
                            ReturnAmount := LookLinesRec."Extract Amount"
                        else
                            if LookLinesRec.Find('>') then begin
                                BackOneRec := LookLinesRec.Next(-1);
                                ReturnAmount := LookLinesRec."Extract Amount";
                            end
                            else
                                if LookHeaderRec.Type = 0 then begin
                                    /*'Factor' Amount is > than the table's greatest "Lower amount"*/
                                    if LookLinesRec.Find('+') then
                                        ReturnAmount := LookLinesRec."Extract Amount";
                                end
                                else
                                    exit(EntryLineRec.Amount);

                    2: /*  Extract amount from tax table*/
                        ReturnAmount := (CalcTaxAmt(LookLinesRec, InputAmount)) *
                                        LookHeaderRec."Output Factor";
                end; /* Case */

                /* Adjust the amount as per the maximum/minimum in the LookupHeader*/
                if (LookHeaderRec."Max. Extract Amount" <> 0) and
                   (ReturnAmount > LookHeaderRec."Max. Extract Amount") then
                    ReturnAmount := LookHeaderRec."Max. Extract Amount"
                else
                    if (ReturnAmount < LookHeaderRec."Min. Extract Amount") then
                        ReturnAmount := LookHeaderRec."Min. Extract Amount";

                /* Check for rounding */
                if LookHeaderRec."Rounding Precision" = 0 then
                    RoundPrec := 0.01
                else
                    RoundPrec := LookHeaderRec."Rounding Precision";
                case LookHeaderRec."Rounding Direction" of
                    1:
                        RoundDir := '>';
                    2:
                        RoundDir := '<';
                    else
                        RoundDir := '=';
                end;
                ReturnAmount := Round(ReturnAmount, RoundPrec, RoundDir);

                LookLinesRec.Reset()
            end;

        /*Check for rounding, Maximum and minimum */
        ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);
        exit(ReturnAmount);
    end;

    procedure CalcTaxAmt(var LDetailsRec: Record "Payroll-Lookup Lines."; TaxTableInput: Decimal): Decimal
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Returns the tax figure from a table lookup of type Tax                     ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/
        /* Parameters:
          by Referrence : The current Lookup detail table record = LDetailsRec.
                          NB: By referrence so that all delimitations, sortings etc
                              are still in effect.
          by value      : The amount to be taxed = TaxTableInput
        */

        //MESSAGE('Tax Table Input:' + FORMAT(TaxTableInput));

        /* Copy all current filters of LookUpRec */
        PrevLookRec := LDetailsRec;
        /* COPYFILTERS(LDetailsRec );          */
        /*BDC
        PrevLookRec.COPYFILTERS(LDetailsRec);
        
//suspended by SSNL2015 begin
        if PrevLookRec.Next(-1) = 0 then
            ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
        //ELSE  ReturnAmount := CalcGraduated (LDetailsRec, TaxTableInput);
        else
            ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100;
*///suspended by SSNL2025 end

        if LDetailsRec.Find('=') then
            /*Record found where Lower Amount is equal to TaxTableInput*/
          if PrevLookRec.Next(-1) = 0 then
                ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
            else
                /* Call function to get the tax amount from the graduated tax table.*/
                ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput)
        //ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100  (SSNL2025)
        else
            if LDetailsRec.Find('>') then
                /*Record found where Lower Amount is just larger than TaxTableInput.
                 Therefore TaxableInput should be in previous range (= record)*/
          if LDetailsRec.Next(-1) = 0 then
                    /* The lowest taxable amount is larger than the input amount */
            ReturnAmount := 0
                else
                    ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput)
            //ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100 (SSNL2025)
            else
                /*TaxableInput is larger than the table's greatest lower amount*/
                if LDetailsRec.Next(-1) = 0 then
                    //ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %")/100
                    ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100
                else
                    /* Call function to get the tax amount from the graduated tax table.*/
                    ReturnAmount := CalcGraduated(LDetailsRec, TaxTableInput);
        //ReturnAmount := (TaxTableInput * LDetailsRec."Tax Rate %") / 100;(SSNL2025)

        //MESSAGE('Tax Table Output:' + FORMAT(ReturnAmount));
        exit(ReturnAmount);
    end;

    procedure CalcGraduated(var WantedLookRec: Record "Payroll-Lookup Lines."; InputToTable: Decimal): Decimal
    begin
        /*”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Returns the tax amount from the graduated tax table.                      ‚
        ‚ Parameters                                                                ‚
        ‚ by reference : The Table Lookup record within which the Taxable amount    ‚
        ‚                falls = WantedLookRec                                      ‚
        ‚                NB: By reference so that all delimitations, sorting etc    ‚
        ‚                    are still in effect.                                   ‚
        ‚ by value     : The amount to be taxed = InputToTable                      ‚
        ”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /* Create a copy of the valid Look Up table Record */
        PrevLookRec := WantedLookRec;
        /*BDC
        COPYFILTERS(WantedLookRec );
       */

        //message('Input to Graduated table: ' + FORMAT(InputToTable));
        //MESSAGE('Rate Percent to Graduated table: ' + FORMAT(WantedLookRec."Tax Rate %"));
        //message(format(PrevLookRec.count));

        if PrevLookRec.Next(-1) = 0 then
            ReturnAmount := (InputToTable * WantedLookRec."Tax Rate %") / 100
        else begin
            /* Compute tax for the amount of money that is within the range of the
              Wanted Look Up Record then add the Cumulative Tax Payable amount from
              the previous Look Up record*/
            //Inserted by SSNL2025 to Calculate Tax Using Slabs Tax Begin
            LookHeaderRec.Get(WantedLookRec.TableId);
            if LookHeaderRec."Use Slabs" then begin
                ReturnAmount := InputToTable;
                ReturnAmount := (ReturnAmount * WantedLookRec."Tax Rate %") / 100
            end // Using Slabs Tax End  
            else begin
                ReturnAmount := (InputToTable - PrevLookRec."Upper Amount");
                ReturnAmount := (ReturnAmount * WantedLookRec."Tax Rate %") / 100;
                ReturnAmount := ReturnAmount + PrevLookRec."Cum. Tax Payable";
            end
        end;
        //MESSAGE('Output from Graduated Final: ' + FORMAT(ReturnAmount));
        exit(ReturnAmount);
    end;

    procedure "CalcFactor1.1"(CurrLineRec: Record "Payroll-Payslip Lines."; LineToChangeRec: Record "Payroll-Payslip Lines."; EDFileRec: Record "Payroll-E/D Codes."): Decimal
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Calculate the amount based on Factor Of and Percentage fields of the file  ‚
        ‚ E/D file,
        ‚  Parameters:                                                               ‚
        ‚    CurrLineRec    : The current entry line record                          ‚
        ‚    LineToChangeRec: The entry line to be changed.
        ‚    EDFileRec      : EDFile Record for the E/D Code of LineToChangeRec      ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /* If NO is in the flag field return amount to 0 */
        if (EDFileRec."Yes/No Req.?") and not (LineToChangeRec.Flag) then
            exit(0);

        /* Calculate the amount based on values in Table Look Up or Percentage fields
          of E/D file */
        if EDFileRec."Table Look Up" = '' then
            ReturnAmount := (CurrLineRec.Amount * EDFileRec.Percentage) / 100
        else /* Extract relevant amount from Table Look Up */

            if not LookHeaderRec.Get(EDFileRec."Table Look Up") then begin
                Message('Table Lookup Not Registered Yet');
                exit(LineToChangeRec.Amount)
            end
            else begin /* Table lookup exists*/

                /* Filter Lookupline records to those of current Table Id Only*/
                LookLinesRec.TableId := EDFileRec."Table Look Up";
                LookLinesRec.SetRange(TableId, EDFileRec."Table Look Up");

                /* Depending on whether input parameter is code or numeric, set dbSETRANGE
                  appropraitely and initialise the record to use as a parameter to
                  dbFINDREC */
                case LookHeaderRec.Type of
                    0, 2:

                        /* Lookup table is searched with numeric variables */
                        if CurrLineRec.Amount > -1 then begin
                            LookLinesRec."Lower Code" := '';
                            LookLinesRec."Lower Amount" := CurrLineRec.Amount *
                                                           LookHeaderRec."Input Factor";
                            LookLinesRec.SetRange("Lower Code", '');
                        end
                        else
                            exit(LookHeaderRec."Min. Extract Amount");
                    else  /*Lookup table is searched with variables of type code*/
                      begin
                        LookLinesRec."Lower Amount" := 0;
                        LookLinesRec."Lower Code" := CurrLineRec."E/D Code";
                        LookLinesRec.SetRange("Upper Amount", 0);
                        LookLinesRec.SetRange("Lower Amount", 0);
                    end
                end; /* Case*/

                case LookHeaderRec.Type of
                    0, 1:

                        /* Extract amount as follows; First find line where Lower Amount or
                          Lower Code is just greater than the CurrLineRec then move one line
                          back.*/

                        if LookLinesRec.Find('=') then
                            ReturnAmount := LookLinesRec."Extract Amount"
                        else
                            if LookLinesRec.Find('>') then begin
                                BackOneRec := LookLinesRec.Next(-1);
                                ReturnAmount := LookLinesRec."Extract Amount";
                            end
                            else
                                if LookHeaderRec.Type = 0 then begin
                                    /*CurrLineRec.Amount is > than the table's greatest "Lower amount"*/
                                    if LookLinesRec.Find('+') then
                                        ReturnAmount := LookLinesRec."Extract Amount"
                                    else
                                        exit(LineToChangeRec.Amount)
                                end
                                else
                                    /*CurrLineRec.EDCode is > than the table's greatest "Lower code"*/
                  exit(LineToChangeRec.Amount);

                    2: /*  Extract amount from tax table*/
                        ReturnAmount := (CalcTaxAmt(LookLinesRec, PreTaxCalc() *
                                                     LookHeaderRec."Input Factor")) *
                                                     LookHeaderRec."Output Factor";
                end; /* Case */

                /* Adjust the amount as per the maximum/minimum in the LookupHeader*/
                if (LookHeaderRec."Max. Extract Amount" <> 0) and
                   (ReturnAmount > LookHeaderRec."Max. Extract Amount") then
                    ReturnAmount := LookHeaderRec."Max. Extract Amount"
                else
                    if (ReturnAmount < LookHeaderRec."Min. Extract Amount") then
                        ReturnAmount := LookHeaderRec."Min. Extract Amount";

                /* Check for rounding */
                if LookHeaderRec."Rounding Precision" = 0 then
                    RoundPrec := 0.01
                else
                    RoundPrec := LookHeaderRec."Rounding Precision";
                case LookHeaderRec."Rounding Direction" of
                    1:
                        RoundDir := '>';
                    2:
                        RoundDir := '<';
                    else
                        RoundDir := '=';
                end;
                ReturnAmount := Round(ReturnAmount, RoundPrec, RoundDir);

                LookLinesRec.Reset()
            end;

        /* Adjust amount as per maximum/minimum set in the E/D file. This will overide
          any max/min. values set in the Table Lookup Header file*/
        ReturnAmount := ChkRoundMaxMin(EDFileRec, ReturnAmount);

        exit(ReturnAmount);
    end;

    procedure ComputeAgain(ParamLine: Record "Payroll-Payslip Lines."; CurrentRec: Record "Payroll-Payslip Lines."; CurrWasDeleted: Boolean)
    begin
        /*”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Compute values for the E/D specified in the Compute field for the         ‚
        ‚  Entry Line record passed as a parameter                                  ‚
        ‚ Parameters :                                                              ‚
        ‚   ParamLine       : Entry line passed as a parameter                      ‚
        ‚   CurrentRec      : Current Entry line                                    ‚
        ‚   CurrWasDeleted  : True if the current record was deleted                ‚
        ”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        ConstEDFileRec.Get(ParamLine."E/D Code");
        "E/DFileRec" := ConstEDFileRec;
        if "E/DFileRec".Compute = '' then
            exit;

        ProllEntryRec.Reset();
        ProllEntryRec.Init();
        ProllEntryRec.SetRange("Payroll Period", CurrentRec."Payroll Period");
        ProllEntryRec.SetRange("Employee No", CurrentRec."Employee No");

        /* If the entry line to be computed does not exist then EXIT */
        ProllEntryRec := ParamLine;
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        if not ProllEntryRec.Find('=') then
            exit;

        /* If CurrentRec is to be deleted, then no need to re-compute it */
        if (CurrWasDeleted and (ProllEntryRec."E/D Code" = CurrentRec."E/D Code"))
        then
            exit;

        /*
          Initialise the variable to store the computed total. If a record was
          deleted then initialise to 0. Otherwise if the current line (i.e that
          entered by the user) also contributes to the computed line then we
          initialise the computed total to that amount
        */
        "E/DFileRec".Get(CurrentRec."E/D Code");
        if CurrWasDeleted then
            ComputedTotal := 0
        else
            if "E/DFileRec".Compute = ConstEDFileRec.Compute then begin
                if "E/DFileRec"."Add/Subtract" = 2 then
                    /* Subtract */
            ComputedTotal := -CurrentRec.Amount
                else
                    /* Add */
            ComputedTotal := CurrentRec.Amount;
            end
            else
                ComputedTotal := 0;

        /*Get first record in P.Roll Entry file for this Employee group*/
        ProllEntryRec := ParamLine;
        ProllEntryRec."E/D Code" := '';
        ProllEntryRec.Find('>');

        /* Go through all the entry lines for this Employee group and sum up
          all those that contribute to the E/D specified in the Compute field for
          the current entry line */
        repeat

            if ProllEntryRec."E/D Code" <> CurrentRec."E/D Code" then begin

                "E/DFileRec".Get(ProllEntryRec."E/D Code");
                if "E/DFileRec".Compute = ConstEDFileRec.Compute then
                    if "E/DFileRec"."Add/Subtract" = 2 then
                        /* Subtract */
                ComputedTotal := ComputedTotal - ProllEntryRec.Amount
                    else
                        /* Add */
                ComputedTotal := ComputedTotal + ProllEntryRec.Amount
            end
        until (ProllEntryRec.Next(1) = 0);

        /* Move the computed amount to the line whose E/D Code is the one that has
          just been calculated.*/
        ProllEntryRec.Init();
        ProllEntryRec."E/D Code" := ConstEDFileRec.Compute;
        "E/DFileRec".Get(ConstEDFileRec.Compute);
        /*dbTRANSFERFIELDS ("E/DFileRec", ProllEntryRec);*/

        /*Check for rounding, Maximum and minimum */
        ComputedTotal := ChkRoundMaxMin("E/DFileRec", ComputedTotal);

        /*ProllEntryRec.Amount := ComputedTotal;
        ProllRecStore := ProllEntryRec;*/

        ProllEntryRec.LockTable();
        if ProllEntryRec.Find('=') then
            /*FactorRecAmount := ProllEntryRec.Amount;*/
            /*ProllEntryRec := ProllRecStore;*/

            /*The new entry in this line should now be used to Compute another and
             also entries where it is a Factor, therefore set ChangeOthers to True*/
            if ProllEntryRec.Amount <> ComputedTotal then begin
                ProllEntryRec.Amount := ComputedTotal;
                ProllEntryRec.ChangeOthers := true;
                ProllEntryRec.Modify()
            end;
        Commit();

        ProllEntryRec.Reset();
    end;

    procedure CalcFactorAgain(ParamLine: Record "Payroll-Payslip Lines."; CurrentRec: Record "Payroll-Payslip Lines."; CurrWasDeleted: Boolean)
    begin
        /*””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ If a change in a line due to the entry or change to another entry is a     ‚
        ‚ contributory factor for the value of another line, then  compute that      ‚
        ‚other line's value and insert it appropriately                              ‚
        ‚ Parameters :                                                               ‚
        ‚   ParamLine         : Line whose value should change others                ‚
        ‚   CurrentRec        : Current Entry line                                   ‚
        ‚   CurrWasDeleted    : True if CurrentRec is to be deleted                  ‚
        ””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /*Get first record in Employee Group Lines file for this Employee group*/
        ProllEntryRec.Reset();
        ProllEntryRec.Init();
        ProllEntryRec.SetRange("Payroll Period", ParamLine."Payroll Period");
        ProllEntryRec.SetRange("Employee No", ParamLine."Employee No");
        ProllEntryRec := ParamLine;
        ProllEntryRec."E/D Code" := '';
        if not ProllEntryRec.Find('>') then
            exit;

        /* Go through all the entry lines for this Employee Group record and where
          the current entry line's value is a factor, calculate that amount. */
        repeat

            "E/DFileRec".Get(ProllEntryRec."E/D Code");

            if "E/DFileRec"."Factor Of" = ParamLine."E/D Code" then begin

                FactorRecAmount := ProllEntryRec.Amount;
                if (CurrWasDeleted and (ParamLine."E/D Code" = CurrentRec."E/D Code"))
                then
                    ProllEntryRec.Amount := 0
                else
                    ProllEntryRec.Amount := "CalcFactor1.1"(ParamLine, ProllEntryRec,
                                                             "E/DFileRec");

                /*The new entry in this line should now be used to Compute another and
                 also entries where it is a Factor, therefore set ChangeOthers to True*/
                if FactorRecAmount <> ProllEntryRec.Amount then begin
                    ProllEntryRec.ChangeOthers := true;
                    ProllEntryRec.Modify()
                end
            end;
        until (ProllEntryRec.Next(1) = 0);
        Commit();

        ProllEntryRec.Reset();
    end;

    procedure AmountIsComputed(var ReturnAmount: Decimal; EntryLineRec: Record "Payroll-Payslip Lines."; EDFileRec: Record "Payroll-E/D Codes."; NewAmount: Decimal; EDCode: Code[20]): Boolean
    begin
        /*”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Check for values that should COMPUTE the amount for the P.Roll Entry      ‚
        ‚ Line record.                                                              ‚
        ‚ Return:                                                                   ‚
        ‚   If there are entries for the employee/period that compute the value     ‚
        ‚   then return TRUE else return FALSE                                      ‚
        ‚ Parameters :                                                              ‚
        ‚   ReturnAmount:  The computed amount, by refference                       ‚
        ‚   EntryLineRec:  The P.Roll Entry record whose value is to be computed    ‚
        ‚   EDFileRec   :  The E/D file record of the E/D of the P.Roll Entry Record‚
        ‚   NewAmount   :  The new calculated or entered amount in the current rec. ‚
        ”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        ProllRecStore := EntryLineRec;

        /*Get first record in P.Roll Entry file for this Period/Employee combination*/
        ProllRecStore.SetRange("Payroll Period", EntryLineRec."Payroll Period");
        ProllRecStore.SetRange("Employee No", EntryLineRec."Employee No");
        ProllRecStore."E/D Code" := '';
        if not ProllRecStore.Find('>') then
            exit(false);

        /* Initialise the variable to store the computed total. */
        ReturnAmount := 0;
        IsComputed := false;

        /* Go through all the entry lines for this Period/Employee record and sum up
          all those that contribute to the E/D of the given payroll entry line */
        repeat
            "E/DFileRec".Get(ProllRecStore."E/D Code");
            if "E/DFileRec".Compute = EntryLineRec."E/D Code" then begin
                /*BDC
                    IF  ProllRecStore.MARK THEN
                  */
                if ProllRecStore."E/D Code" = EDCode then
                    AmtToAdd := NewAmount
                else
                    AmtToAdd := ProllRecStore.Amount;

                if "E/DFileRec"."Add/Subtract" = 2 then
                    /* Subtract */
              ReturnAmount := ReturnAmount - AmtToAdd
                else
                    /* Add */
              ReturnAmount := ReturnAmount + AmtToAdd;

                IsComputed := true
            end
        until (ProllRecStore.Next(1) = 0);

        exit(IsComputed);
    end;

    procedure ChkRoundMaxMin(EDRecord: Record "Payroll-E/D Codes."; TheAmount: Decimal): Decimal
    begin
        /*”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””
        ‚ Round an amount and check for Max and Min. Return the amended amount.     ‚
        ‚ Parameters :                                                              ‚
        ‚   EDRecord : The ED file record to use to check Round, Max. and Min       ‚
        ‚   TheAmount: The amounht to Round, and check for Max. and Min             ‚
        ”””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””””*/

        /* Adjust amount as per maximum/minimum set in the E/D file. */
        if (EDRecord."Max. Amount" <> 0) and
           (TheAmount > EDRecord."Max. Amount") then
            TheAmount := EDRecord."Max. Amount"
        else
            if (TheAmount < EDRecord."Min. Amount") and ("Payslip Group ID" <> "Payslip Group ID"::"TAX DEDUCTED") then
                TheAmount := EDRecord."Min. Amount";

        /* Check for rounding */
        if EDRecord."Rounding Precision" = 0 then
            RoundPrec := 0.01
        else
            RoundPrec := EDRecord."Rounding Precision";
        case EDRecord."Rounding Direction" of
            1:
                RoundDir := '>';
            2:
                RoundDir := '<';
            else
                RoundDir := '=';
        end;

        TheAmount := Round(TheAmount, RoundPrec, RoundDir);

        exit(TheAmount);
    end;

    procedure EDAmountToDate(EmpNo: Code[10]; CurPeriod: Code[10]; EDCode: Code[10]): Decimal
    var
        AmountBack: Decimal;
    begin

        if PeriodRec.Get(CurPeriod) then
            PerStart := PeriodRec."Start Date";

        CurYear := Date2DMY(PerStart, 3);
        YearStart := CalcDate('-CY', PerStart);

        PeriodRec.SetRange(PeriodRec."Start Date", YearStart);
        if PeriodRec.Find('-') then
            Per1 := PeriodRec."Period Code";

        EmployeeRec.Get("Employee No");
        EmployeeRec.SetRange(EmployeeRec."Employee No. Filter", "Employee No");
        EmployeeRec.SetRange("Period Filter", Per1, CurPeriod);
        EmployeeRec.SetRange("ED Filter", EDCode);

        EmployeeRec.CalcFields(EmployeeRec.EDAmount);
        AmountBack := EmployeeRec.EDAmount;

        //MESSAGE(FORMAT(Per1)+'..'+FORMAT(CurPeriod));
        //message(EDCode + ' -> ' + format(AmountBack));

        exit(AmountBack);
    end;

    procedure PreTaxCalc(): Decimal
    begin
        /////////** Begin Cummulative Tax Calculation **/////////

        EDRec2.Reset();
        EDRec2.SetRange(EDRec2."Payslip Group ID", EDRec2."Payslip Group ID"::"TAXABLE PAY");
        if EDRec2.Find('-') then TaxableED := EDRec2."E/D Code";
        EDRec2.Reset();
        EDRec2.SetRange(EDRec2."Payslip Group ID", EDRec2."Payslip Group ID"::"TAX DEDUCTED");
        if EDRec2.Find('-') then TaxED := EDRec2."E/D Code";

        PaySetup.Reset();
        PaySetup.Find('-');
        TaxfreeED := PaySetup."Taxfree Pay ED";

        CurrTaxable := 0;
        if TaxableED <> '' then
            if PayLines2.Get("Payroll Period", "Employee No", TaxableED) then
                CurrTaxable := PayLines2.Amount
            else
                Error('Please Indicate the Taxable ED in The ED Table\\' +
                      'Using the payslip Group ID Field');

        TaxableYTD := EDAmountToDate("Employee No", "Payroll Period", TaxableED);   // + CurrTaxable;
        TaxYTD := EDAmountToDate("Employee No", "Payroll Period", TaxED);

        TaxFreeYTD := EDAmountToDate("Employee No", "Payroll Period", TaxfreeED);
        NewEmpRec.Get("Employee No");
        AmountToTax := TaxableYTD - TaxFreeYTD;

        // + NewEmpRec."Annual Tax Freepay"/12; //Add Tafree again to Avoid double deduction

        //MESSAGE(' TaxableYTD:' + FORMAT(TaxableYTD)+' TaxFreeYTD:' + FORMAT(TaxFreeYTD)+'\\'+
        //        ' TaxYTD:' + FORMAT(TaxYTD)+' AmountToTax:' + FORMAT(AmountToTax));

        //Ret1 := (CalcTaxAmt (LookLinesRec, AmountToTax * LookHeaderRec."Input Factor")) * LookHeaderRec."Output Factor";

        //MESSAGE(' Taxable:' + FORMAT(TaxableYTD)+' TaxFreeYTD:' + FORMAT(TaxFreeYTD)+'\\'+
        //        ' TaxYTD:' + FORMAT(TaxYTD)+' AmountToTax:' + FORMAT(AmountToTax)+'\\'+
        //        ' ReturnAmount:' + FORMAT(Ret1));

        exit(AmountToTax);

        /////////** End  Cummulative Tax Calculation **/////////
    end;

    ///<summary>
    /// Due to the deleted record, ensure all the other lines are correct.        ‚
    /// </summary>
    ///<param name="DeletedRec">
    /// The current record (= the record to be deleted)
    /// </param>

    procedure ChangeDueToDelete(DeletedRec: Record "Payroll-Payslip Lines.")
    var
    begin
        // {Get first record in Employee Group Lines file for this Employee group}
        ProllEntryRec := DeletedRec;
        ProllEntryRec.SETRANGE("Payroll Period", DeletedRec."Payroll Period");
        ProllEntryRec.SETRANGE("Employee No", DeletedRec."Employee No");

        // { If the deleted record was 'COMPUTING' another then make changes }
        "E/DFileRec".GET(DeletedRec."E/D Code");
        ProllEntryRec."E/D Code" := "E/DFileRec".Compute;
        IF ProllEntryRec.FIND('=') THEN
            ComputeAgain(DeletedRec, DeletedRec, TRUE);

        // { If another record is a 'FACTOR OF' the deleted one then make changes }
        CalcFactorAgain(DeletedRec, DeletedRec, TRUE);

        // { Due to these changes adjust AMOUNTS in all lines } ////
        ChangeAllOver(DeletedRec, TRUE);
        EXIT;
    end;
}
