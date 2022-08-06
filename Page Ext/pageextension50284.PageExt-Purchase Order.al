pageextension 50284 pageextension50284 extends "Purchase Order"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
        }


        modify("Document Date")
        {

            Importance = Additional;
        }

        modify("Creditor No.")
        {
            Importance = Promoted;
        }
        modify("Location Code")
        {
            Visible = true;

            Importance = Additional;
        }
        modify("Sell-to Customer No.")
        {
            Importance = Promoted;
        }
        modify("Ship-to Code")
        {
            Importance = Additional;
        }

        modify("Pay-to Address 2")
        {
            Importance = Promoted;
        }
        modify("Transaction Specification")
        {

            Importance = Additional;
            Visible = true;
        }
        modify("Transaction Type")
        {
            Visible = true;
            Importance = Additional;
        }

        modify("Entry Point")
        {
            Visible = true;
            Importance = Additional;
        }
        modify("Area")
        {
            Visible = true;
            Importance = Additional;
        }
        modify("Posting Description")
        {
            Visible = true;
        }       
        modify("Purchaser Code")
        {
            Visible = true;
        }
        modify("No. of Archived Versions")
        {
            Visible = true;
            Importance = Additional;
        }        
        modify("Currency Code")
        {
            Visible = True;
        }
        modify("Prices Including VAT")
        {
            Visible = true;
        }
        //trigger OnAfterValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ShortcutDimension1CodeOnAfterV;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        PricesIncludingVATOnAfterValid;
        */
        //end;
        modify("Shortcut Dimension 2 Code")
        {
            Visible = true;
        }
        modify("Inbound Whse. Handling Time")
        {
            Visible = false;
        }
        modify("Lead Time Calculation")
        {
            Visible = false;
        }
        
        //trigger OnAssistEdit()
        //begin
        /*
        Clear(ChangeExchangeRate);
        if "Posting Date" <> 0D then
          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
        else
          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WorkDate);
        if ChangeExchangeRate.RunModal = ACTION::OK then begin
          Validate("Currency Factor",ChangeExchangeRate.GetParameter);
          CurrPage.Update;
        end;
        Clear(ChangeExchangeRate);
        */
        //end;


        //Unsupported feature: Code Insertion on ""Currency Code"(Control 42)".

        //trigger OnAfterValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        CurrPage.Update;
        PurchCalcDiscByType.ApplyDefaultInvoiceDiscount(0,Rec);
        */
        //end;

        
        //trigger OnAfterValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        ShortcutDimension2CodeOnAfterV;
        */
        //end;

        //Unsupported feature: Property Deletion (Importance) on ""Ship-to Post Code"(Control 109)".


        //Unsupported feature: Property Deletion (Importance) on ""Pay-to Address"(Control 26)".



        //Unsupported feature: Code Insertion on ""Prepayment %"(Control 28)".

        //trigger OnAfterValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        Prepayment37OnAfterValidate;
        */
        //end;

        //Unsupported feature: Property Deletion (SourceExpr) on ""Pay-to City"(Control 30)".


        //Unsupported feature: Property Deletion (ImplicitType) on ""Pay-to City"(Control 30)".

        modify(Control123)
        {
            Visible = true;
            Caption = 'Clearing';
        }

        //Unsupported feature: Property Deletion (Importance) on ""Pay-to Post Code"(Control 97)".

        modify("Pay-to Contact No.")
        {
            Visible = true;
        }
        modify("Foreign Trade")
        {
            Visible = true;
            Caption = 'Foreign Trade';
            
        }
        modify(Prepayment)
        {
            Visible = true;
        }
        modify("Prepayment %")
        {
            Visible = true;
        }
        modify("Compress Prepayment")
        {
            Visible = true;
        }
        modify("Prepmt. Payment Terms Code")
        {
            Visible = true;
        }
        modify("Prepayment Due Date")
        {
            Visible = true;
        }
        modify("Prepmt. Payment Discount %")
        {
            Visible = true;
        }
        modify("Vendor Cr. Memo No.")
        {
            Visible = True;
        }
        // addafter("Buy-from Vendor No.")
        // {
        //     field("Posting No."; "Posting No.")
        //     {
        //     }
        // //     // field("Posting Description"; "Posting Description")
        //     // {
        //     // }
        // }
    addafter("Buy-from Contact")
        {
            field("Your Reference"; "Your Reference")
            {
            }
            // field("No. of Archived Versions"; "No. of Archived Versions")
            // {
            //     Importance = Additional;
            // }         
            // field("Vendor Invoice No."; "Vendor Invoice No.")
            // {
            //     ShowMandatory = VendorInvoiceNoMandatory;
            // }
        }
        addafter("Document Date")
        {
            field("Created By"; "Created By")
            {
            }
            field("Order Type";"Order Type")
            {}
            field("Posting No.";"Posting No.")
            {}
        }
        addfirst("Invoice Details")
        {
            field("Pay-to Vendor No."; "Pay-to Vendor No.")
            {
                Importance = Promoted;
                trigger OnValidate()
                begin
                    PaytoVendorNoOnAfterValidate;
                end;
            }
        }
        // modify("Entry Point")
        // {
        //     Visible = true;
        //     Importance = Promoted;
        // }
        
        /*addafter("Order Address Code")
        {
            ("Ship-to City"; "Ship-to City")
            {
            }
        }*/
        //addafter(Status)
        addafter("Foreign Trade")
        {
            field("Clearing(LCY)";"Clearing(LCY)")
            {                
            }
            field("Totat Freight"; "Totat Freight")
            {
            }
            field("Total Ancillary Charges"; "Total Ancillary Charges")
            {
            }
            field("Total Ancillary Charges(LCY)";"Total Ancillary Charges(LCY)")
            {                
            }
            field(Overhead;Overhead)
            {                
            }
            field("Interest Expense(LCY)"; "Interest Expense(LCY)")
            {
            }
            field("Total Freight (LCY)"; "Total Freight (LCY)")
            {
            }
            field("Total Amount Item (LCY)";"Total Amount Item (LCY)")
            {                
            }
            field("Approved By";"Approved By")
            {            
            }
        }
        //}
        //addafter("Requested Receipt Date")
        //{
        addfirst(Control95)
        {
            group(Control1230)
            {
                ShowCaption = true;
                //Visible = IsPayToCountyVisible;
            }
        }/*
        moveafter("Buy-from Contact"; "Assigned User ID")
        moveafter("Document Date"; "Vendor Invoice No.")
        moveafter("Vendor Shipment No."; "Vendor Order No.")
        moveafter("Order Address Code"; "Purchaser Code")
        moveafter("Purchaser Code"; "Prices Including VAT")
        moveafter("Approved By"; "Order Date")
        moveafter("Responsibility Center"; "Job Queue Status")
        moveafter("Job Queue Status"; "Promised Receipt Date")
        //moveafter("Order Type"; PurchLines)
        moveafter("Invoice Details"; "Payment Method Code")
        moveafter("Pay-to Contact No."; "Transaction Specification")
        moveafter("Pay-to Address"; "Area")
        moveafter("Pay-to Post Code"; "Entry Point")
        moveafter("Pay-to Contact"; "Ship-to Post Code")
        moveafter("Shortcut Dimension 2 Code"; "On Hold")
        moveafter("Payment Discount %"; "Location Code")
        moveafter("Payment Method Code"; "Shortcut Dimension 2 Code")
        moveafter("Creditor No."; "Shortcut Dimension 1 Code")
        moveafter("Prices Including VAT"; "Pay-to Post Code")
        moveafter("Ship-to Name"; "Order Address Code")
        moveafter("Ship-to Address"; "Sell-to Customer No.")
        moveafter("Inbound Whse. Handling Time"; "Transport Method")
        moveafter("Shipment Method Code"; "Transaction Type")
        moveafter("Lead Time Calculation"; "Expected Receipt Date")
        moveafter("Requested Receipt Date"; "Shipment Method Code")
        moveafter("Promised Receipt Date"; "Ship-to Contact")
        moveafter("Expected Receipt Date"; "Ship-to City")
        moveafter("Sell-to Customer No."; "Ship-to Address 2")
        moveafter("Ship-to Code"; "Ship-to Address")
       // moveafter(Address; "Ship-to Name")
        moveafter("Currency Code"; "Pmt. Discount Date")
        moveafter("Transaction Type"; "Payment Discount %")
        moveafter("Transport Method"; "Payment Terms Code")
        moveafter("Entry Point"; "Pay-to Contact")
        moveafter("Area"; Status)
        moveafter("Total Amount Item (LCY)"; "Requested Receipt Date")
        moveafter("Clearing(LCY)"; "Responsibility Center")
        moveafter("Total Ancillary Charges(LCY)"; "Pay-to City")
        //moveafter(City; "Pay-to Address 2")
        moveafter("Prepayment %"; "Payment Reference")
        moveafter("Compress Prepayment"; "Pay-to Address")
        moveafter("Prepmt. Payment Terms Code"; "Creditor No.")
        moveafter("Prepayment Due Date"; "Pay-to Name")*/
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "MoveNegativeLines(Action 142)".

        addafter(MoveNegativeLines)
        {
            action("Calculate Standard Landed Cost")
            {

                trigger OnAction()
                begin
                    // nav 3.0 //AAA
                    if not Confirm('Are all charges Captured!') then exit;

                    SetRange("No.", "No.");
                    REPORT.Run(REPORT::"Standard Cost", true, true, Rec);
                    SetRange("No.");
                end;
            }
            action("Calculate Actual Landed Cost")
            {

                trigger OnAction()
                begin
                    //Nav 3.0
                    if not Confirm('Are all charges Captured!') then exit;

                    SetRange("No.", "No.");
                    REPORT.Run(REPORT::"Landed Cost", true, true, Rec);
                    SetRange("No.");
                end;
            }
        }
        addafter(SendApprovalRequest)
        {
            action(ApprovalsList)
            {

                trigger OnAction()
                begin
                    PAGE.Run(PAGE::"Approvals List", UserSetup);
                end; 
            }
        }
    }

    var
        CodeForApprovalsetup: Codeunit "Code For Approval setup";

    var
        PurchLine: Record "Purchase Line";
        UserSetup: Record "User Setup";

    local procedure PaytoVendorNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;
}

