tableextension 50247 "tableextension50247" extends "Job Journal Batch"
{
    //Unsupported feature: Property Insertion (Permissions) on ""Job Journal Batch"(Table 237)".
    fields
    {
        //Unsupported feature: Property Modification (Data type) on ""Journal Template Name"(Field 1)".

        modify(Name)
        {
            //Unsupported feature: Property Modification (Data type) on "Name(Field 2)".

            TableRelation = IF ("Journal Template Name" = CONST('RECURRING')) Location WHERE("Location Type" = CONST(Vessel));
        }

        //Unsupported feature: Code Insertion on "Name(Field 2)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*

        if FA.Get(Name) then
          "Global Dimension 2 Code":=FA."Global Dimension 2 Code";
        if locat.Get(Name) then "Vessel Name":=locat.Name;
        */
        //end;
        field(50300; "Voyage No."; Code[10])
        {
        }
        field(50301; "Catch Date"; Date)
        {
            trigger OnValidate()
            var JobJour : Record "Job Journal Line";
                PostJob: Codeunit "Job Jnl.-Post line";
            begin
                //Report Daily Variables
                if "Catch Date" > Today then Error('Catch date cannot be in the future');
                OPDailyRad.Init();
                OPDailyRad.Date := "Catch Date";
                OPDailyRad.Name := Name;
                OPDailyRad.Description := Description;
                OPDailyRad."Reason Code" := "Reason Code";
                OPDailyRad."Voyage No." := "Voyage No.";
                OPDailyRad."Catch Date" := "Catch Date";
                OPDailyRad."Fishing Ground" := "Fishing Ground";
                OPDailyRad."Sea Temperature" := "Sea Temperature";
                OPDailyRad."Job No." := "Job No.";
                OPDailyRad."Global Dimension 2 Code" := "Global Dimension 2 Code";
                OPDailyRad."Fish Hold Temp" := "Fish Hold Temp";
                OPDailyRad."Fuel Balance" := "Fuel Balance";
                OPDailyRad."R.P.M." := "R.P.M.";
                if jobs.Get("Job No.") then
                    OPDailyRad."Catch Sea Days" := "Catch Date" - jobs."Starting Date";

                if not OPDailyRad.Insert() then OPDailyRad.Modify();

                //No Catch Reports Skipper 
                // Imsert by SSNL for License to run
            JobJour.Init();
            JobJour."Journal Template Name" := "Journal Template Name";
            JobJour."Journal Batch Name" := Name;
            JobJour."Line No." := 1000;
            JobJour."Job No." := "Job No.";
            JobJour."Posting Date" := "Catch Date";
            JobJour."Document Date" := "Catch Date";
            JobJour."Document No." := Name + Format("Catch Date");
            JobJour.Type := JobJour.Type::Resource;
            if jobs.Get("Job No.") then begin
                    JobJour.Validate("No.", jobs."Person Responsible");
                    JobJour."Catch Sea Days" := "Catch Date" - jobs."Starting Date";
                end;
                JobJour.Quantity := 1;
                JobJour."Unit of Measure Code" := 'DAY';
                JobJour."Job Task No." := 'TEMP';
                JobJour."Location Code" := Name;
                //JLedEntry.Chargeable:=FALSE;
                JobJour."Source Code" := 'Direct';
                JobJour."Entry Type" := 0;
                JobJour."Phase Code" := "Fishing Ground";
                JobJour.Mark(true);                
                if jobs.Get("Job No.") then
                    JobJour."Catch Sea Days" := "Catch Date" - jobs."Starting Date";
                //JobJour.Get(MarkedOnly);
               // If Confirm('This will calculate Catch Sea days and Register the Skipper',false,'Continue Register','Check Again') then
                  PostJob.RUN(JobJour);
                 //else
                 //Error('Please Check and Enter Catch Date Again'); 


               /*if JLedEntry.FindLast() then "LastNo." := JLedEntry."Entry No.";
                JLedEntry.Init();
                JLedEntry."Job No." := "Job No.";
                JLedEntry."Posting Date" := "Catch Date";
                JLedEntry."Document No." := Name + Format("Catch Date");
                JLedEntry.Type := JLedEntry.Type::Resource;
                if jobs.Get("Job No.") then begin
                    JLedEntry.Validate("No.", jobs."Person Responsible");

                    JLedEntry2."Catch Sea Days" := "Catch Date" - jobs."Starting Date";
                end;
                JLedEntry.Quantity := 1;
                JLedEntry."Unit of Measure Code" := 'DAY';
                JLedEntry."Job Task No." := 'TEMP';
                JLedEntry."Location Code" := Name;
                //JLedEntry.Chargeable:=FALSE;
                JLedEntry."User ID" := UserId;
                JLedEntry."Source Code" := 'Direct';
                JLedEntry."Entry Type" := 0;
                JLedEntry."Entry No." := "LastNo." + 1;
                JLedEntry."Phase Code" := "Fishing Ground";
                if jobs.Get("Job No.") then
                    JLedEntry."Catch Sea Days" := "Catch Date" - jobs."Starting Date";
                //JLedEntry."Step Code":=FORMAT("Sea Temperature");
                JLedEntry2.SetRange(JLedEntry2."Job No.", "Job No.");
                JLedEntry2.SetRange(JLedEntry2."Posting Date", "Catch Date");
                JLedEntry2.SetRange(JLedEntry2.Type, 0);
                if JLedEntry2.Find('-') then begin
                    if JLedEntry3.Get(JLedEntry3."Entry No.") then
                        JLedEntry3."Entry No." := JLedEntry2."Entry No.";
                    if not JLedEntry.Modify() then Message('System in Use by other users, request them to shut down');
                end
                else
                    JLedEntry.Insert();
*/
                locat.SetRange(locat.Code, Rec.Name);
                if locat.FindFirst() then
                    locat."Catch Date" := Rec."Catch Date";
            end;
        }
        field(50303; "Fishing Ground"; Code[30])
        {
            TableRelation = "Job Task"."Job Task No.";

            trigger OnValidate()
            begin
                //"Catch Date":=TODAY;
                if JobsRec.Get("Job No.") then
                    if JobsRec."Voyage Ended" then Message('You may not post on Ended Voyage');
            end;
        }
        field(50304; "Sea Temperature"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                //"Catch Date":=TODAY;
                if JobsRec.Get("Job No.") then
                    if JobsRec."Voyage Ended" then Message('You may not post on Ended Voyage');
            end;
        }
        field(50305; "Job No."; Code[20])
        {
            TableRelation = Job WHERE(Vessel = FIELD(Name),
                                       Status = FILTER(2));

            trigger OnValidate()
            begin
                //"Catch Date":=TODAY;
                if User.Get(UserId) then
                    "Global Dimension 2 Code" := User."Global Dimension 2 Code";

                if JobsRec.Get("Job No.") then begin
                    //JobsRec.CALCFIELDS(JobsRec."Fishing Area",JobsRec."Sea Temperature");
                    JobsRec."Fishing Area" := JobsRec.FishArea("Job No.", '', "Global Dimension 2 Code", '',
                      '', '', '', '', '', '');
                    JobsRec."Sea Temperature" := JobsRec.SeaTemperature("Job No.", '', "Global Dimension 2 Code", '',
                    '', '', '', '', '', '');
                    "Voyage No." := JobsRec."Voyage No.";
                    "Global Dimension 2 Code" := JobsRec."Global Dimension 2 Code";
                    "Fishing Ground" := JobsRec."Fishing Area";
                    if Evaluate("Sea Temperature", JobsRec."Sea Temperature") then;
                end;
                locat.SetRange(locat.Code, Rec.Name);
                if locat.FindFirst() then
                    locat."Catch Date" := Rec."Catch Date";
                /*IF NOT locat.MODIFY(TRUE) THEN
                  locat.INSERT;*///nitin
            end;
        }
        field(50317; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            NotBlank = true;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50318; "Init Journal"; Boolean)
        {
            InitValue = false;
        }
        field(50320; "Fish Hold Temp"; Decimal)
        {
            trigger OnValidate()
            begin
                //"Catch Date":=TODAY;
            end;
        }
        field(50322; "Fuel Balance"; Decimal)
        {
            trigger OnValidate()
            begin
                //"Catch Date":=TODAY;
                if JobsRec.Get("Job No.") then
                    if JobsRec."Voyage Ended" then Message('You may not post on Ended Voyage');
                locat.SetRange(locat.Code, Rec.Name);
                if locat.FindFirst() then
                    locat."Catch Date" := Rec."Catch Date";
                /*IF NOT locat.MODIFY(TRUE) THEN
                  locat.INSERT;*///nitin
            end;
        }
        field(50323; "R.P.M."; Decimal)
        {
            trigger OnValidate()
            begin
                //"Catch Date":=TODAY;
            end;
        }
        field(50324; "Vessel Name"; Text[30])
        {
        }
        field(50325; "Batch Type"; Option)
        {
            OptionMembers = ,EXPT,MRKT,CONS;
        }
        field(50326; Posted; Boolean)
        {
        }
        field(50327; Speed; Decimal)
        {
        }
        field(50328; "Lock Batch"; Boolean)
        {
        }
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LockTable;
    JobJnlTemplate.Get("Journal Template Name");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //LOCKTABLE;//nitin
    JobJnlTemplate.Get("Journal Template Name");
    */
    //end;

        trigger OnBeforeModify()
        begin
           if rec."Lock Batch" then Error('You Cannot Modify Locked Job Batch')
        end;
        trigger OnBeforeDelete()
        begin
            if rec."Lock Batch" then error('You Cannot Delete Locked Job Batch')
        end;
    var
        User: Record "User Setup";
        JobsRec: Record Job;
        jobs: Record Job;
        JLedEntry: Record "Job Ledger Entry";
        JLedEntry2: Record "Job Ledger Entry";
        JLedEntry3: Record "Job Ledger Entry";
        OPDailyRad: Record "Operation Daily Radio";
        "LastNo.": Integer;
        locat: Record Location;
       
}
