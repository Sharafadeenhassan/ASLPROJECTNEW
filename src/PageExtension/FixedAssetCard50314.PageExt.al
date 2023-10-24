pageextension 50314 "pageextension50314" extends "Fixed Asset Card"
{
    layout
    {
        modify("Main Asset/Component")
        {
            Editable = true;
        }
        modify(Control33)
        {
            Visible = false;
        }
        addafter("Budgeted Asset")
        {
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
            }
        }
        addafter(DepreciationMethod)
        {
            group(Control330)
            {
                ShowCaption = false;
            }
        }
    }
    actions
    {
        addafter("FA Posting Types Overview")
        {
            action("List of depreciation books")
            {
                Caption = 'List of depreciation books';
                ApplicationArea = All;
            }
        }
    }
}
