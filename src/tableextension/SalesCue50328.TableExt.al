tableextension 50328 "tableextension50328" extends "Sales Cue"
{
    fields
    {
        //Unsupported feature: Property Modification (CalcFormula) on ""Partially Shipped"(Field 8)".

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
        field(50006; "ReJected MR"; Integer)
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

    //Unsupported feature: Code Modification on "CountOrders(PROCEDURE 9)".

    //procedure CountOrders();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CountSalesOrders.SetRange(Status,CountSalesOrders.Status::Released);
    CountSalesOrders.SetRange(Completely_Shipped,false);
    FilterGroup(2);
    #4..11
        end;
      FieldNo("Partially Shipped"):
        begin
          CountSalesOrders.SetRange(Shipped,true);
          CountSalesOrders.SetFilter(Shipment_Date,GetFilter("Date Filter2"));
        end;
      FieldNo(Delayed):
    #19..24
    CountSalesOrders.Open;
    CountSalesOrders.Read;
    exit(CountSalesOrders.Count_Orders);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
          CountSalesOrders.SetRange(Ship,true);
    #16..27
    */
    //end;

    //Unsupported feature: Code Modification on "FilterOrders(PROCEDURE 11)".

    //procedure FilterOrders();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesHeader.SetRange("Document Type",SalesHeader."Document Type"::Order);
    SalesHeader.SetRange(Status,SalesHeader.Status::Released);
    SalesHeader.SetRange("Completely Shipped",false);
    #4..8
        end;
      FieldNo("Partially Shipped"):
        begin
          SalesHeader.SetRange(Shipped,true);
          SalesHeader.SetFilter("Shipment Date",GetFilter("Date Filter2"));
        end;
      FieldNo(Delayed):
    #16..21
    FilterGroup(2);
    SalesHeader.SetFilter("Responsibility Center",GetFilter("Responsibility Center Filter"));
    FilterGroup(0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
          SalesHeader.SetRange(Ship,true);
    #13..24
    */
    //end;
}
