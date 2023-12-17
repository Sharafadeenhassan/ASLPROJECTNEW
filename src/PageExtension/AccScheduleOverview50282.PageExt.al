pageextension 50282 "pageextension50282" extends "Acc. Schedule Overview"
{
    layout
    {
        modify(General)
        {
            Visible = true;
        }
        modify("Dimension Filters")
        {
            Visible = false;
        }
    }
}
