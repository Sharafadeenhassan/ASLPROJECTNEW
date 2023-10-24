pageextension 50319 "pageextension50319" extends Maintenance
{
    Editable = false;
    actions
    {
        addfirst(creation)
        {
            action("&Edit Maintenace Code")
            {
                Caption = '&Edit Maintenace Code';
                RunObject = Page Maintenance;
                ApplicationArea = All;
            }
            action(Ok)
            {
                Caption = 'Ok';
                ApplicationArea = All;
            }
        }
    }
}
