tableextension 50329 "tableextension50329" extends "Finance Cue"
{
    fields
    {
        field(50001; "MRPending for Store Approval"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("1st Approved" = CONST(Approved),
                                                                      "Final Approved" = FILTER(<> Approved),
                                                                      Rejected = CONST(false)));
            FieldClass = FlowField;
            TableRelation = "Store Requisition Header New";
            Editable = false;
        }
        field(50002; "MRPending For HOD Approval"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("Send for Approval" = CONST(true),
                                                                      "1st Approved" = FILTER(<> Approved),
                                                                      Rejected = CONST(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50003; "MR Pending For Store Process"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("1st Approved" = CONST(Approved),
                                                                      "Final Approved" = FILTER(Approved),
                                                                      "Issued Captured" = CONST(false),
                                                                      Rejected = CONST(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50004; "MR Pending for Process"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("1st Approved" = CONST(Approved),
                                                                      "Final Approved" = FILTER(Approved),
                                                                      "Issued Captured" = CONST(true),
                                                                      Processed = CONST(false),
                                                                      Rejected = CONST(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50005; "Completed MR"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("1st Approved" = CONST(Approved),
                                                                      "Final Approved" = FILTER(Approved),
                                                                      "Issued Captured" = CONST(true),
                                                                      Processed = CONST(true),
                                                                      Rejected = CONST(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50006; "Rejected MR"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("Send for Approval" = CONST(true),
                                                                      Rejected = CONST(true)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50007; "New MR"; Integer)
        {
            CalcFormula = Count("Store Requisition Header New" WHERE("Send for Approval" = CONST(false)));
            FieldClass = FlowField;
            Editable = false;
        }
    }
}
