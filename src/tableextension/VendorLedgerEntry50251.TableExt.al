tableextension 50251 "tableextension50251" extends "Vendor Ledger Entry"
{
    fields
    {
        //Unsupported feature: Property Modification (Editable) on ""Remaining Amount"(Field 14)".

        field(50301; "Loan ID"; Code[10])
        {
            TableRelation = "Monthly Variables Header.";
        }
        field(90016; "Remaining Amt. (LCY)1"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Vendor Ledg. Entry"."Amount (LCY)" WHERE("Vendor Ledger Entry No." = FIELD("Entry No."),
                                                                                  "Posting Date" = FIELD("Date Filter")));
            Caption = 'Remaining Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        //Unsupported feature: Property Insertion (SumIndexFields) on ""Vendor No.",Open,"Global Dimension 1 Code","Global Dimension 2 Code",Positive,"Due Date","Currency Code"(Key)".

        //Unsupported feature: Property Insertion (SumIndexFields) on ""Document Type","Vendor No.","Global Dimension 1 Code","Global Dimension 2 Code","Posting Date","Currency Code"(Key)".
    }
}
