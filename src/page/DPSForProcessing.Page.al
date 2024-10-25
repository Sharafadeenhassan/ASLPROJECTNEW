page 50126 "Approved DPS For Processing"
{
    CardPageID = "Dynamics Procurement System";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Dynamics Procurement Header";
    SourceTableView = SORTING("DPS No.")
                      WHERE(Processed = CONST(false),
                            "Send For Approval" = CONST(true),
                            Approved = CONST(true));
    UsageCategory = Lists;
    ApplicationArea = All, Basic, Suites;
    Caption = 'Approved DPS For Processing';
    Editable = false;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                
                field("DPS No."; Rec."DPS No.")
                {
                    ApplicationArea = All;
                }
                field("Base Date"; Rec."Base Date")
                {
                    ApplicationArea = All;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                }
                field("Req Department";rec."Req Department")
                {
                    ApplicationArea = All;
                }                
                field("2nd Approved (Store)"; Rec.Processed)
                {
                    ApplicationArea = All;
                }
                field("2nd Approved (Store) Date"; Rec."Process Date")
                {
                    ApplicationArea = All;
                }
                field("2nd Approved (Store) By"; Rec."Process By")
                {
                    ApplicationArea = All;
                }
                field("2nd Approved (Store) By Name"; Rec."Process By Name")
                {
                    ApplicationArea = All;
                }               
                field("For 1st Approval (HOD)"; Rec."Send For Approval")
                {
                    ApplicationArea = All;
                }
                field("For 1st Approval(HOD) By"; Rec."Send For Approval By")
                {
                    ApplicationArea = All;
                }
                field("1st Approved (HOD)"; Rec.Approved)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SetFilter("Return To For Process", UserId);
        Rec.FilterGroup(2);
    end;
}
