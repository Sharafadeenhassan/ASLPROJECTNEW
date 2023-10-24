pageextension 50358 "pageextension50358" extends "Account Manager Activities"
{
    layout
    {
        addafter("OCR Completed")
        {
            field("MRPending For HOD Approval"; Rec."MRPending For HOD Approval")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Completed MR"; Rec."Completed MR")
            {
                ApplicationArea = Basic, Suite;
            }
            field("Rejected MR"; Rec."Rejected MR")
            {
                ApplicationArea = Basic, Suite;
            }
        }
    }
}
