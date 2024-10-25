pageextension 50209 "pageextension50209" extends "User Setup"
{
    //
    // UNL-ASL3.60.01.009 (Santus) June 14, 2005
    // -> added new control "Pick Blocked Empl in Journal";
    layout
    {
        addafter("Allow Posting To")
        {
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
            }
        }
        addafter("Time Sheet Admin.")
        {
            field("Create Loan"; Rec."Create Loan")
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            field("Unblock Employee"; Rec."Unblock Employee")
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            field("Edit Resource"; Rec."Edit Resource")
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            field("Periodic Activits/SetUp Access"; Rec."Periodic Activits/SetUp Access")
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            field("Job Catch"; Rec."Job Catch")
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            field("Pick Blocked Empl in Journal"; Rec."Pick Blocked Empl in Journal")
            {
                ShowCaption = true;
                ApplicationArea = All;
            }
            field("JrnllineShowCRM-ASL"; Rec."JrnllineShowCRM-ASL")
            {
                ApplicationArea = All;
            }
            field("Confirm StockOutWarning"; Rec."Confirm StockOutWarning")
            {
                ShowCaption = true;
                Visible = true;
                ApplicationArea = All;
            }
            field("Sales Price"; Rec."Sales Price")
            {
                ApplicationArea = All;
            }
            field("Store Req 1st Approval"; Rec."Store Req 1st Approval")
            {
                ApplicationArea = All;
            }
            field("Store Req Final Approval"; Rec."Store Req Final Approval")
            {
                ApplicationArea = All;
            }
            field("Fish Stk Req F.Approval"; Rec."Fish Stk Req F.Approval")
            {
                ApplicationArea = All;
            }
            field("Print DN"; Rec."Print DN")
            {
                ApplicationArea = All;
            }
            field("Reprint DN"; Rec."Reprint DN")
            {
                ApplicationArea = All;
            }
            field("Return Release To Open"; Rec."Return Release To Open")
            {
                Caption = 'Change Status Release To Open';
                ApplicationArea = All;
            }
            field("Print MR"; Rec."Print MR")
            {
                ApplicationArea = All;
            }
            field("Reprint MR"; Rec."Reprint MR")
            {
                ApplicationArea = All;
            }
            field("Modify Item"; Rec."Modify Item")
            {
                ApplicationArea = All;
            }
            field("Modify Vendor"; Rec."Modify Vendor")
            {
                ApplicationArea = All;
            }
            field("Use Item Journal"; Rec."Use Item Journal")
            {
                ApplicationArea = All;
            }
            field("Modify Customer"; Rec."Modify Customer")
            {
                ApplicationArea = All;
            }
            field("Allow FT Product"; "Allow FT Product")
            {
                ApplicationArea = All;
            }
            field("Allow Non FT Product"; "Allow Non FT Product")
            {
                ApplicationArea = All;
            }
            field("FS Cashier"; "FS Cashier")
            {
                ApplicationArea = All;
            }
            field("FS Suspend Sale"; "FS Suspend Sale")
            {
                ApplicationArea = All;
            }
            field("FS Cancel Sales"; "FS Cancel Sales")
            {
                ApplicationArea = All;
            }
            field("Fish Shop Code"; "Fish Shop Code")
            {
                ApplicationArea = All;
            }
            field("Fish Shop Terminal"; "Fish Shop Terminal")
            {
                ApplicationArea = All;
            }
            field(StoreKeeper; rec.StoreKeeper)
            {
                ApplicationArea = all;
            }
            field("Allow DPS Security Check"; rec."Allow DPS Security Check")
            {
                ApplicationArea = All;
            }
            field("Allow DPS Store Process"; rec."Allow DPS Store Process")
            {
                ApplicationArea = All;
            }
            field("Allowed DPS QC Check"; "Allowed DPS QC Check")
            {
                ApplicationArea = All;
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = all;
            }
            field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
            {
                ApplicationArea = all;
            }
        }
    }
}
