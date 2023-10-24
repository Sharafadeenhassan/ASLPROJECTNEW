tableextension 50240 "tableextension50240" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50301; "Loan ID"; Code[10])
        {
            TableRelation = "Loan.";
        }
        field(90016; "Remaining Amt. (LCY)1"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" WHERE("Cust. Ledger Entry No." = FIELD("Entry No."),
                                                                                 "Posting Date" = FIELD("Date Filter")));
            Caption = 'Remaining Amt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(90017; "Customer Group Map"; Boolean)
        {
            CalcFormula = Exist(Customer WHERE("No." = FIELD("Customer No."),
                                                "Customer Posting Group" = FIELD("Customer Posting Group")));
            FieldClass = FlowField;
            Editable = false;
        }
    }

    //Unsupported feature: Code Modification on "ShowDoc(PROCEDURE 7)".

    //procedure ShowDoc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    case "Document Type" of
      "Document Type"::Invoice:
        begin
          if SalesInvoiceHdr.Get("Document No.") then begin
            PAGE.Run(PAGE::"Posted Sales Invoice",SalesInvoiceHdr);
            exit(true);
          end;
          if ServiceInvoiceHeader.Get("Document No.") then begin
            PAGE.Run(PAGE::"Posted Service Invoice",ServiceInvoiceHeader);
            exit(true);
          end;
        end;
      "Document Type"::"Credit Memo":
        begin
          if SalesCrMemoHdr.Get("Document No.") then begin
            PAGE.Run(PAGE::"Posted Sales Credit Memo",SalesCrMemoHdr);
            exit(true);
          end;
          if ServiceCrMemoHeader.Get("Document No.") then begin
            PAGE.Run(PAGE::"Posted Service Credit Memo",ServiceCrMemoHeader);
            exit(true);
          end;
        end;
      "Document Type"::"Finance Charge Memo":
        if IssuedFinChargeMemoHeader.Get("Document No.") then begin
          PAGE.Run(PAGE::"Issued Finance Charge Memo",IssuedFinChargeMemoHeader);
          exit(true);
        end;
      "Document Type"::Reminder:
        if IssuedReminderHeader.Get("Document No.") then begin
          PAGE.Run(PAGE::"Issued Reminder",IssuedReminderHeader);
          exit(true);
        end;
    end;

    OnAfterShowDoc(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    case "Document Type" of
       "Document Type"::Invoice:
        if SalesInvoiceHdr.Get("Document No.") then begin
          PAGE.Run(PAGE::"Posted Sales Invoice",SalesInvoiceHdr);
          exit(true);
        end;
      "Document Type"::"Credit Memo":
       begin
    #15..27
       end;
    #29..34
    */
    //end;

    //Unsupported feature: Property Modification (Id) on "ShowDoc(PROCEDURE 7).ServiceInvoiceHeader(Variable 1000)".

    //Unsupported feature: Property Modification (Id) on "ShowDoc(PROCEDURE 7).ServiceCrMemoHeader(Variable 1001)".

    //Unsupported feature: Property Modification (Id) on "ShowDoc(PROCEDURE 7).IssuedFinChargeMemoHeader(Variable 1004)".

    //Unsupported feature: Property Modification (Id) on "ShowDoc(PROCEDURE 7).IssuedReminderHeader(Variable 1005)".
}
