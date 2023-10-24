page 50081 "Lost day Type"
{
    PageType = List;
    SourceTable = "Lost Days";
    Caption = 'Lost day Type';
    UsageCategory = Lists;
    ApplicationArea = All, Suite;
    InsertAllowed = true;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Editable = false;
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(SeaPort; Rec.SeaPort)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Edit Lost Day")
            {
                Caption = '&Edit Lost Day';
                Ellipsis = true;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Lost day Typex";
                ApplicationArea = All;
            }
        }
    }
}
