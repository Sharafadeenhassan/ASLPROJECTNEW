page 50140 "Sea Food Categories List"
{
    ApplicationArea = All;
    Caption = 'Sea Food Categories List';
    PageType = List;
    SourceTable = "Sea Food categories";
    UsageCategory = Lists;
    CardPageId = 50150;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Sea food code"; Rec."Sea food code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sea food code field.', Comment = '%';
                }
                field("Sea food Description"; Rec."Sea food Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sea food Description field.', Comment = '%';
                }
                field("Entry code"; Rec."Entry code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry code field.', Comment = '%';
                }
                field(Export; Rec.Export)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Export field.', Comment = '%';
                }
                field("Inventory 1"; Rec."Inventory 1")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory 1 field.', Comment = '%';
                }
                field("Inventory 2"; Rec."Inventory 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory 2 field.', Comment = '%';
                }
                field("Inventory."; Rec."Inventory.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory. field.', Comment = '%';
                }
                field("Landed Value"; Rec."Landed Value")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Landed Value field.', Comment = '%';
                }
                field("Do not show"; Rec."Do not show")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Do not show field.', Comment = '%';
                }
            }
        }
    }
}
