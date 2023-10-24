tableextension 50280 "tableextension50280" extends "Invoice Post. Buffer"
{
    fields
    {
        field(50362; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
            TableRelation = IF ("Reason Code" = CONST('USAGE')) "Fixed Asset" WHERE("FA Subclass Code" = FILTER(<> 'VESSEL'))
            ELSE
            IF ("Reason Code" = CONST('USAGERES')) Location WHERE("Location Type" = FILTER(Residence))
            ELSE
            IF ("Reason Code" = CONST('USAGEOTHRS')) "Standard Text" WHERE(Others = CONST(true));
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
    }
}
