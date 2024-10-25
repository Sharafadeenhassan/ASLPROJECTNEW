page 50127 "Processed Approved DPS"
{
    CardPageID = "Dynamic Purchase Requisition";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    SourceTable = "Dynamics Procurement Header";
    SourceTableView = SORTING("DPS No.")
                      WHERE(Processed = CONST(true),
                            "Send For Approval" = CONST(true),
                            Approved = CONST(true));
    Caption = 'Processed Approved DPS';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
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
                field(Processed; Rec.Processed)
                {
                    ApplicationArea = All;
                }
                field("Process Date"; Rec."Process Date")
                {
                    ApplicationArea = All;
                }
                field("Process By"; Rec."Process By")
                {
                    ApplicationArea = All;
                }
                field("Process By Name"; Rec."Process By Name")
                {
                    ApplicationArea = All;
                }                
                field("Location Filter"; Rec."Location Filter")
                {
                    ApplicationArea = All;
                }
                field("Send For Approval"; Rec."Send For Approval")
                {
                    ApplicationArea = All;
                }
                field("Send For Approval By"; Rec."Send For Approval By")
                {
                    ApplicationArea = All;
                }
                field(Approved; Rec.Approved)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        UserSetup.get(UserId);
        if not UserSetup.StoreKeeper then Error('Sorry You are Not Storekeeper.');
    end;

}
