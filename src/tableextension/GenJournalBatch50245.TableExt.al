tableextension 50245 "tableextension50245" extends "Gen. Journal Batch"
{ 
    fields
    {
        field(50329; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50330; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50331; "Batch Refrence"; Code[20])
        {
        }
    }
}
