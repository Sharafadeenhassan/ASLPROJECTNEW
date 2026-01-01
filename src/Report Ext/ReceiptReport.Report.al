report 50170 "Receipt Report"
{
    // GJLINE."Posting Date"
    // NUm2Words.ToWords("Amount (LCY)",CurrencyName,CurrencyUnit,100,'')+'
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/ReceiptReport.rdlc';
    Caption = 'Receipt Report';
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
                column(GJLINE__Posting_Date_; GJLINE."Posting Date")
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
                column(GJLINE__Bal__Account_No__; GJLINE."Bal. Account No.")
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
                column(DateCaption; DateCaptionLbl)
                {
                }
                column(Receipt_No_Caption; Receipt_No_CaptionLbl)
                {
                }
                column(Dept_Caption; Dept_CaptionLbl)
                {
                }
                column(BranchCaption; BranchCaptionLbl)
                {
                }
                column(Customer_No_Caption; Customer_No_CaptionLbl)
                {
                }
                column(In_Settlement_of__Caption; In_Settlement_of__CaptionLbl)
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
                column(DescriptionCaption; DescriptionCaptionLbl)
                {
                }
                column(AmountCaption; AmountCaptionLbl)
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
                    column(Gen__Journal_Line_Description_Control62; Description)
                    {
                    }
                    column(Amount; -Amount)
                    {
                    }
                    column(Gen__Journal_Line__Balance__LCY___Control40; "Balance (LCY)")
                    {
                    }
                    column(Amount__LCY__; -"Amount (LCY)")
                    {
                    }
                    column(UPPERCASE_NUm2Words_ToWords__Amount__LCY___CurrencyName_CurrencyUnit_100_____; UpperCase(NUm2Words.ToWords("Amount (LCY)", CurrencyName, CurrencyUnit, 100, '')))
                    {
                    }
                    column(Bal__Account_No_______BalAccName; "Bal. Account No." + ' ' + BalAccName)
                    {
                    }
                    column(v1; v1)
                    {
                    }
                    column(v2; v2)
                    {
                    }
                    column(Gen__Journal_Line__Gen__Journal_Line___Line_No__; "Gen. Journal Line"."Line No.")
                    {
                    }
                    column(Gen__Journal_Line__Gen__Journal_Line___Bal__Account_No__; "Gen. Journal Line"."Bal. Account No.")
                    {
                    }
                    column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
                    {
                    }
                    column(USERID; UserId)
                    {
                    }
                    column(Amount__LCY__Caption; Amount__LCY__CaptionLbl)
                    {
                    }
                    column(Amounts_in_words_Caption; Amounts_in_words_CaptionLbl)
                    {
                    }
                    column(Debit_Account_No__Caption; Debit_Account_No__CaptionLbl)
                    {
                    }
                    column(Cashier_Location_Caption; Cashier_Location_CaptionLbl)
                    {
                    }
                    column(Cashier_Signature__Caption; Cashier_Signature__CaptionLbl)
                    {
                    }
                    column(LAGOSCaption; LAGOSCaptionLbl)
                    {
                    }
                    column(Gen__Journal_Line_Journal_Template_Name; "Journal Template Name")
                    {
                    }
                    column(Gen__Journal_Line_Journal_Batch_Name; "Journal Batch Name")
                    {
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
                                            if "Gen. Posting Type" <> "Gen. Posting Type"::" " then
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
                                                if "Bal. Gen. Posting Type" = 0 then
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
                                        //        AllowPostingTo := 31129999D; // &u

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
                    end;

                    trigger OnPostDataItem()
                    begin
                        GLAccNetChange.DeleteAll();
                    end;

                    trigger OnPreDataItem()
                    begin
                        SetRange(Number, 1, GLAccNetChange.Count);
                    end;
                }
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
        A1 := "Gen. Journal Line".GetFilter("Gen. Journal Line"."Journal Template Name");
        A2 := "Gen. Journal Line".GetFilter("Gen. Journal Line"."Journal Batch Name");

        GJLINE.SetRange(GJLINE."Journal Template Name", A1);
        GJLINE.SetRange(GJLINE."Journal Batch Name", A2);
        here := GJLINE.Find('-');

        if (GJLINE."Account Type" = 0) and (GJLINE."Bal. Account Type" = 0) then begin
            BuyFromAddr[1] := '';
            BuyFromAddr[2] := '';
            BuyFromAddr[3] := '';
            BuyFromAddr[4] := '';
            BuyFromAddr[5] := '';
            BuyFromAddr[6] := '';
            BuyFromAddr[7] := '';
            BuyFromAddr[8] := '';
        end;

        if (GJLINE."Account Type" = 1) or (GJLINE."Bal. Account Type" = 1) then begin
            if not Cust.Get(GJLINE."Account No.") then Cust.Get(GJLINE."Bal. Account No.");
            FormatAddr.Customer(BuyFromAddr, Cust)
        end;
        if (GJLINE."Account Type" = 2) or (GJLINE."Bal. Account Type" = 2) then begin
            if not Vend.Get(GJLINE."Account No.") then Vend.Get(GJLINE."Bal. Account No.");
            FormatAddr.Vendor(BuyFromAddr, Vend)
        end;
    end;

    var
        GLSetup: Record "General Ledger Setup";
        SalesSetup: Record "Sales & Receivables Setup";
        PurchSetup: Record "Purchases & Payables Setup";
        UserSetup: Record "User Setup";
        AccountingPeriod: Record "Accounting Period";
        GLAcc: Record "G/L Account";
        Currency: Record Currency;
        Cust: Record Customer;
        Vend: Record Vendor;
        BankAccPostingGroup: Record "Bank Account Posting Group";
        BankAcc: Record "Bank Account";
        GenJnlTemplate: Record "Gen. Journal Template";
        GenJnlLine2: Record "Gen. Journal Line";
        GenJnlAlloc: Record "Gen. Jnl. Allocation";
        VATPostingSetup: Record "VAT Posting Setup";
        NoSeries: Record "No. Series";
        FA: Record "Fixed Asset";
        DeprBook: Record "Depreciation Book";
        FADeprBook: Record "FA Depreciation Book";
        FASetup: Record "FA Setup";
        GLAccNetChange: Record "G/L Account Net Change" temporary;
        ExchAccGLJnlLine: Codeunit "Exchange Acc. G/L Journal Line";
        GenJnlLineFilter: Text[250];
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        AllowFAPostingFrom: Date;
        AllowFAPostingTo: Date;
        LastDate: Date;
        LastDocType: Option Document,Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder;
        LastDocNo: Code[20];
        LastEntrdDocNo: Code[20];
        LastEntrdDate: Date;
        DocBalance: Decimal;
        DocBalanceReverse: Decimal;
        DateBalance: Decimal;
        DateBalanceReverse: Decimal;
        TotalBalance: Decimal;
        TotalBalanceReverse: Decimal;
        AccName: Text[80];
        LastLineNo: Integer;
        GLDocNo: Code[20];
        Day: Integer;
        Week: Integer;
        Month: Integer;
        MonthText: Text[30];
        AmountError: Boolean;
        ErrorCounter: Integer;
        ErrorText: array[50] of Text[250];
        TempErrorText: Text[250];
        BalAccName: Text[80];
        CurrentCustomerVendors: Integer;
        VATEntryCreated: Boolean;
        CustPosting: Boolean;
        VendPosting: Boolean;
        SalesPostingType: Boolean;
        PurchPostingType: Boolean;
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
        v1: Text[30];
        v2: Text[30];
        here: Boolean;
        GJLINE: Record "Gen. Journal Line";
        A1: Text[30];
        A2: Text[30];
        General_Journal___TestCaptionLbl: Label 'General Journal - Test';
        CompanyInfo__Phone_No__CaptionLbl: Label 'Phone No.';
        CompanyInfo__Fax_No__CaptionLbl: Label 'Fax No.';
        Gen__Journal_Batch__NameCaptionLbl: Label 'Journal Batch';
        DateCaptionLbl: Label 'Date';
        Receipt_No_CaptionLbl: Label 'Receipt No.';
        Dept_CaptionLbl: Label 'Dept.';
        BranchCaptionLbl: Label 'Branch';
        Customer_No_CaptionLbl: Label 'Customer No.';
        In_Settlement_of__CaptionLbl: Label 'In Settlement of :';
        Gen__Journal_Line__Document_Type_CaptionLbl: Label 'Document Type';
        Gen__Journal_Line__Account_Type_CaptionLbl: Label 'Account Type';
        AccNameCaptionLbl: Label 'Name';
        Gen__Journal_Line__Gen__Posting_Type_CaptionLbl: Label 'Gen. Posting Type';
        Gen__Journal_Line__Gen__Bus__Posting_Group_CaptionLbl: Label 'Gen. Bus. Posting Group';
        Gen__Journal_Line__Gen__Prod__Posting_Group_CaptionLbl: Label 'Gen. Prod. Posting Group';
        DescriptionCaptionLbl: Label 'Description';
        AmountCaptionLbl: Label 'Amount';
        Amount__LCY__CaptionLbl: Label 'Total (LCY)';
        Amounts_in_words_CaptionLbl: Label 'Amounts in words:';
        Debit_Account_No__CaptionLbl: Label 'Debit Account No.:';
        Cashier_Location_CaptionLbl: Label 'Cashier Location:';
        Cashier_Signature__CaptionLbl: Label 'Cashier Signature :';
        LAGOSCaptionLbl: Label 'LAGOS';
        ErrorText_Number_CaptionLbl: Label 'Warning!';
        ReconciliationCaptionLbl: Label 'Reconciliation';
        GLAccNetChange__No__CaptionLbl: Label 'No.';
        GLAccNetChange_NameCaptionLbl: Label 'Name';
        GLAccNetChange__Net_Change_in_Jnl__CaptionLbl: Label 'Net Change in Jnl.';
        GLAccNetChange__Balance_after_Posting_CaptionLbl: Label 'Balance after Posting';

    local procedure CheckRecurringLine(GenJnlLine2: Record "Gen. Journal Line")
    begin
        if GenJnlTemplate.Recurring then begin
            if GenJnlLine2."Recurring Method" = 0 then
                AddError(StrSubstNo('%1 must be specified.', GenJnlLine2.FieldName("Recurring Method")));
            //IF "Recurring Frequency" = 0D THEN
            //  AddError(STRSUBSTNO('%1 must be specified.',FIELDNAME("Recurring Frequency")));
            if GenJnlLine2."Bal. Account No." <> '' then
                AddError(
                  StrSubstNo(
                    '%1 cannot be specified when using recurring journals.',
                    GenJnlLine2.FieldName("Bal. Account No.")));
            case GenJnlLine2."Recurring Method" of
                GenJnlLine2."Recurring Method"::"V  Variable", GenJnlLine2."Recurring Method"::"RV Reversing Variable":
                    if (GenJnlLine2.Amount = 0) and not AmountError then begin
                        AmountError := true;
                        AddError(StrSubstNo('%1 must be specified.', GenJnlLine2.FieldName(Amount)));
                    end;
                GenJnlLine2."Recurring Method"::"B  Balance", GenJnlLine2."Recurring Method"::"RB Reversing Balance":
                    if (GenJnlLine2.Amount <> 0) and not AmountError then begin
                        AmountError := true;
                        AddError(StrSubstNo('%1 must be 0.', GenJnlLine2.FieldName(Amount)));
                    end;
            end;
            if (GenJnlLine2."Recurring Method" > GenJnlLine2."Recurring Method"::"V  Variable") then begin
                if GenJnlLine2."Account Type" = GenJnlLine2."Account Type"::"Fixed Asset" then
                    AddError(
                      StrSubstNo(
                        '%1 must not be %2 when %3 = %4.',
                        GenJnlLine2.FieldName("Recurring Method"), GenJnlLine2."Recurring Method",
                        GenJnlLine2.FieldName("Account Type"), GenJnlLine2."Account Type"));
                if GenJnlLine2."Bal. Account Type" = GenJnlLine2."Bal. Account Type"::"Fixed Asset" then
                    AddError(
                      StrSubstNo(
                        '%1 must not be %2 when %3 = %4.',
                        GenJnlLine2.FieldName("Recurring Method"), GenJnlLine2."Recurring Method",
                        GenJnlLine2.FieldName("Bal. Account Type"), GenJnlLine2."Bal. Account Type"));
            end;
        end else
            if GenJnlLine2."Recurring Method" <> 0 then
                AddError(StrSubstNo('%1 cannot be specified.', GenJnlLine2.FieldName("Recurring Method")));
        //IF "Recurring Frequency" <> '' THEN
        //AddError(STRSUBSTNO('%1 cannot be specified.',FIELDNAME("Recurring Frequency")));
    end;

    local procedure CheckAllocations(GenJnlLine2: Record "Gen. Journal Line")
    begin
        GenJnlAlloc.Reset();
        GenJnlAlloc.SetRange("Journal Template Name", GenJnlLine2."Journal Template Name");
        GenJnlAlloc.SetRange("Journal Batch Name", GenJnlLine2."Journal Batch Name");
        GenJnlAlloc.SetRange("Journal Line No.", GenJnlLine2."Line No.");
        GenJnlAlloc.SetFilter(Amount, '<>0');
        if GenJnlAlloc.Find('-') then
            if not GenJnlTemplate.Recurring then
                AddError('Allocations can only be used with recurring journals.')
            else begin
                GenJnlAlloc.SetRange("Account No.", '');
                if GenJnlAlloc.Find('-') then
                    AddError(
                      StrSubstNo(
                        'Please specify %1 in the %2 allocation lines.',
                        GenJnlAlloc.FieldName("Account No."), GenJnlAlloc.Count));
            end;
    end;

    local procedure MakeRecurringTexts(var GenJnlLine2: Record "Gen. Journal Line")
    begin
        GLDocNo := GenJnlLine2."Document No.";
        if (GenJnlLine2."Posting Date" <> 0D) and (GenJnlLine2."Account No." <> '') and (GenJnlLine2."Recurring Method" <> 0) then begin
            Day := Date2DMY(GenJnlLine2."Posting Date", 1);
            Week := Date2DWY(GenJnlLine2."Posting Date", 2);
            Month := Date2DMY(GenJnlLine2."Posting Date", 2);
            MonthText := Format(GenJnlLine2."Posting Date", 0, '<Month Text>');
            AccountingPeriod.SetRange("Starting Date", 0D, GenJnlLine2."Posting Date");
            if not AccountingPeriod.Find('+') then
                AccountingPeriod.Name := '';
            GenJnlLine2."Document No." :=
              DelChr(
                PadStr(
                  StrSubstNo(GenJnlLine2."Document No.", Day, Week, Month, MonthText, AccountingPeriod.Name),
                  MaxStrLen(GenJnlLine2."Document No.")),
                '>');
            GenJnlLine2.Description :=
              DelChr(
                PadStr(
                  StrSubstNo(GenJnlLine2.Description, Day, Week, Month, MonthText, AccountingPeriod.Name),
                  MaxStrLen(GenJnlLine2.Description)),
                '>');
        end;
    end;

    local procedure CheckBalance()
    var
        GenJnlLine: Record "Gen. Journal Line";
        NextGenJnlLine: Record "Gen. Journal Line";
    begin
        GenJnlLine := "Gen. Journal Line";
        LastLineNo := "Gen. Journal Line"."Line No.";
        if "Gen. Journal Line".Next() = 0 then;
        NextGenJnlLine := "Gen. Journal Line";
        MakeRecurringTexts(NextGenJnlLine);
        "Gen. Journal Line" := GenJnlLine;
        if not GenJnlLine.EmptyLine() then begin
            DocBalance := DocBalance + GenJnlLine."Balance (LCY)";
            DateBalance := DateBalance + GenJnlLine."Balance (LCY)";
            TotalBalance := TotalBalance + GenJnlLine."Balance (LCY)";
            if GenJnlLine."Recurring Method" >= GenJnlLine."Recurring Method"::"RF Reversing Fixed" then begin
                DocBalanceReverse := DocBalanceReverse + GenJnlLine."Balance (LCY)";
                DateBalanceReverse := DateBalanceReverse + GenJnlLine."Balance (LCY)";
                TotalBalanceReverse := TotalBalanceReverse + GenJnlLine."Balance (LCY)";
            end;
            LastDocType := GenJnlLine."Document Type";
            LastDocNo := GenJnlLine."Document No.";
            LastDate := GenJnlLine."Posting Date";
            if TotalBalance = 0 then begin
                CurrentCustomerVendors := 0;
                VATEntryCreated := false;
            end;
            if GenJnlTemplate."Force Doc. Balance" then begin
                VATEntryCreated :=
                  VATEntryCreated or
                  ((GenJnlLine."Account Type" = GenJnlLine."Account Type"::"G/L Account") and (GenJnlLine."Account No." <> '') and
                   (GenJnlLine."Gen. Posting Type" in [GenJnlLine."Gen. Posting Type"::Purchase, GenJnlLine."Gen. Posting Type"::Sale])) or
                  ((GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::"G/L Account") and (GenJnlLine."Bal. Account No." <> '') and
                   (GenJnlLine."Bal. Gen. Posting Type" in [GenJnlLine."Bal. Gen. Posting Type"::Purchase, GenJnlLine."Bal. Gen. Posting Type"::Sale]));
                if ((GenJnlLine."Account Type" in [GenJnlLine."Account Type"::Customer, GenJnlLine."Account Type"::Vendor]) and
                    (GenJnlLine."Account No." <> '')) or
                   ((GenJnlLine."Bal. Account Type" in [GenJnlLine."Bal. Account Type"::Customer, GenJnlLine."Bal. Account Type"::Vendor]) and
                    (GenJnlLine."Bal. Account No." <> ''))
                   then
                    CurrentCustomerVendors := CurrentCustomerVendors + 1;
                if (CurrentCustomerVendors > 1) and VATEntryCreated then
                    AddError(
                      StrSubstNo(
                        '%1 %2 posted on %3, must be separated by an empty line',
                        GenJnlLine."Document Type", GenJnlLine."Document No.", GenJnlLine."Posting Date"));
            end;
        end;

        if GenJnlTemplate."Force Doc. Balance" and
   (LastDate <> 0D) and (LastDocNo <> '') and
   ((NextGenJnlLine."Posting Date" <> LastDate) or
    (NextGenJnlLine."Document Type" <> LastDocType) or
    (NextGenJnlLine."Document No." <> LastDocNo) or
    (NextGenJnlLine."Line No." = LastLineNo))
then begin
            case true of
                DocBalance <> 0:
                    AddError(
                      StrSubstNo(
                        '%1 %2 is out of balance by %3.',
                        LastDocType, LastDocNo, DocBalance));
                DocBalanceReverse <> 0:
                    AddError(
                      StrSubstNo(
                        'The reversing entries for %1 %2 are out of balance by %3.',
                        LastDocType, LastDocNo, DocBalanceReverse));
            end;
            DocBalance := 0;
            DocBalanceReverse := 0;
            if (NextGenJnlLine."Posting Date" <> LastDate) or
               (NextGenJnlLine."Document Type" <> LastDocType) or (NextGenJnlLine."Document No." <> LastDocNo)
            then begin
                CurrentCustomerVendors := 0;
                VATEntryCreated := false;
                CustPosting := false;
                VendPosting := false;
                SalesPostingType := false;
                PurchPostingType := false;
            end;
        end;

        if (LastDate <> 0D) and ((NextGenJnlLine."Posting Date" <> LastDate) or (NextGenJnlLine."Line No." = LastLineNo)) then begin
            case true of
                DateBalance <> 0:
                    AddError(
                      StrSubstNo(
                        'As of %1, the lines are out of balance by %2.',
                        LastDate, DateBalance));
                DateBalanceReverse <> 0:
                    AddError(
                      StrSubstNo(
                        'As of %1, the reversing entries are out of balance by %2.',
                        LastDate, DateBalanceReverse));
            end;
            DocBalance := 0;
            DocBalanceReverse := 0;
            DateBalance := 0;
            DateBalanceReverse := 0;
        end;

        if NextGenJnlLine."Line No." = LastLineNo then begin
            case true of
                TotalBalance <> 0:
                    AddError(
                      StrSubstNo(
                        'The total of the lines is out of balance by %1.',
                        TotalBalance));
                TotalBalanceReverse <> 0:
                    AddError(
                      StrSubstNo(
                        'The total of the reversing entries is out of balance by %1.',
                        TotalBalanceReverse));
            end;
            DocBalance := 0;
            DocBalanceReverse := 0;
            DateBalance := 0;
            DateBalanceReverse := 0;
            TotalBalance := 0;
            TotalBalanceReverse := 0;
            LastDate := 0D;
            LastDocType := 0;
            LastDocNo := '';
        end;
    end;

    local procedure AddError(Text: Text[250])
    begin
        ErrorCounter := ErrorCounter + 1;
        ErrorText[ErrorCounter] := Text;
    end;

    local procedure ReconcileGLAccNo(GLAccNo: Code[20]; ReconcileAmount: Decimal)
    begin
        if not GLAccNetChange.Get(GLAccNo) then begin
            GLAcc.Get(GLAccNo);
            GLAcc.CalcFields("Balance at Date");
            GLAccNetChange.Init();
            GLAccNetChange."No." := GLAcc."No.";
            GLAccNetChange.Name := GLAcc.Name;
            GLAccNetChange."Balance after Posting" := GLAcc."Balance at Date";
            GLAccNetChange.Insert();
        end;
        GLAccNetChange."Net Change in Jnl." := GLAccNetChange."Net Change in Jnl." + ReconcileAmount;
        GLAccNetChange."Balance after Posting" := GLAccNetChange."Balance after Posting" + ReconcileAmount;
        GLAccNetChange.Modify();
    end;

    local procedure CheckGLAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        if not GLAcc.Get(GenJnlLine."Account No.") then
            AddError(
              StrSubstNo(
                '%1 %2 does not exist.',
                GLAcc.TableName, GenJnlLine."Account No."))
        else begin
            AccName := GLAcc.Name;

            if GLAcc.Blocked then
                AddError(
                  StrSubstNo(
                    '%1 must be %2 for %3 %4.',
                    GLAcc.FieldName(Blocked), false, GLAcc.TableName, GenJnlLine."Account No."));
            if GLAcc."Account Type" <> GLAcc."Account Type"::Posting then begin
                GLAcc."Account Type" := GLAcc."Account Type"::Posting;
                AddError(
                  StrSubstNo(
                    '%1 must be %2 for %3 %4.',
                    GLAcc.FieldName("Account Type"), GLAcc."Account Type", GLAcc.TableName, GenJnlLine."Account No."));
            end;
            if not GenJnlLine."System-Created Entry" then
                if GenJnlLine."Posting Date" = NormalDate(GenJnlLine."Posting Date") then
                    if not GLAcc."Direct Posting" then
                        AddError(
                          StrSubstNo(
                            '%1 must be %2 for %3 %4.',
                            GLAcc.FieldName("Direct Posting"), true, GLAcc.TableName, GenJnlLine."Account No."));

            /*  CASE GLAcc."Department Posting" OF
              //  GLAcc."Department Posting"::"1";
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
              END;*/// & u

            /*CASE GLAcc."Branch Posting" OF
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
            */
            if GenJnlLine."Gen. Posting Type" > 0 then begin
                case GenJnlLine."Gen. Posting Type" of
                    GenJnlLine."Gen. Posting Type"::Sale:
                        SalesPostingType := true;
                    GenJnlLine."Gen. Posting Type"::Purchase:
                        PurchPostingType := true;
                end;
                TestPostingType();

                if not VATPostingSetup.Get(GenJnlLine."VAT Bus. Posting Group", GenJnlLine."VAT Prod. Posting Group") then
                    AddError(
                      StrSubstNo(
                        '%1 %2 %3 does not exist.',
                        VATPostingSetup.TableName, GenJnlLine."VAT Bus. Posting Group", GenJnlLine."VAT Prod. Posting Group"))
                else
                    if GenJnlLine."VAT Calculation Type" <> VATPostingSetup."VAT Calculation Type" then
                        AddError(
                          StrSubstNo(
                            '%1 must be %2.',
                            GenJnlLine.FieldName("VAT Calculation Type"), VATPostingSetup."VAT Calculation Type"))
            end;

            if GLAcc."Reconciliation Account" then
                ReconcileGLAccNo(GenJnlLine."Account No.", Round(GenJnlLine."Amount (LCY)" / (1 + GenJnlLine."VAT %" / 100)));
        end;
    end;

    local procedure CheckCust(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*WITH GenJnlLine DO BEGIN
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
        END; */ //& u
    end;

    local procedure CheckVend(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        /*WITH GenJnlLine DO BEGIN
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
        END;*/ // & u
    end;

    local procedure CheckBankAcc(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        if not BankAcc.Get(GenJnlLine."Account No.") then
            AddError(
              StrSubstNo(
                '%1 %2 does not exist.',
                BankAcc.TableName, GenJnlLine."Account No."))
        else begin
            AccName := BankAcc.Name;

            if BankAcc.Blocked then
                AddError(
                  StrSubstNo(
                    '%1 must be %2 for %3 %4.',
                    BankAcc.FieldName(Blocked), false, BankAcc.TableName, GenJnlLine."Account No."));
            if (GenJnlLine."Currency Code" <> BankAcc."Currency Code") and (BankAcc."Currency Code" <> '') then
                AddError(
                  StrSubstNo(
                    '%1 must be %2.',
                    GenJnlLine.FieldName("Currency Code"), BankAcc."Currency Code"));

            if GenJnlLine."Currency Code" <> '' then
                if not Currency.Get(GenJnlLine."Currency Code") then
                    AddError(
                      StrSubstNo(
                        'The currency %1 cannot be found. Please check the currency table.',
                        GenJnlLine."Currency Code"));

            if GenJnlLine."Bank Payment Type" <> 0 then
                if (GenJnlLine."Bank Payment Type" = GenJnlLine."Bank Payment Type"::"Computer Check") and (GenJnlLine.Amount < 0) then
                    if BankAcc."Currency Code" <> GenJnlLine."Currency Code" then
                        AddError(
                          StrSubstNo(
                            '%1 must not be filled when %2 is different in %3 and %4.',
                            GenJnlLine.FieldName("Bank Payment Type"), GenJnlLine.FieldName("Currency Code"),
                            GenJnlLine.TableName, BankAcc.TableName));

            if BankAccPostingGroup.Get(BankAcc."Bank Acc. Posting Group") then
                if BankAccPostingGroup."G/L Bank Account No." <> '' then
                    ReconcileGLAccNo(
                      BankAccPostingGroup."G/L Bank Account No.",
                      Round(GenJnlLine."Amount (LCY)" / (1 + GenJnlLine."VAT %" / 100)));
        end;
    end;

    local procedure CheckFixedAsset(var GenJnlLine: Record "Gen. Journal Line"; var AccName: Text[30])
    begin
        if not FA.Get(GenJnlLine."Account No.") then
            AddError(
              StrSubstNo(
                '%1 %2 does not exist.',
                FA.TableName, GenJnlLine."Account No."))
        else begin
            AccName := FA.Description;
            if FA.Blocked then
                AddError(
                  StrSubstNo(
                    '%1 must be %2 for %3 %4.',
                    FA.FieldName(Blocked), false, FA.TableName, GenJnlLine."Account No."));
            if FA.Inactive then
                AddError(
                  StrSubstNo(
                    '%1 must be %2 for %3 %4.',
                    FA.FieldName(Inactive), false, FA.TableName, GenJnlLine."Account No."));
            if FA."Budgeted Asset" then
                AddError(
                  StrSubstNo(
                    '%1 %2 must not have %3 = %4.',
                    FA.TableName, GenJnlLine."Account No.", FA.FieldName("Budgeted Asset"), true));
            if DeprBook.Get(GenJnlLine."Depreciation Book Code") then
                CheckFAIntegration(GenJnlLine)
            else
                AddError(
                  StrSubstNo(
                    '%1 %2 does not exist.',
                    DeprBook.TableName, GenJnlLine."Depreciation Book Code"));
            if not FADeprBook.Get(FA."No.", GenJnlLine."Depreciation Book Code") then
                AddError(
                  StrSubstNo(
                    '%1 %2 %3 does not exist.',
                    FADeprBook.TableName, FA."No.", GenJnlLine."Depreciation Book Code"));
        end;
    end;

    local procedure TestFixedAsset(var GenJnlLine: Record "Gen. Journal Line")
    begin
        // Fixed Asset
        if GenJnlLine."Job No." <> '' then
            AddError(
              StrSubstNo(
                '%1 must not be specified in fixed asset journal lines.', GenJnlLine.FieldName("Job No.")));
        if GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::" " then
            AddError(
              StrSubstNo(
                '%1 must be specified in fixed asset journal lines.', GenJnlLine.FieldName("FA Posting Type")));
        if GenJnlLine."Depreciation Book Code" = '' then
            AddError(
              StrSubstNo(
                '%1 must be specified in fixed asset journal lines.', GenJnlLine.FieldName("Depreciation Book Code")));
        if GenJnlLine."Depreciation Book Code" = GenJnlLine."Duplicate in Depreciation Book" then
            AddError(
              StrSubstNo(
                '%1 must be different than %2.',
                GenJnlLine.FieldName("Depreciation Book Code"), GenJnlLine.FieldName("Duplicate in Depreciation Book")));
        if GenJnlLine."Account Type" = GenJnlLine."Bal. Account Type" then
            AddError(
              StrSubstNo(
                '%1 and %2 must not both be %3.',
                GenJnlLine.FieldName("Account Type"), GenJnlLine.FieldName("Bal. Account Type"), GenJnlLine."Account Type"));
        if GenJnlLine."Account Type" = GenJnlLine."Account Type"::"Fixed Asset" then
            if GenJnlLine."FA Posting Type" in
              [GenJnlLine."FA Posting Type"::"Acquisition Cost", GenJnlLine."FA Posting Type"::Disposal, GenJnlLine."FA Posting Type"::Maintenance]
            then begin
                if (GenJnlLine."Gen. Bus. Posting Group" <> '') or (GenJnlLine."Gen. Prod. Posting Group" <> '') then
                    if GenJnlLine."Gen. Posting Type" = GenJnlLine."Gen. Posting Type"::" " then
                        AddError(StrSubstNo('%1 must be specified.', GenJnlLine.FieldName("Gen. Posting Type")));
            end else begin
                if GenJnlLine."Gen. Posting Type" <> GenJnlLine."Gen. Posting Type"::" " then
                    AddError(
                      StrSubstNo(
                        '%1  must not be specified when %2 = %3.',
                        GenJnlLine.FieldName("Gen. Posting Type"), GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type"));
                if GenJnlLine."Gen. Bus. Posting Group" <> '' then
                    AddError(
                      StrSubstNo(
                        '%1 must not be specified when %2 = %3.',
                        GenJnlLine.FieldName("Gen. Bus. Posting Group"), GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type"));
                if GenJnlLine."Gen. Prod. Posting Group" <> '' then
                    AddError(
                      StrSubstNo(
                        '%1 must not be specified when %2 = %3.',
                        GenJnlLine.FieldName("Gen. Prod. Posting Group"), GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type"));
            end;
        if GenJnlLine."Bal. Account Type" = GenJnlLine."Bal. Account Type"::"Fixed Asset" then
            if GenJnlLine."FA Posting Type" in
              [GenJnlLine."FA Posting Type"::"Acquisition Cost", GenJnlLine."FA Posting Type"::Disposal, GenJnlLine."FA Posting Type"::Maintenance]
            then begin
                if (GenJnlLine."Bal. Gen. Bus. Posting Group" <> '') or (GenJnlLine."Bal. Gen. Prod. Posting Group" <> '') then
                    if GenJnlLine."Bal. Gen. Posting Type" = GenJnlLine."Bal. Gen. Posting Type"::" " then
                        AddError(StrSubstNo('%1 must be specified.', GenJnlLine.FieldName("Bal. Gen. Posting Type")));
            end else begin
                if GenJnlLine."Bal. Gen. Posting Type" <> GenJnlLine."Bal. Gen. Posting Type"::" " then
                    AddError(
                      StrSubstNo(
                      '%1 must not be specified when %2 = %3.',
                      GenJnlLine.FieldName("Bal. Gen. Posting Type"), GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type"));
                if GenJnlLine."Bal. Gen. Bus. Posting Group" <> '' then
                    AddError(
                      StrSubstNo(
                        '%1 must not be specified when %2 = %3.',
                        GenJnlLine.FieldName("Bal. Gen. Bus. Posting Group"), GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type"));
                if GenJnlLine."Bal. Gen. Prod. Posting Group" <> '' then
                    AddError(
                      StrSubstNo(
                        '%1 must not be specified when %2 = %3.',
                        GenJnlLine.FieldName("Bal. Gen. Prod. Posting Group"), GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type"));
            end;
        TempErrorText :=
          '%1 ' +
          StrSubstNo(
            'must not be specified together with %1 = %2.',
            GenJnlLine.FieldName("FA Posting Type"), GenJnlLine."FA Posting Type");
        if GenJnlLine."FA Posting Type" <> GenJnlLine."FA Posting Type"::"Acquisition Cost" then begin
            if GenJnlLine."Depr. Acquisition Cost" then
                AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Depr. Acquisition Cost")));
            if GenJnlLine."Salvage Value" <> 0 then
                AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Salvage Value")));
            if GenJnlLine."FA Posting Type" <> GenJnlLine."FA Posting Type"::Maintenance then
                if GenJnlLine.Quantity <> 0 then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName(Quantity)));
            if GenJnlLine."Insurance No." <> '' then
                AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Insurance No.")));
        end;
        if (GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::Maintenance) and GenJnlLine."Depr. until FA Posting Date" then
            AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Depr. until FA Posting Date")));
        if (GenJnlLine."FA Posting Type" <> GenJnlLine."FA Posting Type"::Maintenance) and (GenJnlLine."Maintenance Code" <> '') then
            AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Maintenance Code")));

        if (GenJnlLine."FA Posting Type" <> GenJnlLine."FA Posting Type"::Depreciation) and
           (GenJnlLine."FA Posting Type" <> GenJnlLine."FA Posting Type"::"Custom 1") and
           (GenJnlLine."No. of Depreciation Days" <> 0)
        then
            AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("No. of Depreciation Days")));

        if (GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::Disposal) and GenJnlLine."FA Reclassification Entry" then
            AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("FA Reclassification Entry")));

        if (GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::Disposal) and (GenJnlLine."Budgeted FA No." <> '') then
            AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Budgeted FA No.")));

        if GenJnlLine."FA Posting Date" = 0D then
            GenJnlLine."FA Posting Date" := GenJnlLine."Posting Date";
        if DeprBook.Get(GenJnlLine."Depreciation Book Code") then
            if DeprBook."Use Same FA+G/L Posting Dates" and (GenJnlLine."Posting Date" <> GenJnlLine."FA Posting Date") then
                AddError(
                  StrSubstNo(
                    '%1 must be identical to %2.',
                    GenJnlLine.FieldName("Posting Date"), GenJnlLine.FieldName("FA Posting Date")));
        if GenJnlLine."FA Posting Date" <> 0D then begin
            if GenJnlLine."FA Posting Date" <> NormalDate(GenJnlLine."FA Posting Date") then
                AddError(
                  StrSubstNo(
                    '%1 cannot be a closing date.',
                    GenJnlLine.FieldName("FA Posting Date")));
            //    IF NOT ("FA Posting Date" IN [01010001D..31129998D]) THEN
            AddError(
              StrSubstNo(
                '%1 is not within your range of allowed posting dates.',
                GenJnlLine.FieldName("FA Posting Date")));
            if (AllowFAPostingFrom = 0D) and (AllowFAPostingTo = 0D) then begin
                if UserId <> '' then
                    if UserSetup.Get(UserId) then begin
                        AllowFAPostingFrom := UserSetup."Allow FA Posting From";
                        AllowFAPostingTo := UserSetup."Allow FA Posting To";
                    end;
                if (AllowFAPostingFrom = 0D) and (AllowFAPostingTo = 0D) then begin
                    FASetup.Get();
                    AllowFAPostingFrom := FASetup."Allow FA Posting From";
                    AllowFAPostingTo := FASetup."Allow FA Posting To";
                end;
                if AllowFAPostingTo = 0D then
                    //     AllowFAPostingTo := 31129998D; // & u

                    if (GenJnlLine."FA Posting Date" < AllowFAPostingFrom) or
               (GenJnlLine."FA Posting Date" > AllowFAPostingTo)
            then
                        AddError(
                          StrSubstNo(
                            '%1 is not within your range of allowed posting dates.',
                            GenJnlLine.FieldName("FA Posting Date")));
            end;
            FASetup.Get();
            if (GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::"Acquisition Cost") and
               (GenJnlLine."Insurance No." <> '') and (GenJnlLine."Depreciation Book Code" <> FASetup."Insurance Depr. Book")
            then
                AddError(
                  StrSubstNo(
                    'Insurance integration is not activated for %1 %2.',
                    GenJnlLine.FieldName("Depreciation Book Code"), GenJnlLine."Depreciation Book Code"));

            if GenJnlLine."FA Error Entry No." > 0 then begin
                TempErrorText :=
                  '%1 ' +
                  StrSubstNo(
                  'must not be specified when %1 is specified.',
                   GenJnlLine.FieldName("FA Error Entry No."));
                if GenJnlLine."Depr. until FA Posting Date" then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Depr. until FA Posting Date")));
                if GenJnlLine."Depr. Acquisition Cost" then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Depr. Acquisition Cost")));
                if GenJnlLine."Duplicate in Depreciation Book" <> '' then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Duplicate in Depreciation Book")));
                if GenJnlLine."Use Duplication List" then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Use Duplication List")));
                if GenJnlLine."Salvage Value" <> 0 then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Salvage Value")));
                if GenJnlLine."Insurance No." <> '' then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Insurance No.")));
                if GenJnlLine."Budgeted FA No." <> '' then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Budgeted FA No.")));
                if GenJnlLine."Recurring Method" > 0 then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine.FieldName("Recurring Method")));
                if (GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::Maintenance) then
                    AddError(StrSubstNo(TempErrorText, GenJnlLine."FA Posting Type"));
            end;
        end;
    end;

    local procedure CheckFAIntegration(var GenJnlLine: Record "Gen. Journal Line")
    var
        GLIntegration: Boolean;
    begin
        if GenJnlLine."FA Posting Type" = GenJnlLine."FA Posting Type"::" " then
            exit;
        case GenJnlLine."FA Posting Type" of
            GenJnlLine."FA Posting Type"::"Acquisition Cost":
                GLIntegration := DeprBook."G/L Integration - Acq. Cost";
            GenJnlLine."FA Posting Type"::Depreciation:
                GLIntegration := DeprBook."G/L Integration - Depreciation";
            GenJnlLine."FA Posting Type"::"Write-Down":
                GLIntegration := DeprBook."G/L Integration - Write-Down";
            GenJnlLine."FA Posting Type"::Appreciation:
                GLIntegration := DeprBook."G/L Integration - Appreciation";
            GenJnlLine."FA Posting Type"::"Custom 1":
                GLIntegration := DeprBook."G/L Integration - Custom 1";
            GenJnlLine."FA Posting Type"::"Custom 2":
                GLIntegration := DeprBook."G/L Integration - Custom 2";
            GenJnlLine."FA Posting Type"::Disposal:
                GLIntegration := DeprBook."G/L Integration - Disposal";
            GenJnlLine."FA Posting Type"::Maintenance:
                GLIntegration := DeprBook."G/L Integration - Maintenance";
        end;
        if not GLIntegration then
            AddError(
              StrSubstNo(
                'When G/L integration is not activated, %1 must not be posted in the general journal.',
                GenJnlLine."FA Posting Type"));

        if not DeprBook."G/L Integration - Depreciation" then begin
            if GenJnlLine."Depr. until FA Posting Date" then
                AddError(
                  StrSubstNo(
                    'When G/L integration is not activated, %1 must not be specified in the general journal.',
                    GenJnlLine.FieldName("Depr. until FA Posting Date")));
            if GenJnlLine."Depr. Acquisition Cost" then
                AddError(
                  StrSubstNo(
                    'When G/L integration is not activated, %1 must not be specified in the general journal.',
                    GenJnlLine.FieldName("Depr. Acquisition Cost")));
        end;
    end;

    local procedure TestFixedAssetFields(var GenJnlLine: Record "Gen. Journal Line")
    begin
        if GenJnlLine."FA Posting Type" <> GenJnlLine."FA Posting Type"::" " then
            AddError(StrSubstNo('%1 must not be specified.', GenJnlLine.FieldName("FA Posting Type")));
        if GenJnlLine."Depreciation Book Code" <> '' then
            AddError(StrSubstNo('%1 must not be specified.', GenJnlLine.FieldName("Depreciation Book Code")));
    end;

    [Scope('OnPrem')]
    procedure TestPostingType()
    begin
        case true of
            CustPosting and PurchPostingType:
                AddError('Customer and Gen. Posting Type Purchase are not allowed.');
            VendPosting and SalesPostingType:
                AddError('Vendor and Gen. Posting Type Sales are not allowed.');
        end;
    end;
}
