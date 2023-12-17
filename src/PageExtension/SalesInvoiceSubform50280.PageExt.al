pageextension 50280 "pageextension50280" extends "Sales Invoice Subform"
{
    layout
    {
        //***modify("VAT Prod. Posting Group")

        modify("Unit of Measure")
        {
            Editable = false;
        }
        modify("Line Discount %")
        {
            Caption = 'Line Discount %';
            Style = Subordinate;
        }
        modify("Line Amount")
        {
            Visible = true;
        }
        modify("Job Task No.")
        {
            ShowCaption = false;
            //Unsupported feature: Property Modification (ControlType) on ""Job Task No."(Control 18)".
            //Unsupported feature: Property Modification (Name) on ""Job Task No."(Control 18)".
            //Unsupported feature: Property Insertion (InstructionalTextML) on ""Job Task No."(Control 18)".
            //Unsupported feature: Property Insertion (GroupType) on ""Job Task No."(Control 18)".
        }
        modify("Tax Category")
        {
            //Unsupported feature: Property Modification (Level) on ""Tax Category"(Control 19)".

            //Unsupported feature: Property Modification (ControlType) on ""Tax Category"(Control 19)".

            //Unsupported feature: Property Modification (Name) on ""Tax Category"(Control 19)".

            //Unsupported feature: Property Insertion (GroupType) on ""Tax Category"(Control 19)".

            //Unsupported feature: Property Insertion (InstructionalTextML) on ""Tax Category"(Control 19)".

            ShowCaption = false;
        }
        modify("Appl.-to Item Entry")
        {
            BlankZero = true;
            Editable = true;
            // ShowMandatory = TypeChosen; //***

            //Unsupported feature: Property Modification (Name) on ""Appl.-to Item Entry"(Control 48)".
            //Unsupported feature: Property Modification (SourceExpr) on ""Appl.-to Item Entry"(Control 48)".
            //Unsupported feature: Property Modification (ImplicitType) on ""Appl.-to Item Entry"(Control 48)".
        }
        modify(Control15)
        {
            Caption = 'Invoice Discount %';
            Visible = true;
            Editable = false;
            //*** Style = Subordinate;

            //Unsupported feature: Property Modification (Level) on "Control15(Control 15)".
            //Unsupported feature: Property Modification (ControlType) on "Control15(Control 15)".
            //Unsupported feature: Property Insertion (DecimalPlaces) on "Control15(Control 15)".
            //Unsupported feature: Property Modification (Name) on "Control15(Control 15)".
            //Unsupported feature: Property Insertion (SourceExpr) on "Control15(Control 15)".
        }
        modify("Total Amount Excl. VAT")
        {
            //Unsupported feature: Property Modification (Name) on ""Total Amount Excl. VAT"(Control 13)".

            Caption = 'Total VAT';

            //Unsupported feature: Property Modification (SourceExpr) on ""Total Amount Excl. VAT"(Control 13)".

            //Unsupported feature: Property Insertion (ImplicitType) on ""Total Amount Excl. VAT"(Control 13)".
        }
        modify("Total VAT Amount")
        {
            //Unsupported feature: Property Modification (Name) on ""Total VAT Amount"(Control 11)".

            Caption = 'Total Amount Excl. VAT';

            //Unsupported feature: Property Modification (SourceExpr) on ""Total VAT Amount"(Control 11)".

            //Unsupported feature: Property Insertion (DrillDown) on ""Total VAT Amount"(Control 11)".
        }
        modify("Total Amount Incl. VAT")
        {
            Enabled = RefreshMessageEnabled;
            ShowCaption = false;

            //Unsupported feature: Property Modification (Name) on ""Total Amount Incl. VAT"(Control 9)".
            //Unsupported feature: Property Modification (SourceExpr) on ""Total Amount Incl. VAT"(Control 9)".
            //Unsupported feature: Property Insertion (DrillDown) on ""Total Amount Incl. VAT"(Control 9)".
            //Unsupported feature: Property Insertion (ImplicitType) on ""Total Amount Incl. VAT"(Control 9)".
        }
        modify("IC Partner Code")
        {
            Visible = false;
        }
        modify("IC Partner Reference")
        {
            Visible = false;
        }
        modify("Bin Code")
        {
            Visible = false;
        }
        modify("Unit of Measure Code")
        {
            Visible = false;
        }
        modify("Unit Cost (LCY)")
        {
            Visible = false;
        }
        modify("Shortcut Dimension 2 Code")
        {
            Visible = false;
        }
        /* modify(Control39)
         {
             Visible = false;
         }
         modify(Control33)
         {
             Visible = false;
         }*/
        modify("Invoice Discount Amount")
        {
            Visible = true;
        }
        modify("Invoice Disc. Pct.")
        {
            Visible = false;
        }
        modify("VAT Prod. Posting Group")
        {
            Visible = true;

            trigger OnafterValidate()
            begin
                RedistributeTotalsOnAfterValidate();
            end;
        }
        Modify("Return Reason Code")
        {
            Visible = false;
        }
        modify(Quantity)
        {
            BlankZero = true;
            ShowMandatory = TypeChosen;

            trigger OnafterValidate()
            begin
                QuantityOnAfterValidate();
                RedistributeTotalsOnAfterValidate();
            end;
        }

        moveafter("Deferral Code"; "IC Partner Ref. Type")
        moveafter("Variant Code"; Nonstock)
        Moveafter("Variant Code"; "VAT Prod. Posting Group")
        Moveafter(Quantity; "Return Reason Code")
        Moveafter(Description; "Location Code")
        Moveafter("Unit Price"; Quantity)
        moveafter("Job No."; "Unit of Measure")
        moveafter("Invoice Discount Amount"; Control15)
        moveafter("Total VAT Amount"; "TotalSalesLine.""Line Amount""")
        moveafter("TotalSalesLine.""Line Amount"""; "Total Amount Incl. VAT")
        moveafter("Cross-Reference No."; "Duplicate in Depreciation Book")
        moveafter("IC Partner Code"; "Shortcut Dimension 1 Code")
        moveafter("Variant Code"; "Job Contract Entry No.")
        moveafter("Line Amount"; "Blanket Order Line No.")
        moveafter("Bin Code"; "Unit Price")
        moveafter("Invoice Disc. Pct."; "VAT Prod. Posting Group")
        moveafter(Description; Quantity)

        //***p
        // moveafter("Total Amount Excl. VAT"; "Total Amount Excl. VAT")
        // moveafter(Control1900000001; "Tax Category")
        // moveafter(Control19; "Job Task No.")
        // moveafter(Control18; "Line Discount %")
        // moveafter(Control14; "Total VAT Amount")
        // moveafter("Gen. Prod. Posting Group"; "Line Amount")
        // moveafter("Gen. Bus. Posting Group"; "Deferral Code")
        // moveafter(Amount; "Job No.")
    }

    var
        SalesHeader: Record "Sales Header";
        RefreshMessageEnabled: Boolean;
        TypeChosen: Boolean;

    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetTotalSalesHeader;
    CalculateTotals;
    UpdateEditableOnRow;
    SetItemChargeFieldsStyle;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //EditableCon := RetailPriceField;
    #1..4
    */
    //end;

    //Unsupported feature: Code Modification on "OnInit".

    //trigger OnInit()
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesSetup.Get;
    Currency.InitRoundingPrecision;
    TempOptionLookupBuffer.FillBuffer(TempOptionLookupBuffer."Lookup Type"::Sales);
    IsFoundation := ApplicationAreaMgmtFacade.IsFoundationEnabled;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    EditableCon := true;
    #1..4
    */
    //end;

    local procedure RedistributeTotalsOnAfterValidate()
    begin
        CurrPage.SaveRecord();
        SalesHeader.Get(Rec."Document Type", Rec."Document No.");
        //***P if DocumentTotals.SalesCheckNumberOfLinesLimit(SalesHeader) then
        //     DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec, VATAmount, TotalSalesLine);
        CurrPage.Update();
    end;

    local procedure QuantityOnAfterValidate()
    begin
        if Rec.Reserve = Rec.Reserve::Always then begin
            CurrPage.SaveRecord();
            Rec.AutoReserve();
        end;
    end;

    local procedure UnitofMeasureCodeOnAfterValida()
    begin
        if Rec.Reserve = Rec.Reserve::Always then begin
            CurrPage.SaveRecord();
            Rec.AutoReserve();
        end;
    end;
}

