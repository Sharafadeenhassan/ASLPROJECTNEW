page 50271 "Inventory Posting Group Detail"
{
    Caption = 'Inventory Posting Group Page ';
    PageType = Card;
    SourceTable = "Inventory Posting Group";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the identifier for the inventory posting group.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the inventory posting group.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory Total field.';
                    Importance = Additional;
                }
                field("Inventory Incentive"; Rec."Inventory Incentive")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory Incentive field.';
                    Importance = Additional;
                }
                field("Inventory total1"; Rec."Inventory total1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory Total Vessel field.';
                    Importance = Additional;
                }
                field("Inventory total2"; Rec."Inventory total2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory Total Fishing Grd field.';
                    Importance = Additional;
                }
                field("Inventory total3"; Rec."Inventory total3")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory total3 field.';
                    Importance = Additional;
                }
                field("Inventory total4"; Rec."Inventory total4")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory total4 field.';
                    Importance = Additional;
                }
                field(Inventory1; Rec.Inventory1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory1 field.';
                    Importance = Additional;
                }
                field(Inventory2; Rec.Inventory2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory2 field.';
                    Importance = Additional;
                }
                field(Inventory3; Rec.Inventory3)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory3 field.';
                    Importance = Additional;
                }
                field(Inventory4; Rec.Inventory4)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory4 field.';
                    Importance = Additional;
                }
                field(Points; Rec.Points)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Points field.';
                }
                field("Points/KG"; Rec."Points/KG")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Points/KG field.';
                }
                field("S/No."; Rec."S/No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the S/No. field.';
                }
                field("In Use"; Rec."In Use")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the In Use field.';
                }
                field("Value"; Rec."Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Value field.';
                    Importance = Additional;
                }
            }
        }
    }
}
