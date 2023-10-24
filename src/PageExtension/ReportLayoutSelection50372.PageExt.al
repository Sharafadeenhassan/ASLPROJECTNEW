pageextension 50372 "pageextension50372" extends "Report Layout Selection"
{
    //Unsupported feature: Code Modification on "SelectReportLayout(PROCEDURE 3)".

    //procedure SelectReportLayout();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CustomReportLayout2.FilterGroup(4);
    CustomReportLayout2.SetRange("Report ID","Report ID");
    CustomReportLayout2.FilterGroup(0);
    #4..6
      if CustomReportLayout2.Find then begin
        if not (CustomReportLayout2."Company Name" in [SelectedCompany,'']) then
          Error(WrongCompanyErr);
        "Custom Report Layout Code" := CustomReportLayout2.Code;
        Type := Type::"Custom Layout";
        UpdateRec;
    #13..18
          UpdateRec;
        end;
    exit(OK);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9

    #10..21
    */
    //end;
}
