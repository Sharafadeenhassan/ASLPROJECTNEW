/// <summary>
/// Table Store Requisition Header New (ID 50031).
/// </summary>
table 50031 "Store Requisition Header New"
{
    Caption = 'Store Requisition Header New';
    fields
    {
        field(1; "Req. No"; Code[10])
        {
            Description = 'Requisition No.';

            trigger OnValidate()
            begin
                if "Req. No" <> xRec."Req. No" then begin
                    InveSetup.Get();
                    NoSeriesMgt.TestManual(InveSetup."Store Requisition No.");
                    "No. Series" := '';
                end;
                "Req Date" := Today;
            end;
        }
        field(2; "Req. Type"; Option)
        {
            Description = 'Requisition Type';
            InitValue = Issue;
            OptionCaption = ' ,Transfer,Invoice,Complementary,Issue,Add In,Purchase';
            OptionMembers = " ",Transfer,Invoice,Complementary,Issue,"Add In",Purchase;
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Req Date"; Date)
        {
        }
        field(5; "Send for Approval"; Boolean)
        {
            trigger OnValidate()
            begin
                StoreLine.SetFilter(StoreLine."Req. No.", '%1', "Req. No");
                if StoreLine.FindFirst() then
                    repeat
                        StoreLine.TestField(StoreLine."Item No.");
                        if StoreLine."Claim by Employee" = '' then
                            StoreLine.TestField(StoreLine."Requested Quantity");
                        //StoreLine.TESTFIELD(StoreLine."Issued Quantity",0);
                        StoreLine.TestField(StoreLine."Store Location");
                    until StoreLine.Next() = 0
                else
                    Error('Émpty Requisition can not be sent for Approval');
                UserRec.SetCurrentKey("User Name");
                UserRec.SetRange("User Name", UserId);
                if UserRec.FindSet() then begin
                    Sender := UserRec."Full Name";
                    "Sent Time" := CurrentDateTime;

                    TestField("1st Approval to");
                    TestField("1st Approved", 0);
                    if "Send for Approval" then
                        UserSetup.Get("1st Approval to");
                    /* ToName  := UserSetup."E-Mail";
                     Subject := STRSUBSTNO(text50001,"Req. No");
                     //schoolsetup.GET;

                     "Mail Body":=FORMAT('Kindly Approve this'+'    '+'Store Requisition No.  '+"Req. No"+'- in the'+'    '+TABLENAME);

                     UsersetupRec.GET(USERID);
                     SentFrom:= UsersetupRec."E-Mail";
                     smtprec.GET;
                      NEWMAIL.CreateMessage(USERID,SentFrom,ToName,Subject,"Mail Body",FALSE); //approvalmessage.NewMessage(ToName,CCName,'',Subject,"Mail Body",attachement,FALSE);
                      NEWMAIL.Send;
                      MESSAGE('A mail has been sent to %1 - mail address %2, requesting approval for this Store Requisition',"1st Approval to",ToName);
                          //TRUE;*/
                end;
            end;
        }
        field(6; Sender; Text[50])
        {
            Editable = false;
        }
        field(7; "Sent Time"; DateTime)
        {
            Editable = false;
        }
        field(8; "Processed By"; Code[20])
        {
        }
        field(9; "Processed Date"; Date)
        {
            trigger OnValidate()
            begin
                TestField("Req Date");
                if "Req Date" > "Processed Date" then Error('Processed date ' + '%1' + 'Çannot be before ' + '%2', "Processed Date", "Req Date");
            end;
        }
        field(10; "Transfer To."; Code[20])
        {
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));

            trigger OnValidate()
            begin
                TestField(Processed, false);
                LocationRec.Get("Transfer To.");
                "Voyage No." := LocationRec."Current Voyage";
            end;
        }
        field(11; "Transfer From"; Code[20])
        {
            InitValue = 'GNRL ASL';
            TableRelation = Location.Code WHERE("Use As In-Transit" = CONST(false));

            trigger OnValidate()
            begin
                TestField("1st Approved", 0);
            end;
        }
        field(12; "Document No."; Code[20])
        {
        }
        field(13; "1st Approval to"; Code[50])
        {
            Caption = '1st Approval to';
            TableRelation = "User Setup"."User ID" WHERE("Store Req 1st Approval" = CONST(true));

            trigger OnValidate()
            begin
                UserRec.SetCurrentKey("User Name");
                UserRec.SetRange("User Name", "1st Approval to");
                if UserRec.FindSet() then
                    "1st Approval Name" := UserRec."Full Name";
            end;
        }
        field(14; "Final Approval to"; Code[50])
        {
            Caption = 'Final Approval to';
            TableRelation = if ("Fish Store Requisition" = Const(true)) "User Setup"."User ID" WHERE("Fish Stk Req F.Approval" = Const(True))
            else
            if ("Fish Store Requisition" = const(false)) "User Setup"."User ID" WHERE("Store Req Final Approval" = CONST(true));

            trigger OnValidate()
            begin

                UserRec.SetRange("User Name", "Final Approval to");
                if UserRec.FindSet() then
                    "Final Approval Name" := UserRec."Full Name";
            end;
        }
        field(18; "Mail Body"; Text[250])
        {
        }
        field(19; "To Be Collected By"; Text[50])
        {
        }
        field(20; "1st Approved"; Option)
        {
            Caption = '1st Approved';
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TestField("Send for Approval", true);
                TestField("1st Approval to", UserId);
                "1st Approved Time" := CurrentDateTime;
                case "1st Approved" of
                    "1st Approved"::Approved:
                        begin
                            TestField("Final Approval to");
                            "1st Approved Time" := CurrentDateTime;
                            Rejected := false;
                            UserSetup.Get("Final Approval to");
                        end;

                    "1st Approved"::Rejected:
                        begin
                            "1st Approved Time" := CurrentDateTime;
                            Rejected := true;
                        end;
                    "1st Approved"::"on Hold":
                        "1st Approved Time" := CurrentDateTime;
                end;
                StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
                if StoreLine.FindSet() then begin
                    if "1st Approved" = "1st Approved"::Rejected then
                        StoreLine.ModifyAll(StoreLine.Rejected, true) else
                        StoreLine.ModifyAll(StoreLine.Rejected, false);
                    StoreLine.ModifyAll(StoreLine."1st Approval", "1st Approved");
                    StoreLine.ModifyAll(StoreLine."1st Approval Date", Today);
                end
                else
                    Error('You can not Approved Empty Requisition');
            end;
        }
        field(21; "1st Approval Name"; Text[50])
        {
            Editable = false;
        }
        field(22; "1st Approved Time"; DateTime)
        {
            Editable = false;
        }
        field(23; "No. Series"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(24; "Last Date Modified"; DateTime)
        {
        }
        field(25; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(1,"Global Dimension 1 Code");
            end;
        }
        field(26; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                //ValidateShortcutDimCode(2,"Global Dimension 2 Code");
            end;
        }
        field(27; "Final Approved"; Option)
        {
            Caption = 'Final Approved';
            OptionCaption = ' ,on Hold,Approved,Rejected';
            OptionMembers = " ","on Hold",Approved,Rejected;

            trigger OnValidate()
            begin
                TestField("Send for Approval", true);
                TestField("1st Approved", 2);
                TestField("Final Approval to", UserId);
                "Final Approved Time" := CurrentDateTime;
                //TO ENABLE USAGE AFTER APPROVAL
                //Blocked:=FALSE;
                case "Final Approved" of
                    "Final Approved"::Approved:
                        begin
                            "Final Approved Time" := CurrentDateTime;
                            Rejected := false;
                        end;
                    "Final Approved"::Rejected:
                        begin
                            "Final Approved Time" := CurrentDateTime;
                            Rejected := true;
                        end;
                    "Final Approved"::"on Hold":
                        "Final Approved Time" := CurrentDateTime;
                end;
                StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
                if StoreLine.FindSet() then begin
                    if "Final Approved" = "Final Approved"::Rejected then
                        StoreLine.ModifyAll(StoreLine.Rejected, true) else
                        StoreLine.ModifyAll(StoreLine.Rejected, false);
                    // StoreLine.VALIDATE(StoreLine."Approved Quantity");
                    StoreLine.ModifyAll(StoreLine."Final Approval Date", Today);
                    StoreLine.ModifyAll(StoreLine."Final Approval", "Final Approved");
                end
                else
                    Error('You can not Approved Empty Requisition');
            end;
        }
        field(28; "Final Approval Name"; Text[50])
        {
            Editable = false;
        }
        field(29; "Final Approved Time"; DateTime)
        {
            Editable = false;
        }
        field(30; "Customer No."; Code[20])
        {
            TableRelation = Customer."No.";

            trigger OnValidate()
            begin
                if Custrec.Get("Customer No.") then
                    "Customer Name" := Custrec.Name;
            end;
        }
        field(31; "Customer Name"; Text[50])
        {
        }
        field(32; "Claim by Employee"; Code[20])
        {
            TableRelation = Employee."No.";
            ValidateTableRelation = true;
        }
        field(33; "Claim by Resources"; Code[20])
        {
            TableRelation = Resource."No.";
        }
        field(34; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if Vendrec.Get("Vendor No.") then
                    "Vendor Name" := Vendrec.Name;
            end;
        }
        field(35; "Vendor Name"; Text[50])
        {
        }
        field(36; "Requisition Template"; Code[20])
        {
            TableRelation = "Transfer Header"."No." WHERE("Transfer Template" = CONST(true));
        }
        field(37; "Issued By"; Text[50])
        {
        }
        field(38; "Journal Batch"; Code[20])
        {
            TableRelation = IF ("Job Related" = CONST(false)) "Item Journal Batch".Name WHERE("Journal Template Name" = CONST('ITEM'))
            ELSE
            IF ("Job Related" = CONST(true)) "Job Journal Batch".Name;
        }
        field(39; "Reason Code"; Code[20])
        {
            TableRelation = "Reason Code".Code;
        }
        field(40; "Gen Bus. posting Grp."; Code[20])
        {
            TableRelation = "Gen. Business Posting Group".Code;
        }
        field(41; Processed; Boolean)
        {
            trigger OnValidate()
            begin
                //TESTFIELD("Processed By",'');
                UserRec.SetRange("User Name", UserId);
                if UserRec.FindSet() then
                    "Processed By" := UserRec."Full Name";
                case "Req. Type" of
                    1:
                        TransferOrder();
                    2:
                        CreatesalesInv();
                    3, 4, 5:
                        begin
                            TestField("Issued Captured");
                            TestField("Journal Batch");
                            TestField("Gen Bus. posting Grp.");
                            if "Job Related" then begin
                                TestField("Job No.");
                                CreateJobJnl();
                            end else
                                CreateAdjSmt();
                        end;
                    6:
                        CreatePurchInv();
                end;
            end;
        }
        field(42; "Issued Captured"; Boolean)
        {
            trigger OnValidate()
            begin
                TestField("Final Approved", 2);
                TestField(Processed, false);
                if "Issued Captured" then begin
                    UserRec.SetRange("User Name", UserId);
                    if UserRec.FindSet() then
                        "Captured By" := UserRec."Full Name";
                    "Captured Time" := CurrentDateTime;

                    StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
                    if StoreLine.FindSet() then begin
                        StoreLine.ModifyAll(StoreLine."Issued Captured", "Issued Captured");
                        StoreLine.ModifyAll(StoreLine."Issues Captured Date", Today);
                    end
                    else
                        Error('You can not Capture Empty Requisition');
                end else begin
                    "Captured By" := '';
                    "Captured Time" := 0DT;

                    StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
                    if StoreLine.FindSet() then begin
                        StoreLine.ModifyAll(StoreLine."Issued Captured", "Issued Captured");
                        StoreLine.ModifyAll(StoreLine."Issues Captured Date", 0D);
                    end
                    else
                        Error('You can not Capture Empty Requisition');
                end;
            end;
        }
        field(43; Printed; Boolean)
        {
        }
        field(44; "No of Copies"; Decimal)
        {
        }
        field(45; "Captured By"; Text[50])
        {
        }
        field(46; "Captured Time"; DateTime)
        {
        }
        field(47; "Voyage No."; Code[20])
        {
        }
        field(48; "External Document No"; Code[20])
        {
            TableRelation = IF ("Reason Code" = CONST('USAGEFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('USAGERES')) Location
            ELSE
            IF ("Reason Code" = CONST('USAGEVES')) Location
            ELSE
            IF ("Reason Code" = CONST('USAGEOTR')) "Dimension Value".Code WHERE("Global Dimension No." = CONST(1))
            ELSE
            IF ("Reason Code" = CONST('USAGEACHD')) "Standard Text" WHERE(Others = CONST(true),
                                                                                              Type = CONST(net))
            ELSE
            IF ("Reason Code" = CONST('CONVTFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('CRMISSUE')) "Standard Text" WHERE(Others = CONST(true),
                                                                                                                                                               Type = CONST(crmissue))
            ELSE
            IF ("Reason Code" = CONST('LNADJ')) "Standard Text" WHERE(Others = CONST(true),
                                                                                                                                                                                                                             Type = CONST(ItemLoan));
        }
        field(49; Rejected; Boolean)
        {
        }
        field(50; "Job Related"; Boolean)
        {
        }
        field(51; "Job No."; Code[20])
        {
            TableRelation = IF (DryDock = CONST(false)) Job."No." WHERE(Status = FILTER(<> completed),
                                                                       "No." = FILTER('*J*'))
            ELSE
            IF (DryDock = CONST(true)) Job."No." WHERE(Status = FILTER(<> Completed),
                                                                                                                      "No." = FILTER('*C*'));
        }
        field(52; DryDock; Boolean)
        {
        }
        field(53; "No Of Lines"; Integer)
        {
            CalcFormula = Count("Store Requisition Line New" WHERE("Req. No." = FIELD("Req. No")));
            Editable = false;
            FieldClass = FlowField;
            TableRelation = "Store Requisition Line New";
        }
        field(54; "Purchase Requsition Updated"; Boolean)
        {
        }
        field(55; "Fish Store Requisition"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Req. No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Description)
        {
        }
    }

    trigger OnDelete()
    begin
        TestField("1st Approved", 0);
        TestField("Final Approved", 0);
        StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
        if StoreLine.FindSet() then
            StoreLine.DeleteAll();
    end;

    trigger OnInsert()
    begin
        if "Req. No" = '' then begin
            InveSetup.Get();
            InveSetup.TestField("Store Requisition No.");
            NoSeriesMgt.InitSeries(InveSetup."Store Requisition No.", xRec."No. Series", 0D, "Req. No", "No. Series");
        end;
        "Req Date" := Today;
    end;

    trigger OnModify()
    begin
        TestField("Document No.", '');
    end;

    trigger OnRename()
    begin
        StoreLine.SetRange(StoreLine."Req. No.", xRec."Req. No");
        if StoreLine.FindSet() then
            repeat
                StoreLine.Rename("Req. No", StoreLine."Line No.");
                StoreLine.Modify();
            until StoreLine.Next() = 0;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserRec: Record User;
        UserSetup: Record "User Setup";
        InveSetup: Record "Inventory Setup";
        Custrec: Record Customer;
        StoreLine: Record "Store Requisition Line New";
        Vendrec: Record Vendor;
        Text50003: Label 'Transfer Order %1 Created. Kindly Check the Transfer Order and post  to Update your Inventory';
        Text50004: Label 'Sales Invoice %1 has been Created. Kindly Check and post the Invoice to Update your stock';
        Text50005: Label 'Adjustment Journal has been Created in Item  Journal %1. Kindly Check and post to update your Inventory.';
        Text50006: Label 'Purchase Order %1 has been Created. Kindly Check and Post when necessary to update your Inventory.';
        LocationRec: Record Location;
        PostItem: Codeunit "Item Jnl.-Post Line";
        ItemBatch: Record "Item Journal Batch";
        posttrans: Codeunit "TransferOrder-Post (Yes/No)";
        selection: Integer;
        Text50007: Label '&Add to Purchase Requisition Register,&Create Purchase Order';

    // [Scope('OnPrem')]
    procedure AssistEdit(OldRequisition: Record "Store Requisition Header New"): Boolean
    var
        ReqRec: Record "Store Requisition Header New";
    begin
        ReqRec := Rec;
        InveSetup.Get();
        InveSetup.TestField("Store Requisition No.");
        if NoSeriesMgt.SelectSeries(InveSetup."Store Requisition No.", OldRequisition."No. Series", ReqRec."No. Series") then begin
            NoSeriesMgt.SetSeries(ReqRec."Req. No");
            Rec := ReqRec;
            exit(true);
        end;
    end;

    // [Scope('OnPrem')]
    procedure CreatesalesInv()
    var
        LineNo: Integer;
        noseriesmgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        SalesSetup: Record "Sales & Receivables Setup";
        SalesInv: Record "Sales Header";
        SalesInvline: Record "Sales Line";
        ReqLines: Record "Store Requisition Line New";
    begin
        TestField("Req. Type", 2);
        TestField("Final Approved", 2);
        TestField("Document No.", '');
        "Processed Date" := Today;
        ReqLines.SetRange(ReqLines."Req. No.", "Req. No");
        ReqLines.SetFilter(ReqLines."Issued Quantity", '<>%1', 0);
        if not ReqLines.FindSet() then
            Error('Nothing To Invoice because All Lines has Zero quantity Issued');

        SalesSetup.Get();
        DocNo := noseriesmgt.GetNextNo(SalesSetup."Invoice Nos.", Today, true);
        SalesInv.Init();
        SalesInv."Document Type" := SalesInv."Document Type"::Invoice;
        SalesInv."No." := DocNo;
        SalesInv.Insert();
        SalesInv.Validate("Sell-to Customer No.", Rec."Customer No.");
        SalesInv.Validate("Posting Date", "Processed Date");
        SalesInv."Posting Description" := Description;
        SalesInv."External Document No." := "Req. No";

        SalesInv.Modify();
        //ReqLines.SETRANGE(ReqLines."Req. No.","Req. No");
        //ReqLines.SETFILTER(ReqLines."Issued Quantity",'<>%1', 0);
        LineNo := 0;
        if ReqLines.FindSet() then
            repeat
                LineNo += 10000;
                SalesInvline."Document Type" := SalesInvline."Document Type"::Invoice;
                SalesInvline."Document No." := DocNo;
                SalesInvline."Line No." := LineNo;
                SalesInvline.Insert();
                SalesInvline.Validate(SalesInvline.Type, SalesInvline.Type::Item);
                SalesInvline.Validate("No.", ReqLines."Item No.");
                SalesInvline.Validate("Shipment Date", "Processed Date");
                SalesInvline.Validate(Quantity, ReqLines."Issued Quantity");
                SalesInvline.Modify();
                ReqLines.Processed := true;
                ReqLines.Modify();
            until ReqLines.Next() = 0;
        "Document No." := DocNo;
        Processed := true;
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindSet() then
            "Processed By" := UserRec."Full Name";
        Modify();
        Message(Text50004, DocNo);
    end;

    // [Scope('OnPrem')]
    ///This procedure create Journal for the Issue Item and post
    /// CreateAdjSmt.
    /// /summary>
    procedure CreateAdjSmt()
    var
        ItemJnl: Record "Item Journal Line";
        LineNo: Integer;
        ReqLines: Record "Store Requisition Line New";
    begin
        if "Req. Type" < 3 then Error('Invalid Requisition Type');
        TestField("Final Approved", 2);
        TestField("Journal Batch");
        TestField("Gen Bus. posting Grp.");
        TestField("External Document No");
        TestField("Document No.", '');
        TestField("Issued Captured");
        //"Processed Date" := TODAY;
        ReqLines.SetRange(ReqLines."Req. No.", "Req. No");
        ReqLines.SetFilter(ReqLines."Issued Quantity", '<>%1', 0);
        if not ReqLines.FindSet() then
            Error('Nothing To Issue. All Lines has Zero quantity Issued');

        ItemJnl.SetRange(ItemJnl."Journal Template Name", 'ITEM');
        ItemJnl.SetRange(ItemJnl."Journal Batch Name", "Journal Batch");
        if ItemJnl.FindLast() then
            LineNo := ItemJnl."Line No." else
            LineNo := 0;
        if ReqLines.FindFirst() then
            repeat
                LineNo += 10000;
                ItemJnl.Init();
                ItemJnl."Journal Template Name" := 'Item';
                ItemJnl."Journal Batch Name" := "Journal Batch";
                ItemJnl."Reason Code" := "Reason Code";
                ItemJnl."External Document No." := "External Document No";
                ItemJnl."Line No." := LineNo;
                ItemJnl."Document No." := ReqLines."Req. No.";
                ItemJnl.Validate(ItemJnl."Posting Date", "Processed Date");
                if "Req. Type" in ["Req. Type"::Issue, "Req. Type"::Complementary] then
                    ItemJnl."Entry Type" := ItemJnl."Entry Type"::"Negative Adjmt." else
                    if "Req. Type" = "Req. Type"::"Add In" then
                        ItemJnl."Entry Type" := ItemJnl."Entry Type"::"Positive Adjmt.";
                ItemJnl.Validate(ItemJnl."Item No.", ReqLines."Item No.");
                ItemJnl."Gen. Bus. Posting Group" := "Gen Bus. posting Grp.";
                ItemJnl."Item Category Code" := ReqLines."Item Category";
                ItemJnl.Description := ReqLines."Item Description";
                ItemJnl."Location Code" := ReqLines."Store Location";
                ItemJnl.Validate(ItemJnl.Quantity, ReqLines."Issued Quantity");
                ItemJnl."Lock Qty" := true;
                InveSetup.Get();
                if InveSetup."Auto Post Issue Req" then
                    PostItem.Run(ItemJnl)
                else
                    ItemJnl.Insert();
                ReqLines.Processed := true;
                ReqLines.Modify();
            until ReqLines.Next() = 0;
        if ItemBatch.Get(ItemJnl."Journal Template Name", ItemJnl."Journal Batch Name") then begin
            ItemBatch."Lock batch" := true;
            ItemBatch.Modify();
        end;
        "Document No." := ItemJnl."Document No.";
        Processed := true;
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindSet() then
            "Processed By" := UserRec."Full Name";
        Modify();
        Message(Text50005, "Journal Batch");
    end;
    // [Scope('OnPrem')]
    procedure CreateJobJnl()
    var
        JobJnl: Record "Job Journal Line";
        LineNo: Integer;
        ReqLines: Record "Store Requisition Line New";
        PostJob : Codeunit "Job Jnl.-Post Line";
    begin
        if "Req. Type" < 3 then Error('Invalid Requisition Type');
        TestField("Final Approved", 2);
        TestField("Journal Batch");
        TestField("Gen Bus. posting Grp.");
        TestField("External Document No");
        TestField("Document No.", '');
        TestField("Issued Captured");
        TestField("Job No.");
        if Rec."Processed Date" = 0D then 
                rec."Processed Date" := Today;
        ReqLines.SetRange(ReqLines."Req. No.", rec."Req. No");
        ReqLines.SetFilter(ReqLines."Issued Quantity", '<>%1', 0);
        if not ReqLines.FindSet() then
            Error('Notting To Issue. All Lines has Zero quantity Issued');

        JobJnl.SetRange(JobJnl."Journal Template Name", 'Job');
        JobJnl.SetRange(JobJnl."Journal Batch Name", rec."Journal Batch");
        if JobJnl.FindLast() then
            LineNo := JobJnl."Line No." else
            LineNo := 0;
        if ReqLines.Findset() then
            repeat
                LineNo += 10000;
                JobJnl.Init();
                JobJnl."Journal Template Name" := 'Job';
                JobJnl."Journal Batch Name" := "Journal Batch";
                JobJnl."Reason Code" := "Reason Code";
                JobJnl."External Document No." := "External Document No";
                JobJnl."Line No." := LineNo;
                JobJnl."Document No." := ReqLines."Req. No.";
                JobJnl.Validate(JobJnl."Posting Date", rec."Processed Date");
                JobJnl.Validate(JobJnl."Job No.", rec."Job No.");
                JobJnl.Type := JobJnl.Type::Item;
                JobJnl.Validate(JobJnl."No.", ReqLines."Item No.");
                JobJnl."Gen. Bus. Posting Group" := "Gen Bus. posting Grp.";
                JobJnl.Description := ReqLines."Item Description";
                JobJnl."Location Code" := ReqLines."Store Location";
                JobJnl.Validate(JobJnl.Quantity, ReqLines."Issued Quantity");
                JobJnl."Job Task No." := 'Temp';
                JobJnl."Lock Qty" := true;
                //JobJnl.Modify();
                 InveSetup.GET();
                 IF InveSetup."Auto Post Job Journal" THEN
                   PostJob.RUN(JobJnl)
                 ELSE
                JobJnl.Insert();
                
                ReqLines.Processed := true;
                ReqLines.Modify();
            until ReqLines.Next() = 0;
        /* IF JobBatch.GET(JobJnl."Journal Template Name",JobJnl."Journal Batch Name") THEN
          BEGIN
            JobBatch."Lock batch" := TRUE;
            JobBatch.MODIFY;
          END;*/
        "Document No." := JobJnl."Document No.";
        Processed := true;
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindSet() then
            "Processed By" := UserRec."Full Name";
        Modify();
        Message(Text50005, "Journal Batch");
    end;

    // // [Scope('OnPrem')]
    procedure TransferOrder()
    var
        Transheader: Record "Transfer Header";
        TransLine: Record "Transfer Line";
        LineNo: Integer;
        ReqLines: Record "Store Requisition Line New";
    begin
        TestField("Req. Type", 1);
        TestField("Final Approved", 2);
        TestField("Document No.", '');
        TestField("Issued Captured");
        if "Processed Date" = 0D then
            "Processed Date" := Today;
        ReqLines.SetRange(ReqLines."Req. No.", "Req. No");
        ReqLines.SetFilter(ReqLines."Issued Quantity", '<>%1', 0);
        if not ReqLines.FindSet() then
            Error('Notting To Transfer. All Lines has Zero quantity Issued');

        Transheader.Init();
        Transheader."No." := "Req. No";
        Transheader.Insert(true);
        Transheader.Validate(Transheader."Transfer-from Code", "Transfer From");
        Transheader.Validate(Transheader."Transfer-to Code", "Transfer To.");
        Transheader."In-Transit Code" := 'Own Log.';
        Transheader.Validate(Transheader."Posting Date", "Processed Date");
        Transheader.Validate(Transheader."Shipment Date", "Processed Date");
        Transheader.Validate(Transheader."Receipt Date", "Processed Date");
        Transheader."Voyage No." := "Voyage No.";
        Transheader."Transfer To Voy. No." := "Voyage No.";
        Transheader."External Document No." := "Voyage No.";
        Transheader."Requested By" := Sender;
        Transheader."Approved By" := "1st Approval Name";
        Transheader."Lock Header" := true;
        Transheader.Modify(true);

        //ReqLines.SETRANGE(ReqLines."Req. No.","Req. No");
        //ReqLines.SETFILTER(ReqLines."Issued Quantity",'<>%1', 0);
        LineNo := 0;
        if ReqLines.FindFirst() then
            repeat
                LineNo += 10000;
                TransLine.Init();
                TransLine.Validate(TransLine."Document No.", "Req. No");
                TransLine."Line No." := LineNo;
                TransLine.Validate(TransLine."Item No.", ReqLines."Item No.");
                TransLine.Description := ReqLines."Item Description";
                TransLine."Qty. Reqd." := ReqLines."Requested Quantity";
                TransLine.Validate(TransLine.Quantity, ReqLines."Issued Quantity");

                TransLine."Lock Line" := true;
                TransLine.Insert();
                ReqLines.Processed := true;
                ReqLines.Modify();
            until ReqLines.Next() = 0;
        "Document No." := Transheader."No.";
        Processed := true;
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindSet() then
            "Processed By" := UserRec."Full Name";
        Modify();
        InveSetup.Get();
        if InveSetup."Auto Post Transfer Req" then begin
            Transheader.Validate(Transheader."Direct Transfer", true);
            Transheader.Modify(true);
            posttrans.Run(Transheader)
        end
        else
            Message(Text50003, "Req. No");
    end;

    // [Scope('OnPrem')]
    procedure CreatePurchInv()
    var
        LineNo: Integer;
        noseriesmgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        PurchSetup: Record "Purchases & Payables Setup";
        PurchInv: Record "Purchase Header";
        PurchInvline: Record "Purchase Line";
        ReqLines: Record "Store Requisition Line New";
    begin
        TestField("Req. Type", 6);
        ReqLines.SetRange(ReqLines."Req. No.", "Req. No");
        ReqLines.SetFilter(ReqLines."Issued Quantity", '<>%1', 0);
        if not ReqLines.FindSet() then
            Error('Notting To Process. All Lines has Zero quantity Issued');
        "Processed Date" := Today;
        selection := StrMenu(Text50007, 1);
        if selection = 1 then
            UpdatePurReq()
        else begin
            TestField("Vendor No.");
            TestField("Final Approved", 2);
            TestField("Document No.", '');

            PurchSetup.Get();
            DocNo := noseriesmgt.GetNextNo(PurchSetup."Invoice Nos.", Today, true);
            PurchInv.Init();
            PurchInv."Document Type" := PurchInv."Document Type"::Order;
            PurchInv."No." := DocNo;
            PurchInv.Insert();
            PurchInv.Validate(PurchInv."Buy-from Vendor No.", Rec."Vendor No.");
            PurchInv.Validate("Posting Date", "Processed Date");
            PurchInv."Posting Description" := Description;
            PurchInv."Your Reference" := "Req. No";

            PurchInv.Modify();
            //ReqLines.SETRANGE(ReqLines."Req. No.","Req. No");
            //ReqLines.SETFILTER(ReqLines."Issued Quantity",'<>%1', 0);
            LineNo := 0;
            if ReqLines.FindSet() then
                repeat
                    LineNo += 10000;
                    PurchInvline."Document Type" := PurchInvline."Document Type"::Order;
                    PurchInvline."Document No." := DocNo;
                    PurchInvline."Line No." := LineNo;
                    PurchInvline.Insert();
                    PurchInvline.Validate(PurchInvline.Type, PurchInvline.Type::Item);
                    PurchInvline.Validate("No.", ReqLines."Item No.");
                    PurchInvline.Validate(PurchInvline."Expected Receipt Date", "Processed Date");
                    PurchInvline.Validate(Quantity, ReqLines."Issued Quantity");
                    PurchInvline.Modify();
                    ReqLines.Processed := true;
                    ReqLines.Modify();
                until ReqLines.Next() = 0;
            "Document No." := DocNo;
            Message(Text50006, DocNo);
        end;
        Processed := true;
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindSet() then
            "Processed By" := UserRec."Full Name";
        Modify();
    end;

    // [Scope('OnPrem')]
    procedure CheckReplacement()
    var
        NicsArt: Record "Misc. Article Information";
        OldStLine: Record "Store Requisition Line New";
    begin
        StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
        if StoreLine.FindFirst() then
            repeat
                NicsArt.SetRange(NicsArt."Employee No.", StoreLine."Claim by Employee");
                NicsArt.SetRange(NicsArt."Item No.", StoreLine."Item No.");
                if NicsArt.FindFirst() then begin
                    OldStLine.SetFilter(OldStLine."Claim by Employee", '%1', NicsArt."Employee No.");
                    OldStLine.SetFilter(OldStLine."Item No.", '%1', StoreLine."Item No.");
                    OldStLine.SetFilter(OldStLine.Processed, '%1', true);
                    if OldStLine.FindLast() then begin
                        NicsArt."From Date" := OldStLine."Issues Captured Date";
                        NicsArt."To Date" := CalcDate(NicsArt."Replacement Interval", OldStLine."Issues Captured Date");
                        NicsArt."Last Date Collected" := OldStLine."Issues Captured Date";
                        NicsArt.Modify();
                    end;
                end else
                    Error('Employee is Not %1 Allowed to Collect these Item %2', StoreLine."Claim by Employee", StoreLine."Item No.");
                StoreLine."Last Replacement Date" := NicsArt."From Date";
                StoreLine."Expected Replacement Date" := NicsArt."To Date";
                if NicsArt."To Date" <= Today then
                    StoreLine.Replaced := true;
                StoreLine.Modify();
            until StoreLine.Next() = 0;
    end;

    // [Scope('OnPrem')]
    procedure LoadTemplate()
    var
        Transline: Record "Transfer Line";
        ReqLine: Record "Store Requisition Line New";
    begin
        //TESTFIELD("Req. Type",1);
        if "Requisition Template" <> '' then begin
            ReqLine.SetFilter(ReqLine."Req. No.", '%1', "Req. No");
            if ReqLine.FindSet() then
                Error('To Use Requisition Template Delete All line first.')
            else begin
                Transline.SetFilter(Transline."Document No.", '%1', "Requisition Template");
                if Transline.FindFirst() then
                    repeat
                        ReqLine.Init();
                        ReqLine."Req. No." := "Req. No";
                        ReqLine."Line No." := Transline."Line No.";
                        ReqLine."Item No." := Transline."Item No.";
                        ReqLine."Item Description" := Transline.Description;
                        ReqLine."Store Location" := "Transfer From";
                        ReqLine.Insert(true);
                    until Transline.Next() = 0;
            end
        end else
            Error('Specify the Requisition Template to Copy');
    end;

    // [Scope('OnPrem')]
    procedure GenerateStoreOrder()
    begin
    end;

    local procedure UpdatePurReq()
    var
        Purcreq: Record "Purchase Requisition1";
        purchreq: Record "Purchase Requisition1";
        "LineNo.": Integer;
    begin
        TestField("Req. Type", "Req. Type"::Purchase);
        if Processed then begin
            if purchreq.FindLast() then "LineNo." := purchreq."Puch.Req Line No.";
            StoreLine.SetRange(StoreLine."Req. No.", "Req. No");
            if StoreLine.FindFirst() then
                repeat
                    ;
                    "LineNo." += 10000;
                    Purcreq.Init();
                    Purcreq.Validate(Purcreq."Req No.", StoreLine."Req. No.");
                    Purcreq.Validate(Purcreq."Item No.", StoreLine."Item No.");
                    Purcreq.Description := StoreLine."Item Description";
                    Purcreq."Req. Line No." := StoreLine."Line No.";
                    Purcreq."Req Location" := StoreLine."Store Location";
                    Purcreq.Quantity := StoreLine."Approved Quantity";
                    Purcreq."Req. By" := "1st Approval to";
                    Purcreq."Puch.Req Line No." := "LineNo.";
                    Purcreq.Insert();
                until StoreLine.Next() = 0;
        end;
        "Purchase Requsition Updated" := true;
        "Document No." := 'PurchReg';
        Modify();
    end;
}
