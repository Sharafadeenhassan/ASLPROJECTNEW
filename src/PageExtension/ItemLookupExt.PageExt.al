pageextension 50032 "Item Lookup Ext" extends "Item Lookup"
{
    layout
    {
        addafter(Description)
        {
            field("FT Product"; "FT Product")
            {
                Visible = true;
            }
            field(Inventory; Inventory)
            {
                Visible = true;
            }
            field("CRM / STR"; "CRM / STR")
            {
                Visible = true;
            }
        }
    }
    trigger OnOpenPage()
    var
        UserRec: Record "User Setup";
    begin
        
        IF UserRec.GET(UserId) THEN
            IF UserRec."Allow Non FT Product" THEN
                Rec.SETRANGE("FT Product", FALSE)
            else
                IF UserRec."Allow FT Product" THEN
                    Rec.SETRANGE("FT Product", TRUE);
            end;

}
