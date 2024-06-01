page 50083 "Voyage Catch Default"
{
    // //

    PageType = Card;
    SourceTable = "Job catch Default";
    SourceTableView = SORTING("S/No.");
    Caption = 'Voyage Catch Default';
    Permissions = 
        tabledata "Catch Default" = R,
        tabledata "Job catch Default" = RIMD;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Table Name"; Rec."Table Name")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Vessel; Rec.Vessel)
                {
                    ApplicationArea = All;
                }
                field("Pack Size"; Rec."Pack Size")
                {
                    ApplicationArea = All;
                }
                field(Brand; Rec.Brand)
                {
                    ApplicationArea = All;
                }
                field("Budget Quantity"; Rec."Budget Quantity")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("S/No."; Rec."S/No.")
                {
                    ApplicationArea = All;
                }
                field(GroupSort; Rec.GroupSort)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Marked Rec"; Rec."Marked Rec")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Set Default")
            {
                Caption = 'Set Default';
                Ellipsis = false;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    DefCatch.SetCurrentKey(DefCatch."S/No.");
                    DefCatch.SetRange(DefCatch."In Use", true);
                    if DefCatch.Find('-') then
                        repeat
                            Rec.Init();
                            Rec.Code := DefCatch."No.";
                            Rec."Pack Size" := DefCatch."Pack Size";
                            Rec.Brand := DefCatch.Brand;
                            Rec.Description := DefCatch.Description;
                            fine := Evaluate(Rec."S/No.", Rec.Code);
                            if not Rec.Insert() then Rec.Modify();
                        until DefCatch.Next() = 0;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if Rec."Budget Quantity" = 0 then Rec.Validate("Budget Quantity");
    end;

    var
        DefCatch: Record "Catch Default";
        fine: Boolean;
}
