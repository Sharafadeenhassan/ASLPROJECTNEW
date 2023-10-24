pageextension 50365 "pageextension50365" extends "Sales Order List"
{
    actions
    {
        //Unsupported feature: Property Modification (Name) on ""Print Confirmation"(Action 151)".
    }

    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if UserMgt.GetSalesFilter <> '' then begin
      FilterGroup(2);
      SetRange("Responsibility Center",UserMgt.GetSalesFilter);
      FilterGroup(0);
    end;

    SetRange("Date Filter",0D,WorkDate);

    JobQueueActive := SalesSetup.JobQueueActive;
    CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
    IsOfficeAddin := OfficeMgt.IsAvailable;

    CopySellToCustomerFilter;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
    //SETRANGE("Date Filter",0D,WORKDATE);
    #8..13
    */
    //end;
}
