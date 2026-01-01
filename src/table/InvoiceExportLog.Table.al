table 50060 "Invoice Export Log"
{
    Caption = 'Invoice Export Log';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = CustomerContent;
        }
        field(2; "Export DateTime"; DateTime)
        {
            Caption = 'Export DateTime';
            DataClassification = SystemMetadata;
        }
        field(3; Success; Boolean)
        {
            Caption = 'Success';
            DataClassification = SystemMetadata;
        }
        field(4; "Error Message"; Text[250])
        {
            Caption = 'Error Message';
            DataClassification = SystemMetadata;
        }
    }
    keys
    {
        key(PK; "Invoice No.")
        {
            Clustered = true;
        }
    }
}
