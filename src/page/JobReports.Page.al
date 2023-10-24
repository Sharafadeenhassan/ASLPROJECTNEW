page 50165 "Job-Reports"
{
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All, Basic;
    Caption = 'Job-Reports';
    layout
    {
        area(content)
        {
        }
    }

    actions
    {
        area(processing)
        {
        }
        area(reporting)
        {
            group(Jobs)
            {
                Image = "report";
                action("Points Summary")
                {
                    Image = "Report";
                    ApplicationArea = All;
                    //***R RunObject = Report "Points Summary VJ";
                }
                action("New Daily Points Report Fast")
                {
                    Image = "Report";
                    RunObject = Report "New Daily Points Report Fast";
                    ApplicationArea = All;
                }
                action("Consolidated Narration")
                {
                    Image = "Report";
                    RunObject = Report "Consolidated Narration";
                    ApplicationArea = All;
                }
                action("Daily BreakUp by Vess Summary")
                {
                    Image = "Report";
                    RunObject = Report "Daily BreakUp by Vess Summary";
                    ApplicationArea = All;
                }
                action("Daily BreakUp by Vessel Rep 1")
                {
                    Image = "Report";
                    ApplicationArea = All;
                    ///       RunObject = Report "Daily BreakUp by Vessel Rep 1";
                }
                action("Daily BreakUp by Vessel Rep 2")
                {
                    Image = "Report";
                    RunObject = Report "Daily BreakUp by Vessel Rep 2";
                    ApplicationArea = All;
                }
                action("Daily BreakUp by Vessel Rep 3")
                {
                    Image = "Report";
                    RunObject = Report "Daily BreakUp by Vessel Rep 3";
                    ApplicationArea = All;
                }
                action("Daily BreakUp by Vessel Rep 4")
                {
                    Image = "Report";
                    RunObject = Report "Daily BreakUp by Vessel Rep 4";
                    ApplicationArea = All;
                }
                action("Vessel Daily Log")
                {
                    Image = "Report";
                    RunObject = Report "Vessel Daily Log";
                    ApplicationArea = All;
                }
                action("Voyage Narration")
                {
                    Image = AnalysisView;
                    RunObject = Report "Voyage Narration";
                    ApplicationArea = All;
                }
                action("Transfer To Vessel")
                {
                    Image = Add;
                    RunObject = Report "Transfer To Vessel";
                    ApplicationArea = All;
                }
                action("Report Organoleptic")
                {
                    Caption = 'Report Organoleptic';
                    Image = "Report";
                    RunObject = Report Organoleptic;
                    ApplicationArea = All;
                }
                action("Job - Transaction Detail 2")
                {
                    Caption = 'Job - Transaction Detail 2';
                    Image = "report";
                    RunObject = Report "Job - Transaction Detail 2";
                    ApplicationArea = All;
                }
            }
        }
    }
}
