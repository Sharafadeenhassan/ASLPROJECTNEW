pageextension 50234 "pageextension50234" extends "Chart of Accounts"
{
    layout
    {
        modify("No.")
        {
            Editable = false;
        }
    }
    actions
    {
        modify("&Balance")
        {
            Visible = false;
        }
    }
}
