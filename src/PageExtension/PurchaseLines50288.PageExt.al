pageextension 50288 "pageextension50288" extends "Purchase Lines"
{
    layout
    {
        modify("Document Type")
        {
            Visible = false;
        }
        modify("Document No.")
        {
            Visible = false;
        }
        modify("Buy-from Vendor No.")
        {
            Visible = false;
        }
        modify(Type)
        {
            Visible = false;
        }
        modify("Reserved Qty. (Base)")
        {
            Visible = false;
        }
        modify("Outstanding Quantity")
        {
            Visible = false;
        }
        modify("Indirect Cost %")
        {
            Visible = true;
        }
    }
}