//Unsupported feature: Property Modification (Name) on ""Line Amount"(Control 64)".
//Unsupported feature: Property Modification (SourceExpr) on ""Line Amount"(Control 64)".
//Unsupported feature: Property Modification (ImplicitType) on ""Line Amount"(Control 64)".

//Unsupported feature: Property Modification (Name) on ""Unit of Measure"(Control 10)".
//Unsupported feature: Property Modification (SourceExpr) on ""Unit of Measure"(Control 10)".
//Unsupported feature: Property Modification (ImplicitType) on ""Unit of Measure"(Control 10)".
//Unsupported feature: Property Modification (Name) on ""Unit Price"(Control 12)".
//Unsupported feature: Property Modification (SourceExpr) on ""Unit Price"(Control 12)".

//Unsupported feature: Property Modification (Name) on ""Job No."(Control 52)".
//Unsupported feature: Property Modification (SourceExpr) on ""Job No."(Control 52)".
//Unsupported feature: Property Modification (ImplicitType) on ""Job No."(Control 52)".

//Unsupported feature: Property Modification (Level) on ""Line Discount %"(Control 16)".
//Unsupported feature: Property Modification (Name) on ""Line Discount %"(Control 16)".
//Unsupported feature: Property Modification (SourceExpr) on ""Line Discount %"(Control 16)".
//Unsupported feature: Property Insertion (AutoFormatType) on ""Line Discount %"(Control 16)"
//Unsupported feature: Property Insertion (AutoFormatExpr) on ""Line Discount %"(Control 16)".

