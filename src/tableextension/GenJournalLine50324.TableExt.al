tableextension 50324 "tableextension50324" extends "Gen. Journal Line"
{
    fields
    {
        modify("Reason Code")
        {
            TableRelation = "Reason Code".Code WHERE(Type = FILTER(Import ..));
        }
        modify("External Document No.")
        {
            TableRelation = IF ("Reason Code" = FILTER('ANCILLIARY' | 'CISS' | 'CLEARING' | 'DUTY' | 'ECOWAS' | 'FREIGHT' | 'INSURANCE' | 'INTEREST' | 'SURCHARGE')) "Purchase Header"."No." WHERE("Document Type" = FILTER(> Quote),
                                                                                                                                                                                  "Buy-from Vendor No." = FILTER(<> ''))
            ELSE
            IF ("Account Type" = CONST("Fixed Asset"),
                                                                                                                                                                                           "FA Posting Type" = CONST(Maintenance),
                                                                                                                                                                                           "Maintenance Code" = CONST('MAINTE')) Item."No." WHERE("Gen. Prod. Posting Group" = FILTER(<> 'FIS'))
            ELSE
            IF ("Reason Code" = CONST('USAGEFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('USAGERES')) Location WHERE("Location Type" = FILTER(Residence))
            ELSE
            IF ("Reason Code" = CONST('USAGEOTR')) "Standard Text" WHERE(Others = CONST(true))
            ELSE
            IF ("Reason Code" = CONST('USAGEVES')) Location WHERE("Location Type" = FILTER(Vessel))
            ELSE
            IF ("Reason Code" = CONST('EMPLOYEE')) Employee;
        }
        modify("Maintenance Code")
        {
            TableRelation = Maintenance.Code WHERE(Type = CONST(ITGEN));
        }
        field(50000; "Ready to Post"; Boolean)
        {
        }
        field(50300; "Loan ID"; Code[10])
        {
            TableRelation = "Loan.";
        }
        field(50301; "Deposit ID"; Code[10])
        {
            TableRelation = DEPOSIT."Deposit ID";
        }
        field(50302; Description1; Text[50])
        {
        }
        field(50303;"DPS No.";Code[20])
        {
          Description = 'Store DPS No from the Dynamic Procurement System';
        }
    }
   
    procedure "SALAD/IOU"()
    var LoanRec: Record "Loan.";
    begin
      /*IF "Reason Code"='SALAD' THEN
        BEGIN
          LoanRec.INIT;
          TESTFIELD("Account Type",2);
          LoanRec."Loan ID":='SLD'+"Account No.";
          LoanRec."Staff No.":="Account No.";
          LoanRec."Loan Type":= 'SALAD';
          LoanRec.Description:=
          LoanRec."Acct. Type":=
          LoanRec."Acct. No.":=
          LoanRec."Counter Acct. Type":=
          LoanRec."Counter Acct. No.":=
          LoanRec."Loan Amount":=
          LoanRec."Start Period":=
          LoanRec."Number of Payments":=1;
          LoanRec."Open(Y/N)":=TRUE;
          LoanRec."Loan ED":=
          LoanRec."Loan Created":=TRUE;
          LoanRec.MODIFY;
        END;
        */
    end;
}
