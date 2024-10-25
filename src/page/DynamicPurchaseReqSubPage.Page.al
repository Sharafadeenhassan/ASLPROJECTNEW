page 50132 "Dynamic Purchase Req. SubPage"
{
    Caption = 'Dynamic Purchase Req. SubPage';
    PageType = ListPart;
    SourceTable = "Purchase Requisition1";
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Req No."; Rec."Req No.")
                {
                    ApplicationArea = All;
                    Style = Favorable;
                    StyleExpr = rec.Process;
                }
                field("Req Department"; Rec."Req Department")
                {
                    ApplicationArea = All;
                }
                field("Req Location"; Rec."Req Location")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Req. By"; Rec."Req. By")
                {
                    ApplicationArea = All;
                }
                field("Req. By Name"; Rec."Req. By Name")
                {
                    ApplicationArea = All;
                }
                field("Req. Date"; Rec."Req. Date")
                {
                    ApplicationArea = All;
                }
                field("Req. Proc. Date"; Rec."Req. Proc. Date")
                {
                    ApplicationArea = All;
                }
                field("Req. Line No."; Rec."Req. Line No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
