tableextension 50273 "tableextension50273" extends "Purchase Header"
{
    fields
    {
        //Unsupported feature: Property Modification (Data type) on ""Pay-to Name 2"(Field 6)".

        //Unsupported feature: Property Modification (Data type) on ""Pay-to City"(Field 9)".

        modify("Your Reference")
        {
            //Unsupported feature: Property Modification (Data type) on ""Your Reference"(Field 11)".

            Description = 'Text30';
        }

        //Unsupported feature: Property Modification (Data type) on ""Ship-to City"(Field 17)".

        //Unsupported feature: Property Insertion (NotBlank) on ""Shortcut Dimension 2 Code"(Field 30)".

        modify("Vendor Invoice No.")
        {
            TableRelation = IF ("Reason Code" = CONST('USAGEFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('USAGERES')) Location WHERE("Location Type" = FILTER(Residence))
            ELSE
            IF ("Reason Code" = CONST('USAGEVES')) Location WHERE("Location Type" = FILTER(Vessel))
            ELSE
            IF ("Reason Code" = CONST('USAGEOTR')) "Standard Text" WHERE(Others = CONST(true));
        }
        modify("Reason Code")
        {
            TableRelation = "Reason Code" WHERE(Type = FILTER(Usage | " "));
        }

        //Unsupported feature: Code Modification on ""Buy-from Vendor No."(Field 2).OnValidate".

        //trigger "(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "No." = '' then
          InitRecord;
        TestStatusOpen;
        #4..85

        if not SkipBuyFromContact then
          UpdateBuyFromCont("Buy-from Vendor No.");

        if "No." <> '' then
          StandardCodesMgt.CheckShowPurchRecurringLinesNotification(Rec);

        if (xRec."Buy-from Vendor No." <> '') and (xRec."Buy-from Vendor No." <> "Buy-from Vendor No.") then
          RecallModifyAddressNotification(GetModifyVendorAddressNotificationId);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..88
         "Created By" := DATABASE.UserId;
        #89..94
        {<<<<<<<}
        */
        //end;

        //Unsupported feature: Code Modification on ""Posting Date"(Field 20).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Posting Date");
        TestNoSeriesDate(
          "Posting No.","Posting No. Series",
        #4..21
          if ("Currency Factor" <> xRec."Currency Factor") and not CalledFromWhseDoc then
            SkipJobCurrFactorUpdate := not ConfirmUpdateCurrencyFactor;
        end;

        if "Posting Date" <> xRec."Posting Date" then
          if DeferralHeadersExist then
            ConfirmUpdateDeferralDate;

        if PurchLinesExist then
          JobUpdatePurchLines(SkipJobCurrFactorUpdate);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..24
        if PurchLinesExist then
          JobUpdatePurchLines(SkipJobCurrFactorUpdate);
        */
        //end;

        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 30).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");

        Modify;
        //AAA
        {IF "Shortcut Dimension 2 Code"= 'ATLANTIC' THEN "Responsibility Center":='ASL';
        IF "Shortcut Dimension 2 Code"= 'COSMOS' THEN "Responsibility Center":='COS';
        IF "Shortcut Dimension 2 Code"= 'ICF' THEN "Responsibility Center":='ICF';
        IF "Shortcut Dimension 2 Code"= 'SAVANNAH' THEN "Responsibility Center":='SSC';
        }
        */
        //end;
        field(50000; "Landed Cost Factor"; Option)
        {
            Description = 'BPR1.00,LC';
            InitValue = Value;
            OptionMembers = Value,Quantity,Weight;
        }
        field(50001; Overhead; Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE("External Document No." = FIELD("No."),
                                                        "G/L Account No." = FILTER('12090030')));
            Description = 'BPR1.00,LC';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50002; "Total Amount Item (LCY)"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                                "Document No." = FIELD("No."),
                                                                                Type = FILTER(<> " " & <> "G/L Account" & <> "Charge (Item)"),
                                                                                "Qty. to Receive" = FILTER(<> 0)));
            Description = 'BPR1.00,LC';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50010; "Vendor Freight"; Boolean)
        {
            Description = 'BPR1.00,LC';
        }
        field(50011; "Total Amount account"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Amount (LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                                "Document No." = FIELD("No."),
                                                                                Type = FILTER("G/L Account")));
            Description = 'BPR1.00,LC';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50012; "Total Amt. Item to Rec. (LCY)"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."QtytoReceiveAmount(LCY)" WHERE("Document No." = FIELD("No."),
                                                                               Type = FILTER(<> " " & <> "G/L Account"),
                                                                               "Outstanding Quantity" = FILTER(<> 0)));
            Description = 'BPR1.00,LC';
            FieldClass = FlowField;
            Editable = false;
        }
        field(50015; "Waybill No."; Code[10])
        {
        }
        field(50300; "Form M No."; Code[20])
        {
        }
        field(50301; "LC No."; Code[20])
        {
        }
        field(50302; "LC Opened On"; Date)
        {
        }
        field(50303; "Vessel Name"; Text[50])
        {
        }
        field(50304; "Container No."; Code[20])
        {
        }
        field(50310; "Totat Freight"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Currency Factor" <> 0 then
                    "Total Freight (LCY)" := "Totat Freight" / "Currency Factor"
                else
                    "Total Freight (LCY)" := "Totat Freight";
                TestField("Currency Code");
            end;
        }
        field(50311; "Total Ancillary Charges"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Currency Factor" <> 0 then
                    "Total Ancillary Charges(LCY)" := "Total Ancillary Charges" / "Currency Factor"
                else
                    "Total Ancillary Charges(LCY)" := "Total Ancillary Charges";
                TestField("Currency Code");
            end;
        }
        field(50312; "Clearing(LCY)"; Decimal)
        {
            trigger OnValidate()
            begin
                TestField("Currency Code");
            end;
        }
        field(50313; "Interest Expense(LCY)"; Decimal)
        {
            trigger OnValidate()
            begin
                TestField("Currency Code");
            end;
        }
        field(50314; "Shipment Status"; Text[30])
        {
        }
        field(50315; Importer; Text[30])
        {
        }
        field(50320; "Total Freight (LCY)"; Decimal)
        {
            Editable = false;
        }
        field(50321; "Total Ancillary Charges(LCY)"; Decimal)
        {
            Editable = false;
        }
        field(50322; Validity; Code[10])
        {
            Caption = 'Validity';
            TableRelation = "Payment Terms".Code;
        }
        field(50330; "Freight(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Freight(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                    "Document No." = FIELD("No.")));
            Description = 'LT-Landed Total';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50331; "Ancillary(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Ancillary(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                      "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50332; "Duty(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Duty(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                 "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50333; "Insurance(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Insurance(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                      "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50334; "Surcharge Duty(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Surcharge Duty(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                           "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50335; "Ecowas Duty(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Ecowas Duty(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                        "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50336; "CISS(LCYLT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."CISS(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                 "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50337; "Vat (LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Vat (LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                 "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50338; "Clearing(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Clearing(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                     "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50339; "Interest(LCY)LT"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Interest(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                     "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50340; "Freight(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualFreight(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                          "Document No." = FIELD("No.")));
            Description = 'LT-Landed Total Sum 4 Header';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50341; "Ancillary(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualAncillary(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                            "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50342; "Duty(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualDuty(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                       "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50343; "Insurance(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualInsurance(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                            "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50344; "Surcharge Duty(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualSurcharge Duty(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                                 "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50345; "Ecowas Duty(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualEcowas Duty(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                              "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50346; "CISS(LCYLTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualCISS(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                       "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50347; "Vat (LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualVat (LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                       "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50348; "Clearing(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualClearing(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                           "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50349; "Interest(LCY)LTS"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."ActualInterest(LCY)" WHERE("Document Type" = FIELD("Document Type"),
                                                                           "Document No." = FIELD("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50360; "Original Purc. Order No."; Code[20])
        {
            TableRelation = "Purch. Rcpt. Header"."Order No." WHERE("Buy-from Vendor No." = FIELD("Buy-from Vendor No."));

            trigger OnValidate()
            begin
                if "Original Purc. Order No." <> '' then begin
                    if "No." = "Original Purc. Order No." then Error('Purch. Order No. and Original Purch. Order No. cannot be the same');
                    if "No." < "Original Purc. Order No." then Error('Purch. Order No. must be greater than Original Purch. Order No.');
                    //IF PurhOrdx.GET("Document Type","Original Purc. Order No.") THEN
                    //  TESTFIELD("Buy-from Vendor No.",PurhOrd."Buy-from Vendor No.")
                    // ELSE
                    // ERROR('Purchase Order not found');
                end;
                UpdatePurchLines(FieldCaption("Original Purc. Order No."), true);
            end;
        }
        field(50361; "Total Quantity Received"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Quantity Received" WHERE("Document Type" = FIELD("Document Type"),
                                                                         "Document No." = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50370; "Line Amount"; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = Sum("Purchase Line"."Line Amount" WHERE("Document Type" = FIELD("Document Type"),
                                                                   "Document No." = FIELD("No.")));
            Caption = 'Line Amount';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50380; "Form M Submitted No.r"; Code[15])
        {
            Description = '``';
        }
        field(50381; "Transaction Bank"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(50382; "Form M Submitted Date"; Date)
        {
        }
        field(50383; "Form M Approval No."; Code[15])
        {
        }
        field(50384; "Form M Approval Date"; Date)
        {
        }
        field(50385; "Form M Expiry Date"; Date)
        {
        }
        field(50386; "Inspection Agent"; Code[10])
        {
            TableRelation = Vendor;
        }
        field(50387; "Insurance Co."; Code[10])
        {
            TableRelation = Vendor;
        }
        field(50388; "Nature of Cover"; Option)
        {
            OptionMembers = " ",Marine,Comprehensive;
        }
        field(50389; "Insurance Policy No."; Code[15])
        {
        }
        field(50390; "Valid up to"; Date)
        {
        }
        field(50391; "Inspection No."; Code[15])
        {
        }
        field(50392; "Vendor Notified Date"; Date)
        {
        }
        field(50393; "Inspection Date"; Date)
        {
        }
        field(50394; "Expected Departure"; Date)
        {
        }
        field(50395; "Actual Sailing of Vessel"; Date)
        {
        }
        field(50396; "Expected Date of Arrival"; Date)
        {
        }
        field(50397; "Actual Date of Arrival"; Date)
        {
        }
        field(50398; "Actual Value"; Decimal)
        {
            CalcFormula = Sum("G/L Entry".Amount WHERE("G/L Account No." = CONST('12090030'),
                                                        "External Document No." = FIELD("No."),
                                                        "Reason Code" = FIELD("Reason Code Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50399; "Reason Code Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = "Reason Code";
        }
        field(50400; "Purchase Order Req. No"; Code[20])
        {
            TableRelation = "Requisition Wksh. Name".Name WHERE("Worksheet Template Name" = FILTER(<> 'RECURRING'));
        }
        field(50500; "Created By"; Code[20])
        {
            Editable = false;
        }
        field(50501; "Payment Status"; Code[10])
        {
        }
        field(50502; Description; Text[250])
        {
        }
        field(50503; "Approved By"; Code[50])
        {
            Caption = 'User ID';
            NotBlank = true;
            TableRelation = User."User Name";
            /*
                        trigger OnLookup()
                        var
                            UserMgt: Codeunit "User Management";
                        begin
                            UserMgt.LookupUserID("Approved By");
                        end;

                        trigger OnValidate()
                        var
                            UserMgt: Codeunit "User Management";
                        begin
                            UserMgt.ValidateUserID("Approved By");
                        end;
                        */
        }
        field(50504; "Latest Shipment Date"; Date)
        {
        }
        field(50505; "Order Type"; Option)
        {
            Caption = 'Order Type';
            OptionCaption = ' ,Local,Foreign';
            OptionMembers = " ","Local",Foreign;
        }
    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if not UserSetupMgt.CheckRespCenter(1,"Responsibility Center") then
      Error(
        Text023,
    #4..34
       (ReturnShptHeader."No." <> '') or
       (PurchInvHeaderPrepmt."No." <> '') or
       (PurchCrMemoHeaderPrepmt."No." <> '')
    then
      Message(PostedDocsToPrintCreatedMsg);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..37
    //{>>>>>>>} ORIGINAL
    //THEN BEGIN
    //  COMMIT;
    //
    //  IF PurchRcptHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text000,TRUE,
    //         PurchRcptHeader."No.")
    //    THEN BEGIN
    //      PurchRcptHeader.SETRECFILTER;
    //      PurchRcptHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchInvHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text001,TRUE,
    //         PurchInvHeader."No.")
    //    THEN BEGIN
    //      PurchInvHeader.SETRECFILTER;
    //      PurchInvHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchCrMemoHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text002,TRUE,
    //         PurchCrMemoHeader."No.")
    //    THEN BEGIN
    //      PurchCrMemoHeader.SETRECFILTER;
    //      PurchCrMemoHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF ReturnShptHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text024,TRUE,
    //         ReturnShptHeader."No.")
    //    THEN BEGIN
    //      ReturnShptHeader.SETRECFILTER;
    //      ReturnShptHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchInvHeaderPrepmt."No." <> '' THEN
    //    IF CONFIRM(
    //         Text043,TRUE,
    //         PurchInvHeader."No.")
    //    THEN BEGIN
    //      PurchInvHeaderPrepmt.SETRECFILTER;
    //      PurchInvHeaderPrepmt.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchCrMemoHeaderPrepmt."No." <> '' THEN
    //    IF CONFIRM(
    //         Text044,TRUE,
    //         PurchCrMemoHeaderPrepmt."No.")
    //    THEN BEGIN
    //      PurchCrMemoHeaderPrepmt.SETRECFILTER;
    //      PurchCrMemoHeaderPrepmt.PrintRecords(TRUE);
    //    END;
    //END;
    //{=======} MODIFIED
    //THEN BEGIN
    //  COMMIT;
    //
    //  IF PurchRcptHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text000,TRUE,
    //         PurchRcptHeader."No.")
    //    THEN BEGIN
    //      PurchRcptHeader.SETRECFILTER;
    //      PurchRcptHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchInvHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text001,TRUE,
    //         PurchInvHeader."No.")
    //    THEN BEGIN
    //      PurchInvHeader.SETRECFILTER;
    //      PurchInvHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchCrMemoHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text002,TRUE,
    //         PurchCrMemoHeader."No.")
    //    THEN BEGIN
    //      PurchCrMemoHeader.SETRECFILTER;
    //      PurchCrMemoHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF ReturnShptHeader."No." <> '' THEN
    //    IF CONFIRM(
    //         Text024,TRUE,
    //         ReturnShptHeader."No.")
    //    THEN BEGIN
    //      ReturnShptHeader.SETRECFILTER;
    //      ReturnShptHeader.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchInvHeaderPrepmt."No." <> '' THEN
    //
    //
    //    IF CONFIRM(
    //         Text043,TRUE,
    //         PurchInvHeader."No.")
    //    THEN BEGIN
    //      PurchInvHeaderPrepmt.SETRECFILTER;
    //      PurchInvHeaderPrepmt.PrintRecords(TRUE);
    //    END;
    //
    //  IF PurchCrMemoHeaderPrepmt."No." <> '' THEN
    //    IF CONFIRM(
    //         Text044,TRUE,
    //         PurchCrMemoHeaderPrepmt."No.")
    //    THEN BEGIN
    //      PurchCrMemoHeaderPrepmt.SETRECFILTER;
    //      PurchCrMemoHeaderPrepmt.PrintRecords(TRUE);
    //    END;
    //END;
    then
      Message(PostedDocsToPrintCreatedMsg);
    //{<<<<<<<}
    */
    //end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    InitInsert;

    if GetFilter("Buy-from Vendor No.") <> '' then
      if GetRangeMin("Buy-from Vendor No.") = GetRangeMax("Buy-from Vendor No.") then
        Validate("Buy-from Vendor No.",GetRangeMin("Buy-from Vendor No."));

    if "Purchaser Code" = '' then
      SetDefaultPurchaser;

    if "Buy-from Vendor No." <> '' then
      StandardCodesMgt.CheckShowPurchRecurringLinesNotification(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..8
    //Inserted begin
      "Shortcut Dimension 1 Code":='STOR';
      "Shortcut Dimension 2 Code":='ATLANTIC';
    // Insert End
    if "Buy-from Vendor No." <> '' then
      StandardCodesMgt.CheckShowPurchRecurringLinesNotification(Rec);
    {<<<<<<<}
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: UpdateConfirmed) (VariableCollection) on "UpdatePurchLines(PROCEDURE 15)".

    //Unsupported feature: Property Modification (Name) on "TriggerOnAfterPostPurchaseDoc(PROCEDURE 116)".

    //Unsupported feature: Code Modification on "TriggerOnAfterPostPurchaseDoc(PROCEDURE 116)".

    //procedure TriggerOnAfterPostPurchaseDoc();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    PurchPost.OnAfterPostPurchaseDoc(Rec,GenJnlPostLine,PurchRcpHdrNo,RetShptHdrNo,PurchInvHdrNo,PurchCrMemoHdrNo,false);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*

    //PurchPost.OnAfterPostPurchaseDoc(Rec,GenJnlPostLine,PurchRcpHdrNo,RetShptHdrNo,PurchInvHdrNo,PurchCrMemoHdrNo,FALSE);
    */
    //end;

    procedure TriggerOnAfterPostPurchaseDoc1(var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; PurchRcpHdrNo: Code[20]; RetShptHdrNo: Code[20]; PurchInvHdrNo: Code[20]; PurchCrMemoHdrNo: Code[20])
    var
        PurchPost: Codeunit "Purch.-Post";
    begin
        PurchPost.OnAfterPostPurchaseDoc(Rec, GenJnlPostLine, PurchRcpHdrNo, RetShptHdrNo, PurchInvHdrNo, PurchCrMemoHdrNo, false);
    end;
}
