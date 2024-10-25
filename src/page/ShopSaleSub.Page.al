page 50094 "Shop Sales Sub"
{
    Caption = 'Shop Sale Sub';
    PageType = ListPart;
    SourceTable = "Shop Lines";
    ApplicationArea = All;
    UsageCategory = Lists;
    AutoSplitKey = true;
    DelayedInsert = true;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Shop Code"; Rec.Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shop Code field.', Comment = '%';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Invoice No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.', Comment = '%';
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount field.', Comment = '%';
                    Editable = false;
                }
                field(Discount; Rec.Discount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Discount field.', Comment = '%';
                    Visible = false;
                }
                field("Line Amount Due"; Rec."Line Amount Due")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line Amount Due field.', Comment = '%';
                }
                field("Posting Date"; Rec."Transaction Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.', Comment = '%';
                }
                field("General Device"; Rec."General Device")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the General Device field.', Comment = '%';
                }
                field("Restore Header";"Restore Header")
                {

                }
            }
        }
    }
    var
    HeaderRecPage: Page "Shop Sales Header";
    HeaderRec : Record ShopHeader;

    trigger OnModifyRecord(): Boolean
    begin
        HeaderRec.Get(rec.Code,rec."Invoice No.");
        HeaderRec.CalcFields("Amount Due","Discount Amount","Invoice Total");
        HeaderRecPage.Update(true);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if HeaderRec.Get(rec.Code,rec."Invoice No.") then begin
        HeaderRec.CalcFields("Amount Due","Discount Amount","Invoice Total");
        HeaderRecPage.Update(true);
        end;
    end;

    }
