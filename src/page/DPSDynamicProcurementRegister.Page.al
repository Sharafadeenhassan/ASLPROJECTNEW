page 50121 "Dynamic Procurement Register"
{
    CardPageID = "Dynamics Procurement System";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Dynamics Procurement Header";
    SourceTableView = order(descending) where("Send For Approval" = const(false));
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    Caption = 'Dynamic Procurement Register';
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
                field("Req Department";rec."Req Department")
                {
                    ApplicationArea = all;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = All;
                } 
                field("Send For Approval";rec."Send For Approval")
                {}
                field("Send For Approval By";rec."Send For Approval By")
                {}
                field("Send for Approval Time";rec."Send for Approval Time")
                {}
                field("Sent For 1st Approval (HOD)";rec."Sent To For Approval")
                {}
                field("1st Approved (HOD)";rec.Approved)
                {}
                field("1st Approved (HOD) By";rec."Approved By"){}
                field("1st Approved (HOD) Time";rec."Approved Time"){}                              
                field("2nd Approval (Store)"; Rec.Processed)
                {
                    ApplicationArea = All;
                }
                field("2nd Approval(Store) Date"; Rec."Process Date")
                {
                    ApplicationArea = All;
                }
                field("2nd Approval(Store) By"; Rec."Process By")
                {
                    ApplicationArea = All;
                }
                field("2nd Approval (Store) By Name"; Rec."Process By Name")
                {
                    ApplicationArea = All;
                }
                field("Total Line Items";rec."Total Line Items"){visible =false;}
                field("Approved Line items";rec."Approved Line items")
                {visible =false;}
            }
        }
    }
trigger OnOpenPage()
var UserSetup: Record "User Setup";
begin
    UserSetup.get(UserId);
    if UserSetup."Allow DPS Store Process" = false then Error('You Don''t Access to Dynamic Procurement System'); 
end;
    
}
