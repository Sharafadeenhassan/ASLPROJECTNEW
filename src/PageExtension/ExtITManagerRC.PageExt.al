pageextension 50001 "Ext IT Manager RC" extends "Business Manager Role Center"
{
      layout
    {
        addlast(rolecenter)
        {
            part(ExportDashboard; "Invoice Export Dashboard")
            {
                ApplicationArea = All;
            }
        }
    }
}