// {
//     //Unsupported feature: Property Modification (ControlType) on ""VAT Prod. Posting Group"(Control 14)".
//     //Unsupported feature: Property Modification (Name) on ""VAT Prod. Posting Group"(Control 14)".
//     //Unsupported feature: Property Insertion (GroupType) on ""VAT Prod. Posting Group"(Control 14)".
//     //Unsupported feature: Property Insertion (InstructionalTextML) on ""VAT Prod. Posting Group"(Control 14)".
//     ShowCaption = false;
// }
//  modify(Description)

//Unsupported feature: Code Modification on ""Job No."(Control 52).OnAfterValidate".
//trigger "(Control 52)()
//Parameters and return type have not been exported.
//>>>> ORIGINAL CODE:
//begin
/*
ShowShortcutDimCode(ShortcutDimCode);
*/
//end;
//>>>> MODIFIED CODE:
//begin
/*
UnitofMeasureCodeOnAfterValida;
RedistributeTotalsOnAfterValidate;
*/
//end;

//Unsupported feature: Property Deletion (Visible) on ""Job No."(Control 52)".
//Unsupported feature: Property Deletion (ToolTipML) on ""Job Task No."(Control 18)".
//Unsupported feature: Property Deletion (ApplicationArea) on ""Job Task No."(Control 18)".
//Unsupported feature: Property Deletion (SourceExpr) on ""Job Task No."(Control 18)".
//Unsupported feature: Property Deletion (Visible) on ""Job Task No."(Control 18)".
//Unsupported feature: Property Deletion (ImplicitType) on ""Job Task No."(Control 18)".
//Unsupported feature: Property Deletion (Visible) on ""Job Contract Entry No."(Control 60)".
//Unsupported feature: Property Deletion (ToolTipML) on ""Tax Category"(Control 19)".
//Unsupported feature: Property Deletion (ApplicationArea) on ""Tax Category"(Control 19)".
//Unsupported feature: Property Deletion (SourceExpr) on ""Tax Category"(Control 19)".
//Unsupported feature: Property Deletion (Visible) on ""Tax Category"(Control 19)".
//Unsupported feature: Property Deletion (ImplicitType) on ""Tax Category"(Control 19)".
//Unsupported feature: Code Insertion on ""Unit Price"(Control 48)".
//trigger OnAfterValidate()
//Parameters and return type have not been exported.
//begin
/*
RedistributeTotalsOnAfterValidate;
*/
//end;

