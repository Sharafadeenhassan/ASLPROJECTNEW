table 50018 "Applicants"
{
    DataCaptionFields = "No.", Surname, "First Name", "Middle Name";
    DataPerCompany = false;
    DrillDownPageID = "Applicants List";
    LookupPageID = "Applicants List";
    Caption = 'Applicants';
    fields
    {
        field(1; "No."; Code[20])
        {
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    HumanResSetup.Get();
                    NoSeriesMgt.TestManual(HumanResSetup."Application Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; Surname; Text[30])
        {
        }
        field(3; "First Name"; Text[30])
        {
            trigger OnValidate()
            begin
                if ("Search Name" = '') then
                    "Search Name" := "First Name";
            end;
        }
        field(4; "Middle Name"; Text[30])
        {
        }
        field(5; Initials; Text[30])
        {
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Initials)) or ("Search Name" = '') then
                    "Search Name" := Initials;
            end;
        }
        field(7; "Search Name"; Code[30])
        {
        }
        field(8; Address; Text[30])
        {
        }
        field(9; "Address 2"; Text[30])
        {
        }
        field(10; City; Text[30])
        {
        }
        field(11; "Post Code"; Code[20])
        {
            TableRelation = "Post Code";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if PostCode.Get("Post Code") then
                    City := PostCode.City;
            end;
        }
        field(12; County; Text[30])
        {
        }
        field(13; "Phone No."; Text[30])
        {
        }
        field(14; "Mobile Phone No."; Text[30])
        {
        }
        field(15; "E-Mail"; Text[80])
        {
        }
        field(16; "Alt. Address Code"; Code[10])
        {
            TableRelation = "Alternative Address".Code WHERE("Employee No." = FIELD("No."));
        }
        field(17; "Alt. Address Start Date"; Date)
        {
        }
        field(18; "Alt. Address End Date"; Date)
        {
        }
        field(19; Picture; BLOB)
        {
            SubType = Bitmap;
        }
        field(20; "Birth Date"; Date)
        {
        }
        field(24; Sex; Enum "Employee Gender")
        {
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(31; "Application Status"; Option)
        {
            OptionMembers = " ","Under Interview","Short Listed",Accepted,Rejected;

            trigger OnValidate()
            begin
                EmployeeQualification.SetRange("Employee No.", "No.");
                EmployeeQualification.ModifyAll("Employee Status", "Application Status");
                if (("Application Status" = "Application Status"::Accepted) or
                   ("Application Status" = "Application Status"::Accepted)) and
                   ("Date Accepted/Rejected" = 0D) then begin
                    "Date Accepted/Rejected" := WorkDate();
                    ApplicantRec."Date Offer Made" := WorkDate();
                end;
                if ("Application Status" = "Application Status"::Accepted) then
                    if Confirm('Do you want to convert this applicant to staff?', true) then begin
                        "Application Status" := "Application Status"::Accepted;
                        Modify();
                        Applicantsr.SetRange("No.", "No.");
                        REPORT.Run(REPORT::"Convert Applicant to Staff", true, true, Applicantsr);
                    end;
            end;
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Global Dimension 1 Code");
                MODIFY();
            end;
        }
        field(37; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Global Dimension 2 Code");
                MODIFY();
            end;
        }
        field(39; Comment; Boolean)
        {
            CalcFormula = Exist("Human Resource Comment Line" WHERE("Table Name" = CONST(Applicants),
             "No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(48; Pager; Text[30])
        {
        }
        field(49; "Fax No."; Text[30])
        {
        }
        field(50; "Company E-Mail"; Text[80])
        {
        }
        field(51; Title; Text[30])
        {
        }
        field(52; "Salespers./Purch. Code"; Code[10])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(53; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(50000; "Region Code"; Code[10])
        {
            TableRelation = "Business Unit".Code;
        }
        field(50015; "Posting Group"; Code[20])
        {
            TableRelation = "Payroll-Posting Group Header."."Posting Group Code";
        }
        field(50016; "Employee Group"; Code[20])
        {
            TableRelation = "Payroll-Employee Group Header." WHERE("Posting Group Code" = FIELD("Posting Group"));
        }
        field(50071; Blocked; Boolean)
        {
        }
        field(50073; "Modified By"; Code[10])
        {
            Editable = false;
        }
        field(50076; Class; Code[10])
        {
            TableRelation = "Skill Appraisal"."Skill code";
        }
        field(50086; "Date Offer Made"; Date)
        {
        }
        field(50088; "Position Applied For"; Code[20])
        {
            TableRelation = "Employment Contract"."Unique Cd No";

            trigger OnValidate()
            begin
                if "Position Applied For" <> '' then begin
                    if EmplContract.Get("Position Applied For") then
                        "Position Description" := EmplContract.Description;
                end
                else
                    "Position Description" := '';
            end;
        }
        field(50089; "Position Description"; Text[30])
        {
            Editable = false;
        }
        field(50092; "Agreed Start Date"; Date)
        {
        }
        field(50093; "Assigned Employee No"; Code[10])
        {
            trigger OnValidate()
            begin
                if "Assigned Employee No" <> '' then
                    "Application Status" := "Application Status"::Accepted
                else
                    if "Application Status" = "Application Status"::Accepted then
                        "Application Status" := "Application Status"::" ";
            end;
        }
        field(50094; "Date Accepted/Rejected"; Date)
        {
        }
        field(50095; "Next of Kin"; Text[30])
        {
            CalcFormula = Lookup("Employee Relative"."First Name" WHERE("Employee No." = FIELD("No."),
                                                                         Source = CONST(Applicant),
                                                                         "Relative Code" = CONST('NEXT')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50096; Staffed; Boolean)
        {
            InitValue = false;
        }
        field(50097; "Last Remuneration"; Decimal)
        {
            BlankZero = true;
            DecimalPlaces = 2 : 2;
        }
        field(53000; "First Interview"; Boolean)
        {
        }
        field(53001; "First Interview Date"; Date)
        {
        }
        field(53002; "First Interview Result"; Decimal)
        {
            DecimalPlaces = 1 : 1;

            trigger OnValidate()
            begin
                "First Interview Maximum" := "First Interview Result";
            end;
        }
        field(53003; "Second Interview"; Boolean)
        {
        }
        field(53004; "Second Interview Date"; Date)
        {
        }
        field(53005; "Second Interview Result"; Decimal)
        {
            DecimalPlaces = 1 : 1;

            trigger OnValidate()
            begin
                "Second Interview Maximum" := "Second Interview Result";
            end;
        }
        field(53006; "Final Interview"; Boolean)
        {
        }
        field(53007; "Final Interview Date"; Date)
        {
        }
        field(53008; "Final Interview Result"; Decimal)
        {
            DecimalPlaces = 1 : 1;

            trigger OnValidate()
            begin
                "Final Interview Maximum" := "Final Interview Result";
            end;
        }
        field(53009; "First Interview Maximum"; Decimal)
        {
        }
        field(53010; "Second Interview Maximum"; Decimal)
        {
            trigger OnValidate()
            begin
                if ("Second Interview Result" > "Second Interview Maximum") then
                    Error('Maximum Score attainable in this interview is %1', Format("Second Interview Maximum"));
            end;
        }
        field(53011; "Final Interview Maximum"; Decimal)
        {
            trigger OnValidate()
            begin
                if ("Final Interview Result" > "Final Interview Maximum") then
                    Error('Maximum Score attainable in this interview is %1', Format("Final Interview Maximum"));
            end;
        }
        field(53012; "Advert Ref No"; Code[20])
        {
        }
        field(53013; "Position check lis"; Text[30])
        {
            //  TableRelation = Table50055.Field2;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; Surname, "First Name", "Middle Name")
        {
        }
        key(Key3; "Assigned Employee No")
        {
        }
        key(Key4; "Application Status")
        {
        }
        key(Key5; "Advert Ref No")
        {
        }
        key(Key6; "First Name", "Middle Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Post Code", City, Address, "Address 2")
        {
        }
    }

    trigger OnDelete()
    begin
        AlternativeAddr.SetRange("Employee No.", "No.");
        AlternativeAddr.DeleteAll();

        EmployeeQualification.SetRange("Employee No.", "No.");
        EmployeeQualification.DeleteAll();

        Relative.SetRange("Employee No.", "No.");
        Relative.DeleteAll();

        EmployeeAbsence.SetRange("Employee No.", "No.");
        EmployeeAbsence.DeleteAll();

        MiscArticleInformation.SetRange("Employee No.", "No.");
        MiscArticleInformation.DeleteAll();

        ConfidentialInformation.SetRange("Employee No.", "No.");
        ConfidentialInformation.DeleteAll();

        HumanResComment.SetRange("No.", "No.");
        HumanResComment.DeleteAll();
    end;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Application Nos.");
            NoSeriesMgt.InitSeries(HumanResSetup."Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        ApplicantRec."Modified By" := UserId;

        if Staffed then Error('You canot modify a STAFFED Applicant Record!!!');

        /*
        IF Res.READPERMISSION THEN
          EmployeeResUpdate.HumanResToRes(xRec,Rec);
        IF SalespersonPurchaser.READPERMISSION THEN
          EmployeeSalespersonUpdate.HumanResToSalesPerson(xRec,Rec);
        */
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    var
        //approv: Record "Object";
        HumanResSetup: Record "Human Resources Setup";
        ApplicantRec: Record Applicants;
        PostCode: Record "Post Code";
        AlternativeAddr: Record "Alternative Address";
        EmployeeQualification: Record "Employee Qualification";
        Relative: Record "Employee Relative";
        EmployeeAbsence: Record "Employee Absence";
        MiscArticleInformation: Record "Misc. Article Information";
        ConfidentialInformation: Record "Confidential Information";
        HumanResComment: Record "Human Resource Comment Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        EmplContract: Record "Employment Contract";
        Applicantsr: Record Applicants;
        InterCount: Integer;
        TotalScore: Decimal;
        TotalMax: Decimal;
        AllAvg: Decimal;
        DimMgt: Codeunit DimensionManagement;

    [Scope('OnPrem')]
    procedure AssistEdit(OldApplicant: Record Applicants): Boolean
    begin
        ApplicantRec := Rec;
        HumanResSetup.Get();
        HumanResSetup.TestField("Application Nos.");
        if NoSeriesMgt.SelectSeries(HumanResSetup."Application Nos.", OldApplicant."No. Series", ApplicantRec."No. Series") then begin
            HumanResSetup.Get();
            HumanResSetup.TestField("Application Nos.");
            NoSeriesMgt.SetSeries(ApplicantRec."No.");
            Rec := ApplicantRec;
            exit(true);
        end;
    end;

    [Scope('OnPrem')]
    procedure FullName(): Text[100]
    begin
        if "Middle Name" = '' then
            exit(Surname + ' ' + "First Name")
        else
            exit(Surname + ' ' + "First Name" + ' ' + "Middle Name");
    end;

    [Scope('OnPrem')]
    procedure ComputeAverage(): Decimal
    begin
        InterCount := 0;
        TotalMax := 0;
        TotalScore := "First Interview Result" + "Second Interview Result" + "Final Interview Result";
        if ("First Interview Result" <> 0) then begin
            Validate("First Interview Maximum");
            if ("First Interview Result" > "First Interview Maximum") then begin
                Message('Maximum Score attainable in 1st interview is %1', Format("First Interview Maximum"));
                exit(0);
            end;
            TotalMax := TotalMax + "First Interview Maximum";
        end;
        if ("Second Interview Result" <> 0) then begin
            Validate("Second Interview Maximum");
            if ("Second Interview Result" > "Second Interview Maximum") then begin
                Message('Maximum Score attainable in 2nd interview is %1', Format("Second Interview Maximum"));
                exit(0);
            end;
            TotalMax := TotalMax + "Second Interview Maximum";
        end;

        if ("Final Interview Result" <> 0) then begin
            Validate("Final Interview Maximum");
            if ("Final Interview Result" > "Final Interview Maximum") then begin
                Message('Maximum Score attainable in 3rd interview is %1', Format("Final Interview Maximum"));
                exit(0);
            end;
            TotalMax := TotalMax + "Final Interview Maximum";
        end;

        if (TotalMax <> 0) then
            AllAvg := (TotalScore / (TotalMax)) * 100
        else
            AllAvg := 0;

        exit(AllAvg);
    end;

    // [Scope('OnPrem')]
    procedure ValidateShortcutDimCode(FieldNo: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNo, ShortcutDimCode);
        DimMgt.SaveDefaultDim(DATABASE::"Applicant Qualification", "No.", FieldNo, ShortcutDimCode);
        Modify();
    end;
}
