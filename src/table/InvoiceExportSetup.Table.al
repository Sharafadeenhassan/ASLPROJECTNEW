table 50056 "Invoice Export Setup"
{
    Caption = 'Invoice Export Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
            InitValue = 'DEFAULT';
        }
        field(2; "API URL"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Live API URL';
        }
        field(3; "Environment"; Option)
{
    OptionMembers = Test,Live;
    DataClassification = ToBeClassified;
}
field(4; "Test API URL"; Text[250])
        {
            DataClassification = ToBeClassified;
            Caption = 'Test API URL';
        }
    }

    keys
    {
        key(PK; "Primary Key") { Clustered = true; }
    }
}


