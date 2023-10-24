tableextension 50249 "tableextension50249" extends "Requisition Wksh. Name"
{
    fields
    {
        field(50001; Approved; Boolean)
        {
        }
        field(50002; "Requested By"; Code[10])
        {
            CalcFormula = Min("Requisition Line"."Requester ID" WHERE("Worksheet Template Name" = FIELD("Worksheet Template Name"),
                                                                       "Journal Batch Name" = FIELD(Name)));
            FieldClass = FlowField;
            Editable = false;
        }
    }
}
