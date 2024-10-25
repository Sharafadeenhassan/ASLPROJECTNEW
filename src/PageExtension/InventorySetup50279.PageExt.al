pageextension 50279 "pageextension50279" extends "Inventory Setup"
{
    layout
    {
        addafter(Numbering)
        {
            group("Materia Requisition")
            {
                field("Store Requisition No."; Rec."Store Requisition No.")
                {
                    ApplicationArea = All;
                }
                field("DPS No. Series";"DPS No. Series")
                {
                    ApplicationArea = All;
                }
                field("Store Req. Add-In No.";"Store Req. Add-In No.")
                {
                    ApplicationArea = All;
                }
                field("Store Req. Compliment No.";"Store Req. Compliment No.")
                {
                    ApplicationArea = All;                    
                }
                field("Store Req. Invoice No.";"Store Req. Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("Store Req. Purchase No.";"Store Req. Purchase No.")
                {
                    ApplicationArea = All;
                }
                field("Store Req. Transfer No.";"Store Req. Transfer No.")
                {
                    ApplicationArea= All;
                }
                field("Auto Post Issue Req"; Rec."Auto Post Issue Req")
                {
                    ApplicationArea = All;
                }
                field("Auto Post Transfer Req"; Rec."Auto Post Transfer Req")
                {
                    ApplicationArea = All;
                }
                field("Auto Post Job Journal";"Auto Post Job Journal")
                {
                    ApplicationArea = All;
                }
            }
            group(Other)
            {
                Caption = 'Other';
                field("FA Acquisition"; Rec."FA Acquisition")
                {
                    ApplicationArea = All;
                }
                field("FA Acquisition Template"; Rec."FA Acquisition Template")
                {
                    ApplicationArea = All;
                }
                field("FA Maintenance"; Rec."FA Maintenance")
                {
                    ApplicationArea = All;
                }
                field("FA Maintenance Template"; Rec."FA Maintenance Template")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
