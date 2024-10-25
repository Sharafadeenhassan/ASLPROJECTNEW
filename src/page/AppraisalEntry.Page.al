page 50028 "Appraisal Entry"
{
    Caption = 'Appraisal Entry';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Sales Header";
    SourceTableView = WHERE("Document Type" = FILTER("Return Order"));
    UsageCategory = History;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Appraisal Selection"; Rec."Appraisal Selection")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    Caption = 'Appraisee No.';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        SelltoCustomerNoOnAfterValidat();
                    end;
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    Caption = 'Name';
                    ApplicationArea = All;
                }
                field("Sell-to Address"; Rec."Sell-to Address")
                {
                    Caption = 'Address';
                    ApplicationArea = All;
                }
                field("Sell-to Address 2"; Rec."Sell-to Address 2")
                {
                    Caption = 'Address 2';
                    ApplicationArea = All;
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    Caption = 'Post Code/City';
                    ApplicationArea = All;
                }
                field("Sell-to City"; Rec."Sell-to City")
                {
                    ApplicationArea = All;
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    Caption = 'Contact';
                    ApplicationArea = All;
                }
                field("Contr. Code/Postn.  Applied"; Rec."Contr. Code/Postn.  Applied")
                {
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ShortcutDimension1CodeOnAfterV();
                    end;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        ShortcutDimension2CodeOnAfterV();
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Posting No. Series"; Rec."Posting No. Series")
                {
                    ApplicationArea = All;
                }
            }
            part(SalesLines; "Appraisal Entry Subform.")
            {
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
            group(Interview)
            {
                Caption = 'Interview';
                label(Control1000000016)
                {
                    CaptionClass = Text19064607;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000021)
                {
                    CaptionClass = Text19060600;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Skill Score"; Rec."Skill Score")
                {
                    ApplicationArea = All;
                }
                field("Skill Total"; Rec."Skill Total")
                {
                    ApplicationArea = All;
                }
                field("Performance Score"; Rec."Performance Score")
                {
                    ApplicationArea = All;
                }
                label(Control1000000023)
                {
                    CaptionClass = Text19012021;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Cgrade; Rec.Cgrade)
                {
                    Caption = 'Current';
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Rgrade; Rec.Rgrade)
                {
                    Caption = 'Recommended';
                    ApplicationArea = All;
                }
                field(Agrade; Rec.Agrade)
                {
                    Caption = 'Approved';
                    ApplicationArea = All;
                }
                label(Control1000000022)
                {
                    CaptionClass = Text19068379;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field("Skill Percentage"; Rec."Skill Percentage")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Performance Total"; Rec."Performance Total")
                {
                    ApplicationArea = All;
                }
                field("Performance Percentage"; Rec."Performance Percentage")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Total Percentage"; Rec."Total Percentage")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                label(Control1000000014)
                {
                    CaptionClass = Text19015031;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000019)
                {
                    CaptionClass = Text19080001;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000020)
                {
                    CaptionClass = Text19080002;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000024)
                {
                    CaptionClass = Text19032492;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000031)
                {
                    CaptionClass = Text19055220;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Cstep; Rec.Cstep)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Cedamount; Rec.Cedamount)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Rstep; Rec.Rstep)
                {
                    ApplicationArea = All;
                }
                field(Redamount; Rec.Redamount)
                {
                    ApplicationArea = All;
                }
                field(Astep; Rec.Astep)
                {
                    ApplicationArea = All;
                }
                label(Control1000000042)
                {
                    CaptionClass = Text19000744;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Date1; Rec.Date1)
                {
                    ApplicationArea = All;
                }
                field(Date2; Rec.Date2)
                {
                    ApplicationArea = All;
                }
                field(Date3; Rec.Date3)
                {
                    ApplicationArea = All;
                }
                field(Date4; Rec.Date4)
                {
                    ApplicationArea = All;
                }
                field(Date5; Rec.Date5)
                {
                    ApplicationArea = All;
                }
                field(Date6; Rec.Date6)
                {
                    ApplicationArea = All;
                }
                field(Date7; Rec.Date7)
                {
                    ApplicationArea = All;
                }
                label(Control1000000039)
                {
                    CaptionClass = Text19015056;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Date8; Rec.Date8)
                {
                    ApplicationArea = All;
                }
                label(Control1000000040)
                {
                    CaptionClass = Text19080003;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Aedamount; Rec.Aedamount)
                {
                    ApplicationArea = All;
                }
                label(Control1000000043)
                {
                    CaptionClass = Text19051066;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Skill1; Rec.Skill1)
                {
                    ApplicationArea = All;
                }
                field(Skill2; Rec.Skill2)
                {
                    ApplicationArea = All;
                }
                field(Date9; Rec.Date9)
                {
                    ApplicationArea = All;
                }
                label(Control1000000041)
                {
                    CaptionClass = Text19080004;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000044)
                {
                    CaptionClass = Text19052518;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                label(Control1000000046)
                {
                    CaptionClass = Text19003762;
                    ShowCaption = false;
                    ApplicationArea = All;
                }
                field(Performance1; Rec.Performance1)
                {
                    ApplicationArea = All;
                }
                field(Tpercent1; Rec.Tpercent1)
                {
                    ApplicationArea = All;
                }
                field(Performance2; Rec.Performance2)
                {
                    ApplicationArea = All;
                }
                field(Skill3; Rec.Skill3)
                {
                    ApplicationArea = All;
                }
                field(Performance3; Rec.Performance3)
                {
                    ApplicationArea = All;
                }
                field(Skill4; Rec.Skill4)
                {
                    ApplicationArea = All;
                }
                field(Performance4; Rec.Performance4)
                {
                    ApplicationArea = All;
                }
                field(Skill5; Rec.Skill5)
                {
                    ApplicationArea = All;
                }
                field(Performance5; Rec.Performance5)
                {
                    ApplicationArea = All;
                }
                field(Skill6; Rec.Skill6)
                {
                    ApplicationArea = All;
                }
                field(Performance6; Rec.Performance6)
                {
                    ApplicationArea = All;
                }
                field(Skill7; Rec.Skill7)
                {
                    ApplicationArea = All;
                }
                field(Performance7; Rec.Performance7)
                {
                    ApplicationArea = All;
                }
                field(Skill8; Rec.Skill8)
                {
                    ApplicationArea = All;
                }
                field(Skill9; Rec.Skill9)
                {
                    ApplicationArea = All;
                }
                field(Tpercent2; Rec.Tpercent2)
                {
                    ApplicationArea = All;
                }
                field(Tpercent3; Rec.Tpercent3)
                {
                    ApplicationArea = All;
                }
                field(Tpercent4; Rec.Tpercent4)
                {
                    ApplicationArea = All;
                }
                field(Tpercent5; Rec.Tpercent5)
                {
                    ApplicationArea = All;
                }
                field(Tpercent6; Rec.Tpercent6)
                {
                    ApplicationArea = All;
                }
                field(Tpercent7; Rec.Tpercent7)
                {
                    ApplicationArea = All;
                }
                field(Performance8; Rec.Performance8)
                {
                    ApplicationArea = All;
                }
                field(Tpercent8; Rec.Tpercent8)
                {
                    ApplicationArea = All;
                }
                field(Performance9; Rec.Performance9)
                {
                    ApplicationArea = All;
                }
                field(Tpercent9; Rec.Tpercent9)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Order")
            {
                Caption = 'Order';
                Visible = false;
                action(List)
                {
                    ShortCutKey = 'F5';
                    ApplicationArea = All;
                }
                action(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'F7';
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        SalesSetup.Get();
                        if SalesSetup."Calc. Inv. Discount" then begin
                            //CurrPage.SalesLines.PAGE.CalcInvDisc();
                            Commit()
                        end;
                        PAGE.RunModal(PAGE::"Sales Order Statistics", Rec);
                    end;
                }
                action(Card)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    // RunObject = Page "Customer Card";  //*** revISit
                    // RunPageLink = "No." = FIELD ("Sell-to Customer No.");
                    ShortCutKey = 'Shift+F7';
                    Visible = true;
                    ApplicationArea = All;
                }
                action(Action1000000007)
                {
                    Caption = 'Card';
                    Image = EditLines;
                    RunObject = Page "Employee Card";
                    ShortCutKey = 'Shift+F7';
                    ApplicationArea = All;
                }
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Sales Comment Sheet";
                    RunPageLink = "Document Type" = FIELD("Document Type"),
                                  "No." = FIELD("No.");
                    ApplicationArea = All;
                }
                action("S&hipments")
                {
                    Caption = 'S&hipments';
                    RunObject = Page "Posted Sales Shipments";
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                    Visible = true;
                    ApplicationArea = All;
                }
                action(Invoices)
                {
                    Caption = 'Invoices';
                    Image = Invoice;
                    RunObject = Page "Posted Sales Invoices";
                    RunPageLink = "Order No." = FIELD("No.");
                    RunPageView = SORTING("Order No.");
                    Visible = true;
                    ApplicationArea = All;
                }
                action(Action122)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Dimension Values";
                    Visible = true;
                    ApplicationArea = All;
                }
                separator(Action120)
                {
                }
            }
            group(Line)
            {
                Caption = 'Line';
                action("Item Availability by")
                {
                    ApplicationArea = All;
                }
                action(Period)
                {
                    ApplicationArea = All;
                }
                action(Variant)
                {
                    ApplicationArea = All;
                }
                action(Location)
                {
                    ApplicationArea = All;
                }
                action("Reservation Entries")
                {
                    ApplicationArea = All;
                }
                action("Select Item Substitution")
                {
                    ApplicationArea = All;
                }
                action(Dimensions)
                {
                    ShortCutKey = 'Shift+Ctrl+D';
                    ApplicationArea = All;
                }
                action("Item Charge &Assignment")
                {
                    ApplicationArea = All;
                }
                action("Item &Tracking Lines")
                {
                    ApplicationArea = All;
                }
            }
            group(Functions)
            {
                Caption = 'Functions';
                action("Calculate &Invoice Discount")
                {
                    Caption = 'Calculate &Invoice Discount';
                    ApplicationArea = All;
                }
                action("E&xplode BOM")
                {
                    Caption = 'E&xplode BOM';
                    ApplicationArea = All;
                }
                action("Copy Document")
                {
                    Caption = 'Copy Document';
                    Ellipsis = true;
                    Image = CopyDocument;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        CopySalesDoc.SetSalesHeader(Rec);
                        CopySalesDoc.RunModal();
                        Clear(CopySalesDoc);
                    end;
                }
                action("Insert &Ext. Texts")
                {
                    Caption = 'Insert &Ext. Texts';
                    ApplicationArea = All;
                }
                action("Drop Shipment")
                {
                    Caption = 'Drop Shipment';
                    ApplicationArea = All;
                }
                action("Purchase &Order")
                {
                    Caption = 'Purchase &Order';
                    ApplicationArea = All;
                }
                action("Special Order")
                {
                    Caption = 'Special Order';
                    ApplicationArea = All;
                }
                action("&Reserve")
                {
                    Caption = '&Reserve';
                    ApplicationArea = All;
                }
                action("Nonstoc&k Items")
                {
                    Caption = 'Nonstoc&k Items';
                    Enabled = true;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if not UpdateAllowed() then
                            exit;

                        //CurrPage.SalesLines.PAGE.ShowNonstockItems();
                    end;
                }
                action("Order &Tracking")
                {
                    Caption = 'Order &Tracking';
                    ApplicationArea = All;
                }
                action(Warehouse)
                {
                    Caption = 'Warehouse';
                    ApplicationArea = All;
                }
                action("Order &Promising")
                {
                    Caption = 'Order &Promising';
                    Enabled = true;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        OrderPromising: Page "Order Promising Lines";
                    begin
                        OrderPromising.SetSalesHeader(Rec);
                        OrderPromising.RunModal();
                    end;
                }
                group(Action148)
                {
                    Caption = 'Warehouse';
                    Enabled = false;
                    Visible = false;
                    action("Activity List")
                    {
                        Caption = 'Activity List';
                        Enabled = true;
                        RunObject = Page "Warehouse Activity List";
                        RunPageLink = Type = FILTER(Movement | "Invt. Put-away" | "Invt. Pick"),
                                      "No. of Lines" = FILTER(> 0),
                                      "Source Type Filter" = CONST(1),
                                      "Source Subtype Filter" = FIELD("Document Type"),
                                      "Source No. Filter" = FIELD("No.");
                        Visible = true;
                        ApplicationArea = All;
                    }
                    action("Create Assignment")
                    {
                        Caption = 'Create Assignment';
                        Enabled = true;
                        Visible = true;
                        ApplicationArea = All;

                        trigger OnAction()
                        var
                            RetrieveSourceDocOutbound: Codeunit "Get Source Doc. Outbound";
                        begin
                            RetrieveSourceDocOutbound.CreateFromSalesOrder(Rec);
                        end;
                    }
                }
                action("Re&lease")
                {
                    Caption = 'Re&lease';
                    Enabled = true;
                    Image = ReleaseDoc;
                    RunObject = Codeunit "Release Sales Document";
                    ShortCutKey = 'Ctrl+F9';
                    Visible = true;
                    ApplicationArea = All;
                }
                action("Re&open")
                {
                    Caption = 'Re&open';
                    Enabled = true;
                    Image = ReOpen;
                    Visible = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        ReleaseSalesDoc.Reopen(Rec);
                    end;
                }
                action("Ge&nerate Appraisal Line")
                {
                    Caption = 'Ge&nerate Appraisal Line';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        DocPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("&Up-date Applicant Score")
                {
                    Caption = '&Up-date Applicant Score';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        //Univision Start 010202 Yusuf
                        if Rec."Appraisal Selection" = 1 then
                            if applicant.Get(Rec."Sell-to Customer No.") then
                            //SETRANGE("No.",applicant."No.");
                            begin
                                applicant."First Interview Result" := Rec."Skill Score";
                                applicant."First Interview Maximum" := Rec."Skill Total";
                                applicant."First Interview Date" := Rec."Posting Date";
                                applicant.Modify();
                            end;
                        //Univision End 010202 Yusuf
                    end;
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                action("Test Report")
                {
                    Caption = 'Test Report';
                    Ellipsis = true;
                    Image = TestReport;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        ReportPrint.PrintSalesHeader(Rec);
                    end;
                }
                action("P&ost")
                {
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit "Sales-Post (Yes/No)";
                    ShortCutKey = 'F9';
                    ApplicationArea = All;
                }
                action("Post and &Print")
                {
                    Caption = 'Post and &Print';
                    Ellipsis = true;
                    Image = PostPrint;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Codeunit "Sales-Post + Print";
                    ShortCutKey = 'Shift+F9';
                    ApplicationArea = All;
                }
                action("Post &Batch")
                {
                    Caption = 'Post &Batch';
                    Ellipsis = true;
                    Image = PostBatch;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        REPORT.RunModal(REPORT::"Batch Post Sales Orders", true, true, Rec);
                        CurrPage.Update(false);
                    end;
                }
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.SaveRecord();
        exit(Rec.ConfirmDeletion());
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Responsibility Center" := UserMgt.GetSalesFilter();
    end;

    trigger OnOpenPage()
    begin
        if UserMgt.GetSalesFilter() <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Responsibility Center", UserMgt.GetSalesFilter());
            Rec.FilterGroup(0);
        end;

        Rec.SetRange("Date Filter", 0D, WorkDate() - 1);
        //OnActivatePage;  #1
    end;

    var
        Text000: Label 'Unable to execute this function while in view only mode.';
        CopySalesDoc: Report "Copy Sales Document";
        ReportPrint: Codeunit "Test Report-Print";
        DocPrint: Codeunit "Document-Print";
        SalesSetup: Record "Sales & Receivables Setup";
        UserMgt: Codeunit "User Setup Management";
        Larger: Text[1];
        Precision: Decimal;
        ttscore: Decimal;
        result: Decimal;
        applicant: Record Applicants;
        Text19064607: Label 'Score';
        Text19060600: Label 'Over';
        Text19012021: Label 'Grade';
        Text19068379: Label '%tage';
        Text19015031: Label '%';
        Text19080001: Label '%';
        Text19080002: Label '%';
        Text19032492: Label 'Step';
        Text19055220: Label 'Gross Pay';
        Text19000744: Label 'Date';
        Text19015056: Label 'N';
        Text19080003: Label 'N';
        Text19051066: Label 'Skill';
        Text19080004: Label 'N';
        Text19052518: Label 'Performance';
        Text19003762: Label 'Total %';

    [Scope('OnPrem')]
    procedure UpdateAllowed(): Boolean
    begin
        if CurrPage.Editable = false then
            Error(Text000);
        exit(true);
    end;

    local procedure SelltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update();
    end;

    local procedure ShortcutDimension2CodeOnAfterV()
    begin
        CurrPage.SalesLines.PAGE.Update(true);
    end;

    local procedure ShortcutDimension1CodeOnAfterV()
    begin
        CurrPage.SalesLines.PAGE.Update(true);
    end;

    local procedure OnActivateForm()
    begin
        //Univision Start 31/10/01 Yusuf
        Rec."Skill Percentage" := 0;
        Larger := '>';
        Precision := 0.1;
        if Rec."Skill Total" > 0 then
            Rec."Skill Percentage" := (Rec."Skill Score" / Rec."Skill Total") * 100
        else
            Rec."Skill Percentage" := 0;
        Rec."Skill Percentage" := Round(Rec."Skill Percentage", Precision, Larger);

        Rec."Performance Percentage" := 0;
        Larger := '>';
        Precision := 0.1;
        if Rec."Performance Total" > 0 then
            Rec."Performance Percentage" := (Rec."Performance Score" / Rec."Performance Total") * 100
        else
            Rec."Performance Percentage" := 0;
        Rec."Performance Percentage" := Round(Rec."Performance Percentage", Precision, Larger);

        Rec."Total Percentage" := 0;
        Larger := '>';
        Precision := 0.1;
        ttscore := Rec."Skill Score" + Rec."Performance Score";
        result := Rec."Skill Total" + Rec."Performance Total";
        if result > 0 then
            Rec."Total Percentage" := (ttscore / result) * 100
        else
            Rec."Total Percentage" := 0;
        Rec."Total Percentage" := Round(Rec."Total Percentage", Precision, Larger);
        // Univision Finish 31/10/01 Yusuf
    end;
}
