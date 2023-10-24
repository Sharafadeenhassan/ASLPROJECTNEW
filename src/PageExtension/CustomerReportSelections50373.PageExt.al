pageextension 50373 "pageextension50373" extends "Customer Report Selections"
{
    layout
    {
        //Unsupported feature: Code Modification on "Usage2(Control 3).OnAfterValidate".

        //trigger OnAfterValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        case Usage2 of
          Usage2::Quote:
            Usage := Usage::"S.Quote";
        #4..11
          Usage2::"Job Quote":
            Usage := Usage::JQ;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        // Map from the page option to the table option
        #1..14
        */
        //end;
    }

    //Unsupported feature: Code Insertion (VariableCollection) on "OnAfterGetRecord".

    //trigger (Variable: CustomReportSelection)()
    //Parameters and return type have not been exported.
    //begin
    /*
    */
    //end;

    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MapTableUsageValueToPageValue;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    CurrPage.Update(false);

    {// Map from the table option to the page option
    CASE Usage OF
      CustomReportSelection.Usage::"S.Quote":
        Usage2 := Usage::"S.Quote";
      CustomReportSelection.Usage::"S.Order":
        Usage2 := Usage::"S.Order";
      CustomReportSelection.Usage::"S.Invoice":
        Usage2 := Usage::"S.Invoice";
      CustomReportSelection.Usage::"S.Cr.Memo":
        Usage2 := Usage::"S.Cr.Memo";
      CustomReportSelection.Usage::"C.Statement":
        Usage2 := Usage2::"Customer Statement";
    END;}
    MapTableUsageValueToPageValue;
    */
    //end;

    //Unsupported feature: Property Deletion (DelayedInsert).
}
