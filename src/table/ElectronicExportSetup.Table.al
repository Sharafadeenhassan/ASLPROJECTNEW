table 50800 "Electronic Export Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Export Folder Path"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Export Folder Path';
            InitValue = 'C:\Exports';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}