pageextension 50288 "pageextension50288" extends "Purchase Lines"
{
    layout
    {
        modify("Document Type")
        {
            Visible = false;
        }
        modify("Document No.")
        {
            Visible = false;
        }
        modify("Buy-from Vendor No.")
        {
            Visible = false;
        }
        modify(Type)
        {
            Visible = false;
        }
        modify("Reserved Qty. (Base)")
        {
            Visible = false;
        }
        modify("Outstanding Quantity")
        {
            Visible = false;
        }
        modify("Indirect Cost %")
        {
            Visible = true;
        }
        addafter("Indirect Cost %")
        {
            field("Req Locked"; Rec."Req Locked")
            {
                ApplicationArea = All;
                Caption = 'Req Locked';
                ToolTip = 'Req Locked';
                Editable = false;
                importance = Additional;
            }
            field("Gen. Prod. Posting Group";rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
                Caption = 'Gen. Prod. Posting Group';
                ToolTip = 'Gen. Prod. Posting Group';
                Editable = true;
            }
            field("Gen. Bus. Posting Group";rec."Gen. Bus. Posting Group")
            {
                ApplicationArea = All;
                Caption = 'Gen. Bus. Posting Group';
                ToolTip = 'Gen. Bus. Posting Group';
                Editable = true;
                importance = Additional;
            }
            field("DPS No.";rec."DPS No.")
            {
                ApplicationArea = All;
                Caption = 'DPS No.';
                ToolTip = 'DPS No.';
                Editable = true;
                importance = Additional;
            }
            field("DPS Line No.";rec."DPS Line No")
            {
                ApplicationArea = All;
                Caption = 'DPS Line No.';
                ToolTip = 'DPS Line No.';
                Editable = true;
                importance = Additional;
            }
        }
        
    }
    trigger OnAfterGetRecord()
    begin
        if rec."Req Locked" then
        CurrPage.Editable(false);
    end;
}
