pageextension 50346 "pageextension50346" extends "Sales Comment Sheet"
{
    layout
    {
        addafter("Code")
        {
            field(Quantity; Rec.Quantity)
            {
                Visible = false;
                ApplicationArea = All;
            }
        }
    }
}
