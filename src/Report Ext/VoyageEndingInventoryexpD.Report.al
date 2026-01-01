/// <summary>
/// Report Voyage Ending Inventory expD (ID 50032).
/// </summary>
report 50032 "Voyage Ending Inventory expD"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ReportRdlc/VoyageEndingInventoryexpD.rdlc';
    Permissions =
        tabledata "Inventory Posting Group" = R,
        tabledata Item = R,
        tabledata "Item Category" = R,
        tabledata Job = R,
        tabledata "Job Journal Batch" = RIMD,
        tabledata "Job Journal Line" = RIM,
        tabledata "Job Planning Line" = R,
        tabledata "Job Task" = R,
        tabledata Location = R,
        tabledata Resource = RM;
    Caption = 'Voyage Ending Inventory expD';
    dataset
    {
        dataitem(Job; Job)
        {
            RequestFilterFields = "No.", Points, "Ending Date";
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(USERID; UserId)
            {
            }
            column(Job__No__; "No.")
            {
            }
            column(Job__Starting_Date_; "Starting Date")
            {
            }
            column(Job__Ending_Date_; "Ending Date")
            {
            }
            column(Job_Vessel; Vessel)
            {
            }
            column(Job__Global_Dimension_2_Code_; "Global Dimension 2 Code")
            {
            }
            column(JobCaption; JobCaptionLbl)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(Calculated_Inventory_on_BoardCaption; Calculated_Inventory_on_BoardCaptionLbl)
            {
            }
            column(Job__No__Caption; FieldCaption("No."))
            {
            }
            column(Job__Starting_Date_Caption; FieldCaption("Starting Date"))
            {
            }
            column(Job__Ending_Date_Caption; FieldCaption("Ending Date"))
            {
            }
            column(Job_VesselCaption; FieldCaption(Vessel))
            {
            }
            column(Job__Global_Dimension_2_Code_Caption; FieldCaption("Global Dimension 2 Code"))
            {
            }
            column(Job_Bill_to_Customer_No_; "Bill-to Customer No.")
            {
            }
            dataitem(Item; Item)
            {
                DataItemLink = "Location Filter" = FIELD(Vessel);
                DataItemTableView = SORTING("No.") WHERE("Statistics Group" = FILTER(0 .. 3), "Gen. Prod. Posting Group" = CONST('FIS'), Inventory = FILTER(<> 0));
                RequestFilterFields = "No.";
                column(Item_No; "No.")
                {
                }
                column(Item_Description; Description)
                {
                }
                column(Item_Location_Filter; "Location Filter")
                {
                }
                column(Inventory_Item; Item.Inventory)
                {
                }

                trigger OnAfterGetRecord()
                begin

                    if (Selection = 1) or (Selection = 3)
                    then
                        MakeLines(Item, 1);
                    Item.CalcFields(Inventory);
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Date Filter", 0D, Job."Ending Date");
                    if (Selection = 1) or (Selection = 3) then MakeBatch(1);
                end;
            }
            dataitem(ItemMrkt; Item)
            {
                DataItemLink = "Location Filter" = FIELD(Vessel);
                DataItemTableView = SORTING("No.") WHERE("Statistics Group" = FILTER(4), "Gen. Prod. Posting Group" = CONST('FIS'));
                column(ItemMrkt__No__; "No.")
                {
                }
                column(ItemMrkt_Description; Description)
                {
                }
                column(ItemMrkt_Inventory; Inventory)
                {
                }
                column(ItemMrkt_Location_Filter; "Location Filter")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if (Selection = 2) or (Selection = 3)
                       then
                        MakeLines(ItemMrkt, 2);
                end;

                trigger OnPreDataItem()
                begin
                    SetRange("Date Filter", 0D, Job."Ending Date");

                    if (Selection = 2) or (Selection = 3)
                      then
                        MakeBatch(2);
                end;
            }
            dataitem("Job Planning Line"; "Job Planning Line")
            {
                DataItemLink = "Job No." = FIELD("No.");
                DataItemTableView = SORTING("Allocation %", "Resource Group") ORDER(Descending) WHERE(Type = CONST(Resource));
                column(Job_Planing_Line__No__; "Job Planning Line"."No.")
                {
                }
                column(Job_Planning_line__Resource_Group_; "Job Planning Line"."Resource Group")
                {
                }
                column(Resource_on_BoardCaption; Resource_on_BoardCaptionLbl)
                {
                }
                column(Job_Ledger_Entry__No__Caption; FieldCaption("No."))
                {
                }
                column(Job_Ledger_Entry__Resource_Group_Caption; FieldCaption("Resource Group"))
                {
                }
                column(Job_Planning_line_Job_No_; "Job Planning Line"."Job No.")
                {
                }
                column(Job_Ledger_Entry_Phase_Code; "Job Planning Line"."Job Task No.")
                {
                }
                column(Job_Ledger_Entry_Type; Type)
                {
                }
                column(Job_Budget_Line_Variant_Code; "Variant Code")
                {
                    IncludeCaption = true;
                }
                column(Line_N0_Job_planning_Line; "Job Planning Line"."Line No.")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if Selection = 2 then begin
                        if RES.Get("No.") then begin
                            RES.Posted := false;
                            RES.Modify();
                            "Ended Voyage" := true;
                            Validate("Ending Date", Job."Ending Date");
                            Modify();
                        end;
                        if JobJB.Get('RECURRING', Job.Vessel) then JobJB.Delete();
                    end
                    else
                        CurrReport.Break();
                end;

                trigger OnPreDataItem()
                begin
                    CurrReport.NewPage();
                end;
            }

            trigger OnAfterGetRecord()
            begin
                Job.TestField(Job.Status, 2);
                Message('Sea Days is %1 ', Job."Sea Days");
                if not Confirm('has the ending date been Updated', false) then CurrReport.Quit();
            end;

            trigger OnPreDataItem()
            begin
                Icount[1] := 10000;
                Icount[2] := 10000;
                JNo := Job.GetFilter(Job."No.");
                if JNo = '' then Error('Please, remember to enter the Job No.');
                PickRunType();
            end;
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        JobJB: Record "Job Journal Batch";
        JobJL: Record "Job Journal Line";
        JobJL2: Record "Job Journal Line";
        JobJLX: Record "Job Journal Line";
        items: Record Item;
        InvPostGrp: Record "Inventory Posting Group";
        RES: Record Resource;
        Icount: array[2] of Integer;
        LocCd: Code[10];
        JNo: Code[10];
        Loc: Record Location;
        Selection: Integer;
        Text002: Label '&Export,&Marketing,Export &and Marketing';
        JobCaptionLbl: Label 'Job';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        Calculated_Inventory_on_BoardCaptionLbl: Label 'Calculated Inventory on Board';
        Resource_on_BoardCaptionLbl: Label 'Resource on Board';
        JobTask: Record "Job Task";
        Jobtask_No: Code[20];
        ItemCat: Record "Item Category";

    [Scope('OnPrem')]
    procedure PickRunType()
    begin
        Selection := StrMenu(Text002, 3);
        if Selection = 0 then exit;
    end;

    [Scope('OnPrem')]
    procedure WorkTypeCode(var Nos: Code[10])
    begin
        if items.Get(Nos) then
            if InvPostGrp.Get(items."Inventory Posting Group") then
                JobJL."Work Type Code Sort" := InvPostGrp.Category;
    end;

    [Scope('OnPrem')]
    procedure MakeBatch(CatchType: Integer)
    begin
        JobJB.Init();
        JobJB."Journal Template Name" := 'JOB';

        JobJB."Voyage No." := Job."Voyage No.";
        JobJB."Job No." := Job.Vessel;
        if Loc.Get(Job.Vessel) then JobJB."Vessel Name" := Loc.Name else JobJB."Vessel Name" := Job.Vessel;
        JobJB."No. Series" := '';
        case CatchType of
            1:
                begin
                    JobJB.Name := Job."No." + 'EXPT';
                    JobJB."Batch Type" := 1;
                end;
            2:
                begin
                    JobJB.Name := Job."No." + 'MRKT';
                    JobJB."Batch Type" := 2;
                end;
        end;
        if not JobJB.Insert() then JobJB.Modify();
    end;

    [Scope('OnPrem')]
    procedure MakeLines(var Items: Record Item; CatchType: Integer)
    begin
        Items.CalcFields(Items.Inventory);
        if Items.Inventory <> 0 then begin
            Icount[CatchType] := Icount[CatchType] + 10000;
            JobJL.Init();
            JobJL."Journal Template Name" := 'JOB';
            JobJL."Journal Batch Name" := JobJB.Name;
            JobJL."Line No." := Icount[CatchType];
            JobJL."Document Date" := Today;
            JobJLX.Init();

            //Remove Catch from Vessel
            JobJL."Document No." := Job."No.";
            JobJL."Job No." := Job."No.";
            JobJL.Type := 1;
            JobJL.Validate(JobJL."No.", Items."No.");

            WorkTypeCode(Items."No.");
            JobJL.Description := Items.Description;
            JobJL.Validate(JobJL.Quantity, Items.Inventory);
            JobJL."Statistics Group" := Items."Statistics Group";
            JobJL.Validate(JobJL."Unit Cost (LCY)", 0);  //Sept 30,2002 Unit Cost is Zero
            JobJL."Reconciliation Catch Quantity" := Items.Inventory;
            JobJL."Gen. Prod. Posting Group" := Items."Gen. Prod. Posting Group";
            JobJL."Location Code" := Job.Vessel;
            JobJL."External Document No." := Job."Voyage No.";
            JobJL."Shortcut Dimension 2 Code" := Job."Global Dimension 2 Code";
            JobJL."Shortcut Dimension 1 Code" := Job."Global Dimension 1 Code";
            JobJL."Posting Date" := Job."Ending Date";
            JobJL."Phase Code" := Job.Vessel;// &  u
            if ItemCat.Get(Items."Item Category Code") then begin
                if ItemCat."Parent Category" <> '' then
                    JobJL."Task Code" := ItemCat."Parent Category"
                else
                    JobJL."Task Code" := ItemCat.code;
            end else
                JobJL."Task Code" := Items."Item Category Code";

            //JobJL."Task Code" := Item."Item Category Code";// &u
            //  JobJL."Step Code":='0';// & u
            JobTask.SetRange("Job No.", JobJL."Job No.");
            if JobTask.FindFirst() then
                Jobtask_No := JobTask."Job Task No.";
            JobJL.Validate("Job Task No.", Jobtask_No);
            JobJL."Work Type Code" := Items."Item Category Code";
            JobJL."Source Code" := Job.Vessel;
            if not JobJL.Insert() then JobJL.Modify();

            //Take Catches to Store (ColdRoom)
            JobJL2.Init();
            JobJL2 := JobJL;
            JobJL2."Line No." := JobJL2."Line No." - 5000;

            LocCd := 'ASL';
            JobJL2."Location Code" := 'CRM-' + LocCd;
            JobJL2."Reconciliation Catch Quantity" := JobJL2.Quantity * -1;
            JobJL2.Validate(JobJL2.Quantity, 0);
            JobJL2."Shortcut Dimension 2 Code" := 'ATLANTIC';
            JobJL2."Variant Code" := '';
            if not JobJL2.Insert() then JobJL2.Modify();
        end;
    end;
}
