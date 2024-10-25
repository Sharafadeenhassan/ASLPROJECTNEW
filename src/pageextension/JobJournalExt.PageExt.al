pageextension 50242 "Job Journal Ext" extends "Job Journal"
{
    layout
    {
        modify("Line Type") { Visible = false; }
        modify("Document No.") { Visible = false; }
        modify("Job No.") { Visible = false; }
        modify("Job Task No.") { Visible = true;}
        modify(Type) { Visible = false; }
        modify("Unit of Measure Code") { Visible = false; }
        modify("Unit Cost") { Visible = false; }
        modify("Total Cost") { Visible = false; }
        modify("Unit Price") { Visible = false; }
        modify("Work Type Code") { Visible = false; }

        addafter(CurrentJnlBatchName)
        {
            field("Copy From Vessel"; "Copy From  Vesel")
            {
                Importance = Additional;
                TableRelation = "Job Journal Batch".Name;
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Work Type Code ASL"; Rec."Work Type Code ASL")
            {
                ApplicationArea = all;
            }
            field("Task Code";"Task Code")
            {
                ApplicationArea = All;
            }
        }
        addafter(Quantity)
        {
            field("ASL Source Code"; Rec."ASL Source Code")
            {
                Caption = 'Change Source Code';
                ApplicationArea = All;
            }
            field(Catch; Rec.Catch) { ApplicationArea = All; }
            field("Stock Position Calc."; Rec."Stock Position Calc.") { ApplicationArea = All; }
            field("Posting Group"; Rec."Posting Group") { ApplicationArea = All; }
            field("Catch Sea Days";"Catch Sea Days"){ApplicationArea = All;}
        }
        addafter("Gen. Prod. Posting Group")
        {
            field(Groupsort; Rec.Groupsort)
            {
                Importance = Additional;
                ApplicationArea = All;
            }
            field("Reason Code"; Rec."Reason Code") { ApplicationArea = All; }
            field(ROB; Rec.ROB) { ApplicationArea = All; }
        }
        addafter("Total Cost (LCY)")
        {
            field("Source Code"; Rec."Source Code")
            {
                ApplicationArea = All;
                Editable = True;
            }
        }
        addafter("Shortcut Dimension 2 Code")
        {
            field(ASLShortcutDimCode3; ShortcutDimCode[3])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,3';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                              "Dimension Value Type" = CONST(Standard),
                                                              Blocked = CONST(false));
                Visible = DimVisible3;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(3, ShortcutDimCode[3]);

                    //***P   OnValidateShortcutDimCode(Rec, ShortcutDimCode, 3);
                end;
            }
            field(ASLShortcutDimCode4; ShortcutDimCode[4])
            {
                ApplicationArea = Dimensions;
                CaptionClass = '1,2,4';
                TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                              "Dimension Value Type" = CONST(Standard),
                                                              Blocked = CONST(false));
                Visible = DimVisible4;

                trigger OnValidate()
                begin
                    Rec.ValidateShortcutDimCode(4, ShortcutDimCode[4]);

                    //***P OnValidateShortcutDimCode(Rec, ShortcutDimCode, 4);
                end;
            }
        }
        addafter(AccName)
        {
            field("Reconciliation Catch Quantity"; Rec."Reconciliation Catch Quantity")
            {
                ApplicationArea = All;
            }
        }
        moveafter(Description; Quantity)
    }
    actions
    {
        modify("P&ost")
        {
            trigger OnBeforeAction()
            begin
                Rec.SetFilter(Quantity, '<>%1', 0);
                Rec.SetRange("Location Code");
            end;

            trigger OnAfterAction()
            begin
                Rec.SetRange(Quantity);
                Catigo();
                if (User."Global Dimension 2 Code" <> 'MRKT') then
                    Rec.SetRange("Location Code", 'CRM-ASL');
            end;
        }
        modify("Post and &Print")
        {
            trigger OnBeforeAction()
            begin
                Rec.SetFilter(Quantity, '<>%1', 0);
                Rec.SetRange("Location Code");
            end;

            trigger OnAfterAction()
            begin
                Rec.SetRange(Quantity);
                Catigo();
                if (User."Global Dimension 2 Code" <> 'MRKT') then
                    Rec.SetRange("Location Code", 'CRM-ASL');
            end;
        }

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CODEUNIT.Run(CODEUNIT::"Job Jnl.-Post",Rec);
        CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
        CurrPage.Update(false);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SetFilter(Quantity,'<>%1',0);
        SetRange("Location Code");
        CODEUNIT.Run(CODEUNIT::"Job Jnl.-Post",Rec);  //standard
        //SETRANGE(Quantity,0,0);
        //DELETEALL;

        SetRange(Quantity);
        CurrentJnlBatchName := GetRangeMax("Journal Batch Name");  //standard
        CurrPage.Update(false);        //standard
        Catigo;
        if (User."Global Dimension 2 Code"<>'MRKT') then
            SetRange("Location Code",'CRM-ASL');
        */
        //end;
        addafter(SuggestLinesFromTimeSheets)
        {
            action("Fish Caught/Reconciliation")
            {
                Caption = 'Fish Caught/Reconciliation';
                Image = Reconcile;
                ApplicationArea = All;
                // RunObject = report "Vessel Catches";
                trigger OnAction()
                var
                    GenPurpose: Codeunit "General Purpose Codeunit";
                begin
                    GenPurpose.PrintVesselCatches(Rec);
                    // GenPurpose.PrintJobJnlLine(Rec);
                end;
            }
            action("Initialize Vessel from A Copy")
            {
                Image = CopyWorksheet;
                Promoted = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CopyVessel();
                end;
            }
            action("------------------------")
            {
                Caption = 'Separator';
                ApplicationArea = All;
            }
        }
    }

    //Unsupported feature: Property Modification (Length) on "CurrentJnlBatchName(Variable 1005)".

    //var
    //>>>> ORIGINAL VALUE:
    //CurrentJnlBatchName : 10;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CurrentJnlBatchName : 20;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "DimVisible1(Variable 1016)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimVisible1 : 1016;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimVisible1 : 1116;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "DimVisible2(Variable 1015)".//

    //var
    //>>>> ORIGINAL VALUE:
    //DimVisible2 : 1015;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimVisible2 : 1115;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "DimVisible3(Variable 1014)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimVisible3 : 1014;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimVisible3 : 1114;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "DimVisible4(Variable 1013)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimVisible4 : 1013;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimVisible4 : 1113;
    //Variable type has not been exported.

    //Unsupported feature: Property Modification (Id) on "DimVisible5(Variable 1012)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimVisible5 : 1012;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimVisible5 : 1112;
    //Variable type has not been exported.

    var
        User: Record "User Setup";
        Category: Option " ",HON,HDLS,OTHER,"LOCAL";
        JBat: Record "Job Journal Batch";
        i: Integer;
        JobcatchDefault: Record "Job catch Default";
        JobJournalLine: Record "Job Journal Line";
        UnitofMeasure: Record "Unit of Measure";
        UnitofMeasureCd: Code[10];
        ITVars: Code[10];
        Jobs: Record Job;
        Items: Record Item;
        "Copy From  Vesel": Code[20];

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    ShowShortcutDimCode(ShortcutDimCode);
    if (Catch=0) and ("Location Code"='CRM-ASL') then Validate(Catch);
    */
    //end;

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeOpenPage(Rec,CurrentJnlBatchName);

    IsSaasExcelAddinEnabled := ServerConfigSettingHandler.GetIsSaasExcelAddinEnabled;
    #4..14
    if not JnlSelected then
      Error('');
    JobJnlManagement.OpenJnl(CurrentJnlBatchName,Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..17

    if User.Get(UserId) then begin
       if (User."Global Dimension 2 Code" <> 'MRKT') and (User.Category = User.Category:: Export) then
        if User."JrnllineShowCRM-ASL"=true then
          "Location Code":='CRM-ASL'
        end;
    */
    //end;

    procedure Catigo()
    begin
        Rec.SetRange("Statistics Group", Category);
        CurrPage.Update(false);
        if (User."Global Dimension 2 Code" <> 'MRKT') then
            case User.Category of
                1:

                    case Category of
                        0, 4:
                            Rec.SetRange("Statistics Group", 1, 3);
                        1:
                            Rec.SetRange("Statistics Group", 1);
                        2:
                            Rec.SetRange("Statistics Group", 2);
                        3:
                            Rec.SetRange("Statistics Group", 3);
                    end;
                2:

                    case Category of
                        0, 1, 2, 3:
                            Rec.SetRange("Statistics Group", 4);
                        4:
                            Rec.SetRange("Statistics Group", 4);
                    end;
            end;
    end;

    local procedure ClearCatch()
    var
        //doprint: Codeunit "Document-Print";
        window: Dialog;
        RecCount: Integer;
    begin

        if JBat.Get(Rec."Journal Template Name", Rec."Journal Batch Name") then begin
            //Job Journal Line Insertion
            i := 0;
            //Insert Default Catches for the Job JobcatchDefault.SetCurrentKey(JobcatchDefault."S/No.", JobcatchDefault."Table Name", JobcatchDefault."No.");
            JobcatchDefault.SetRange(JobcatchDefault."Table Name", JobcatchDefault."Table Name"::Job);
            JobcatchDefault.SetRange(JobcatchDefault."No.", JBat."Job No.");
            if JobcatchDefault.Find('-') then begin
                window.Open('Clearing Catch Record(s)...Please wait.\' +
                            'No of Records  #1########\' +
                            'Count          #2########');

                RecCount := JobcatchDefault.Count;
                window.Update(1, RecCount);
                repeat
                    i := i + 1;
                    window.Update(2, i);
                    JobJournalLine.Init();
                    JobJournalLine."Journal Template Name" := Rec."Journal Template Name";
                    if Rec."Journal Template Name" = 'RECURRING' then begin
                        JobJournalLine."Recurring Method" := 2;
                        if Evaluate(JobJournalLine."Recurring Frequency", '1D') then;
                    end;

                    JobJournalLine."Journal Batch Name" := Rec."Journal Batch Name";
                    JobJournalLine.Validate(JobJournalLine."Job No.", JBat."Job No.");
                    JobJournalLine."Posting Date" := JBat."Catch Date";
                    JobJournalLine."Document Date" := JBat."Catch Date";
                    JobJournalLine."Document No." := JBat.Name + Format(JBat."Catch Date");
                    JobJournalLine.Type := JobJournalLine.Type::Item;
                    JobJournalLine."Line No." := i * 10000;
                    JobJournalLine.Code1 := JobcatchDefault.Code;
                    JobJournalLine.Pack := JobcatchDefault."Pack Size";
                    JobJournalLine.Brand := JobcatchDefault.Brand;
                    JobJournalLine."Job Task No." := 'Temp';
                    if UnitofMeasure.Get(JobJournalLine.Pack) then UnitofMeasureCd := UnitofMeasure."Catch Code"; //Get Unit of measure Code
                    ITVars := Format(JobJournalLine.Code1) + UnitofMeasureCd + CopyStr(JobJournalLine.Brand, 1, 1);   //Requip Code Name
                    JobJournalLine.Validate(JobJournalLine."No.", ITVars);         //Updates JobJournalLine."Task Code"
                    JobJournalLine.Validate(JobJournalLine."Location Code", JBat.Name);
                    //JobJournalLine."Phase Code":=JBat."Fishing Ground";
                    JobJournalLine."Source Code" := JBat."Fishing Ground";
                    if Jobs.Get(JBat."Job No.") then
                        JobJournalLine."Catch Sea Days" := JBat."Catch Date" - Jobs."Starting Date";

                    //JobJournalLine."Step Code":=FORMAT(JBat."Sea Temperature");
                    if Items.Get(ITVars) then
                        if Items."Unit Cost" <> 0 then
                            JobJournalLine.Validate(JobJournalLine."Unit Cost", Items."Unit Cost")
                        else
                            JobJournalLine.Validate(JobJournalLine."Unit Cost", Items.Points);
                    JobJournalLine.Validate(JobJournalLine."Unit Cost", 0); //AAA-Sept 30, 2002 Unit cost must be zero
                    JobJournalLine.Validate(JobJournalLine."Shortcut Dimension 2 Code", JBat."Global Dimension 2 Code");
                    if not JobJournalLine.Insert() then JobJournalLine.Modify();
                until JobcatchDefault.Next() = 0;
                window.Close();
            end;
        end;
        CurrPage.Update(false);
    end;

    local procedure CopyVessel()
    var
        JobJnlLineCopy: Record "Job Journal Line";
    begin
        if "Copy From  Vesel" <> '' then
            JobJournalLine.SetRange(JobJournalLine."Journal Batch Name", "Copy From  Vesel");
        if JobJournalLine.FindFirst() then
            repeat
                JobJnlLineCopy.Init();
                JobJnlLineCopy.TransferFields(JobJournalLine);
                ///***P JobJnlLineCopy."Journal Batch Name" := CurrentJnlBatchName;
                if not JobJnlLineCopy.Insert() then JobJnlLineCopy.Modify();
            until JobJournalLine.Next() = 0;
        Message('Line Coppied from Vessel %1', "Copy From  Vesel");
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Rec."Lock Qty" then
            if (Rec."No." <> xRec."No.") or (Rec.Quantity <> xRec.Quantity) or (Rec.Description <> xRec.Description) then
                Error('You Can Not Modify Line Generated from Requisition');
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Lock Qty" then Error('You Can Not Delete Line Generated from Requisition');
    end;
}