xmlport 50028 "E-Invoicing"
{
    Caption = 'E-Invoicing';

    schema
    {
        textelement(RootNodeName)
        {
            tableelement(SalesInvoiceHeader; "Sales Invoice Header")
            {
                fieldelement(No; SalesInvoiceHeader."No.")
                {
                }
                fieldelement(BilltoCustomerNo; SalesInvoiceHeader."Bill-to Customer No.")
                {
                }
                fieldelement(BilltoName; SalesInvoiceHeader."Bill-to Name")
                {
                }
                fieldelement(AllowLineDisc; SalesInvoiceHeader."Allow Line Disc.")
                {
                }
                fieldelement(Amount; SalesInvoiceHeader.Amount)
                {
                }
                fieldelement(AmountIncludingVAT; SalesInvoiceHeader."Amount Including VAT")
                {
                }
                fieldelement(BilltoAddress; SalesInvoiceHeader."Bill-to Address")
                {
                }
                fieldelement(BilltoAddress2; SalesInvoiceHeader."Bill-to Address 2")
                {
                }
                fieldelement(BilltoCity; SalesInvoiceHeader."Bill-to City")
                {
                }
                fieldelement(BilltoContact; SalesInvoiceHeader."Bill-to Contact")
                {
                }
                fieldelement(BilltoContactNo; SalesInvoiceHeader."Bill-to Contact No.")
                {
                }
                fieldelement(BilltoCountryRegionCode; SalesInvoiceHeader."Bill-to Country/Region Code")
                {
                }
                fieldelement(BilltoCounty; SalesInvoiceHeader."Bill-to County")
                {
                }
                fieldelement(BilltoName2; SalesInvoiceHeader."Bill-to Name 2")
                {
                }
                fieldelement(BilltoPostCode; SalesInvoiceHeader."Bill-to Post Code")
                {
                }
                fieldelement(Cancelled; SalesInvoiceHeader.Cancelled)
                {
                }
                fieldelement(Closed; SalesInvoiceHeader.Closed)
                {
                }
                fieldelement(Correction; SalesInvoiceHeader.Correction)
                {
                }
                fieldelement(Corrective; SalesInvoiceHeader.Corrective)
                {
                }
                fieldelement(CurrencyCode; SalesInvoiceHeader."Currency Code")
                {
                }
                fieldelement(CurrencyFactor; SalesInvoiceHeader."Currency Factor")
                {
                }
                fieldelement(CustomerDiscGroup; SalesInvoiceHeader."Customer Disc. Group")
                {
                }
                fieldelement(DueDate; SalesInvoiceHeader."Due Date")
                {
                }
                fieldelement(ExternalDocumentNo; SalesInvoiceHeader."External Document No.")
                {
                }
                fieldelement(SystemId; SalesInvoiceHeader.SystemId)
                {
                }
                fieldelement(InvoiceDiscCode; SalesInvoiceHeader."Invoice Disc. Code")
                {
                }
                fieldelement(InvoiceDiscountAmount; SalesInvoiceHeader."Invoice Discount Amount")
                {
                }
                fieldelement(InvoiceDiscountValue; SalesInvoiceHeader."Invoice Discount Value")
                {
                }
                fieldelement(LocationCode; SalesInvoiceHeader."Location Code")
                {
                }
                fieldelement(OrderDate; SalesInvoiceHeader."Order Date")
                {
                }
                fieldelement(OrderNo; SalesInvoiceHeader."Order No.")
                {
                }
                fieldelement(PaymentTermsCode; SalesInvoiceHeader."Payment Terms Code")
                {
                }
                fieldelement(PerformancePercentage; SalesInvoiceHeader."Performance Percentage")
                {
                }
                fieldelement(PostingDate; SalesInvoiceHeader."Posting Date")
                {
                }
                fieldelement(PostingDescription; SalesInvoiceHeader."Posting Description")
                {
                }
                fieldelement(PricesIncludingVAT; SalesInvoiceHeader."Prices Including VAT")
                {
                }
                fieldelement(SelltoAddress; SalesInvoiceHeader."Sell-to Address")
                {
                }
                fieldelement(SelltoAddress2; SalesInvoiceHeader."Sell-to Address 2")
                {
                }
                fieldelement(SelltoCity; SalesInvoiceHeader."Sell-to City")
                {
                }
                fieldelement(SelltoContact; SalesInvoiceHeader."Sell-to Contact")
                {
                }
                fieldelement(SelltoContactNo; SalesInvoiceHeader."Sell-to Contact No.")
                {
                }
                fieldelement(SelltoCountryRegionCode; SalesInvoiceHeader."Sell-to Country/Region Code")
                {
                }
                fieldelement(SelltoCounty; SalesInvoiceHeader."Sell-to County")
                {
                }
                fieldelement(SelltoCustomerName; SalesInvoiceHeader."Sell-to Customer Name")
                {
                }
                fieldelement(SelltoCustomerName2; SalesInvoiceHeader."Sell-to Customer Name 2")
                {
                }
                fieldelement(SelltoCustomerNo; SalesInvoiceHeader."Sell-to Customer No.")
                {
                }
                fieldelement(SelltoEMail; SalesInvoiceHeader."Sell-to E-Mail")
                {
                }
                fieldelement(SelltoPhoneNo; SalesInvoiceHeader."Sell-to Phone No.")
                {
                }
                fieldelement(SelltoPostCode; SalesInvoiceHeader."Sell-to Post Code")
                {
                }
                fieldelement(SentasEmail; SalesInvoiceHeader."Sent as Email")
                {
                }
                fieldelement(ShiptoAddress; SalesInvoiceHeader."Ship-to Address")
                {
                }
                fieldelement(ShiptoAddress2; SalesInvoiceHeader."Ship-to Address 2")
                {
                }
                fieldelement(ShiptoCity; SalesInvoiceHeader."Ship-to City")
                {
                }
                fieldelement(ShiptoCode; SalesInvoiceHeader."Ship-to Code")
                {
                }
                fieldelement(ShiptoContact; SalesInvoiceHeader."Ship-to Contact")
                {
                }
                fieldelement(ShiptoCountryRegionCode; SalesInvoiceHeader."Ship-to Country/Region Code")
                {
                }
                fieldelement(ShiptoCounty; SalesInvoiceHeader."Ship-to County")
                {
                }
                fieldelement(ShiptoName; SalesInvoiceHeader."Ship-to Name")
                {
                }
                fieldelement(ShiptoName2; SalesInvoiceHeader."Ship-to Name 2")
                {
                }
                fieldelement(ShiptoPostCode; SalesInvoiceHeader."Ship-to Post Code")
                {
                }
                fieldelement(ShipmentDate; SalesInvoiceHeader."Shipment Date")
                {
                }
                fieldelement(ShipmentMethodCode; SalesInvoiceHeader."Shipment Method Code")
                {
                }
                fieldelement(ShipmentMonth; SalesInvoiceHeader."Shipment Month")
                {
                }
                fieldelement(ShippingAgentCode; SalesInvoiceHeader."Shipping Agent Code")
                {
                }
                fieldelement(SystemId; SalesInvoiceHeader.SystemId)
                {
                }
                fieldelement(TaxAreaCode; SalesInvoiceHeader."Tax Area Code")
                {
                }
                fieldelement(TaxLiable; SalesInvoiceHeader."Tax Liable")
                {
                }
                fieldelement(VATBaseDiscount; SalesInvoiceHeader."VAT Base Discount %")
                {
                }
                fieldelement(VATBusPostingGroup; SalesInvoiceHeader."VAT Bus. Posting Group")
                {
                }
                fieldelement(VATCountryRegionCode; SalesInvoiceHeader."VAT Country/Region Code")
                {
                }
                fieldelement(VATRegistrationNo; SalesInvoiceHeader."VAT Registration No.")
                {
                }
                fieldelement(WorkDescription; SalesInvoiceHeader."Work Description")
                {
                }
                fieldelement(YourReference; SalesInvoiceHeader."Your Reference")
                {
                }
                tableelement(SalesInvoiceLine; "Sales Invoice Line")
                {
                    //DataItemLink = "Document No." = FIELD("No.");
                    //DataItemLinkReference = "Sales Invoice Header";
                    //DataItemTableView = SORTING("Document No.", "Line No.");
                    fieldelement(ItemNo; SalesInvoiceLine."No.")
                    { }
                    fieldelement(Description; SalesInvoiceLine.Description)
                    { }
                    fieldelement(Quantity; SalesInvoiceLine.Quantity)
                    { }
                    fieldelement(UnitPrice; SalesInvoiceLine."Unit Price")
                    { }
                    fieldelement(LineAmount; SalesInvoiceLine."Line Amount")
                    { }
                    fieldelement(VATPercent; SalesInvoiceLine."VAT %")
                    { }
                    fieldelement(LineDiscountPercent; SalesInvoiceLine."Line Discount %")
                    { }
                    fieldelement(AmountIncludingVAT; SalesInvoiceLine."Amount Including VAT")
                    { }
                    fieldelement(LineNo; SalesInvoiceLine."Line No.")
                    { }
                    fieldelement(UnitOfMeasureCode; SalesInvoiceLine."Unit of Measure Code")
                    { }
                    fieldelement(LocationCode; SalesInvoiceLine."Location Code")
                    { }
                    fieldelement(PostingDate; SalesInvoiceLine."Posting Date")
                    { }
                    fieldelement(Description2; SalesInvoiceLine."Description 2")
                    { }
                    fieldelement(ShipmentDate; SalesInvoiceLine."Shipment Date")
                    { }
                    fieldelement(SystemId; SalesInvoiceLine.SystemId)
                    { }
                    fieldelement(DimensionSetID; SalesInvoiceLine."Dimension Set ID")
                    { }
                    fieldelement(LineDiscountAmount; SalesInvoiceLine."Line Discount Amount")
                    { }

                }
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
}
/*     actions
     {
         area(Processing)
         {
         }
     }
         field(ImportDate; SalesInvoiceHeader."Posting Date")
         {
             Caption = 'Export Date';
             ToolTip = 'Specifies the date of the sales invoices to be Exported.';
         }
         field(CustomerNo; SalesInvoiceHeader."Sell-to Customer No.")
         {
             Caption = 'Customer No.';
             ToolT= 'Specifies the customer number for which the sales invoices are to be Exported.';

         fieldelement(InvNo; SalesInvoiceHeader."No.")
         {
             Caption = 'Invoice No.';
             ToolTip = 'Specifies the invoice number to be Exported.';
         }
         {
             Caption = 'Include Posted Invoices';
             ToolTip = 'Specifies whether to include posted sales invoices in the export.';
 }
}

         }
          */
