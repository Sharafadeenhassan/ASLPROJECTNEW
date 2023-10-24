tableextension 50224 "tableextension50224" extends "G/L Account"
{
    //Unsupported feature: Property Insertion (Permissions) on ""G/L Account"(Table 15)".

    fields
    {
        field(50000; "Ext. DocNo. Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "G/L Entry"."External Document No.";
        }
        field(50001; "Job Filter"; Code[10])
        {
            TableRelation = Job."No.";
        }
        field(50002; "Reason Code Filter"; Code[10])
        {
            FieldClass = FlowField;
            TableRelation = "Reason Code".Code;
            Editable = false;
        }
        field(50003; "Department Posting"; Date)
        {
        }
    }
}
