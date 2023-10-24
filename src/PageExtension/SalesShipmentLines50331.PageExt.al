pageextension 50331 "pageextension50331" extends "Sales Shipment Lines"
{
    //Unsupported feature: Code Modification on "IsFirstLine(PROCEDURE 2)".

    //procedure IsFirstLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TempSalesShptLine.Reset;
    TempSalesShptLine.CopyFilters(Rec);
    TempSalesShptLine.SetRange("Document No.",DocNo);
    if not TempSalesShptLine.FindFirst then begin
      SalesShptLine.CopyFilters(Rec);
      SalesShptLine.SetRange("Document No.",DocNo);
      if SalesShptLine.FindFirst then begin
        TempSalesShptLine := SalesShptLine;
        TempSalesShptLine.Insert;
      end;
    end;
    if TempSalesShptLine."Line No." = LineNo then
      exit(true);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..6
      SalesShptLine.FindFirst;
      TempSalesShptLine := SalesShptLine;
      TempSalesShptLine.Insert;
    #11..13
    */
    //end;
}
