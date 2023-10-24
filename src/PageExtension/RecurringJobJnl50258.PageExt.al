pageextension 50258 "pageextension50258" extends "Recurring Job Jnl."
{
    layout
    {
        modify("Recurring Frequency")
        {
            Visible = false;
        }
        /*modify("Line Type")
        {
            Visible = false;
        }*/
        modify("Posting Date")
        {
            Editable = true;
        }
        modify("Document No.")
        {
            Visible = false;
        }
        modify("Job No.")
        {
            Editable = true;
        }
        modify("Job Task No.")
        {
            Visible = false;
            Editable = false;
        }
        /* modify(Type)
         {
             Visible = false;
         }*/
        modify(Description)
        {
            //Unsupported feature: Property Modification (Name) on "Description(Control 12)".

            //Unsupported feature: Property Modification (SourceExpr) on "Description(Control 12)".

            //Unsupported feature: Property Modification (ImplicitType) on "Description(Control 12)".

            Editable = true;
        }
        modify(Quantity)
        {
            Editable = false;
        }

        modify("Total Cost")
        {
            Visible = false;
        }
        addafter(CurrentJnlBatchName)
        {
            field("Copy from Vessel"; "Copy From Vesel")
            {
                Importance = Promoted;
                TableRelation = "Job Journal Batch".Name WHERE(Recurring = CONST(true));
                ApplicationArea = All;
            }
        }
        addfirst(Control1)
        {
            field(Code1; Rec.Code1)
            {
                Editable = true;
                ApplicationArea = All;

                trigger OnValidate()
                begin
                    Items.Get(Rec.Code1);
                    Rec."Task Code" := items."Item Category Code"; //Items."Product Group Code";
                end;
            }
            field(Catch; Rec.Catch)
            {
                ApplicationArea = All;
            }
            field(Pack; Rec.Pack)
            {
                ApplicationArea = All;
            }
        }
        addafter(Description)
        {
            field("Line No."; Rec."Line No.")
            {
                Editable = false;
                ApplicationArea = All;
            }
        }
        moveafter("External Document No."; "Recurring Method")
        addafter("Job No.")
        {
            field("Vessel Type"; Rec."Vessel Type")
            {
                ApplicationArea = All;
            }
        }
        addafter("No.")
        {
            field("Phase Code"; Rec."Phase Code")
            {
                ApplicationArea = All;
            }
            field("Task Code"; Rec."Task Code")
            {
                ApplicationArea = All;
            }
        }
        addafter("ShortcutDimCode[8]")
        {
            field("Source Code"; Rec."Source Code")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Unit Cost (LCY)"; "Total Cost")

        addafter("Account Name")
        {
            group("Shrimp Points")
            {
                Caption = 'Shrimp Points';
                field(Control9; Rec."Shrimp Points")
                {
                    ApplicationArea = All;
                }
            }
            group("Fish Points")
            {
                Caption = 'Fish Points';
                field(Control13; Rec."Fish Points")
                {
                    ApplicationArea = All;
                }
            }
            group("Catch Points")
            {
                Caption = 'Catch Points';
                field(Control17; Rec."Catch Points")
                {
                    ApplicationArea = All;
                }
            }
            group("Catch Total")
            {
                Caption = 'Catch Total';
                field(Control21; Rec."Catch Total")
                {
                    ApplicationArea = All;
                }
            }
        }
        moveafter(Description; "JobDescription")
    }
    actions
    {
        modify("Test Report")
        {
            Promoted = true;
            PromotedIsBig = true;
            PromotedCategory = Process;
        }
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
            end;
        }

        //Unsupported feature: Code Modification on ""P&ost"(Action 56).OnAction".

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

        SetFilter(Quantity,'<>0');
        #1..3
        */
        //end;

        //Unsupported feature: Code Modification on ""Post and &Print"(Action 57).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CODEUNIT.Run(CODEUNIT::"Job Jnl.-Post+Print",Rec);
        CurrentJnlBatchName := GetRangeMax("Journal Batch Name");
        CurrPage.Update(false);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        SetFilter(Quantity,'<>0');
        #1..3
        */
        //end;
        addafter(Reconcile)
        {
            action(ClearCatch)
            {
                Caption = 'ClearCatch';
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    //ClearCatch;
                    Rec.ClearCatch();
                end;
            }
            action("Update Catch")
            {
                Image = UpdateShipment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.ClearCatchUpdate();
                end;
            }
            action("Initialize Vessel")
            {
                Image = CopyWorksheet;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CopyVessel();
                end;
            }
        }
        addafter("Post and &Print")
        {
            action(Narration)
            {
                Caption = 'Narration';
                Image = TaskList;
                Promoted = true;
                RunObject = Page "Lost Days";
                RunPageLink = "Table Name" = CONST(Job),
                              "No." = FIELD("Job No."),
                              Type = CONST(Narration);
                ApplicationArea = All;
            }
        }
    }

    var
        Items: Record Item;
        JobJournalLine: Record "Job Journal Line";
        "Copy From Vesel": Code[20];

    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    JobJnlManagement.GetNames(Rec,JobDescription,AccName);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    JobJnlManagement.GetNames(Rec,JobDescription,AccName);
    {
    //3.0
    CurrPage.SAVERECORD;
    JobJnlManagement.SetName(CurrentJnlBatchName,Rec);
    CurrPage.UPDATE(FALSE);
    }
    */
    //end;

    local procedure CopyVessel()
    var
        JobJnlLineCopy: Record "Job Journal Line";
    begin
        if "Copy From Vesel" <> '' then
            JobJournalLine.SetRange(JobJournalLine."Journal Batch Name", "Copy From Vesel");
        if JobJournalLine.FindFirst() then
            repeat
                JobJnlLineCopy.Init();
                JobJnlLineCopy.TransferFields(JobJournalLine);
                JobJnlLineCopy."Journal Batch Name" := rec."Journal Batch Name"; //CurrentJnlBatchName; //Revisit code
                JobJnlLineCopy."Task Code" := JobJournalLine."Task Code";
                JobJnlLineCopy.Insert();
            until JobJournalLine.Next() = 0;
        Message('Line Coppied from Vessel %1', "Copy From Vesel");
    end;
}

// {
//modify("Recurring Method")

//Unsupported feature: Property Modification (Name) on ""Recurring Method"(Control 30)".

//Unsupported feature: Property Modification (SourceExpr) on ""Recurring Method"(Control 30)".

//Unsupported feature: Property Modification (ImplicitType) on ""Recurring Method"(Control 30)".

// Editable = false;
// }

//Unsupported feature: Code Modification on "CurrentJnlBatchName(Control 78).OnAfterValidate".

//trigger OnAfterValidate()
//Parameters and return type have not been exported.
//>>>> ORIGINAL CODE:
//begin
/*
JobJnlManagement.CheckName(CurrentJnlBatchName,Rec);
CurrentJnlBatchNameOnAfterVali;
*/
//end;
//>>>> MODIFIED CODE:
//begin
/*
JobJnlManagement.CheckName(CurrentJnlBatchName,Rec);
*/
//end;

// addafter("Unit Cost (LCY)")
// {
//     // field("Total Cost"; "Total Cost")
//     // {
//     //     ApplicationArea = Jobs;
//     //     ToolTip = 'Specifies the total cost for the journal line. The total cost is calculated based on the job currency, which comes from the Currency Code field on the job card.';
//     //   }
// }