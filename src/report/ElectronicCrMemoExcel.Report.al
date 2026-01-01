report 50257 "Elec Cr Memo Excel Export"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = true;

    dataset
    {
        dataitem(SalesCrMemoHeader; "Sales Cr.Memo Header")
        {
            RequestFilterFields = "No.", "Posting Date", "Sell-to Customer No.";

            dataitem(SalesCrMemoLine; "Sales Cr.Memo Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.");

                trigger OnPreDataItem()
                begin
                    // Switch to Lines sheet before adding line data
                    if not LinesSheetCreated then begin
                        ExcelBuffer.SelectOrAddSheet('Lines');
                        ExcelBuffer.AddColumn('Doc No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Line No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Type', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Quantity', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Unit Price', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Amount', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        ExcelBuffer.AddColumn('Category Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                        LinesSheetCreated := true;
                    end else
                        ExcelBuffer.SelectOrAddSheet('Lines');
                end;

                trigger OnAfterGetRecord()
                begin
                    // Add line data
                    ExcelBuffer.NewRow();
                    ExcelBuffer.AddColumn(SalesCrMemoLine."Document No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(SalesCrMemoLine."Line No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(Format(SalesCrMemoLine.Type), false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(SalesCrMemoLine."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(SalesCrMemoLine.Description, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(SalesCrMemoLine.Quantity, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(SalesCrMemoLine."Unit Price", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(SalesCrMemoLine.Amount, false, '', false, false, false, '', ExcelBuffer."Cell Type"::Number);
                    ExcelBuffer.AddColumn(SalesCrMemoLine."Item Category Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                end;

                trigger OnPostDataItem()
                begin
                    // Switch back to Headers sheet for next header
                    ExcelBuffer.SelectOrAddSheet('Headers');
                end;
            }

            trigger OnAfterGetRecord()
            begin
                // Ensure we're on the Headers sheet
                ExcelBuffer.SelectOrAddSheet('Headers');

                // Add header data
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn(SalesCrMemoHeader."No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Posting Date", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Date);
                ExcelBuffer.AddColumn('396', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Paid', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Currency Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Currency Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to Customer Name", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);

                // Get customer details
                if CustRec.Get(SalesCrMemoHeader."Sell-to Customer No.") then begin
                    ExcelBuffer.AddColumn(CustRec."Tax Registration No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn(CustRec."Business Description", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                end else begin
                    ExcelBuffer.AddColumn('', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                    ExcelBuffer.AddColumn('', false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                end;

                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to E-Mail", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to Phone No.", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to Address", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to City", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to Post Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn(SalesCrMemoHeader."Sell-to Country/Region Code", false, '', false, false, false, '', ExcelBuffer."Cell Type"::Text);
            end;

            trigger OnPreDataItem()
            begin
                // Create Headers sheet
                ExcelBuffer.DeleteAll();
                ExcelBuffer.CreateNewBook('Headers');
                ExcelBuffer.AddColumn('Document No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Posting Date', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Invoice Type', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Payment Status', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Document Currency Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Tax Currency Code', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer Party Name', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('TIN No.', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Business Description', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer Email', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer Phone', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer Street', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer City', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer Postal Zone', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Customer Country', false, '', true, false, false, '', ExcelBuffer."Cell Type"::Text);
            end;

            trigger OnPostDataItem()
            begin
                // No action needed here - sheets are already created and populated
            end;
        }
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ExportFolderPath; FolderPath)
                    {
                        ApplicationArea = All;
                        Caption = 'Export Folder Path';
                        ToolTip = 'Specifies the folder path where the Excel file will be saved.';

                        trigger OnValidate()
                        begin
                            if FolderPath = '' then
                                FolderPath := 'C:\Exports';
                        end;
                    }
                    field(FileName; FileNameText)
                    {
                        ApplicationArea = All;
                        Caption = 'File Name';
                        ToolTip = 'Specifies the name of the Excel file. Leave blank to use auto-generated name based on date.';
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            // Get default folder path from setup
            if ExportSetup.Get('DEFAULT') then
                FolderPath := ExportSetup."Export Folder Path"
            else
                FolderPath := 'C:\Exports';

            // Default file name with date
            if FileNameText = '' then
                FileNameText := Format(Today, 0, '<Year4><Month,2><Day,2>') + '_CrMemo.xlsx';
        end;
    }

    trigger OnPostReport()
    var
        TempBlob: Codeunit "Temp Blob";
        FileManagement: Codeunit "File Management";
        OutStream: OutStream;
        InStream: InStream;
        FullFileName: Text;
    begin
        if ExcelBuffer.IsEmpty() then begin
            Message('No data to export.');
            exit;
        end;

        // Build full file name
        if FileNameText = '' then
            FileNameText := Format(Today, 0, '<Year4><Month,2><Day,2>') + '_CrMemo.xlsx';

        if not FileNameText.EndsWith('.xlsx') then
            FileNameText += '.xlsx';

        if FolderPath.EndsWith('\') then
            FullFileName := FolderPath + FileNameText
        else
            FullFileName := FolderPath + '\' + FileNameText;

        // Write both sheets and close workbook
        ExcelBuffer.SelectOrAddSheet('Headers');
        ExcelBuffer.WriteSheet('Headers', CompanyName, UserId);
        ExcelBuffer.SelectOrAddSheet('Lines');
        ExcelBuffer.WriteSheet('Lines', CompanyName, UserId);
        ExcelBuffer.CloseBook();

        // Export to file
        TempBlob.CreateOutStream(OutStream);
        ExcelBuffer.SaveToStream(OutStream, true);

        TempBlob.CreateInStream(InStream);
        DownloadFromStream(InStream, 'Export Credit Memo', '', '', FullFileName);

        Message('Excel file exported successfully to:\%1', FullFileName);
    end;

    trigger OnPreReport()
    begin
        // Performance: Clear Excel Buffer to prevent memory buildup
        ExcelBuffer.Reset();
        ExcelBuffer.DeleteAll();
        HeadersSheetCreated := false;

        if FolderPath = '' then begin
            if ExportSetup.Get('DEFAULT') then
                FolderPath := ExportSetup."Export Folder Path"
            else
                FolderPath := 'C:\Exports';
        end;
    end;

    var
        ExcelBuffer: Record "Excel Buffer" temporary;
        ExportSetup: Record "Electronic Export Setup";
        CustRec: Record Customer;
        FolderPath: Text;
        FileNameText: Text;
        LinesSheetCreated: Boolean;
        HeadersSheetCreated: Boolean;
}
