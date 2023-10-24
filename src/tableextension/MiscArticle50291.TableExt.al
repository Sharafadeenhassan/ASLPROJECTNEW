tableextension 50291 "tableextension50291" extends "Misc. Article"
{
    fields
    {
        field(50000; "Mat Type"; Option)
        {
            OptionMembers = " ","Stock Item";
        }
        field(50001; "Item No."; Code[20])
        {
            TableRelation = IF ("Mat Type" = CONST("Stock Item")) Item."No.";

            trigger OnValidate()
            begin
                if itemrec.Get("Item No.") then
                    Description := itemrec.Description;
            end;
        }
        field(50002; Replaceable; Boolean)
        {
        }
        field(50003; "Replacement Interval"; DateFormula)
        {
        }
    }

    var
        itemrec: Record Item;
}