//Unsupported feature: Property Modification (Name) on ""Job Contract Entry No."(Control 60)".
//Unsupported feature: Property Modification (SourceExpr) on ""Job Contract Entry No."(Control 60)".
//Unsupported feature: Property Modification (ImplicitType) on ""Job Contract Entry No."(Control 60)".
//Unsupported feature: Property Modification (Name) on ""Blanket Order Line No."(Control 56)".

//Unsupported feature: Property Modification (SourceExpr) on ""Blanket Order Line No."(Control 56)".

//Unsupported feature: Property Modification (ImplicitType) on ""Blanket Order Line No."(Control 56)".

//Unsupported feature: Property Modification (Name) on ""Duplicate in Depreciation Book"(Control 66)".

//Unsupported feature: Property Modification (SourceExpr) on ""Duplicate in Depreciation Book"(Control 66)".

//Unsupported feature: Property Modification (ImplicitType) on ""Duplicate in Depreciation Book"(Control 66)".
//Unsupported feature: Property Modification (Name) on ""Deferral Code"(Control 21)".

//Unsupported feature: Property Modification (SourceExpr) on ""Deferral Code"(Control 21)".

//Unsupported feature: Property Modification (ImplicitType) on ""Deferral Code"(Control 21)".

//Unsupported feature: Property Modification (Name) on ""Shortcut Dimension 1 Code"(Control 20)".

//Unsupported feature: Property Modification (SourceExpr) on ""Shortcut Dimension 1 Code"(Control 20)".
// modify("IC Partner Ref. Type")
// {
//     Visible = false;
// }

// modify(Nonstock)
// {
//     Visible = false;
// }
// modify("VAT Prod. Posting Group") {Visible = false;}

//Unsupported feature: Property Deletion (ToolTipML) on ""VAT Prod. Posting Group"(Control 14)".

//Unsupported feature: Property Deletion (ApplicationArea) on ""VAT Prod. Posting Group"(Control 14)".

//Unsupported feature: Property Deletion (SourceExpr) on ""VAT Prod. Posting Group"(Control 14)".

//Unsupported feature: Property Deletion (Visible) on ""VAT Prod. Posting Group"(Control 14)".

//Unsupported feature: Property Deletion (ImplicitType) on ""VAT Prod. Posting Group"(Control 14)".

// modify("Location Code")
// {
//     Visible = false;
// }

//Unsupported feature: Property Deletion (BlankZero) on "Quantity(Control 8)".
//Unsupported feature: Property Deletion (Visible) on ""Unit of Measure"(Control 10)".

//Unsupported feature: Property Deletion (BlankZero) on ""Unit Price"(Control 12)".

//Unsupported feature: Code Insertion (VariableCollection) on ""Invoice Discount Amount"(Control 16).OnAfterValidate".

//trigger (Variable: SalesHeader)()
//Parameters and return type have not been exported.
//begin
/*
*/
//end;

//Unsupported feature: Property Deletion (BlankZero) on ""Line Discount %"(Control 16)".

//Unsupported feature: Property Deletion (ImplicitType) on ""Line Discount %"(Control 16)".

//Unsupported feature: Property Deletion (BlankZero) on ""Line Amount"(Control 64)".

//Unsupported feature: Property Deletion (Visible) on ""Appl.-to Item Entry"(Control 48)".

//Unsupported feature: Property Deletion (Enabled) on ""Deferral Code"(Control 21)".

//Unsupported feature: Property Deletion (ShowCaption) on "Control15(Control 15)".
//Unsupported feature: Property Deletion (ShowCaption) on "Control15(Control 15)".
//Unsupported feature: Property Deletion (GroupType) on "Control15(Control 15)".
//Unsupported feature: Property Deletion (DrillDown) on ""Total Amount Excl. VAT"(Control 13)".
//Unsupported feature: Property Deletion (ImplicitType) on ""Total VAT Amount"(Control 11)".
//Unsupported feature: Code Insertion on "RefreshTotals(Control 9)".
//trigger OnDrillDown()
//begin
/*
DocumentTotals.SalesRedistributeInvoiceDiscountAmounts(Rec,VATAmount,TotalSalesLine);
CurrPage.Update(false);
*/
//end;

//Unsupported feature: Property Deletion (CaptionML) on ""Total Amount Incl. VAT"(Control 9)".

//Unsupported feature: Property Deletion (AutoFormatType) on ""Total Amount Incl. VAT"(Control 9)".
