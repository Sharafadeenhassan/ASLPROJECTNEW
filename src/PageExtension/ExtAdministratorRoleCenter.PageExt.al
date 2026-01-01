pageextension 50002 "Ext Administrator Role Center" extends "Administrator Role Center"
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


