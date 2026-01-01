page 50144 "Invoice Export Dashboard"
{
    PageType = List;
    SourceTable = "Invoice Export Log";
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group("Export Activity")
            {
                repeater(Group)
                {
                    field("Invoice No."; Rec."Invoice No.") { ApplicationArea = All; }
                    field("Export DateTime"; Rec."Export DateTime") { ApplicationArea = All; }
                    field("Success"; Rec."Success") { ApplicationArea = All; }
                    field("Error Message"; Rec."Error Message") { ApplicationArea = All; }
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(ViewSetup)
            {
                Caption = 'View Setup';
                ApplicationArea = All;
                RunObject = Page "Invoice Export Setup Card";
            }

            action(RunExport)
            {
                Caption = 'Run Batch Export';
                ApplicationArea = All;
                RunObject = Report "Batch Invoice Export";
            }
        }
    }
}
