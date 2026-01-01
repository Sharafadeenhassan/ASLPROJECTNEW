xmlport 50800 "Electronic Invoice Port"
{
    Format = VariableText;
    Caption = 'Electronic Invoice Port';
    UseRequestPage = true;
    Direction = Export;
    schema
    {
        textelement(Workbook)
        {
            textelement(Headers)
            {
                tableelement(SalesInvoiceHeader; "Sales Invoice Header")
                {
                    RequestFilterFields = "Posting Date", "Sell-to Customer No.", "No.";

                    fieldelement(document_identifier; SalesInvoiceHeader."No.") { }
                    fieldelement(issue_date; SalesInvoiceHeader."Posting Date") { }
                    textelement(invoice_type) { }
                    textelement(payment_Status) { }
                    fieldelement(document_currency_code; SalesInvoiceHeader."Currency Code") { }
                    fieldelement(tax_currency_code; SalesInvoiceHeader."Currency Code") { }
                    fieldelement(customer_party_name; SalesInvoiceHeader."Sell-to Customer Name") { }
                    textelement(TINNo) { }
                    fieldelement(customer_email; SalesInvoiceHeader."Sell-to E-Mail") { }
                    fieldelement(customer_phone; SalesInvoiceHeader."Sell-to Phone No.") { }
                    textelement(BusinessDescription) { }
                    fieldelement(customer_street; SalesInvoiceHeader."Sell-to Address") { }
                    fieldelement(customer_city; SalesInvoiceHeader."Sell-to City") { }
                    fieldelement(customer_postal_zone; SalesInvoiceHeader."Sell-to Post Code") { }
                    fieldelement(customer_country; SalesInvoiceHeader."Sell-to Country/Region Code") { }


                    trigger OnAfterGetRecord()
                    var
                        BusinessDescription: Text[150];
                        TINNo: Code[20];
                    begin
                        // Populate BusinessDescription and TINNo from Customer record
                        if CustRec.Get(SalesInvoiceHeader."Sell-to Customer No.") then begin
                            BusinessDescription := CustRec."Business Description";
                            TINNo := CustRec."Tax Registration No.";
                        end else begin
                            BusinessDescription := '';
                            TINNo := '';
                        end;
                        invoice_type := invoiceTypeCode;
                        payment_Status := paymentStatus;
                    end;


                }
            }
            textelement(Lines)
            {
                tableelement(SalesInvoiceLine; "Sales Invoice Line")
                {
                    LinkTable = SalesInvoiceHeader;
                    LinkFields = "Document No." = field("No.");

                    fieldelement(DocNo; SalesInvoiceLine."Document No.") { }
                    fieldelement(LineNo; SalesInvoiceLine."Line No.") { }
                    fieldelement(Type; SalesInvoiceLine.Type) { }
                    fieldelement(No; SalesInvoiceLine."No.") { }
                    fieldelement(Description; SalesInvoiceLine.Description) { }
                    fieldelement(Quantity; SalesInvoiceLine.Quantity) { }
                    fieldelement(UnitPrice; SalesInvoiceLine."Unit Price") { }
                    fieldelement(Amount; SalesInvoiceLine.Amount) { }
                    fieldelement(CategoryCode; SalesInvoiceLine."Item Category Code") { }
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
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                        ToolTip = 'Specify the starting date for the posting date filter.';
                    }

                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';
                        ToolTip = 'Specify the ending date for the posting date filter.';
                    }

                    field(FolderPath; FolderPath)
                    {
                        ApplicationArea = All;
                        Caption = 'Folder Path';
                        ToolTip = 'Specify the folder path where the file will be exported.';

                        trigger OnValidate()
                        begin
                            UpdateFileName();
                        end;
                    }

                    field(ExportFileName; ExportFileName)
                    {
                        ApplicationArea = All;
                        Caption = 'File Name';
                        ToolTip = 'The full path and filename for the export file.';
                        Editable = true;
                    }

                }
            }
        }

        actions
        {
            area(Processing)
            {
            }
        }

        trigger OnOpenPage()
        var
            ExportSetup: Record "Electronic Export Setup";
        begin
            StartDate := Today;
            EndDate := Today;
            if ExportSetup.Get('DEFAULT') then
                FolderPath := ExportSetup."Export Folder Path"
            else
                FolderPath := 'C:\Exports';
            UpdateFileName();
        end;
    }

    trigger OnPreXMLport()
    begin
        if (StartDate <> 0D) and (EndDate <> 0D) then
            SalesInvoiceHeader.SetRange("Posting Date", StartDate, EndDate)
        else if StartDate <> 0D then
            SalesInvoiceHeader.SetFilter("Posting Date", '>=%1', StartDate)
        else if EndDate <> 0D then
            SalesInvoiceHeader.SetFilter("Posting Date", '<=%1', EndDate);
    end;

    var
        CustRec: Record Customer;
        FolderPath: Text;
        ExportFileName: Text;
        StartDate: Date;
        EndDate: Date;
        invoiceTypeCode: Label '396';
        paymentStatus: Label 'Paid';

    local procedure UpdateFileName()
    var
        DateText: Text;
    begin
        DateText := Format(Today, 0, '<Year4><Month,2><Day,2>');
        if FolderPath <> '' then begin
            if FolderPath[StrLen(FolderPath)] = '\' then
                ExportFileName := FolderPath + 'Invoice_' + DateText + '.txt'
            else
                ExportFileName := FolderPath + '\Invoice_' + DateText + '.txt';
        end else
            ExportFileName := 'Invoice_' + DateText + '.txt';
    end;
}