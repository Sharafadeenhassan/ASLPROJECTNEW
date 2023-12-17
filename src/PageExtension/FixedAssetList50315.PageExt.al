pageextension 50315 "pageextension50315" extends "Fixed Asset List"
{
    layout
    {
        addafter("Description")
        {
            field(Blocked; Rec.Blocked)
            {
                ApplicationArea = FixedAsset;
            }
            field("Serial No.";"Serial No.")
            {
                ApplicationArea = FixedAssets;
                ToolTip = 'Specify The Unique Serial No for The Asset e.g Vehicle Registration No.';
                Visible = True;
            }
        }
    }
}
