page 50109 "Requisition History"
{
    Caption = 'Requisition History';
    PageType = CardPart;
    SourceTable = "Store Requisition Header New";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Req Date"; Rec."Req Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Req Date field.', Comment = '%';
                }
                field("Req. No"; Rec."Req. No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Req. No field.', Comment = '%';
                }
                field("Req. Type"; Rec."Req. Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Req. Type field.', Comment = '%';
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender field.', Comment = '%';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
                }
                field(SystemCreatedBy; Rec.SystemCreatedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemCreatedBy field.', Comment = '%';
                }
                field(SystemModifiedAt; Rec.SystemModifiedAt)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedAt field.', Comment = '%';
                }
                field(SystemModifiedBy; Rec.SystemModifiedBy)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemModifiedBy field.', Comment = '%';
                }
            }
        }
    }
}
