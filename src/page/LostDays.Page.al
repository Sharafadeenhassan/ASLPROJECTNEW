page 50086 "Lost Days"
{
    // Description

    AutoSplitKey = true;
    Caption = 'Lost Days';
    DataCaptionFields = "No.";
    DelayedInsert = true;
    MultipleNewLines = true;
    PageType = List;
    SourceTable = "Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field(Vessel; Rec.Vessel)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Day Lost Cause"; Rec."Day Lost Cause")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description())
                {
                    Caption = 'Lost Day Description';
                    ApplicationArea = All;
                }
                field(Voyage; Rec.Voyage)
                {
                    ApplicationArea = All;
                }
                field("Operation No."; Rec."Operation No.")
                {
                    ApplicationArea = All;
                }
                field("Day Lost Location"; Rec."Day Lost Location")
                {
                    ApplicationArea = All;
                }
                field("Days Lost"; Rec."Days Lost")
                {
                    ApplicationArea = All;
                }
                field("Hours Lost"; Rec."Hours Lost")
                {
                    ApplicationArea = All;
                }
                field(Comment; rec."Comment Temp")
                {
                    ApplicationArea = All;
                    /* trigger OnValidate()
                     begin
                         rec.Comment := CopyStr(rec."Comment Temp", 1, 80);
                     end; */
                }
                field("Code"; Rec.Code)
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field(Deductible; Rec.Deductible)
                {
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Voyage Narration")
            {
                Caption = 'Voyage Narration';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Voyage Narration";
                ApplicationArea = All;
            }
            action("Consolidated Narration")
            {
                Caption = 'Consolidated Narration';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Consolidated Narration";
                ApplicationArea = All;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        // SetUpNewLine(xRec);
        Rec.Type := Rec.Type::Narration;
    end;
}
