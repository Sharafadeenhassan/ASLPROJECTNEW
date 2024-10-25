/// <summary>
/// TableExtension Job Journal Line Ext (ID 50241) extends Record Job Journal Line.
/// </summary>
tableextension 50241 "Job Journal Line Ext" extends "Job Journal Line"
{
    fields
    {
        modify("Source Code")
        {
            TableRelation = IF ("External Document No." = FILTER(<> '')) Location WHERE("Location Type" = CONST(Vessel))
            else
            "Source Code";
        }
        modify("Work Type Code")
        {
            TableRelation = IF (Type = CONST(Item)) "Item Category"
            else
            "Work Type";
        }
        field(50299; "ASL Source Code"; Code[20])
        {
            TableRelation = Location WHERE("Location Type" = CONST(Vessel));
            trigger OnValidate()
            begin
                "Source Code" := "ASL Source Code";
            end;
        }
        field(50300; Catch; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate(Quantity, Catch * -1);

                if Item.Get("No.") then begin
                    Points := Item.Points;
                    "Unit Price" := Points;
                end;
                // "Source Code" := "Location Code";

                "Total Price" := "Unit Price" * Catch;
                "Reason Code" := 'CATCH';

                //Prepare data for Sorting
                if InvtPostGrp.Get(Code1) then
                    Groupsort := InvtPostGrp.Category
                else
                    Groupsort := '';
            end;
        }
        field(50301; Code1; Code[10])
        {
            TableRelation = Item;

            trigger OnValidate()
            begin
                Syntesis(Code1, Pack, Brand);
                //***GetItem();
                if ItemCat.Get(item."Item Category Code") then
                    "Task Code" := ItemCat."Parent Category";
            end;
        }
        field(50302; Pack; Code[5])
        {
            TableRelation = "Unit of Measure" WHERE("In Use" = CONST(true),
                                                     "Catch Code" = FILTER(<> ''));

            trigger OnValidate()
            begin
                Syntesis(Code1, Pack, Brand);
            end;
        }
        field(50303; Brand; Code[5])
        {
            TableRelation = "Reason Code" WHERE("In Use" = CONST(true),
                                                 Type = CONST(Brands));

            trigger OnValidate()
            begin
                Syntesis(Code1, Pack, Brand);
            end;
        }
        field(50316; "Statistics Group"; Integer)
        {
            Caption = 'Statistics Group';
        }
        field(50317; "Catch Total"; Decimal)
        {
            CalcFormula = Sum("Job Journal Line".Catch WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                              "Journal Batch Name" = FIELD("Journal Batch Name")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50318; "Catch Points"; Decimal)
        {
            CalcFormula = Sum("Job Journal Line"."Total Price" WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                                      "Journal Batch Name" = FIELD("Journal Batch Name")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50320; "Reconciliation Catch Quantity"; Decimal)
        {
        }
        field(50321; ROB; Decimal)
        {
            trigger OnValidate()
            begin
                //CALCFIELDS("Stock Position Calc.");
                if "Gen. Prod. Posting Group" in ['LB', 'AG', 'PK'] then begin
                    if ROB < 0 then
                        Error('Negative stock position not possible');
                    Validate(Quantity, StockTillDate(Rec) - ROB);
                    "ROB By" := UserId;
                end else
                    Error('Item Must Be LB,AG or PK to be able to EDit ROB');
            end;
        }
        field(50322; "Stock Position Calc."; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Location Code" = FIELD("Location Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50323; "Posted Catch"; Decimal)
        {
            CalcFormula = - Sum("Job Ledger Entry".Quantity WHERE("Job No." = FIELD("Job No."),
                                                                  "Posting Date" = FIELD("Posting Date"),
                                                                  Type = FIELD(Type),
                                                                  "No." = FIELD("No.")));
            DecimalPlaces = 0 : 2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50324; "Catch Sea Days"; Decimal)
        {
            Description = 'Total sea day on a day that there is a catch';
        }
        field(50330; "Work Type Code ASL"; Code[20])
        {
            Caption = 'Work Type Code ASL';
            DataClassification = AccountData;
            TableRelation = IF (Type = CONST(Item)) "Item Category"
            else
            "Work Type";

            trigger OnValidate()
            begin
                "Work Type Code" := "Work Type Code ASL";
            end;
        }
        field(50333; "Work Type Code Sort"; Code[15])
        {
            Caption = 'Work Type Code Sort';
            TableRelation = "Work Type";
            ValidateTableRelation = false;

            trigger OnValidate()
            begin
                if (Type = Type::Resource) and ("No." <> '') then
                    if WorkType.Get("Work Type Code") then
                        "Unit of Measure Code" := WorkType."Unit of Measure Code"
                    else begin
                        Res.Get("No.");
                        "Unit of Measure Code" := Res."Base Unit of Measure";
                    end; //FindResUnitCost; //FindResPrice;
            end;
        }
        field(50338; "Shrimp Points"; Decimal)
        {
            CalcFormula = Sum("Job Journal Line"."Total Price" WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                                      "Journal Batch Name" = FIELD("Journal Batch Name"),
                                                                      "Task Code" = CONST('SHR')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50339; "Fish Points"; Decimal)
        {
            CalcFormula = Sum("Job Journal Line"."Total Price" WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                                      "Journal Batch Name" = FIELD("Journal Batch Name"),
                                                                      "Task Code" = CONST('FIS')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50350; "ROB By"; Code[50])
        {
            Editable = false;
            TableRelation = User;
        }
        field(50351; Groupsort; Code[15])
        {
            Description = 'To Identify the Sorting Group';
        }
        field(50352; "Phase Code"; Code[30])
        {
        }
        field(50353; "Task Code"; Code[30])
        {
            TableRelation = Task;
        }
        field(50354; "Lock Qty"; Boolean)
        {
            Editable = false;
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionMembers = " ","Short Voyage ";
        }
        field(50356; "Shrimp Total"; Decimal)
        {
            CalcFormula = Sum("Job Journal Line".Catch WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                                      "Journal Batch Name" = FIELD("Journal Batch Name"),
                                                                      "Task Code" = CONST('SHR')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50357; "Fish Total"; Decimal)
        {
            CalcFormula = Sum("Job Journal Line".Catch WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                                      "Journal Batch Name" = FIELD("Journal Batch Name"),
                                                                      "Task Code" = CONST('FIS')));
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(ASLKey1; "Statistics Group") { }
        key(ASLKey1A; "Work Type Code")
        {
            SumIndexFields = Quantity;
        }
        key(ASLKey2; "Work Type Code Sort")
        {
            //    SumIndexFields = Quantity;
        }
        key(ASLKey3; "Posting Group")
        {
            SumIndexFields = "Total Cost", "Total Price";
        }

        //Unsupported feature: Property Insertion (SumIndexFields) on ""Journal Template Name","Journal Batch Name","Line No."(ASLKey)".
        //Unsupported feature: Property Insertion (SumIndexFields) on ""Journal Template Name","Journal Batch Name",Type,"No.","Unit of Measure Code","Work Type Code"(ASLKey)".
    }

    trigger OnAfterInsert()
    begin
        if Code1 <> '' then begin
            Syntesis(Code1, Pack, Brand);
            Validate("No.", ItemVar);
            Rec."Job Task No." := 'Temp';
        end;
    end;
    /*trigger OnAfterInsert()
    var
        JobBatchrec: Record "Job Journal Batch";    
    begin
    //if JobBatchrec.Get(Rec."Journal Template Name",Rec."Journal Batch Name") then
    //    if JobBatchrec."Lock Batch" then Error('You Cannot Add new Line to a Locked File')

    end;
    */
    trigger OnBeforeModify()
    var
        JobBatchrec: Record "Job Journal Batch";
    begin
        //if JobBatchrec.Get(Rec."Journal Template Name",Rec."Journal Batch Name") then
        if rec."Lock Qty" then Error('You Cannot Modify a Locked Record')
    end;

    trigger OnBeforeDelete()
    var
        JobBatchrec: Record "Job Journal Batch";
    begin
        //if JobBatchrec.Get(Rec."Journal Template Name",Rec."Journal Batch Name") then
        if rec."Lock Qty" then Error('You Cannot Delete Locked Line')
    end;

    var
        Item: Record Item;
        WorkType: Record "Work Type";
        Res: Record Resource;
        UOM: Record "Unit of Measure";
        items: Record Item;
        InvPostGrp: Record "Inventory Posting Group";
        InvtPostGrp: Record "Inventory Posting Group";
        UOMCd: Code[10];
        ItemVar: Code[10];
        ItemPoints: Record "Item Points";
        ItemFindPoints: Codeunit "Item-Find Point";
        Points: Decimal;
        JCatchDefa: Record "Job catch Default";
        JBat: Record "Job Journal Batch";
        i: Integer;
        JJLine: Record "Job Journal Line";
        ITVars: Code[10];
        Jobs: Record Job;
        Jobtask_No: Code[20];
        GLSetup: Record "General Ledger Setup";
        ItemCat: Record "Item Category";

    procedure ClearCatch()
    var
        //***DocPrint: Codeunit "Document-Print";
        Window: Dialog;
        RecCount: Integer;
        JobTask: Record "Job Task";
        ItemCat: Record "Item Category";
        ItemC: Record item;
    begin

        if JBat.Get("Journal Template Name", "Journal Batch Name") then begin
            //Job Journal Line Insertion
            i := 0;
            //Insert Default Catches for the Job
            JCatchDefa.SetCurrentKey(JCatchDefa."S/No.", JCatchDefa."Table Name", JCatchDefa."No.");
            JCatchDefa.SetRange(JCatchDefa."Table Name", JCatchDefa."Table Name"::Job);
            JCatchDefa.SetRange(JCatchDefa."No.", JBat."Job No.");
            if JCatchDefa.Find('-') then begin
                Window.Open('Clearing Catch Record(s)...Please wait.\' +
                            'No of Records  #1########\' +
                            'Count          #2########');
                RecCount := JCatchDefa.Count;
                Window.Update(1, RecCount);
                repeat
                    i := i + 1;
                    Window.Update(2, i);
                    JJLine.Init();
                    JJLine."Journal Template Name" := "Journal Template Name";
                    if "Journal Template Name" = 'RECURRING' then begin
                        JJLine."Recurring Method" := 2;
                        if Evaluate(JJLine."Recurring Frequency", '1D') then;
                    end;

                    JJLine."Journal Batch Name" := "Journal Batch Name";
                    JJLine.Validate(JJLine."Job No.", JBat."Job No.");
                    JJLine."Posting Date" := JBat."Catch Date";
                    JJLine."Document Date" := JBat."Catch Date";
                    JJLine."Phase Code" := JBat."Fishing Ground";
                    JJLine."Document No." := JBat.Name + Format(JBat."Catch Date");
                    JJLine.Type := JJLine.Type::Item;
                    JJLine."Line No." := i * 10000;
                    JJLine.Code1 := JCatchDefa.Code;
                    JJLine.Pack := JCatchDefa."Pack Size";
                    JJLine.Brand := JCatchDefa.Brand;
                    if UOM.Get(JJLine.Pack) then UOMCd := UOM."Catch Code"; //Get Unit of measure Code
                    ITVars := Format(JJLine.Code1) + UOMCd + CopyStr(JJLine.Brand, 1, 1);   //Requip Code Name
                    JJLine.Validate(JJLine."No.", ITVars);
                    ItemC.Get(JJLine."No.");
                    if ItemCat.Get(ItemC."Item Category Code") then begin
                        if ItemCat."Parent Category" <> '' then
                            JJLine.Validate("Task Code", ItemCat."Parent Category")
                        else
                            JJLine.Validate("Task Code", ItemCat.code);
                    end else
                        JJLine.Validate("Task Code", ItemC."Item Category Code");
                    JJLine.Validate("Unit Price", itemC.Points);
                    JJLine.Validate(JJLine."Location Code", JBat.Name);
                    JJLine."Statistics Group" := ItemC."Statistics Group";
                    if JobTask.FindFirst() then
                        Jobtask_No := JobTask."Job Task No.";
                    JJLine.Validate("Job Task No.", Jobtask_No);
                    if Jobs.Get(JBat."Job No.") then
                        JJLine."Catch Sea Days" := JBat."Catch Date" - Jobs."Starting Date";
                    //JJLine."Step Code":=FORMAT(JBat."Sea Temperature"); //AA
                    if items.Get(ITVars) then
                        if items."Unit Cost" <> 0 then
                            JJLine.Validate(JJLine."Unit Cost", items."Unit Cost")
                        else
                            JJLine.Validate(JJLine."Unit Cost", items.Points);
                    JJLine.Validate(JJLine."Unit Cost", 0); //AAA-Sept 30, 2002 Unit cost must be zero
                    JJLine.Validate(JJLine."Shortcut Dimension 2 Code", JBat."Global Dimension 2 Code");
                    JJLine."Phase Code" := JBat."Fishing Ground"; //AA
                    JJLine."Source Code" := JBat."Fishing Ground";
                    JobTask.SetRange("Job No.", "Job No.");
                    if JobTask.FindFirst() then
                        Jobtask_No := JobTask."Job Task No.";
                    JJLine.Validate("Job Task No.", Jobtask_No);
                    if not JJLine.Insert(true) then JJLine.Modify(true);
                until JCatchDefa.Next() = 0;
                Window.Close();
            end else
                Error('No Default Job Line for %1 To Update', JBat."Job No.");
        end;
    end;

    procedure ClearCatchUpdate()
    var
        //***DocPrint: Codeunit "Document-Print";
        Window: Dialog;
        RecCount: Integer;
        JobTask: Record "Job Task";
    begin
        //Batch introduced by SHOD
        if JBat.Get("Journal Template Name", "Journal Batch Name") then begin
            //Job Journal Line Update
            i := 0;
            JJLine.SetRange(JJLine."Journal Template Name", JBat."Journal Template Name");
            JJLine.SetRange(JJLine."Journal Batch Name", JBat.Name);
            if JJLine.Find('-') then begin
                Window.Open('Clearing Catch Record(s)...Please wait.\' +
                            'No of Records  #1########\' +
                            'Count          #2########');
                RecCount := JJLine.Count;
                Window.Update(1, RecCount);
                repeat
                    i := i + 1;
                    Window.Update(2, i);
                    JJLine."Posting Date" := JBat."Catch Date";
                    JJLine."Document Date" := JBat."Catch Date";
                    JJLine."Phase Code" := JBat."Fishing Ground";
                    JJLine."Document No." := JBat.Name + Format(JBat."Catch Date");
                    JJLine.Type := JJLine.Type::Item;
                    if Jobs.Get(JBat."Job No.") then
                        JJLine."Catch Sea Days" := JBat."Catch Date" - Jobs."Starting Date";
                    JJLine.Validate(JJLine.Catch, 0);
                    if items.Get(JJLine."No.") then begin
                        JJLine."Statistics Group" := items."Statistics Group";
                        if items."Unit Cost" <> 0 then
                            JJLine.Validate(JJLine."Unit Cost", items."Unit Cost")
                        else
                            JJLine.Validate(JJLine."Unit Cost", items.Points);
                    end;
                    JJLine.Validate(JJLine."Unit Cost", 0);  // Unit cost must be zero
                    JJLine.Validate(JJLine."Shortcut Dimension 2 Code", JBat."Global Dimension 2 Code");
                    JJLine."Phase Code" := JBat."Fishing Ground";
                    JJLine."Source Code" := JBat."Fishing Ground";
                    JJLine."Job No." := JBat."Job No.";
                    JJLine."Posting Date" := JBat."Catch Date";
                    JobTask.SetRange("Job No.", JBat."Job No.");
                    if JobTask.FindFirst() then
                        Jobtask_No := JobTask."Job Task No.";
                    JJLine.Validate("Job Task No.", Jobtask_No);
                    JJLine.Modify(true);
                until JJLine.Next() = 0;
                Window.Close();
            end;
        end;
    end;

    procedure FindItemPoints()
    begin
        ItemPoints.Init();
        ItemPoints."Item No." := "No.";
        ItemPoints."Price Group Code" := "Customer Price Group";
        ItemPoints."Unit of Measure Code" := "Unit of Measure Code";
        ItemPoints."Starting Date" := "Posting Date";
        ItemFindPoints.Run(ItemPoints);
        ItemPoints.TestField("Price Includes VAT", false);
        //***GetGLSetup;
        "Unit Price" := ItemPoints."Unit Price";
        if ItemPoints."Unit of Measure Code" = '' then
            "Unit Price" :=
              Round(
                "Unit Price" * "Qty. per Unit of Measure",
                GLSetup."Unit-Amount Rounding Precision");
        Validate("Unit Price");
    end;

    procedure FindItemPrice()

    begin
        /*
		FindSalesLinePrice.INIT;
		FindSalesLinePrice."Item No." := "No.";
		//ItemPrice."Price Group Code" := "Price Group Code";
		FindSalesLinePrice."Sales Code" := "Customer Price Group";
		FindSalesLinePrice."Unit of Measure Code" := "Unit of Measure Code";
		FindSalesLinePrice."Starting Date" := "Posting Date";
		PriceCalcMgt.RUN(FindSalesLinePrice);
		ItemPrice.TESTFIELD("Price Includes VAT",FALSE);
		GetGLSetup;
		"Unit Price" := ItemPrice."Unit Price";
		IF ItemPrice."Unit of Measure Code" = '' THEN
		  "Unit Price" :=
			ROUND(
			  "Unit Price" * "Qty. per Unit of Measure",
			  GLSetup."Unit-Amount Rounding Precision");
		VALIDATE("Unit Price");
		*/
    end;

    procedure StockTillDate(JJLn: Record "Job Journal Line"): Decimal
    var
        Items: Record Item;
    begin
        if Items.Get(JJLn."No.") then begin
            Items.SetFilter(Items."Location Filter", JJLn."Location Code");
            Items.SetFilter(Items."Date Filter", '..%1', JJLn."Posting Date");
            Items.CalcFields(Items.Inventory);
            exit(Items.Inventory / JJLn."Qty. per Unit of Measure");
        end else
            exit(99999);
    end;

    procedure Syntesis(Cd: Code[10]; Pk: Code[10]; Br: Code[10]) Itemno: Code[10]
    begin
        //Syntesis Item Code Name
        //Get Unit of measure Code
        if UOM.Get(Pk) then UOMCd := UOM."Catch Code";
        //Requip Code Name
        ItemVar := Format(Cd) + UOMCd + CopyStr(Br, 1, 1);
        "No." := ItemVar;
    end;

    procedure WorkTypeCode(var Nos: Code[10])
    begin
        if items.Get(Nos) then
            if InvPostGrp.Get(items."Inventory Posting Group") then
                "Work Type Code Sort" := InvPostGrp.Category;
    end;
}