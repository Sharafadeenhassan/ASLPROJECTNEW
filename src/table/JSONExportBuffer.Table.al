table 50055 "JSON Export Buffer"
{
    Caption = 'JSON Export Buffer';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
        }
        field(2; FileName; Text[100])
        {
            Caption = 'FileName';
        }
        field(3; Content; Blob)
        {
            Caption = 'Content';
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
