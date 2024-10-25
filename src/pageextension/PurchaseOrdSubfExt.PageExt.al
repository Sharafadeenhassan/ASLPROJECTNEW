pageextension 50308 "Purchase Ord. Subf. Ext" extends "Purchase Order Subform"
{
    layout
    {
        modify("Qty. to Receive")
        {
            //Unsupported feature: Property Modification (Name) on ""Qty. to Receive"(Control 18)".

            //Unsupported feature: Property Modification (SourceExpr) on ""Qty. to Receive"(Control 18)".

            //Unsupported feature: Property Modification (ImplicitType) on ""Qty. to Receive"(Control 18)".

            Visible = false;
            Editable = true;
        }
        modify(Control43)
        {
            //Unsupported feature: Property Modification (Level) on "Control43(Control 43)".

            //Unsupported feature: Property Modification (ControlType) on "Control43(Control 43)".

            //Unsupported feature: Property Modification (Name) on "Control43(Control 43)".

            Caption = 'Inventory Posting Group';

            //Unsupported feature: Property Insertion (SourceExpr) on "Control43(Control 43)".

            //Unsupported feature: Property Insertion (ImplicitType) on "Control43(Control 43)".
        }
        modify(Control37)
        {
            Caption = 'Invoice Discount Amount';
            //Unsupported feature: Property Modification (ControlType) on "Control37(Control 37)".
            //Unsupported feature: Property Modification (Name) on "Control37(Control 37)".
            //Unsupported feature: Property Insertion (SourceExpr) on "Control37(Control 37)".
            //Unsupported feature: Property Insertion (AutoFormatType) on "Control37(Control 37)".
            //Unsupported feature: Property Insertion (AutoFormatExpr) on "Control37(Control 37)".

            //***P Editable = InvDiscAmountEditable;
            // Style = Subordinate;
            // StyleExpr = RefreshMessageEnabled;
        }
        modify(Control19)
        {
            Caption = 'Invoice Discount %';
            Visible = true;
            Editable = false;
            // Style = Subordinate;
            // StyleExpr = RefreshMessageEnabled;

            //Unsupported feature: Property Modification (Name) on "Control19(Control 19)".
            //Unsupported feature: Property Modification (ControlType) on "Control19(Control 19)".
            //Unsupported feature: Property Insertion (DecimalPlaces) on "Control19(Control 19)".
            //Unsupported feature: Property Insertion (SourceExpr) on "Control19(Control 19)".
        }
        modify("Total Amount Excl. VAT")
        {
            //Unsupported feature: Property Modification (Level) on ""Total Amount Excl. VAT"(Control 17)".

            //Unsupported feature: Property Modification (Name) on ""Total Amount Excl. VAT"(Control 17)".

            Caption = 'Total VAT';

            //Unsupported feature: Property Modification (SourceExpr) on ""Total Amount Excl. VAT"(Control 17)".

            //Unsupported feature: Property Insertion (ImplicitType) on ""Total Amount Excl. VAT"(Control 17)".
        }
        modify("Total VAT Amount")
        {
            //Unsupported feature: Property Modification (Level) on ""Total VAT Amount"(Control 15)".

            //Unsupported feature: Property Modification (Name) on ""Total VAT Amount"(Control 15)".

            Caption = 'Total Amount Excl. VAT';

            //Unsupported feature: Property Modification (SourceExpr) on ""Total VAT Amount"(Control 15)".

            //Unsupported feature: Property Insertion (DrillDown) on ""Total VAT Amount"(Control 15)".
        }
        modify("Total Amount Incl. VAT")
        {
            //Unsupported feature: Property Modification (Level) on ""Total Amount Incl. VAT"(Control 13)".

            //Unsupported feature: Property Modification (Name) on ""Total Amount Incl. VAT"(Control 13)"
            //Unsupported feature: Property Modification (SourceExpr) on ""Total Amount Incl. VAT"(Control 13)".

            //Unsupported feature: Property Insertion (DrillDown) on ""Total Amount Incl. VAT"(Control 13)".

            Enabled = RefreshMessageEnabled;
            ShowCaption = false;

            //Unsupported feature: Property Insertion (ImplicitType) on ""Total Amount Incl. VAT"(Control 13)".
        }
        modify("Prepayment %")
        {
            Visible = false;
        }
        modify("Qty. to Assign")
        {
            Visible = false;
        }
        modify("Qty. Assigned")
        {
            Visible = false;
        }
        modify("Job No.")
        {
            Visible = false;
        }
        modify("Job Total Price")
        {
            Visible = false;
        }
        modify("Job Total Price (LCY)")
        {
            Visible = false;
        }
        modify("Promised Receipt Date")
        {
            Visible = false;
        }
        modify("Planned Receipt Date")
        {
            Visible = false;
        }
        modify("Expected Receipt Date")
        {
            Visible = false;
        }

        addfirst(Content)
        {
            group(Control87)
            {
                ShowCaption = false;
            }
        }
        addafter("Bin Code")
        {
            field("Duty Rate%"; Rec."Duty Rate%")
            {
                ApplicationArea = All;
            }
        }

        moveafter("Allow Item Charge Assignment"; "Prepmt. Line Amount")
        Modify("Prepmt. Line Amount")
        {
            Visible = false;

            trigger OnAfterValidate()
            begin
                RedistributeTotalsOnAfterValidate();
            end;
        }
        moveafter("Allow Item Charge Assignment"; "Prepmt. Amt. Inv.")

        Modify("Prepmt. Amt. Inv.")
        {
            Visible = false;

            trigger OnAfterValidate()
            begin
                RedistributeTotalsOnAfterValidate();
            end;
        }
        modify("Indirect Cost %")
        {
            Editable = false;
            visible = true;
        }
        Addafter("Indirect Cost %")
        {
            field("ASL Indirect Cost %"; rec."ASL Indirect Cost %")
            {
                ApplicationArea = all;
            }
            field("Insurance(LCY)"; rec."Insurance(LCY)")
            {
                ApplicationArea = all;
            }
            field("Interest(LCY)"; rec."Interest(LCY)")
            {
                ApplicationArea = all;
            }
            field("Duty(LCY)"; rec."Duty(LCY)")
            {
                ApplicationArea = all;
            }
            field("Clearing(LCY)"; rec."Clearing(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualFreight(LCY)"; rec."ActualFreight(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualInsurance(LCY)"; rec."ActualInsurance(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualSurcharge Duty(LCY)"; rec."ActualSurcharge Duty(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualCISS(LCY)"; rec."ActualCISS(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualVat (LCY)"; rec."ActualVat (LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualClearing(LCY)"; rec."ActualClearing(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualInterest(LCY)"; rec."ActualInterest(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualTotal Overhead(LCY)"; rec."ActualTotal Overhead(LCY)")
            {
                ApplicationArea = All;
            }
            field("ActualLandedAmount(LCY)"; rec."ActualLandedAmount(LCY)")
            {
                ApplicationArea = all;
            }
            field("ActualDuty(LCY)"; rec."ActualDuty(LCY)")
            {
                Applicationarea = all;
            }
        }
        addafter("Qty. to Assign")
        {
            field("Previous Purchase Price(LCY)"; rec."Previous Purchase Price(LCY)")
            {
                ApplicationArea = All;
            }
            field("Quantity Ordered"; rec."Quantity Ordered")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Job Line Discount %"; "Job Total Price", "Job Total Price (LCY)")

        moveafter("Requested Receipt Date"; "Promised Receipt Date")

        addafter("Operation No.")
        {
            field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Invoice Discount Amount"; Control19)
        moveafter("Line Discount %"; "Allow Item Charge Assignment")
        moveafter("Qty. to Receive"; "Qty. to Invoice")
        moveafter("Qty. to Invoice"; "Quantity Received")
        moveafter("Job No."; "Job Task No.")
        moveafter("Job Line Discount %"; "Requested Receipt Date")
        moveafter("Requested Receipt Date"; "Line No.")
        moveafter("Planned Receipt Date"; "Document No.")
        moveafter("Expected Receipt Date"; "Order Date")

        moveafter("Prepayment %"; "Inv. Discount Amount")
        moveafter("Quantity Invoiced"; "Allow Invoice Disc.")

        // Controls not found
        // moveafter(Control1900000001; "Invoice Discount Amount")
        // moveafter(InvoiceDiscountAmount; Control37)
        // moveafter(InvoiceDiscountPct; "Total VAT Amount")
        // moveafter("ActualAncillary(LCY)"; "Qty. to Assign")
    }

    var
        RefreshMessageEnabled: Boolean;
        PurchHeader: Record "Purchase Header";

    local procedure RedistributeTotalsOnAfterValidate()
    var
        DocumentTotals: Codeunit "Document Totals";
    begin
        CurrPage.SaveRecord();

        PurchHeader.Get(Rec."Document Type", Rec."Document No.");
        if DocumentTotals.PurchaseCheckNumberOfLinesLimit(PurchHeader) then
            DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec, VATAmount, TotalPurchaseLine);
        CurrPage.Update();
    end;

    trigger OnOpenPage()
    begin
        if rec."Req Locked" = true then CurrPage .Editable := false;
    end;

     trigger OnAfterGetRecord()
    begin
        if rec."Req Locked" then
        CurrPage.Editable(false);
    end;
}


//Unsupported feature: Property Modification (SourceExpr) on ""Line Discount Amount"(Control 60)".
//Unsupported feature: Property Modification (Name) on ""Line Discount Amount"(Control 60)".
//Unsupported feature: Property Modification (Name) on ""Allow Invoice Disc."(Control 58)".
//Unsupported feature: Property Modification (SourceExpr) on ""Allow Invoice Disc."(Control 58)".
//Unsupported feature: Property Modification (ImplicitType) on ""Allow Invoice Disc."(Control 58)".
//*** modify("Inv. Discount Amount")
// modify("Inv. Discount Amount")
// {
//     BlankZero = true;
//     //Unsupported feature: Property Modification (Name) on ""Inv. Discount Amount"(Control 26)".
//     //Unsupported feature: Property Modification (SourceExpr) on ""Inv. Discount Amount"(Control 26)".
// }
//Unsupported feature: Property Modification (SourceExpr) on ""Quantity Invoiced"(Control 24)".
//Unsupported feature: Property Modification (Name) on ""Quantity Received"(Control 20)".
//Unsupported feature: Property Modification (SourceExpr) on ""Quantity Received"(Control 20)".
//Unsupported feature: Property Modification (Name) on ""Qty. to Invoice"(Control 22)".
//Unsupported feature: Property Modification (SourceExpr) on ""Qty. to Invoice"(Control 22)".
//Unsupported feature: Property Modification (Name) on ""Quantity Invoiced"(Control 24)".
//Unsupported feature: Property Modification (Name) on ""Allow Item Charge Assignment"(Control 56)".
//Unsupported feature: Property Modification (SourceExpr) on ""Allow Item Charge Assignment"(Control 56)".
//Unsupported feature: Property Modification (ImplicitType) on ""Allow Item Charge Assignment"(Control 56)".
//Unsupported feature: Property Modification (Name) on ""Qty. to Assign"(Control 66)".
//Unsupported feature: Property Modification (SourceExpr) on ""Qty. to Assign"(Control 66)".
//Unsupported feature: Property Modification (Name) on ""Qty. Assigned"(Control 54)".
//Unsupported feature: Property Modification (SourceExpr) on ""Qty. Assigned"(Control 54)".
//Unsupported feature: Property Modification (Name) on ""Document No."(Control 25)".
//Unsupported feature: Property Modification (ImplicitType) on ""Document No."(Control 25)".
//Unsupported feature: Property Modification (Name) on ""Line No."(Control 27)".
//Unsupported feature: Property Modification (SourceExpr) on ""Line No."(Control 27)".
//Unsupported feature: Property Modification (ImplicitType) on ""Line No."(Control 27)".
//Unsupported feature: Property Modification (SourceExpr) on ""Document No."(Control 25)".
//Unsupported feature: Property Modification (Level) on "AmountBeforeDiscount(Control 45)".
//Unsupported feature: Property Modification (Level) on ""Invoice Discount Amount"(Control 35)".
//Unsupported feature: Property Modification (Name) on ""Invoice Discount Amount"(Control 35)".
//Unsupported feature: Property Modification (Level) on ""Invoice Disc. Pct."(Control 33)".
//Unsupported feature: Property Modification (Name) on ""Invoice Disc. Pct."(Control 33)".

//trigger OnAfterValidate()
//begin
/*
//Unsupported feature: Property Deletion (Visible) on ""Allow Invoice Disc."(Control 58)".
//Unsupported feature: Property Deletion (Visible) on ""Inv. Discount Amount"(Control 26)".
//Unsupported feature: Property Deletion (BlankZero) on ""Qty. to Receive"(Control 18)".
//Unsupported feature: Code Insertion on ""Prepayment %"(Control 56)".
//Parameters and return type have not been exported.
RedistributeTotalsOnAfterValidate;
*/
//end;//Unsupported feature: Property Deletion (Visible) on ""Document No."(Control 25)".

//Unsupported feature: Property Deletion (Editable) on ""Document No."(Control 25)".

//Unsupported feature: Property Deletion (Visible) on ""Line No."(Control 27)".

//Unsupported feature: Property Deletion (Editable) on ""Line No."(Control 27)".

//Unsupported feature: Property Deletion (GroupType) on "Control43(Control 43)".

//Unsupported feature: Property Deletion (ShowCaption) on "Control43(Control 43)".

//Unsupported feature: Code Insertion on ""Invoice Discount Amount"(Control 37)".

//trigger OnAfterValidate()
//Parameters and return type have not been exported.
//var
//PurchaseHeader: Record "Purchase Header";
//begin
/*
PurchaseHeader.Get("Document Type","Document No.");
PurchCalcDiscByType.ApplyInvDiscBasedOnAmt(TotalPurchaseLine."Inv. Discount Amount",PurchaseHeader);
CurrPage.Update(false);
*/
//end;

//Unsupported feature: Property Deletion (GroupType) on "Control37(Control 37)".

//Unsupported feature: Property Deletion (ShowCaption) on "Control37(Control 37)".

//Unsupported feature: Code Modification on ""Invoice Discount Amount"(Control 35).OnAfterValidate".

//trigger OnAfterValidate()
//Parameters and return type have not been exported.
//>>>> ORIGINAL CODE:
//begin
/*
ValidateInvoiceDiscountAmount;
DocumentTotals.PurchaseDocTotalsNotUpToDate;
*/
//end;
//>>>> MODIFIED CODE:
//begin
/*
   ValidateInvoiceDiscountAmount;
   DocumentTotals.PurchaseDocTotalsNotUpToDate;
*/
//end;

//Unsupported feature: Property Deletion (CaptionML) on ""Invoice Discount Amount"(Control 35)".

//Unsupported feature: Property Deletion (AutoFormatType) on ""Invoice Discount Amount"(Control 35)".

//Unsupported feature: Property Deletion (Editable) on ""Invoice Discount Amount"(Control 35)".

//Unsupported feature: Property Deletion (CaptionML) on ""Invoice Disc. Pct."(Control 33)".

//Unsupported feature: Property Deletion (GroupType) on "Control19(Control 19)".

//Unsupported feature: Property Deletion (ShowCaption) on "Control19(Control 19)".

//Unsupported feature: Property Deletion (DrillDown) on ""Total Amount Excl. VAT"(Control 17)".

//Unsupported feature: Property Deletion (ImplicitType) on ""Total VAT Amount"(Control 15)".

//Unsupported feature: Code Insertion on "RefreshTotals(Control 13)".

//trigger OnDrillDown()
//begin
/*
DocumentTotals.PurchaseRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalPurchaseLine);
CurrPage.Update(false);
*/
//end;

//Unsupported feature: Property Deletion (CaptionML) on ""Total Amount Incl. VAT"(Control 13)".

//Unsupported feature: Property Deletion (AutoFormatType) on ""Total Amount Incl. VAT"(Control 13)".
