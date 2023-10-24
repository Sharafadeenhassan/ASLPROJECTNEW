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

        //Unsupported feature: Code Modification on "Amount(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateAmount;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        //AAA/Jan 2002/Sta
        if ("External Document No."<>'') and ("Maintenance Code"<>'') and ("FA Posting Type"="FA Posting Type"::Maintenance)then
        begin
        if ItemRec.Get("External Document No.") then
            begin
              if ItemRec."Costing Method"=ItemRec."Costing Method"::Average then
              begin
                ItemRec.SetRange(ItemRec."No.");
                ItemCostMgt.CalculateAverageCost(ItemRec,AverageCostLCY,AverageCostACY);
                "Amount (LCY)":=Quantity*AverageCostLCY;
              end else
                "Amount (LCY)":=Quantity*ItemRec."Unit Cost";
            end;
            if ("Currency Code"<>'') then
              Amount:= Round(CurrExchRate.ExchangeAmtLCYToFCY("Posting Date","Currency Code","Amount (LCY)","Currency Factor"))
            else
              Amount:="Amount (LCY)";
        end;
        //AAA/Jan 2002/Sto
        ValidateAmount;
        */
        //end;
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
    }

    //Unsupported feature: Code Modification on "ExportPaymentFile(PROCEDURE 81)".

    //procedure ExportPaymentFile();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not FindSet then
      Error(NothingToExportErr);
    SetRange("Journal Template Name","Journal Template Name");
    SetRange("Journal Batch Name","Journal Batch Name");
    TestField("Check Printed",false);

    CheckDocNoOnLines;
    if IsExportedToPaymentFile then
    #9..12
      CODEUNIT.Run(BankAcc.GetPaymentExportCodeunitID,Rec)
    else
      CODEUNIT.Run(CODEUNIT::"Exp. Launcher Gen. Jnl.",Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    #6..15
    */
    //end;

    procedure "SALAD/IOU"()
    begin
        /*IF "Reason Code"='SALAD' THEN
        BEGIN
          LoanRec.INIT;
          TESTFIELD("Account Type",2);
          LoanRec."Loan ID":='SLD'+"Account No.";
          LoanRec."Staff No.":="Account No.";
          LoanRec."Loan Type":='SALAD';
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
