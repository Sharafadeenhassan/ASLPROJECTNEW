tableextension 50279 "tableextension50279" extends "Invt. Posting Buffer"
{
    fields
    {
        field(50362; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
        }
        field(50364; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";

            trigger OnValidate()
            begin
                // AAA -Feb 2002
                //IF "Reason Code"='USAGE' THEN "Gen. Bus. Posting Group":='LOCAL';
            end;
        }
        field(50365; "Maintenance Code"; Code[10])
        {
        }
    }
}
