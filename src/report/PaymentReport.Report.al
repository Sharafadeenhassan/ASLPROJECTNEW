report 50111 "Payment Report"
{
    // PurchSetup.BeingPaymentText
    // "Acct Name"
    // "Gen. Journal Line"."Bal. Account No."
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/PaymentReport.rdlc';
    Caption = 'Payment Report';
    dataset
    {
        dataitem("Gen. Journal Batch"; "Gen. Journal Batch")
        {
            DataItemTableView = SORTING("Journal Template Name", Name);
            RequestFilterFields = "Journal Template Name", Name;
            column(Gen__Journal_Batch_Journal_Template_Name; "Journal Template Name")
            {
            }
            column(Gen__Journal_Batch_Name; Name)
            {
            }
            dataitem("Integer"; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                PrintOnlyIfDetail = true;
                column(COMPANYNAME; CompanyName)
                {
                }
                column(COMPANYNAME_Control56; CompanyName)
                {
                }
                column(HdText; HdText)
                {
                }
                column(Vend__No__; Vend."No.")
                {
                }
                column(BuyFromAddr_1_; BuyFromAddr[1])
                {
                }
                column(BuyFromAddr_2_; BuyFromAddr[2])
                {
                }
                column(BuyFromAddr_3_; BuyFromAddr[3])
                {
                }
                column(BuyFromAddr_4_; BuyFromAddr[4])
                {
                }
                column(BuyFromAddr_5_; BuyFromAddr[5])
                {
                }
                column(BuyFromAddr_6_; BuyFromAddr[6])
                {
                }
                column(BuyFromAddr_7_; BuyFromAddr[7])
                {
                }
                column(BuyFromAddr_8_; BuyFromAddr[8])
                {
                }
                column(CompanyAddr_1_; CompanyAddr[1])
                {
                }
                column(CompanyAddr_2_; CompanyAddr[2])
                {
                }
                column(CompanyAddr_3_; CompanyAddr[3])
                {
                }
                column(CompanyAddr_4_; CompanyAddr[4])
                {
                }
                column(CompanyAddr_5_; CompanyAddr[5])
                {
                }
                column(CompanyAddr_6_; CompanyAddr[6])
                {
                }
                column(CompanyInfo__Phone_No__; CompanyInfo."Phone No.")
                {
                }
                column(CompanyInfo__Fax_No__; CompanyInfo."Fax No.")
                {
                }
                column(Payto; Payto)
                {
                }
                column(Gen__Journal_Batch___Journal_Template_Name_; "Gen. Journal Batch"."Journal Template Name")
                {
                }
                column(Gen__Journal_Batch__Name; "Gen. Journal Batch".Name)
                {
                }
                column(GJLINE__Document_No__; GJLINE."Document No.")
                {
                }
                column(GJLINE__Shortcut_Dimension_1_Code_; GJLINE."Shortcut Dimension 1 Code")
                {
                }
                column(GJLINE__Shortcut_Dimension_2_Code_; GJLINE."Shortcut Dimension 2 Code")
                {
                }
                column(GJLINE__Posting_Date_; GJLINE."Posting Date")
                {
                }
                column(Gen__Journal_Line__TABLENAME__________GenJnlLineFilter; "Gen. Journal Line".TableName + ': ' + GenJnlLineFilter)
                {
                }
                column(paymentof; paymentof)
                {
                }
                column(General_Journal___TestCaption; General_Journal___TestCaptionLbl)
                {
                }
                column(CompanyInfo__Phone_No__Caption; CompanyInfo__Phone_No__CaptionLbl)
                {
                }
                column(CompanyInfo__Fax_No__Caption; CompanyInfo__Fax_No__CaptionLbl)
                {
                }
                column(Gen__Journal_Batch___Journal_Template_Name_Caption; "Gen. Journal Batch".FieldCaption("Journal Template Name"))
                {
                }
                column(Gen__Journal_Batch__NameCaption; Gen__Journal_Batch__NameCaptionLbl)
                {
                }
                column(Requisition_No_Caption; Requisition_No_CaptionLbl)
                {
                }
                column(Dept_Caption; Dept_CaptionLbl)
                {
                }
                column(BranchCaption; BranchCaptionLbl)
                {
                }
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(Being_Payment_For__Caption; Being_Payment_For__CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Posting_Date_Caption; "Gen. Journal Line".FieldCaption("Posting Date"))
                {
                }
                column(Gen__Journal_Line__Document_Type_Caption; Gen__Journal_Line__Document_Type_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Document_No__Caption; "Gen. Journal Line".FieldCaption("Document No."))
                {
                }
                column(Gen__Journal_Line__Account_Type_Caption; Gen__Journal_Line__Account_Type_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Account_No__Caption; "Gen. Journal Line".FieldCaption("Account No."))
                {
                }
                column(AccNameCaption; AccNameCaptionLbl)
                {
                }
                column(Gen__Journal_Line_DescriptionCaption; "Gen. Journal Line".FieldCaption(Description))
                {
                }
                column(Gen__Journal_Line__Gen__Posting_Type_Caption; Gen__Journal_Line__Gen__Posting_Type_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Gen__Bus__Posting_Group_Caption; Gen__Journal_Line__Gen__Bus__Posting_Group_CaptionLbl)
                {
                }
                column(Gen__Journal_Line__Gen__Prod__Posting_Group_Caption; Gen__Journal_Line__Gen__Prod__Posting_Group_CaptionLbl)
                {
                }
                column(Gen__Journal_Line_AmountCaption; "Gen. Journal Line".FieldCaption(Amount))
                {
                }
                column(Gen__Journal_Line__Bal__Account_No__Caption; "Gen. Journal Line".FieldCaption("Bal. Account No."))
                {
                }
                column(Gen__Journal_Line__Balance__LCY__Caption; "Gen. Journal Line".FieldCaption("Balance (LCY)"))
                {
                }
                column(GL_Account_No_Caption; GL_Account_No_CaptionLbl)
                {
                }
                column(Dept__CodeCaption; Dept__CodeCaptionLbl)
                {
                }
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
                {
                }
                column(Branch_CodeCaption; Branch_CodeCaptionLbl)
                {
                }
                column(Integer_Number; Number)
                {
                }
                dataitem("Gen. Journal Line"; "Gen. Journal Line")
                {
                    DataItemLink = "Journal Template Name" = FIELD("Journal Template Name"), "Journal Batch Name" = FIELD(Name);
                    DataItemLinkReference = "Gen. Journal Batch";
                    DataItemTableView = SORTING("Journal Template Name", "Journal Batch Name", "Line No.");
                    RequestFilterFields = "Posting Date";
                    column(Gen__Journal_Line__Posting_Date_; "Posting Date")
                    {
                    }
                    column(Gen__Journal_Line__Document_Type_; "Document Type")
                    {
                    }
                    column(Gen__Journal_Line__Document_No__; "Document No.")
                    {
                    }
                    column(Gen__Journal_Line__Account_Type_; "Account Type")
                    {
                    }
                    column(Gen__Journal_Line__Account_No__; "Account No.")
                    {
                    }
                    column(AccName; AccName)
                    {
                    }
                    column(Gen__Journal_Line_Description; Description)
                    {
                    }
                    column(Gen__Journal_Line__Gen__Posting_Type_; "Gen. Posting Type")
                    {
                    }
                    column(Gen__Journal_Line__Gen__Bus__Posting_Group_; "Gen. Bus. Posting Group")
                    {
                    }
                    column(Gen__Journal_Line__Gen__Prod__Posting_Group_; "Gen. Prod. Posting Group")
                    {
                    }
                    column(Gen__Journal_Line_Amount; Amount)
                    {
                    }
                    column(Gen__Journal_Line__Currency_Code_; "Currency Code")
                    {
                    }
                    column(Gen__Journal_Line__Bal__Account_No__; "Bal. Account No.")
                    {
                    }
                    column(Gen__Journal_Line__Balance__LCY__; "Balance (LCY)")
                    {
                    }
                    column(Gen__Journal_Line__Account_No___Control55; "Account No.")
                    {
                    }
                    column(Gen__Journal_Line__Shortcut_Dimension_1_Code_; "Shortcut Dimension 1 Code")
                    {
                    }
                    column(Gen__Journal_Line_Description_Control62; Description)
                    {
                    }
                    column(Gen__Journal_Line_Amount_Control64; Amount)
                    {
                    }
                    column(Gen__Journal_Line__Shortcut_Dimension_2_Code_; "Shortcut Dimension 2 Code")
                    {
                    }
                    column(Gen__Journal_Line__Balance__LCY___Control40; "Balance (LCY)")
                    {
                    }
                    column(Gen__Journal_Line__Amount__LCY__; "Amount (LCY)")
                    {
                    }
                    column(Acct_Name______BalAccName; "Acct Name" + ' ' + BalAccName)
                    {
                    }
                    column(UPPERCASE_NUm2Words_ToWords__Amount__LCY___CurrencyName_CurrencyUnit_100_____; UpperCase(NUm2Words.ToWords("Amount (LCY)", CurrencyName, CurrencyUnit, 100, '')))
                    {
                    }
                    column(Payto_Control107; Payto)
                    {
                    }
                    column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                    {
                    }
                    column(USERID; UserId)
                    {
                    }
                    column(Gen__Journal_Line__Amount__LCY__Caption; Gen__Journal_Line__Amount__LCY__CaptionLbl)
                    {
                    }
                    column(Amounts_in_words_Caption; Amounts_in_words_CaptionLbl)
                    {
                    }
                    column(Credit_Account_No__Caption; Credit_Account_No__CaptionLbl)
                    {
                    }
                    column(Payment_approval_Caption; Payment_approval_CaptionLbl)
                    {
                    }
                    column(Checked_by_Caption; Checked_by_CaptionLbl)
                    {
                    }
                    column(Received_by_Caption; Received_by_CaptionLbl)
                    {
                    }
                    column(Departmental_Approval_Caption; Departmental_Approval_CaptionLbl)
                    {
                    }
                    column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
                    {
                    }
                    column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
                    {
                    }
                    column(Gen__Journal_Line_Line_No_; "Line No.")
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if "Currency Code" = '' then
                            "Amount (LCY)" := Amount;

                        UpdateLineBalance();

                        AccName := '';
                        BalAccName := '';

                        if not EmptyLine() then begin
                            MakeRecurringTexts("Gen. Journal Line");

                            AmountError := false;

                            if ("Account No." = '') and ("Bal. Account No." = '') then
                                AddError(StrSubstNo('%1 or %2 must be specified.', FieldName("Account No."), FieldName("Bal. Account No.")))
                            else
                                if ("Account Type" <> "Account Type"::"Fixed Asset") and
                                   ("Bal. Account Type" <> "Bal. Account Type"::"Fixed Asset")
                                then
                                    TestFixedAssetFields("Gen. Journal Line");

                            if "Account No." <> '' then
                                case "Account Type" of
                                    "Account Type"::"G/L Account":
                                        begin
                                            if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') or
                                               ("VAT Bus. Posting Group" <> '') or ("VAT Prod. Posting Group" <> '')
                                            then
                                                if "Gen. Posting Type" = 0 then
                                                    AddError(StrSubstNo('%1 must be specified.', FieldName("Gen. Posting Type")));
                                            if ("Gen. Posting Type" <> "Gen. Posting Type"::" ") and
                                               ("VAT Posting" = "VAT Posting"::"Automatic VAT Entry")
                                            then begin
                                                if "VAT Amount" + "VAT Base Amount" <> Amount then
                                                    AddError(
                                                      StrSubstNo(
                                                        '%1 + %2 must be %3.', FieldName("VAT Amount"), FieldName("VAT Base Amount"),
                                                        FieldName(Amount)));
                                                if "Currency Code" <> '' then
                                                    if "VAT Amount (LCY)" + "VAT Base Amount (LCY)" <> "Amount (LCY)" then
                                                        AddError(
                                                          StrSubstNo(
                                                            '%1 + %2 must be %3.', FieldName("VAT Amount (LCY)"),
                                                            FieldName("VAT Base Amount (LCY)"), FieldName("Amount (LCY)")));
                                            end;
                                        end;
                                    "Account Type"::Customer, "Account Type"::Vendor:
                                        begin
                                            if "Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1 must be " " when %2 is %3.',
                                                    FieldName("Gen. Posting Type"), FieldName("Account Type"), "Account Type"));
                                            if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') or
                                               ("VAT Bus. Posting Group" <> '') or ("VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1, %2, %3 or %4 must not be completed when %5 is %6.',
                                                    FieldName("Gen. Bus. Posting Group"), FieldName("Gen. Prod. Posting Group"),
                                                    FieldName("VAT Bus. Posting Group"), FieldName("VAT Prod. Posting Group"),
                                                    FieldName("Account Type"), "Account Type"));

                                            if "Document Type" <> 0 then
                                                if ("Account Type" = "Account Type"::Customer) =
                                                   ("Document Type" in ["Document Type"::Payment, "Document Type"::"Credit Memo"])
                                                then begin
                                                    if (Amount > 0) and not AmountError then begin
                                                        AmountError := true;
                                                        AddError(StrSubstNo('%1 must be negative.', FieldName(Amount)));
                                                    end;
                                                end else
                                                    if (Amount < 0) and not AmountError then begin
                                                        AmountError := true;
                                                        AddError(StrSubstNo('%1 must be positive.', FieldName(Amount)));
                                                    end;
                                            if Amount * "Sales/Purch. (LCY)" < 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1 must have the same sign as %2.',
                                                    FieldName("Sales/Purch. (LCY)"), FieldName(Amount)));
                                            if "Job No." <> '' then
                                                AddError(StrSubstNo('%1 cannot be specified.', FieldName("Job No.")));
                                        end;
                                    "Account Type"::"Bank Account":
                                        begin
                                            if "Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1 must be " " when %2 is %3.',
                                                    FieldName("Gen. Posting Type"), FieldName("Account Type"), "Account Type"));
                                            if ("Gen. Bus. Posting Group" <> '') or ("Gen. Prod. Posting Group" <> '') or
                                               ("VAT Bus. Posting Group" <> '') or ("VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1, %2, %3 or %4 must not be completed when %5 is %6.',
                                                    FieldName("Gen. Bus. Posting Group"), FieldName("Gen. Prod. Posting Group"),
                                                    FieldName("VAT Bus. Posting Group"), FieldName("VAT Prod. Posting Group"),
                                                    FieldName("Account Type"), "Account Type"));

                                            if "Job No." <> '' then
                                                AddError(StrSubstNo('%1 cannot be specified.', FieldName("Job No.")));
                                            if (Amount < 0) and ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") then
                                                if not "Check Printed" then
                                                    AddError(StrSubstNo('%1 must be Yes.', FieldName("Check Printed")));
                                        end;
                                    "Account Type"::"Fixed Asset":
                                        TestFixedAsset("Gen. Journal Line");
                                end;

                            if "Bal. Account No." <> '' then
                                case "Bal. Account Type" of
                                    "Bal. Account Type"::"G/L Account":
                                        begin
                                            if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') or
                                               ("Bal. VAT Bus. Posting Group" <> '') or ("Bal. VAT Prod. Posting Group" <> '')
                                            then
                                                if "Bal. Gen. Posting Type" = "Bal. Gen. Posting Type"::" " then
                                                    AddError(StrSubstNo('%1 must be specified.', FieldName("Bal. Gen. Posting Type")));
                                            if ("Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" ") and
                                               ("VAT Posting" = "VAT Posting"::"Automatic VAT Entry")
                                            then begin
                                                if "Bal. VAT Amount" + "Bal. VAT Base Amount" <> -Amount then
                                                    AddError(
                                                      StrSubstNo(
                                                        '%1 + %2 must be -%3.', FieldName("Bal. VAT Amount"), FieldName("Bal. VAT Base Amount"),
                                                        FieldName(Amount)));
                                                if "Currency Code" <> '' then
                                                    if "Bal. VAT Amount (LCY)" + "Bal. VAT Base Amount (LCY)" <> -"Amount (LCY)" then
                                                        AddError(
                                                          StrSubstNo(
                                                            '%1 + %2 must be -%3.', FieldName("Bal. VAT Amount (LCY)"),
                                                            FieldName("Bal. VAT Base Amount (LCY)"), FieldName("Amount (LCY)")));
                                            end;
                                        end;
                                    "Bal. Account Type"::Customer, "Bal. Account Type"::Vendor:
                                        begin
                                            if "Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" " then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1 must be " " when %2 is %3.',
                                                    FieldName("Bal. Gen. Posting Type"), FieldName("Bal. Account Type"), "Bal. Account Type"));
                                            if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') or
                                               ("Bal. VAT Bus. Posting Group" <> '') or ("Bal. VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1, %2, %3 or %4 must not be completed when %5 is %6.',
                                                    FieldName("Bal. Gen. Bus. Posting Group"), FieldName("Bal. Gen. Prod. Posting Group"),
                                                    FieldName("Bal. VAT Bus. Posting Group"), FieldName("Bal. VAT Prod. Posting Group"),
                                                    FieldName("Bal. Account Type"), "Bal. Account Type"));

                                            if "Document Type" <> 0 then
                                                if ("Bal. Account Type" = "Bal. Account Type"::Customer) =
                                                   ("Document Type" in ["Document Type"::Payment, "Document Type"::"Credit Memo"])
                                                then begin
                                                    if (Amount < 0) and not AmountError then begin
                                                        AmountError := true;
                                                        AddError(StrSubstNo('%1 must be positive.', FieldName(Amount)));
                                                    end;
                                                end else
                                                    if (Amount > 0) and not AmountError then begin
                                                        AmountError := true;
                                                        AddError(StrSubstNo('%1 must be negative.', FieldName(Amount)));
                                                    end;
                                            if Amount * "Sales/Purch. (LCY)" > 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1 must have a different sign than %2.',
                                                    FieldName("Sales/Purch. (LCY)"), FieldName(Amount)));
                                            if "Job No." <> '' then
                                                AddError(StrSubstNo('%1 cannot be specified.', FieldName("Job No.")));
                                        end;
                                    "Bal. Account Type"::"Bank Account":
                                        begin
                                            if "Bal. Gen. Posting Type" <> 0 then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1 must be " " when %2 is %3.',
                                                    FieldName("Bal. Gen. Posting Type"), FieldName("Bal. Account Type"), "Bal. Account Type"));
                                            if ("Bal. Gen. Bus. Posting Group" <> '') or ("Bal. Gen. Prod. Posting Group" <> '') or
                                               ("Bal. VAT Bus. Posting Group" <> '') or ("Bal. VAT Prod. Posting Group" <> '')
                                            then
                                                AddError(
                                                  StrSubstNo(
                                                    '%1, %2, %3 or %4 must not be completed when %5 is %6.',
                                                    FieldName("Bal. Gen. Bus. Posting Group"), FieldName("Bal. Gen. Prod. Posting Group"),
                                                    FieldName("Bal. VAT Bus. Posting Group"), FieldName("Bal. VAT Prod. Posting Group"),
                                                    FieldName("Bal. Account Type"), "Bal. Account Type"));

                                            if "Job No." <> '' then
                                                AddError(StrSubstNo('%1 cannot be specified.', FieldName("Job No.")));
                                            if (Amount > 0) and ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") then
                                                if not "Check Printed" then
                                                    AddError(StrSubstNo('%1 must be Yes.', FieldName("Check Printed")));
                                        end;
                                    "Bal. Account Type"::"Fixed Asset":
                                        TestFixedAsset("Gen. Journal Line");
                                end;

                            if ("Account No." <> '') and
                               (not "System-Created Entry") and
                               ("Gen. Posting Type" = "Gen. Posting Type"::" ") and
                               (Amount = 0) and
                               ("Account Type" <> "Account Type"::"Fixed Asset")
                            then
                                AddError(StrSubstNo('%1 must be specified.', FieldName(Amount)));

                            CheckRecurringLine("Gen. Journal Line");
                            CheckAllocations("Gen. Journal Line");

                            if "Posting Date" = 0D then
                                AddError(StrSubstNo('%1 must be specified.', FieldName("Posting Date")))
                            else begin
                                if "Posting Date" <> NormalDate("Posting Date") then
                                    if ("Account Type" <> "Account Type"::"G/L Account") or
                                       ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account")
                                    then
                                        AddError(
                                          StrSubstNo(
                                            '%1 must only be a closing date for G/L entries.', FieldName("Posting Date")));

                                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                    if UserId <> '' then
                                        if UserSetup.Get(UserId) then begin
                                            AllowPostingFrom := UserSetup."Allow Posting From";
                                            AllowPostingTo := UserSetup."Allow Posting To";
                                        end;
                                    if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                                        AllowPostingFrom := GLSetup."Allow Posting From";
                                        AllowPostingTo := GLSetup."Allow Posting To";
                                    end;
                                    if AllowPostingTo = 0D then
                                        //        AllowPostingTo := 31129999D;

                                        if ("Posting Date" < AllowPostingFrom) or ("Posting Date" > AllowPostingTo) then
                                            AddError(
                                              StrSubstNo(
                                                '%1 is not within your allowed range of posting dates.', Format("Posting Date")));

                                    if "Gen. Journal Batch"."No. Series" <> '' then begin
                                        if NoSeries."Date Order" and ("Posting Date" < LastEntrdDate) then
                                            AddError('The lines are not listed according to Posting Date because they were not entered in that order.');
                                        LastEntrdDate := "Posting Date";
                                    end;
                                end;

                                if ("Document Date" <> 0D) then
                                    if ("Document Date" <> NormalDate("Document Date")) and
                                       (("Account Type" <> "Account Type"::"G/L Account") or
                                        ("Bal. Account Type" <> "Bal. Account Type"::"G/L Account"))
                                    then
                                        AddError(
                                          StrSubstNo(
                                            '%1 must only be a closing date for G/L entries.', FieldName("Document Date")));

                                if "Document No." = '' then
                                    AddError(StrSubstNo('%1 must be specified.', FieldName("Document No.")))
                                else
                                    if "Gen. Journal Batch"."No. Series" <> '' then begin
                                        if (LastEntrdDocNo <> '') and
                                           ("Document No." <> LastEntrdDocNo) and
                                           ("Document No." <> IncStr(LastEntrdDocNo))
                                        then
                                            AddError('There is a gap in the number series.');
                                        LastEntrdDocNo := "Document No.";
                                    end;

                                if ("Account Type" in ["Account Type"::Customer, "Account Type"::Vendor, "Account Type"::"Fixed Asset"]) and
                                   ("Bal. Account Type" in ["Bal. Account Type"::Customer, "Bal. Account Type"::Vendor, "Bal. Account Type"::"Fixed Asset"])
                                then
                                    AddError(
                                      StrSubstNo(
                                        '%1 or %2 must be G/L Account or Bank Account.',
                                        FieldName("Account Type"), FieldName("Bal. Account Type")));

                                if Amount * "Amount (LCY)" < 0 then
                                    AddError(
                                      StrSubstNo(
                                        '%1 must have the same sign as %2.', FieldName("Amount (LCY)"), FieldName(Amount)));

                                if ("Account Type" = "Account Type"::"G/L Account") and
                                   ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")
                                then
                                    if "Applies-to Doc. No." <> '' then
                                        AddError(StrSubstNo('%1 cannot be specified.', FieldName("Applies-to Doc. No.")));

                                if (("Account Type" = "Account Type"::"G/L Account") and
                                    ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) or
                                   ("Document Type" <> "Document Type"::Invoice)
                                then begin
                                    if "Pmt. Discount Date" <> 0D then
                                        AddError(StrSubstNo('%1 cannot be specified.', FieldName("Pmt. Discount Date")));
                                    if "Payment Discount %" <> 0 then
                                        AddError(StrSubstNo('%1 must be 0.', FieldName("Payment Discount %")));
                                end;

                                if (("Account Type" = "Account Type"::"G/L Account") and
                                    ("Bal. Account Type" = "Bal. Account Type"::"G/L Account")) or
                                   ("Applies-to Doc. No." <> '')
                                then
                                    if "Applies-to ID" <> '' then
                                        AddError(StrSubstNo('%1 cannot be specified.', FieldName("Applies-to ID")));

                                if ("Account Type" <> "Account Type"::"Bank Account") and
                                   ("Bal. Account Type" <> "Bal. Account Type"::"Bank Account")
                                then
                                    if GenJnlLine2."Bank Payment Type" > 0 then
                                        AddError(StrSubstNo('%1 cannot be specified.', FieldName("Bank Payment Type")));

                                if "Account No." <> '' then
                                    case "Account Type" of
                                        "Account Type"::"G/L Account":
                                            CheckGLAcc("Gen. Journal Line", AccName);
                                        "Account Type"::Customer:
                                            CheckCust("Gen. Journal Line", AccName);
                                        "Account Type"::Vendor:
                                            CheckVend("Gen. Journal Line", AccName);
                                        "Account Type"::"Bank Account":
                                            CheckBankAcc("Gen. Journal Line", AccName);
                                        "Account Type"::"Fixed Asset":
                                            CheckFixedAsset("Gen. Journal Line", AccName);
                                    end;
                                if "Bal. Account No." <> '' then begin
                                    ExchAccGLJnlLine.Run("Gen. Journal Line");
                                    case "Account Type" of
                                        "Account Type"::"G/L Account":
                                            CheckGLAcc("Gen. Journal Line", BalAccName);
                                        "Account Type"::Customer:
                                            CheckCust("Gen. Journal Line", BalAccName);
                                        "Account Type"::Vendor:
                                            CheckVend("Gen. Journal Line", BalAccName);
                                        "Account Type"::"Bank Account":
                                            CheckBankAcc("Gen. Journal Line", BalAccName);
                                        "Account Type"::"Fixed Asset":
                                            CheckFixedAsset("Gen. Journal Line", BalAccName);
                                    end;
                                    ExchAccGLJnlLine.Run("Gen. Journal Line");
                                end;
                            end;

                            CheckBalance();
                        end;
                    end;

                    trigger OnPostDataItem()
                    begin

                        GenJnlManagement.GetAccounts("Gen. Journal Line", AccName, BalAccName);
                        if BankAcc.Get("Bal. Account No.") then;
                        if BankAccPostingGroup.Get(BankAcc."Post Code") then "Acct Name" := BankAccPostingGroup."G/L Bank Account No.";

                        GLSetup.Get();
                        CurrencyName := GLSetup."LCY Code";
                        CurrencyUnit := GLSetup."LCY Unit";
                    end;

                    trigger OnPreDataItem()
                    begin
                        GenJnlTemplate.Get("Gen. Journal Batch"."Journal Template Name");
                        if GenJnlTemplate.Recurring then begin
                            if GetFilter("Posting Date") <> '' then
                                AddError(
                                  StrSubstNo(
                                    '%1 cannot be filtered when you post recurring journals.',
                                    FieldName("Posting Date")));
                            SetRange("Posting Date", 0D, WorkDate());
                            if GetFilter("Expiration Date") <> '' then
                                AddError(
                                  StrSubstNo(
                                    '%1 cannot be filtered when you post recurring journals.',
                                    FieldName("Expiration Date")));
                            SetFilter("Expiration Date", '%1 | %2..', 0D, WorkDate());
                        end;

                        if "Gen. Journal Batch"."No. Series" <> '' then begin
                            NoSeries.Get("Gen. Journal Batch"."No. Series");
                            LastEntrdDocNo := '';
                            LastEntrdDate := 0D;
                        end;

                        CurrentCustomerVendors := 0;
                        VATEntryCreated := false;

                        GenJnlLine2.Reset();
                        GenJnlLine2.CopyFilters("Gen. Journal Line");

                        GLAccNetChange.DeleteAll();
                        CurrReport.CreateTotals("Amount (LCY)", "Balance (LCY)");
                    end;
                }
                dataitem(ErrorLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(ErrorText_Number_; ErrorText[Number])
                    {
                    }
                    column(ErrorText_Number_Caption; ErrorText_Number_CaptionLbl)
                    {
                    }
                    column(ErrorLoop_Number; Number)
                    {
                    }

                    trigger OnPostDataItem()
                    begin
                        ErrorCounter := 0;
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, ErrorCounter);
                    end;
                }
                dataitem(ReconcileLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number);
                    column(GLAccNetChange__No__; GLAccNetChange."No.")
                    {
                    }
                    column(GLAccNetChange_Name; GLAccNetChange.Name)
                    {
                    }
                    column(GLAccNetChange__Net_Change_in_Jnl__; GLAccNetChange."Net Change in Jnl.")
                    {
                    }
                    column(GLAccNetChange__Balance_after_Posting_; GLAccNetChange."Balance after Posting")
                    {
                    }
                    column(Gen__Journal_Line__TABLENAME__________GenJnlLineFilter_Control88; "Gen. Journal Line".TableName + ': ' + GenJnlLineFilter)
                    {
                    }
                    column(ReconciliationCaption; ReconciliationCaptionLbl)
                    {
                    }
                    column(GLAccNetChange__No__Caption; GLAccNetChange__No__CaptionLbl)
                    {
                    }
                    column(GLAccNetChange_NameCaption; GLAccNetChange_NameCaptionLbl)
                    {
                    }
                    column(GLAccNetChange__Net_Change_in_Jnl__Caption; GLAccNetChange__Net_Change_in_Jnl__CaptionLbl)
                    {
                    }
                    column(GLAccNetChange__Balance_after_Posting_Caption; GLAccNetChange__Balance_after_Posting_CaptionLbl)
                    {
                    }
                    column(ReconcileLoop_Number; Number)
                    {
                    }

                    trigger OnAfterGetRecord()
                    begin
                        if Number = 1 then
                            GLAccNetChange.Find('-')
                        else
                            GLAccNetChange.Next();

                        if GenJnlTemplate.Name = 'Payments' then HdText := 'CASH REQUISITION';
                        CurrReport.ShowOutput(false);
                    end;

                    trigger OnPostDataItem()
                    begin
                        GLAccNetChange.DeleteAll();

                        CurrReport.ShowOutput((CurrReport.PageNo() = 1) and (GenJnlLineFilter <> ''));
                        CurrReport.ShowOutput(false);
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, GLAccNetChange.Count);

                        if GenJnlTemplate.Name = 'Payments' then HdText := 'CASH REQUISITION';
                        CurrReport.ShowOutput(false);
                    end;
                }

                trigger OnPreDataItem()
                begin

                    if CopyStr("Gen. Journal Batch"."Journal Template Name", 1, 3) = 'PAY' then
                        if Paytype = 0 then HdText := 'CASH REQUISITION' else HdText := 'CHEQUE REQUISITION';

                    GJLINE.SetFilter(GJLINE."Journal Template Name", "Gen. Journal Batch"."Journal Template Name");
                    GJLINE.SetFilter(GJLINE."Journal Batch Name", "Gen. Journal Batch".Name);
                    here := GJLINE.Find('-');
                    I := 0;
                    if (GJLINE."Account Type" = 0) or (GJLINE."Account Type" > 2) then begin
                        BuyFromAddr[1] := '';
                        BuyFromAddr[2] := '';
                        BuyFromAddr[3] := '';
                        BuyFromAddr[4] := '';
                        BuyFromAddr[5] := '';
                        BuyFromAddr[6] := '';
                    end;
                    if GJLINE."Account Type" = 1 then
                        if Cust.Get(GJLINE."Account No.") then
                            FormatAddr.Customer(BuyFromAddr, Cust);
                    if GJLINE."Account Type" = 2 then
                        if Vend.Get(GJLINE."Account No.") then
                            FormatAddr.Vendor(BuyFromAddr, Vend);

                    if GJLINE."Currency Code" = '' then begin
                        GLSetup.Get();
                        CurrencyName := GLSetup."LCY Code";
                        CurrencyUnit := GLSetup."LCY Unit";
                    end
                    else
                        if Currency.Get(GJLINE."Currency Code") then begin
                            CurrencyName := Currency.Text;
                            CurrencyUnit := Currency.CurrUnit;
                        end;

                    GLSetup.Get();
                    CurrencyName := GLSetup."LCY Code";
                    CurrencyUnit := GLSetup."LCY Unit";

                    //Get Bank link account No.
                    if GJLINE."Bal. Account Type" = 3 then
                        if BankAcc.Get(GJLINE."Bal. Account No.") then
                            if BankAccPostingGroup.Get(BankAcc."Bank Acc. Posting Group") then "Acct Name" := BankAccPostingGroup."G/L Bank Account No.";

                    GJLINE.SetFilter(GJLINE."Journal Template Name", "Gen. Journal Batch"."Journal Template Name");
                    GJLINE.SetFilter(GJLINE."Journal Batch Name", "Gen. Journal Batch".Name);
                    here := GJLINE.Find('-');
                end;
            }

            trigger OnAfterGetRecord()
            begin

                CurrReport.PageNo := 1;

                "Gen. Journal Line".SetFilter("Gen. Journal Line"."Journal Template Name", "Gen. Journal Batch"."Journal Template Name");
                "Gen. Journal Line".SetFilter("Gen. Journal Line"."Journal Batch Name", "Gen. Journal Batch".Name);
                if "Gen. Journal Line".Find('-') then begin
                    Vend.Get("Gen. Journal Line"."Account No.");
                    FormatAddr.Vendor(BuyFromAddr, Vend);
                end;

                if Payto <> '' then
                    if Vend.Get(Payto) then FormatAddr.Vendor(BuyFromAddr, Vend);
            end;

            trigger OnPreDataItem()
            begin
                GLSetup.Get();
                SalesSetup.Get();
                PurchSetup.Get();

                //AAA-jan-apr2001
                CompanyInfo.Get();
                FormatAddr.Company(CompanyAddr, CompanyInfo);
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Control2)
                {
                    ShowCaption = false;
                    field(printtoexcel; printtoexcel)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        GenJnlLineFilter := "Gen. Journal Line".GetFilters;
        if printtoexcel then
            createsheet();
    end;

    var
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        PurchSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        Currency: Record Currency;
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAccPostingGroup: Record "Bank Account Posting Group";
        BankAcc: Record "Bank Account";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlLine2: Record "Gen. Journal Line";
        NoSeries: Record "No. Series";
        GLAccNetChange: Record "G/L Account Net Change" temporary;
        ExchAccGLJnlLine: Codeunit "Exchange Acc. G/L Journal Line";
        GenJnlLineFilter: Text[250];
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        LastEntrdDocNo: Code[20];
        LastEntrdDate: Date;
        AccName: Text[80];
        AmountError: Boolean;
        ErrorCounter: Integer;
        ErrorText: array[50] of Text[250];
        BalAccName: Text[80];
        CurrentCustomerVendors: Integer;
        VATEntryCreated: Boolean;
        FormatAddr: Codeunit "Format Address";
        CompanyInfo: Record "Company Information";
        HdText: Text[250];
        BuyFromAddr: array[8] of Text[50];
        CompanyAddr: array[8] of Text[50];
        paymentof: Text[250];
        Payto: Text[80];
        CurrencyName: Text[30];
        CurrencyUnit: Text[10];
        NUm2Words: Codeunit Library;
        GenJnlManagement: Codeunit GenJnlManagement;
        Paytype: Option Cash,Cheque;
        here: Boolean;
        GJLINE: Record "Gen. Journal Line";
        "Acct Name": Code[10];
        I: Integer;
        General_Journal___TestCaptionLbl: Label 'General Journal - Test';
        CompanyInfo__Phone_No__CaptionLbl: Label 'Phone No.';
        CompanyInfo__Fax_No__CaptionLbl: Label 'Fax No.';
        Gen__Journal_Batch__NameCaptionLbl: Label 'Journal Batch';
        Requisition_No_CaptionLbl: Label 'Requisition No.';
        Dept_CaptionLbl: Label 'Dept.';
        BranchCaptionLbl: Label 'Branch';
        DateCaptionLbl: Label 'Date';
        Being_Payment_For__CaptionLbl: Label 'Being Payment For :';
        Gen__Journal_Line__Document_Type_CaptionLbl: Label 'Document Type';
        Gen__Journal_Line__Account_Type_CaptionLbl: Label 'Account Type';
        AccNameCaptionLbl: Label 'Name';
        Gen__Journal_Line__Gen__Posting_Type_CaptionLbl: Label 'Gen. Posting Type';
        Gen__Journal_Line__Gen__Bus__Posting_Group_CaptionLbl: Label 'Gen. Bus. Posting Group';
        Gen__Journal_Line__Gen__Prod__Posting_Group_CaptionLbl: Label 'Gen. Prod. Posting Group';
        GL_Account_No_CaptionLbl: Label 'GL Account No.';
        Dept__CodeCaptionLbl: Label 'Dept. Code';
        DescriptionCaptionLbl: Label 'Description';
        AmountCaptionLbl: Label 'Amount';
        Branch_CodeCaptionLbl: Label 'Branch Code';
        Gen__Journal_Line__Amount__LCY__CaptionLbl: Label 'Total (LCY)';
        Amounts_in_words_CaptionLbl: Label 'Amounts in words:';
        Credit_Account_No__CaptionLbl: Label 'Credit Account No.:';
        Payment_approval_CaptionLbl: Label 'Payment approval:';
        Checked_by_CaptionLbl: Label 'Checked by:';
        Received_by_CaptionLbl: Label 'Received by:';
        Departmental_Approval_CaptionLbl: Label 'Departmental Approval:';
        ErrorText_Number_CaptionLbl: Label 'Warning!';
        ReconciliationCaptionLbl: Label 'Reconciliation';
        GLAccNetChange__No__CaptionLbl: Label 'No.';
        GLAccNetChange_NameCaptionLbl: Label 'Name';
        GLAccNetChange__Net_Change_in_Jnl__CaptionLbl: Label 'Net Change in Jnl.';
        GLAccNetChange__Balance_after_Posting_CaptionLbl: Label 'Balance after Posting';
        ExcelBuff: Record "Excel Buffer";
        printtoexcel: Boolean;

    local procedure CheckRecurringLine(GenJnlLine2: Record "Gen. Journal Line")
    begin
        /*"WITH GenJnlLine2 DO BEGIN
          IF GenJnlTemplate.Recurring THEN BEGIN
            IF "Recurring Method" = 0 THEN
              AddError(STRSUBSTNO('%1 must be specified.',FIELDNAME("Recurring Method")));
            //IF "Recurring Frequency" = '' THEN
             // AddError(STRSUBSTNO('%1 must be specified.',FIELDNAME("Recurring Frequency")));
            IF "Bal. Account No." <> '' THEN
              AddError(
                STRSUBSTNO(
                  '%1 cannot be specified when using recurring journals.',
                  FIELDNAME("Bal. Account No.")));
            CASE "Recurring Method" OF
              "Recurring Method"::"V  Variable","Recurring Method"::"RV Reversing Variable":
                IF (Amount = 0) AND NOT AmountError THEN BEGIN
                  AmountError := TRUE;
                  AddError(STRSUBSTNO('%1 must be specified.',FIELDNAME(Amount)));
                END;
              "Recurring Method"::"B  Balance","Recurring Method"::"RB Reversing Balance":
                IF (Amount <> 0) AND NOT AmountError THEN BEGIN
                  AmountError := TRUE;
                  AddError(STRSUBSTNO('%1 must be 0.',FIELDNAME(Amount)));
                END;
            END;
            IF ("Recurring Method" > "Recurring Method"::"V  Variable") THEN BEGIN
              IF "Account Type" = "Account Type"::"Fixed Asset" THEN
                AddError(
                  STRSUBSTNO(
                    '%1 must not be %2 when %3 = %4.',
                    FIELDNAME("Recurring Method"),"Recurring Method",
                    FIELDNAME("Account Type"),"Account Type"));
              IF "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" THEN
                AddError(
                  STRSUBSTNO(
                    '%1 must not be %2 when %3 = %4.',
                    FIELDNAME("Recurring Method"),"Recurring Method",
                    FIELDNAME("Bal. Account Type"),"Bal. Account Type"));
            END;
          END ELSE BEGIN
            IF "Recurring Method" <> 0 THEN
              AddError(STRSUBSTNO('%1 cannot be specified.',FIELDNAME("Recurring Method")));
           // IF "Recurring Frequency" <> '' THEN
             // AddError(STRSUBSTNO('%1 cannot be specified.',FIELDNAME("Recurring Frequency")));
          END;
        END;
        */
    end;

    local procedure CheckAllocations(GenJnlLine2: Record "Gen. Journal Line")
    begin
        /*
        WITH GenJnlLine2 DO BEGIN
          GenJnlAlloc.RESET;
          GenJnlAlloc.SETRANGE("Journal Template Name","Journal Template Name");
          GenJnlAlloc.SETRANGE("Journal Batch Name","Journal Batch Name");
          GenJnlAlloc.SETRANGE("Journal Line No.","Line No.");
          GenJnlAlloc.SETFILTER(Amount,'<>0');
          IF GenJnlAlloc.FIND('-') THEN BEGIN
            IF NOT GenJnlTemplate.Recurring THEN
              AddError('Allocations can only be used with recurring journals.')
            ELSE BEGIN
              GenJnlAlloc.SETRANGE("Account No.",'');
              IF GenJnlAlloc.FIND('-') THEN
                AddError(
                  STRSUBSTNO(
                    'Please specify %1 in the %2 allocation lines.',
                    GenJnlAlloc.FIELDNAME("Account No."),GenJnlAlloc.COUNT));
            END;
          END;
        END;
        */
    end;

    local procedure MakeRecurringTexts(var GenJnlLine2: Record "Gen. Journal Line")
    begin
        /*
        WITH GenJnlLine2 DO BEGIN
          GLDocNo := "Document No.";
          IF ("Posting Date" <> 0D) AND ("Account No." <> '') AND ("Recurring Method" <> 0) THEN BEGIN
            Day := DATE2DMY("Posting Date",1);
            Week := DATE2DWY("Posting Date",2);
            Month := DATE2DMY("Posting Date",2);
            MonthText := FORMAT("Posting Date",0,'<Month Text>');
            AccountingPeriod.SETRANGE("Starting Date",0D,"Posting Date");
            IF NOT AccountingPeriod.FIND('+') THEN
              AccountingPeriod.Name := '';
            "Document No." :=
              DELCHR(
                PADSTR(
                  STRSUBSTNO("Document No.",Day,Week,Month,MonthText,AccountingPeriod.Name),
                  MAXSTRLEN("Document No.")),
                '>');
            Description :=
              DELCHR(
                PADSTR(
                  STRSUBSTNO(Description,Day,Week,Month,MonthText,AccountingPeriod.Name),
                  MAXSTRLEN(Description)),
                '>');
          END;
        END;
        */
    end;

    local procedure CheckBalance()
    begin
        /*GenJnlLine := "Gen. Journal Line";
        LastLineNo := "Gen. Journal Line"."Line No.";
        IF "Gen. Journal Line".NEXT = 0 THEN;
        NextGenJnlLine := "Gen. Journal Line";
        MakeRecurringTexts(NextGenJnlLine);
        "Gen. Journal Line" := GenJnlLine;
        WITH GenJnlLine DO
          IF NOT EmptyLine THEN BEGIN
            DocBalance := DocBalance + "Balance (LCY)";
            DateBalance := DateBalance + "Balance (LCY)";
            TotalBalance := TotalBalance + "Balance (LCY)";
            IF "Recurring Method" >= "Recurring Method"::"RF Reversing Fixed" THEN BEGIN
              DocBalanceReverse := DocBalanceReverse + "Balance (LCY)";
              DateBalanceReverse := DateBalanceReverse + "Balance (LCY)";
              TotalBalanceReverse := TotalBalanceReverse + "Balance (LCY)";
            END;
            LastDocType := "Document Type";
            LastDocNo := "Document No.";
            LastDate := "Posting Date";
            IF TotalBalance = 0 THEN BEGIN
              CurrentCustomerVendors := 0;
              VATEntryCreated := FALSE;
            END;
            IF GenJnlTemplate."Force Doc. Balance" THEN BEGIN
              VATEntryCreated :=
                VATEntryCreated OR
                (("Account Type" = "Account Type"::"G/L Account") AND ("Account No." <> '') AND
                 ("Gen. Posting Type" IN ["Gen. Posting Type"::Purchase,"Gen. Posting Type"::Sale])) OR
                (("Bal. Account Type" = "Bal. Account Type"::"G/L Account") AND ("Bal. Account No." <> '') AND
                 ("Bal. Gen. Posting Type" IN ["Bal. Gen. Posting Type"::Purchase,"Bal. Gen. Posting Type"::Sale]));
              IF (("Account Type" IN ["Account Type"::Customer,"Account Type"::Vendor]) AND
                  ("Account No." <> '')) OR
                 (("Bal. Account Type" IN ["Bal. Account Type"::Customer,"Bal. Account Type"::Vendor]) AND
                  ("Bal. Account No." <> ''))
                 THEN
                   CurrentCustomerVendors := CurrentCustomerVendors + 1;
               IF (CurrentCustomerVendors > 1) AND VATEntryCreated THEN
                 AddError(
                   STRSUBSTNO(
                     '%1 %2 posted on %3, must be separated by an empty line',
                     "Document Type","Document No.","Posting Date"));
            END;
          END;

        WITH NextGenJnlLine DO BEGIN
          IF GenJnlTemplate."Force Doc. Balance" AND
             (LastDate <> 0D) AND (LastDocNo <> '') AND
             (("Posting Date" <> LastDate) OR
              ("Document Type" <> LastDocType) OR
              ("Document No." <> LastDocNo) OR
              ("Line No." = LastLineNo))
          THEN BEGIN
            CASE TRUE OF
              DocBalance <> 0:
                AddError(
                  STRSUBSTNO(
                    '%1 %2 is out of balance by %3.',
                    LastDocType,LastDocNo,DocBalance));
              DocBalanceReverse <> 0:
                AddError(
                  STRSUBSTNO(
                    'The reversing entries for %1 %2 are out of balance by %3.',
                    LastDocType,LastDocNo,DocBalanceReverse));
            END;
            DocBalance := 0;
            DocBalanceReverse := 0;
            IF ("Posting Date" <> LastDate) OR
               ("Document Type" <> LastDocType) OR ("Document No." <> LastDocNo)
            THEN BEGIN
              CurrentCustomerVendors := 0;
              VATEntryCreated := FALSE;
              CustPosting := FALSE;
              VendPosting := FALSE;
              SalesPostingType := FALSE;
              PurchPostingType := FALSE;
            END;
          END;

          IF (LastDate <> 0D) AND (("Posting Date" <> LastDate) OR ("Line No." = LastLineNo)) THEN BEGIN
            CASE TRUE OF
              DateBalance <> 0:
                AddError(
                  STRSUBSTNO(
                    'As of %1, the lines are out of balance by %2.',
                    LastDate,DateBalance));
              DateBalanceReverse <> 0:
                AddError(
                  STRSUBSTNO(
                    'As of %1, the reversing entries are out of balance by %2.',
                    LastDate,DateBalanceReverse));
            END;
            DocBalance := 0;
            DocBalanceReverse := 0;
            DateBalance := 0;
            DateBalanceReverse := 0;
          END;

          IF "Line No." = LastLineNo THEN BEGIN
            CASE TRUE OF
              TotalBalance <> 0:
                AddError(
                  STRSUBSTNO(
                    'The total of the lines is out of balance by %1.',
                    TotalBalance));
              TotalBalanceReverse <> 0:
                AddError(
                  STRSUBSTNO(
                    'The total of the reversing entries is out of balance by %1.',
                    TotalBalanceReverse));
            END;
            DocBalance := 0;
            DocBalanceReverse := 0;
            DateBalance := 0;
            DateBalanceReverse := 0;
            TotalBalance := 0;
            TotalBalanceReverse := 0;
            LastDate := 0D;
            LastDocType := 0;
            LastDocNo := '';
          END;
        END;
        */
    end;

    local procedure AddError(Text: Text[250])
    begin
        /*ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;     */
    end;

    local procedure ReconcileGLAccNo(GLAccNo: Code[20]; ReconcileAmount: Decimal)
    begin
        /*IF NOT GLAccNetChange.GET(GLAccNo) THEN BEGIN
          GLAcc.GET(GLAccNo);
          GLAcc.CALCFIELDS("Balance at Date");
          GLAccNetChange.INIT;
          GLAccNetChange."No." := GLAcc."No.";
          GLAccNetChange.Name := GLAcc.Name;
          GLAccNetChange."Balance after Posting" := GLAcc."Balance at Date";
          GLAccNetChange.INSERT;
        END;
        GLAccNetChange."Net Change in Jnl." := GLAccNetChange."Net Change in Jnl." + ReconcileAmount;
        GLAccNetChange."Balance after Posting" := GLAccNetChange."Balance after Posting" + ReconcileAmount;
        GLAccNetChange.MODIFY;   */
    end;

    local procedure CheckGLAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*WITH GenJnlLine DO BEGIN
          IF NOT GLAcc.GET("Account No.") THEN
            AddError(
              STRSUBSTNO(
                '%1 %2 does not exist.',
                GLAcc.TABLENAME,"Account No."))
          ELSE BEGIN
            AccName := GLAcc.Name;

            IF GLAcc.Blocked THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  GLAcc.FIELDNAME(Blocked),FALSE,GLAcc.TABLENAME,"Account No."));
            IF GLAcc."Account Type" <> GLAcc."Account Type"::Posting THEN BEGIN
              GLAcc."Account Type" := GLAcc."Account Type"::Posting;
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  GLAcc.FIELDNAME("Account Type"),GLAcc."Account Type",GLAcc.TABLENAME,"Account No."));
            END;
            IF NOT "System-Created Entry" THEN
              IF "Posting Date" = NORMALDATE("Posting Date") THEN
                IF NOT GLAcc."Direct Posting" THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must be %2 for %3 %4.',
                      GLAcc.FIELDNAME("Direct Posting"),TRUE,GLAcc.TABLENAME,"Account No."));

            {CASE GLAcc."Department Posting" OF
              GLAcc."Department Posting"::"1":
               IF GenJnlLine."Shortcut Dimension 1 Code" = '' THEN
                 AddError(
                   STRSUBSTNO(
                     '%1 is mandatory when posting to %2 %3.',
                     FIELDNAME("Shortcut Dimension 1 Code"),GLAcc.TABLENAME,GLAcc."No."));
              GLAcc."Department Posting"::"2":
                IF GenJnlLine."Shortcut Dimension 1 Code" <> GLAcc."Global Dimension 1 Code" THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must be %2 when posting to %3 %4.',
                      FIELDNAME("Shortcut Dimension 1 Code"),GLAcc."Global Dimension 1 Code",GLAcc.TABLENAME,GLAcc."No."));
              GLAcc."Department Posting"::"3":
                IF GenJnlLine."Shortcut Dimension 1 Code" <> '' THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must be blank when posting to %2 %3.',
                      FIELDNAME("Shortcut Dimension 1 Code"),GLAcc.TABLENAME,GLAcc."No."));
            END;
            }
            {
            CASE GLAcc."Branch Posting" OF
              GLAcc."Branch Posting"::"1":
                IF GenJnlLine."Shortcut Dimension 2 Code" = '' THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 is mandatory when posting to %2 %3.',
                      FIELDNAME("Shortcut Dimension 2 Code"),GLAcc.TABLENAME,GLAcc."No."));
              GLAcc."Branch Posting"::"2":
                IF GenJnlLine."Shortcut Dimension 2 Code" <> GLAcc."Global Dimension 2 Code" THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must be %2 when posting to %3 %4.',
                      FIELDNAME("Shortcut Dimension 2 Code"),GLAcc."Global Dimension 2 Code",GLAcc.TABLENAME,GLAcc."No."));
              GLAcc."Branch Posting"::"3":
                IF GenJnlLine."Shortcut Dimension 2 Code" <> '' THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must be blank when posting to %2 %3.',
                      FIELDNAME("Shortcut Dimension 2 Code"),GLAcc.TABLENAME,GLAcc."No."));
            END;
            }

            IF "Gen. Posting Type" > 0 THEN BEGIN
              CASE "Gen. Posting Type" OF
                "Gen. Posting Type"::Sale:
                  SalesPostingType := TRUE;
                "Gen. Posting Type"::Purchase:
                  PurchPostingType := TRUE;
              END;
              TestPostingType;

              IF NOT VATPostingSetup.GET("VAT Bus. Posting Group","VAT Prod. Posting Group") THEN
                AddError(
                  STRSUBSTNO(
                    '%1 %2 %3 does not exist.',
                    VATPostingSetup.TABLENAME,"VAT Bus. Posting Group","VAT Prod. Posting Group"))
              ELSE
                IF "VAT Calculation Type" <> VATPostingSetup."VAT Calculation Type" THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must be %2.',
                      FIELDNAME("VAT Calculation Type"),VATPostingSetup."VAT Calculation Type"))
            END;

            IF GLAcc."Reconciliation Account" THEN
              ReconcileGLAccNo("Account No.",ROUND("Amount (LCY)" / (1 + "VAT %" / 100)));
          END;
        END;
              */
    end;

    local procedure CheckCust(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*
        WITH GenJnlLine DO BEGIN
          IF NOT Cust.GET("Account No.") THEN
            AddError(
              STRSUBSTNO(
                '%1 %2 does not exist.',
                Cust.TABLENAME,"Account No."))
          ELSE BEGIN
            AccName := Cust.Name;

            IF Cust.Blocked THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  Cust.FIELDNAME(Blocked),FALSE,Cust.TABLENAME,"Account No."));
            IF "Currency Code" <> '' THEN
              IF NOT Currency.GET("Currency Code") THEN
                AddError(
                  STRSUBSTNO(
                    'The currency %1 cannot be found. Please check the currency table.',
                    "Currency Code"));

            CustPosting := TRUE;
            TestPostingType;

            IF "Recurring Method" = 0 THEN
              IF "Document Type" IN
                 ["Document Type"::Invoice,"Document Type"::"Credit Memo",
                  "Document Type"::"Finance Charge Memo"]
              THEN BEGIN
                OldCustLedgEntry.RESET;
                OldCustLedgEntry.SETCURRENTKEY("Document Type","Document No.","Customer No.");
                OldCustLedgEntry.SETRANGE("Document Type","Document Type");
                OldCustLedgEntry.SETRANGE("Document No.","Document No.");
                IF OldCustLedgEntry.FIND('-') THEN
                  AddError(STRSUBSTNO('Sales %1 %2 already exists.',"Document Type","Document No."));
              END;

             IF SalesSetup."Ext. Doc. No. Mandatory" THEN
               TESTFIELD("External Document No.");
          END;
        END;
           */
    end;

    local procedure CheckVend(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*
        WITH GenJnlLine DO BEGIN
          IF NOT Vend.GET("Account No.") THEN
            AddError(
              STRSUBSTNO(
                '%1 %2 does not exist.',
                Vend.TABLENAME,"Account No."))
          ELSE BEGIN
            AccName := Vend.Name;

            IF Vend.Blocked THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  Vend.FIELDNAME(Blocked),FALSE,Vend.TABLENAME,"Account No."));
            IF "Currency Code" <> '' THEN
              IF NOT Currency.GET("Currency Code") THEN
                AddError(
                  STRSUBSTNO(
                    'The currency %1 cannot be found. Please check the currency table.',
                    "Currency Code"));

            VendPosting := TRUE;
            TestPostingType;

            IF "Recurring Method" = 0 THEN
              IF "Document Type" IN
                 ["Document Type"::Invoice,"Document Type"::"Credit Memo",
                  "Document Type"::"Finance Charge Memo"]
              THEN BEGIN
                OldVendLedgEntry.RESET;
                OldVendLedgEntry.SETCURRENTKEY("Document Type","Document No.","Vendor No.");
                OldVendLedgEntry.SETRANGE("Document Type","Document Type");
                OldVendLedgEntry.SETRANGE("Document No.","Document No.");
                OldVendLedgEntry.SETRANGE("Vendor No.","Account No.");
                IF OldVendLedgEntry.FIND('-') THEN
                  AddError(
                    STRSUBSTNO(
                      'Purchase %1 %2 already exists for this vendor.',
                      "Document Type","Document No."));

                IF PurchSetup."Ext. Doc. No. Mandatory" OR
                  ("External Document No." <> '')
                THEN BEGIN
                  // Test vendor number
                  IF "External Document No." = '' THEN
                    AddError(
                      STRSUBSTNO(
                        '%1 must be entered.',FIELDNAME("External Document No.")));
                  OldVendLedgEntry.RESET;
                  OldVendLedgEntry.SETCURRENTKEY("Document Type","External Document No.","Vendor No.");
                  OldVendLedgEntry.SETRANGE("Document Type","Document Type");
                  OldVendLedgEntry.SETRANGE("External Document No.","External Document No.");
                  OldVendLedgEntry.SETRANGE("Vendor No.","Account No.");
                  IF OldVendLedgEntry.FIND('-') THEN
                    AddError(
                      STRSUBSTNO(
                        'Purchase %1 %2 already exists for this vendor.',
                        "Document Type","External Document No."));
                END;
              END;
          END;
        END;
        */
    end;

    local procedure CheckBankAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*
        WITH GenJnlLine DO BEGIN
          IF NOT BankAcc.GET("Account No.") THEN
            AddError(
              STRSUBSTNO(
                '%1 %2 does not exist.',
                BankAcc.TABLENAME,"Account No."))
          ELSE BEGIN
            AccName := BankAcc.Name;

            IF BankAcc.Blocked THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  BankAcc.FIELDNAME(Blocked),FALSE,BankAcc.TABLENAME,"Account No."));
            IF ("Currency Code" <> BankAcc."Currency Code") AND (BankAcc."Currency Code" <> '') THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2.',
                  FIELDNAME("Currency Code"),BankAcc."Currency Code"));

            IF "Currency Code" <> '' THEN
              IF NOT Currency.GET("Currency Code") THEN
                AddError(
                  STRSUBSTNO(
                    'The currency %1 cannot be found. Please check the currency table.',
                    "Currency Code"));

            IF "Bank Payment Type" <> 0 THEN
              IF ("Bank Payment Type" = "Bank Payment Type"::"Computer Check") AND (Amount < 0) THEN
                IF BankAcc."Currency Code" <> "Currency Code" THEN
                  AddError(
                    STRSUBSTNO(
                      '%1 must not be filled when %2 is different in %3 and %4.',
                      FIELDNAME("Bank Payment Type"),FIELDNAME("Currency Code"),
                      TABLENAME,BankAcc.TABLENAME));

            IF BankAccPostingGroup.GET(BankAcc."Bank Acc. Posting Group") THEN
              IF BankAccPostingGroup."G/L Bank Account No." <> '' THEN
                ReconcileGLAccNo(
                  BankAccPostingGroup."G/L Bank Account No.",
                  ROUND("Amount (LCY)" / (1 + "VAT %" / 100)));
          END;
        END;
          */
    end;

    local procedure CheckFixedAsset(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*
        WITH GenJnlLine DO BEGIN
          IF NOT FA.GET("Account No.") THEN
            AddError(
              STRSUBSTNO(
                '%1 %2 does not exist.',
                FA.TABLENAME,"Account No."))
          ELSE BEGIN
            AccName := FA.Description;
            IF FA.Blocked THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  FA.FIELDNAME(Blocked),FALSE,FA.TABLENAME,"Account No."));
            IF FA.Inactive THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be %2 for %3 %4.',
                  FA.FIELDNAME(Inactive),FALSE,FA.TABLENAME,"Account No."));
            IF FA."Budgeted Asset" THEN
              AddError(
                STRSUBSTNO(
                  '%1 %2 must not have %3 = %4.',
                  FA.TABLENAME,"Account No.",FA.FIELDNAME("Budgeted Asset"),TRUE));
            IF DeprBook.GET("Depreciation Book Code") THEN
              CheckFAIntegration(GenJnlLine)
            ELSE
              AddError(
                STRSUBSTNO(
                  '%1 %2 does not exist.',
                  DeprBook.TABLENAME,"Depreciation Book Code"));
            IF NOT FADeprBook.GET(FA."No.","Depreciation Book Code") THEN
              AddError(
                STRSUBSTNO(
                  '%1 %2 %3 does not exist.',
                  FADeprBook.TABLENAME,FA."No.","Depreciation Book Code"));
          END;
        END;
        */
    end;

    local procedure TestFixedAsset(var GenJnlLine: Record "Gen. Journal Line")
    begin
        /*
        // Fixed Asset
        WITH GenJnlLine DO BEGIN
          IF "Job No." <> '' THEN
            AddError(
              STRSUBSTNO(
                '%1 must not be specified in fixed asset journal lines.',FIELDNAME("Job No.")));
          IF "FA Posting Type" = "FA Posting Type"::" " THEN
            AddError(
              STRSUBSTNO(
                '%1 must be specified in fixed asset journal lines.',FIELDNAME("FA Posting Type")));
          IF "Depreciation Book Code" = '' THEN
            AddError(
              STRSUBSTNO(
                '%1 must be specified in fixed asset journal lines.',FIELDNAME("Depreciation Book Code")));
          IF "Depreciation Book Code" = "Duplicate in Depreciation Book" THEN
            AddError(
              STRSUBSTNO(
                '%1 must be different than %2.',
                FIELDNAME("Depreciation Book Code"),FIELDNAME("Duplicate in Depreciation Book")));
          IF "Account Type" = "Bal. Account Type" THEN
            AddError(
              STRSUBSTNO(
                '%1 and %2 must not both be %3.',
                FIELDNAME("Account Type"),FIELDNAME("Bal. Account Type"),"Account Type"));
          IF "Account Type" = "Account Type"::"Fixed Asset" THEN BEGIN
            IF "FA Posting Type" IN
              ["FA Posting Type"::"Acquisition Cost","FA Posting Type"::Disposal,"FA Posting Type"::Maintenance]
            THEN BEGIN
              IF ("Gen. Bus. Posting Group" <> '') OR ("Gen. Prod. Posting Group" <> '') THEN
                IF "Gen. Posting Type" = "Gen. Posting Type"::" " THEN
                  AddError(STRSUBSTNO('%1 must be specified.',FIELDNAME("Gen. Posting Type")));
            END ELSE BEGIN
              IF "Gen. Posting Type" <> "Gen. Posting Type"::" " THEN
                AddError(
                  STRSUBSTNO(
                    '%1  must not be specified when %2 = %3.',
                    FIELDNAME("Gen. Posting Type"),FIELDNAME("FA Posting Type"),"FA Posting Type"));
              IF "Gen. Bus. Posting Group" <> '' THEN
                AddError(
                  STRSUBSTNO(
                    '%1 must not be specified when %2 = %3.',
                    FIELDNAME("Gen. Bus. Posting Group"),FIELDNAME("FA Posting Type"),"FA Posting Type"));
              IF "Gen. Prod. Posting Group" <> '' THEN
                AddError(
                  STRSUBSTNO(
                    '%1 must not be specified when %2 = %3.',
                    FIELDNAME("Gen. Prod. Posting Group"),FIELDNAME("FA Posting Type"),"FA Posting Type"));
            END;
          END;
          IF "Bal. Account Type" = "Bal. Account Type"::"Fixed Asset" THEN BEGIN
            IF "FA Posting Type" IN
              ["FA Posting Type"::"Acquisition Cost","FA Posting Type"::Disposal,"FA Posting Type"::Maintenance]
            THEN BEGIN
              IF ("Bal. Gen. Bus. Posting Group" <> '') OR ("Bal. Gen. Prod. Posting Group" <> '') THEN
                IF "Bal. Gen. Posting Type" = "Bal. Gen. Posting Type"::" " THEN
                  AddError(STRSUBSTNO('%1 must be specified.',FIELDNAME("Bal. Gen. Posting Type")));
            END ELSE BEGIN
              IF "Bal. Gen. Posting Type" <> "Bal. Gen. Posting Type"::" " THEN
                AddError(
                  STRSUBSTNO(
                  '%1 must not be specified when %2 = %3.',
                  FIELDNAME("Bal. Gen. Posting Type"),FIELDNAME("FA Posting Type"),"FA Posting Type"));
              IF "Bal. Gen. Bus. Posting Group" <> '' THEN
                AddError(
                  STRSUBSTNO(
                    '%1 must not be specified when %2 = %3.',
                    FIELDNAME("Bal. Gen. Bus. Posting Group"),FIELDNAME("FA Posting Type"),"FA Posting Type"));
              IF "Bal. Gen. Prod. Posting Group" <> '' THEN
                AddError(
                  STRSUBSTNO(
                    '%1 must not be specified when %2 = %3.',
                    FIELDNAME("Bal. Gen. Prod. Posting Group"),FIELDNAME("FA Posting Type"),"FA Posting Type"));
            END;
          END;
          TempErrorText :=
            '%1 ' +
            STRSUBSTNO(
              'must not be specified together with %1 = %2.',
              FIELDNAME("FA Posting Type"),"FA Posting Type");
          IF "FA Posting Type" <> "FA Posting Type"::"Acquisition Cost" THEN BEGIN
            IF "Depr. Acquisition Cost" THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Depr. Acquisition Cost")));
            IF "Salvage Value" <> 0 THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Salvage Value")));
            IF "FA Posting Type" <> "FA Posting Type"::Maintenance THEN
              IF Quantity <> 0 THEN
                AddError(STRSUBSTNO(TempErrorText,FIELDNAME(Quantity)));
            IF "Insurance No." <> '' THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Insurance No.")));
          END;
          IF ("FA Posting Type" = "FA Posting Type"::Maintenance) AND "Depr. until FA Posting Date" THEN
            AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Depr. until FA Posting Date")));
          IF ("FA Posting Type" <> "FA Posting Type"::Maintenance) AND ("Maintenance Code" <> '') THEN
            AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Maintenance Code")));

          IF ("FA Posting Type" <> "FA Posting Type"::Depreciation) AND
             ("FA Posting Type" <> "FA Posting Type"::"Custom 1") AND
             ("No. of Depreciation Days" <> 0)
          THEN
            AddError(STRSUBSTNO(TempErrorText,FIELDNAME("No. of Depreciation Days")));

          IF ("FA Posting Type" = "FA Posting Type"::Disposal) AND "FA Reclassification Entry" THEN
            AddError(STRSUBSTNO(TempErrorText,FIELDNAME("FA Reclassification Entry")));

          IF ("FA Posting Type" = "FA Posting Type"::Disposal) AND ("Budgeted FA No." <> '') THEN
            AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Budgeted FA No.")));

          IF "FA Posting Date" = 0D THEN
            "FA Posting Date" := "Posting Date";
          IF DeprBook.GET("Depreciation Book Code") THEN
            IF DeprBook."Use Same FA+G/L Posting Dates" AND ("Posting Date" <> "FA Posting Date") THEN
              AddError(
                STRSUBSTNO(
                  '%1 must be identical to %2.',
                  FIELDNAME("Posting Date"),FIELDNAME("FA Posting Date")));
          IF "FA Posting Date" <> 0D THEN BEGIN
            IF "FA Posting Date" <> NORMALDATE("FA Posting Date") THEN
              AddError(
                STRSUBSTNO(
                  '%1 cannot be a closing date.',
                  FIELDNAME("FA Posting Date")));
            IF NOT ("FA Posting Date" IN [01010001D..31129999D]) THEN
              AddError(
                STRSUBSTNO(
                  '%1 is not within your range of allowed posting dates.',
                  FIELDNAME("FA Posting Date")));
            IF (AllowFAPostingFrom = 0D) AND (AllowFAPostingTo = 0D) THEN BEGIN
              IF USERID <> '' THEN
                IF UserSetup.GET(USERID) THEN BEGIN
                  AllowFAPostingFrom := UserSetup."Allow FA Posting From";
                  AllowFAPostingTo := UserSetup."Allow FA Posting To";
                END;
              IF (AllowFAPostingFrom = 0D) AND (AllowFAPostingTo = 0D) THEN BEGIN
                FASetup.GET;
                AllowFAPostingFrom := FASetup."Allow FA Posting From";
                AllowFAPostingTo := FASetup."Allow FA Posting To";
              END;
              IF AllowFAPostingTo = 0D THEN
                AllowFAPostingTo := 31129999D;
            END;
            IF ("FA Posting Date" < AllowFAPostingFrom) OR
               ("FA Posting Date" > AllowFAPostingTo)
            THEN
              AddError(
                STRSUBSTNO(
                  '%1 is not within your range of allowed posting dates.',
                  FIELDNAME("FA Posting Date")));
          END;
          FASetup.GET;
          IF ("FA Posting Type" = "FA Posting Type"::"Acquisition Cost") AND
             ("Insurance No." <> '') AND ("Depreciation Book Code" <> FASetup."Insurance Depr. Book")
          THEN
            AddError(
              STRSUBSTNO(
                'Insurance integration is not activated for %1 %2.',
                FIELDNAME("Depreciation Book Code"),"Depreciation Book Code"));

          IF "FA Error Entry No." > 0 THEN BEGIN
            TempErrorText :=
              '%1 ' +
              STRSUBSTNO(
              'must not be specified when %1 is specified.',
               FIELDNAME("FA Error Entry No."));
            IF "Depr. until FA Posting Date" THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Depr. until FA Posting Date")));
            IF "Depr. Acquisition Cost" THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Depr. Acquisition Cost")));
            IF "Duplicate in Depreciation Book" <> '' THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Duplicate in Depreciation Book")));
            IF "Use Duplication List" THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Use Duplication List")));
            IF "Salvage Value" <> 0 THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Salvage Value")));
            IF "Insurance No." <> '' THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Insurance No.")));
            IF "Budgeted FA No." <> '' THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Budgeted FA No.")));
            IF "Recurring Method" > 0 THEN
              AddError(STRSUBSTNO(TempErrorText,FIELDNAME("Recurring Method")));
            IF ("FA Posting Type" = "FA Posting Type"::Maintenance) THEN
              AddError(STRSUBSTNO(TempErrorText,"FA Posting Type"));
          END;
        END;
        */
    end;

    local procedure CheckFAIntegration(var GenJnlLine: Record "Gen. Journal Line")
    begin
        /*WITH GenJnlLine DO BEGIN
          IF "FA Posting Type" = "FA Posting Type"::" " THEN
            EXIT;
          CASE "FA Posting Type" OF
            "FA Posting Type"::"Acquisition Cost":
              GLIntegration := DeprBook."G/L Integration - Acq. Cost";
            "FA Posting Type"::Depreciation:
              GLIntegration := DeprBook."G/L Integration - Depreciation";
            "FA Posting Type"::"Write-Down":
              GLIntegration := DeprBook."G/L Integration - Write-Down";
            "FA Posting Type"::Appreciation:
              GLIntegration := DeprBook."G/L Integration - Appreciation";
            "FA Posting Type"::"Custom 1":
              GLIntegration := DeprBook."G/L Integration - Custom 1";
            "FA Posting Type"::"Custom 2":
              GLIntegration := DeprBook."G/L Integration - Custom 2";
            "FA Posting Type"::Disposal:
              GLIntegration := DeprBook."G/L Integration - Disposal";
            "FA Posting Type"::Maintenance:
              GLIntegration := DeprBook."G/L Integration - Maintenance";
          END;
          IF NOT GLIntegration THEN
            AddError(
              STRSUBSTNO(
                'When G/L integration is not activated, %1 must not be posted in the general journal.',
                "FA Posting Type"));

          IF NOT DeprBook."G/L Integration - Depreciation" THEN BEGIN
            IF "Depr. until FA Posting Date"THEN
              AddError(
                STRSUBSTNO(
                  'When G/L integration is not activated, %1 must not be specified in the general journal.',
                  FIELDNAME("Depr. until FA Posting Date")));
            IF "Depr. Acquisition Cost" THEN
              AddError(
                STRSUBSTNO(
                  'When G/L integration is not activated, %1 must not be specified in the general journal.',
                  FIELDNAME("Depr. Acquisition Cost")));
          END;
        END;
            */
    end;

    local procedure TestFixedAssetFields(var GenJnlLine: Record "Gen. Journal Line")
    begin
        /*
        WITH GenJnlLine DO BEGIN
          IF "FA Posting Type" <> "FA Posting Type"::" " THEN
            AddError(STRSUBSTNO('%1 must not be specified.',FIELDNAME("FA Posting Type")));
          IF "Depreciation Book Code" <> '' THEN
            AddError(STRSUBSTNO('%1 must not be specified.',FIELDNAME("Depreciation Book Code")));
        END;
          */
    end;

    [Scope('OnPrem')]
    procedure TestPostingType()
    begin
        /*
        CASE TRUE OF
          CustPosting AND PurchPostingType:
            AddError('Customer and Gen. Posting Type Purchase are not allowed.');
          VendPosting AND SalesPostingType:
            AddError('Vendor and Gen. Posting Type Sales are not allowed.');
        END;                  */
    end;

    [Scope('OnPrem')]
    procedure createsheet()
    begin
        ExcelBuff.CreateBookAndOpenExcel('Sales', 'Hai', CompanyName, UserId, '');
    end;

    [Scope('OnPrem')]
    procedure header()
    begin
        ExcelBuff.AddColumn('Posting Date', false, '', false, false, false, '', 0);
        ExcelBuff.AddColumn('Barcode', false, '', false, false, false, '', 0);
        ExcelBuff.AddColumn('Quantity', false, '', false, false, false, '', 0);
    end;

    [Scope('OnPrem')]
    procedure body()
    begin
        ExcelBuff.NewRow();
        //excelbuff.AddColumn("I"."Posting Date",FALSE,'',FALSE,FALSE,FALSE,'',0);
        //excelbuff.AddColumn("Item Ledger Entry".Barcodes,FALSE,'',FALSE,FALSE,FALSE,'',0);
        //excelbuff.AddColumn("Item Ledger Entry".Quantity,FALSE,'',FALSE,FALSE,FALSE,'',0);
        //excelbuff.AddColumn("Item Ledger Entry".Description,FALSE,'',FALSE,FALSE,FALSE,'',0);
    end;
}
