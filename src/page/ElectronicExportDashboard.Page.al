page 50178 "Electronic Export Dashboard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Electronic Export Dashboard';
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(Overview)
            {
                Caption = 'Export Center Overview';
                InstructionalText = 'Welcome to the Electronic Export Dashboard. Manage and export sales invoices and credit memos to Excel or text format.';
                ShowCaption = true;

                group(QuickStats)
                {
                    Caption = '';
                    ShowCaption = false;

                    group(TodayStats)
                    {
                        Caption = 'Today''s Activity';
                        ShowCaption = true;

                        field(InvoicesTodayLabel; InvoicesTodayLabel)
                        {
                            ApplicationArea = All;
                            Caption = 'Sales Invoices Posted';
                            ToolTip = 'Number of sales invoices posted today.';
                            Editable = false;
                            Style = StrongAccent;
                            StyleExpr = true;
                            ShowCaption = true;

                            trigger OnDrillDown()
                            var
                                SalesInvoiceHeader: Record "Sales Invoice Header";
                            begin
                                SalesInvoiceHeader.SetRange("Posting Date", Today);
                                Page.Run(Page::"Posted Sales Invoices", SalesInvoiceHeader);
                            end;
                        }
                        field(InvoiceAmountTodayDisplay; InvoiceAmountTodayDisplay)
                        {
                            ApplicationArea = All;
                            Caption = 'Invoice Value';
                            ToolTip = 'Total value of invoices posted today. Click to view details.';
                            Editable = false;
                            Style = Favorable;
                            StyleExpr = InvoiceAmountToday > 0;

                            trigger OnDrillDown()
                            var
                                SalesInvoiceHeader: Record "Sales Invoice Header";
                            begin
                                SalesInvoiceHeader.SetRange("Posting Date", Today);
                                Page.Run(Page::"Posted Sales Invoices", SalesInvoiceHeader);
                            end;
                        }
                        field(CreditMemosTodayLabel; CreditMemosTodayLabel)
                        {
                            ApplicationArea = All;
                            Caption = 'Credit Memos Posted';
                            ToolTip = 'Number of credit memos posted today.';
                            Editable = false;
                            Style = Attention;
                            StyleExpr = TotalCreditMemosToday > 0;

                            trigger OnDrillDown()
                            var
                                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                            begin
                                SalesCrMemoHeader.SetRange("Posting Date", Today);
                                Page.Run(Page::"Posted Sales Credit Memos", SalesCrMemoHeader);
                            end;
                        }
                        field(CreditMemoAmountTodayDisplay; CreditMemoAmountTodayDisplay)
                        {
                            ApplicationArea = All;
                            Caption = 'Credit Memo Value';
                            ToolTip = 'Total value of credit memos posted today. Click to view details.';
                            Editable = false;
                            Style = Unfavorable;
                            StyleExpr = CreditMemoAmountToday > 0;

                            trigger OnDrillDown()
                            var
                                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                            begin
                                SalesCrMemoHeader.SetRange("Posting Date", Today);
                                Page.Run(Page::"Posted Sales Credit Memos", SalesCrMemoHeader);
                            end;
                        }
                    }

                    group(MonthStats)
                    {
                        Caption = 'Month-to-Date Summary';
                        ShowCaption = true;

                        field(InvoicesThisMonthLabel; InvoicesThisMonthLabel)
                        {
                            ApplicationArea = All;
                            Caption = 'Total Invoices';
                            ToolTip = 'Total number of sales invoices posted this month.';
                            Editable = false;

                            trigger OnDrillDown()
                            var
                                SalesInvoiceHeader: Record "Sales Invoice Header";
                            begin
                                SalesInvoiceHeader.SetRange("Posting Date", CalcDate('<-CM>', Today), Today);
                                Page.Run(Page::"Posted Sales Invoices", SalesInvoiceHeader);
                            end;
                        }
                        field(InvoiceAmountThisMonthDisplay; InvoiceAmountThisMonthDisplay)
                        {
                            ApplicationArea = All;
                            Caption = 'Invoice Value MTD';
                            ToolTip = 'Total value of invoices posted this month. Click to view details.';
                            Editable = false;

                            trigger OnDrillDown()
                            var
                                SalesInvoiceHeader: Record "Sales Invoice Header";
                            begin
                                SalesInvoiceHeader.SetRange("Posting Date", CalcDate('<-CM>', Today), Today);
                                Page.Run(Page::"Posted Sales Invoices", SalesInvoiceHeader);
                            end;
                        }
                        field(CreditMemosThisMonthLabel; CreditMemosThisMonthLabel)
                        {
                            ApplicationArea = All;
                            Caption = 'Total Credit Memos';
                            ToolTip = 'Total number of credit memos posted this month.';
                            Editable = false;

                            trigger OnDrillDown()
                            var
                                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                            begin
                                SalesCrMemoHeader.SetRange("Posting Date", CalcDate('<-CM>', Today), Today);
                                Page.Run(Page::"Posted Sales Credit Memos", SalesCrMemoHeader);
                            end;
                        }
                        field(CreditMemoAmountThisMonthDisplay; CreditMemoAmountThisMonthDisplay)
                        {
                            ApplicationArea = All;
                            Caption = 'Credit Memo Value MTD';
                            ToolTip = 'Total value of credit memos posted this month. Click to view details.';
                            Editable = false;

                            trigger OnDrillDown()
                            var
                                SalesCrMemoHeader: Record "Sales Cr.Memo Header";
                            begin
                                SalesCrMemoHeader.SetRange("Posting Date", CalcDate('<-CM>', Today), Today);
                                Page.Run(Page::"Posted Sales Credit Memos", SalesCrMemoHeader);
                            end;
                        }
                    }
                }
            }

            group(ExportSettings)
            {
                Caption = 'Export Configuration';
                ShowCaption = true;

                part(Setup; "Electronic Export Setup Part")
                {
                    ApplicationArea = All;
                    Caption = 'Current Export Settings';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(RefreshStats)
            {
                Caption = 'Refresh Statistics';
                Image = Refresh;
                ApplicationArea = All;
                ToolTip = 'Refresh the dashboard statistics and data.';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                begin
                    CalculateStatistics();
                    CurrPage.Update(false);
                    Message('Statistics refreshed successfully.');
                end;
            }

            group("Sales Invoice")
            {
                Caption = 'Sales Invoice Exports';
                Image = Invoice;

                action(ExportInvoiceExcel)
                {
                    Caption = 'Export Invoices to Excel';
                    Image = ExportToExcel;
                    ApplicationArea = All;
                    ToolTip = 'Export Sales Invoices to Excel file with separate sheets for headers and lines. You can filter by date range and customer.';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        Report.Run(Report::"Elec Inv Excel Export");
                    end;
                }
                action(ExportInvoiceText)
                {
                    Caption = 'Export Invoices to Text (XML)';
                    Image = Export;
                    ApplicationArea = All;
                    ToolTip = 'Export Sales Invoices to text file using XMLPort format for electronic submission.';
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        Xmlport.Run(Xmlport::"Electronic Invoice Port");
                    end;
                }
                action(ViewPostedInvoices)
                {
                    Caption = 'View Posted Invoices';
                    Image = PostedOrder;
                    ApplicationArea = All;
                    ToolTip = 'Open the list of all posted sales invoices.';
                    RunObject = Page "Posted Sales Invoices";
                }
            }

            group("Credit Memo")
            {
                Caption = 'Credit Memo Exports';
                Image = CreditMemo;

                action(ExportCreditMemoExcel)
                {
                    Caption = 'Export Credit Memos to Excel';
                    Image = ExportToExcel;
                    ApplicationArea = All;
                    ToolTip = 'Export Sales Credit Memos to Excel file with separate sheets for headers and lines. You can filter by date range and customer.';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        Report.Run(Report::"Elec Cr Memo Excel Export");
                    end;
                }
                action(ViewPostedCreditMemos)
                {
                    Caption = 'View Posted Credit Memos';
                    Image = PostedOrder;
                    ApplicationArea = All;
                    ToolTip = 'Open the list of all posted credit memos.';
                    RunObject = Page "Posted Sales Credit Memos";
                }
            }

            group(Configuration)
            {
                Caption = 'Setup & Configuration';
                Image = Setup;

                action(ManageExportSetup)
                {
                    Caption = 'Manage Export Setup';
                    Image = SetupList;
                    ApplicationArea = All;
                    ToolTip = 'Configure export settings including folder paths and file naming conventions.';
                    RunObject = Page "Electronic Export Setup Part";
                }
                action(ViewExportLog)
                {
                    Caption = 'View Export History';
                    Image = Log;
                    ApplicationArea = All;
                    ToolTip = 'View the history of invoice exports including success/failure status.';
                    RunObject = Page "Invoice Export Dashboard";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        CalculateStatistics();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateDisplayFields();
    end;

    local procedure CalculateStatistics()
    var
        SalesInvoiceHeader: Record "Sales Invoice Header";
        SalesCrMemoHeader: Record "Sales Cr.Memo Header";
    begin
        // Calculate Invoice Statistics - Today
        SalesInvoiceHeader.Reset();
        SalesInvoiceHeader.SetRange("Posting Date", Today);
        TotalInvoicesToday := SalesInvoiceHeader.Count();
        InvoiceAmountToday := 0;
        if SalesInvoiceHeader.FindSet() then
            repeat
                InvoiceAmountToday += SalesInvoiceHeader."Amount Including VAT";
            until SalesInvoiceHeader.Next() = 0;

        // Calculate Invoice Statistics - This Month
        SalesInvoiceHeader.Reset();
        SalesInvoiceHeader.SetRange("Posting Date", CalcDate('<-CM>', Today), Today);
        TotalInvoicesThisMonth := SalesInvoiceHeader.Count();
        InvoiceAmountThisMonth := 0;
        if SalesInvoiceHeader.FindSet() then
            repeat
                InvoiceAmountThisMonth += SalesInvoiceHeader."Amount Including VAT";
            until SalesInvoiceHeader.Next() = 0;

        // Calculate Credit Memo Statistics - Today
        SalesCrMemoHeader.Reset();
        SalesCrMemoHeader.SetRange("Posting Date", Today);
        TotalCreditMemosToday := SalesCrMemoHeader.Count();
        CreditMemoAmountToday := 0;
        if SalesCrMemoHeader.FindSet() then
            repeat
                CreditMemoAmountToday += SalesCrMemoHeader."Amount Including VAT";
            until SalesCrMemoHeader.Next() = 0;

        // Calculate Credit Memo Statistics - This Month
        SalesCrMemoHeader.Reset();
        SalesCrMemoHeader.SetRange("Posting Date", CalcDate('<-CM>', Today), Today);
        TotalCreditMemosThisMonth := SalesCrMemoHeader.Count();
        CreditMemoAmountThisMonth := 0;
        if SalesCrMemoHeader.FindSet() then
            repeat
                CreditMemoAmountThisMonth += SalesCrMemoHeader."Amount Including VAT";
            until SalesCrMemoHeader.Next() = 0;

        UpdateDisplayFields();
    end;

    local procedure UpdateDisplayFields()
    begin
        // Format display fields for better readability
        InvoicesTodayLabel := Format(TotalInvoicesToday) + ' invoices';
        InvoiceAmountTodayDisplay := Format(InvoiceAmountToday, 0, '<Precision,2:2><Standard Format,1>');
        CreditMemosTodayLabel := Format(TotalCreditMemosToday) + ' credit memos';
        CreditMemoAmountTodayDisplay := Format(CreditMemoAmountToday, 0, '<Precision,2:2><Standard Format,1>');

        InvoicesThisMonthLabel := Format(TotalInvoicesThisMonth) + ' invoices';
        InvoiceAmountThisMonthDisplay := Format(InvoiceAmountThisMonth, 0, '<Precision,2:2><Standard Format,1>');
        CreditMemosThisMonthLabel := Format(TotalCreditMemosThisMonth) + ' credit memos';
        CreditMemoAmountThisMonthDisplay := Format(CreditMemoAmountThisMonth, 0, '<Precision,2:2><Standard Format,1>');
    end;

    var
        TotalInvoicesToday: Integer;
        TotalInvoicesThisMonth: Integer;
        InvoiceAmountToday: Decimal;
        InvoiceAmountThisMonth: Decimal;
        TotalCreditMemosToday: Integer;
        TotalCreditMemosThisMonth: Integer;
        CreditMemoAmountToday: Decimal;
        CreditMemoAmountThisMonth: Decimal;
        InvoicesTodayLabel: Text;
        InvoiceAmountTodayDisplay: Text;
        CreditMemosTodayLabel: Text;
        CreditMemoAmountTodayDisplay: Text;
        InvoicesThisMonthLabel: Text;
        InvoiceAmountThisMonthDisplay: Text;
        CreditMemosThisMonthLabel: Text;
        CreditMemoAmountThisMonthDisplay: Text;
}