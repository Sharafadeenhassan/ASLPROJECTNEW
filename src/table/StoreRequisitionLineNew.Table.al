table 50032 "Store Requisition Line New"
{
    DrillDownPageID = "Store Requisition Subform";
    Caption = 'Store Requisition Line New';
    
    fields
    {
        field(1; "Req. No."; Code[10])
        {
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Item No."; Code[10])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                if ItemRec.Get("Item No.") then begin
                    "Item Description" := ItemRec.Description;
                    "Item Category" := ItemRec."Gen. Prod. Posting Group";
                    "Inventory Posting Group" := ItemRec."Inventory Posting Group";
                    ItemRec.SetFilter(ItemRec."Location Filter", '%1', "Store Location");
                    ItemRec.CalcFields(ItemRec.Inventory,ItemRec."MR Req Qty");
                    if ItemRec.Inventory <= 0 then
                        "Procurement Request" := true;
                    //ELSE ERROR('Zero Stock Item Can Not be Requested, Kindly Inform the Store Manager for Order');
                end;
                TransLineQty := 0;
                Transline.SetRange(Transline."Item No.", "Item No.");
                Transline.SetRange(Transline."Transfer-from Code", "Store Location");
                Transline.SetFilter(Transline."Qty. to Ship", '<>%1', 0);
                if Transline.FindSet() then begin
                    Transline.CalcSums(Transline."Qty. to Ship");
                    TransLineQty := Transline."Qty. to Ship";
                end;
                StoreLine := Rec;
                StoreLine.CalcFields(StoreLine."Pending Approved Qty");
                //"Available Quantity" := (ItemRec.Inventory - (StoreLine."Pending Approved Qty" + Tranlineqty));
                "Available Quantity" := (ItemRec.Inventory - ItemRec."MR Req Qty"); //+Tranlineqty);
                if "Available Quantity" < 0 then "Available Quantity" := 0;
                if "Req. Type" = "Req. Type"::Purchase then begin
                    ItemLedg.SetCurrentKey("Item No.", Open, "Variant Code", Positive, "Location Code", "Posting Date");
                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    ItemLedg.SetFilter(ItemLedg.Positive, '%1', false);
                    ItemLedg.SetRange(ItemLedg."Location Code", "Store Location");
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', "L1M S Date", "Req Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "L1M Consumption" := ItemLedg.Quantity;
                    end;
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', "L3M S Date", "Req Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "L3M Consumption" := ItemLedg.Quantity;
                        if ItemLedg.Quantity <> 0 then
                            "Average Consumption" := ItemLedg.Quantity / 3;
                    end;
                end;
            end;
        }
        field(4; "Item Description"; Text[50])
        {
            Editable = false;
        }
        field(5; "Requested Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                TestField("1st Approval", 0);
                if ("Last Replacement Date" <> 0D) and (Replaced = false) then Error('You Can Not Request already issued Item before authorised');
                if "Claim by Employee" <> '' then begin
                    NicsArt.SetRange(NicsArt."Employee No.", "Claim by Employee");
                    NicsArt.SetRange(NicsArt."Item No.", "Item No.");
                    if NicsArt.FindFirst() then
                        if "Requested Quantity" > NicsArt."Default Quantity" then
                            Error('You can Not Give more than Authorised Quantity');
                end;
                StoreLine.SetRange(StoreLine."Item No.", "Item No.");
                StoreLine.SetRange(StoreLine."Store Location","Store Location");
                if StoreLine.FindFirst() then begin
                    ItemRec.Get("Item No.");
                    ItemRec.SetFilter(ItemRec."Location Filter", '%1', "Store Location");
                    ItemRec.CalcFields(ItemRec.Inventory, ItemRec."MR Approved Qty", ItemRec."MR Pending  Qty",ItemRec."MR Req Qty");
                    If (xRec."Requested Quantity" <> rec."Requested Quantity") then
                    begin
                        "Approved Quantity" := "Requested Quantity";
                        "Issued Quantity" := "Requested Quantity";
                    end;   
                    ItemRec.CalcFields(ItemRec.Inventory, ItemRec."MR Approved Qty", ItemRec."MR Pending  Qty",ItemRec."MR Req Qty");
                    "Available Quantity" := (ItemRec.Inventory - (ItemRec."MR Req Qty" /*+ "Requested Quantity"*/));
                if "Available Quantity" < 0 then "Available Quantity" := 0;
                end;
                if (("Requested Quantity" > "Available Quantity") and ("Req. Type" < 5)) then begin
                    "Approved Quantity" := "Available Quantity";
                    "Issued Quantity" := "Approved Quantity";
                    "Procurement Request" := true;
                    "Shortage Qty" := "Requested Quantity" - "Available Quantity";
                end else begin
                    "Procurement Request" := false;
                    "Approved Quantity" := "Requested Quantity";
                    "Issued Quantity" := "Approved Quantity";
                    "Shortage Qty" := 0;
                end;
            end;
        }
        field(6; "Approved Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                if StoreHead.Get("Req. No.") then
                    StoreHead.TestField(StoreHead."Send for Approval", true)
                else
                    Error('Requisition Does Not Exist');
                StoreHead.SetFilter(StoreHead."Req. No", '%1', "Req. No.");
                if StoreHead.FindFirst() then
                    if StoreHead."Final Approved" <> 0 then Error('You can Not Change Approved Quantity After Approval');
                TestField("Requested Quantity");
                case "Req. Type" of
                    1, 2, 3, 4:
                        begin
                            if "Approved Quantity" > "Requested Quantity" then Error('Approved Quantity Can not be more than Requested Quantity');
                            "Issued Quantity" := "Approved Quantity";
                            StoreLine.SetRange(StoreLine."Item No.", "Item No.");
                            StoreLine.SETRANGE(StoreLine."Store Location","Store Location");
                            if StoreLine.FindFirst() then begin
                                ItemRec.Get("Item No.");
                                ItemRec.SetFilter(ItemRec."Location Filter", '%1',"Store Location");
                                ItemRec.CalcFields(ItemRec.Inventory,ItemRec."MR Req Qty");
                                //StoreLine.CalcFields(StoreLine."Pending Approved Qty");
                                //"Available Quantity" := (ItemRec.Inventory - StoreLine."Pending Approved Qty");
                                "Available Quantity" := (ItemRec.Inventory - (ItemRec."MR Req Qty"));
                              end;
                            if "Approved Quantity" > "Available Quantity" then Error('Approved Quantity Can Not be more than Available Quantity');
                        end
                end;
                "Issued Quantity" := "Approved Quantity";
            end;
        }
        field(7; "Issued Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                TestField("Approved Quantity");
                case "Req. Type" of
                    1, 2, 3, 4:
                        begin
                            ItemRec.Get("Item No.");
                            ItemRec.SetFilter(ItemRec."Location Filter", '%1', "Store Location");
                            ItemRec.CalcFields(ItemRec.Inventory,ItemRec."MR Req Qty");
                            "Available Quantity" := ItemRec.Inventory - (ItemRec."MR Req Qty" - xRec."Issued Quantity");
                            if "Available Quantity" < "Issued Quantity" then Error('You cannot Issue more than Available Quantity');
                            if "Issued Quantity" > "Approved Quantity" then Error('Issued Quantity Can not be more than Approved Quantity');
                        end;
                end;
            end;
        }
        field(8; "Store Location"; Code[20])
        {
            InitValue = 'GNRL ASL';
            TableRelation = Location.Code;

            trigger OnValidate()
            begin
                if xrec."Store Location" <> rec."Store Location" then
                rec.Validate("Requested Quantity");
            end;

        }
        field(9; "Claim by Employee"; Code[20])
        {
            TableRelation = Employee."No.";
            ValidateTableRelation = true;

            trigger OnValidate()
            begin
                // StoreLine.SETRANGE(StoreLine."Req. No.","Req. No.");
                StoreLine.SetFilter(StoreLine."Claim by Employee", '%1', "Claim by Employee");
                StoreLine.SetFilter(StoreLine."Item No.", '%1', "Item No.");
                StoreLine.SetFilter(StoreLine.Rejected, '%1', false);
                StoreLine.SetFilter(StoreLine.Processed, '%1', false);
                StoreLine.SetFilter(StoreLine."Approved Quantity", '>%1', 0);
                if StoreLine.Count > 0 then Error('Item already selected under process for this Employee');
                StoreLine.Reset();
                NicsArt.SetRange(NicsArt."Employee No.", "Claim by Employee");
                NicsArt.SetRange(NicsArt."Item No.", "Item No.");
                if NicsArt.FindFirst() then begin
                    OldStLine.SetFilter(OldStLine."Claim by Employee", '%1', NicsArt."Employee No.");
                    OldStLine.SetFilter(OldStLine."Item No.", '%1', "Item No.");
                    OldStLine.SetFilter(OldStLine.Processed, '%1', true);
                    // OldStLine.SETFILTER(OldStLine."Approved Quantity",'>%1',0);
                    if OldStLine.FindLast() then begin
                        NicsArt."From Date" := OldStLine."Issues Captured Date";
                        NicsArt."To Date" := CalcDate(NicsArt."Replacement Interval", OldStLine."Req Date");
                        NicsArt."Last Date Collected" := OldStLine."Req Date";
                        NicsArt.Modify();
                    end;
                    if NicsArt."To Date" <= Today then begin
                        Validate("Requested Quantity", NicsArt."Default Quantity");
                        Replaced := true;
                    end
                    else begin
                        Replaced := false;
                        Validate("Requested Quantity", 0);
                    end;
                end else
                    Error('Employee is Not %1 Allowed to Collect these Item %2', StoreLine."Claim by Employee", "Item No.");
                "Last Replacement Date" := NicsArt."From Date";
                "Expected Replacement Date" := NicsArt."To Date";
                StoreLine.Reset();
            end;
        }
        field(10; "Claim by Resources"; Code[20])
        {
            TableRelation = Resource."No.";
        }
        field(11; Comment; Text[250])
        {
        }
        field(12; "Ge. Mat. Requsition"; Boolean)
        {
        }
        field(13; "Mat. Req.  No."; Code[10])
        {
        }
        field(14; "Pending Approved Qty"; Decimal)
        {
            CalcFormula = Sum("Store Requisition Line New"."Approved Quantity" WHERE("Final Approval" = FILTER(Approved),
                                                                                      Processed = CONST(false),
                                                                                      "Req. Type" = FILTER(Issue | Invoice | Complementary | Transfer),
                                                                                      "Item No." = FIELD("Item No."),
                                                                                      "Store Location" = FIELD("Store Location"),
                                                                                      Rejected = CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15; "1st Approval"; Option)
        {
            Editable = false;
            OptionCaption = ' ,On Hold,Approved,Rejected';
            OptionMembers = " ","On Hold",Approved,Rejected;
        }
        field(16; "Final Approval"; Option)
        {
            Editable = false;
            OptionCaption = ' ,On Hold,Approved,Rejected';
            OptionMembers = " ","On Hold",Approved,Rejected;
        }
        field(17; Processed; Boolean)
        {
        }
        field(18; "Req. Type"; Option)
        {
            Description = 'Requisition Type';
            Editable = false;
            InitValue = Issue;
            OptionCaption = ' ,Transfer,Invoice,Complementary,Issue,Add In,Purchase';
            OptionMembers = " ",Transfer,Invoice,Complementary,Issue,"Add In",Purchase;
        }
        field(19; "Available Quantity"; Decimal)
        {
            Editable = false;
        }
        field(20; "Issued By"; Text[50])
        {
        }
        field(21; "Procurement Request"; Boolean)
        {
        }
        field(22; "Shortage Qty"; Decimal)
        {
            Editable = false;
        }
        field(23; Procured; Boolean)
        {
        }
        field(24; "Procurement Order"; Code[10])
        {
        }
        field(25; "Item Category"; Code[20])
        {
        }
        field(26; Rejected; Boolean)
        {
        }
        field(27; "Issues Captured Date"; Date)
        {
        }
        field(28; "Last Replacement Date"; Date)
        {
        }
        field(29; "Expected Replacement Date"; Date)
        {
        }
        field(30; Replaced; Boolean)
        {
            trigger OnValidate()
            begin
                if StoreHead.Get("Req. No.") then
                    StoreHead.TestField(StoreHead."Send for Approval", true);
                if Replaced then begin
                    NicsArt.SetRange(NicsArt."Employee No.", "Claim by Employee");
                    NicsArt.SetRange(NicsArt."Item No.", "Item No.");
                    if NicsArt.FindFirst() then
                        Validate("Requested Quantity", NicsArt."Default Quantity");
                end else
                    Validate("Approved Quantity", 0);
            end;
        }
        field(31; "1st Approval Date"; Date)
        {
        }
        field(32; "Final Approval Date"; Date)
        {
        }
        field(33; "Process Date"; Date)
        {
        }
        field(34; "Issued Captured"; Boolean)
        {
        }
        field(35; "Req Date"; Date)
        {
        }
        field(36; "No Header"; Boolean)
        {
            CalcFormula = - Exist("Store Requisition Header New" WHERE("Req. No" = FIELD("Req. No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(37; "Inventory Posting Group"; Code[20])
        {
            Editable = false;
            TableRelation = "Inventory Posting Group".Code;
        }
        field(38; "L1M Consumption"; Decimal)
        {
            Description = 'Last One Month Consumption';
        }
        field(39; "L3M Consumption"; Decimal)
        {
            Description = 'Last Three Month Consumption';
        }
        field(40; "Average Consumption"; Decimal)
        {
            Description = 'Average Monthly Consumption';
        }
        field(41; "Pending Order Quantity"; Decimal)
        {
            Description = 'All Expected Purchase Quantity';
        }
        field(42; "L1M S Date"; Date)
        {
            Description = 'Last One Month Start Date';
        }
        field(43; "L3M S Date"; Date)
        {
            Description = 'Last Three Month Start Date';
        }
        field(44; "L6M Consumption"; Decimal)
        {
            Description = 'Last 6 month Consumption';
        }
        field(45; "L1Y Consumption"; Decimal)
        {
            Description = 'Last 12 month Consumption';
        }
        field(46; "Management  Comment"; Text[100])
        {
        }
        field(47; "HOD Comment"; Text[100])
        {
        }
        field(48; "Supply Quantity"; Decimal)
        {
            CalcFormula = Sum("Purchase Requisition1"."QCC Check Quantity" WHERE("Req No." = FIELD("Req. No."),
                                                                                  "Req. Line No." = FIELD("Line No."),
                                                                                  "QCC Check" = CONST(true)));
            FieldClass = FlowField;
            Editable = false;
        }
        Field(49; "Doc Line Qty"; Decimal)
        {
            CalcFormula = sum("Store Requisition Line New"."Requested Quantity" where("Req. No." = field("Req. No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50; "Committed Approved Qty"; Decimal)
        {
            CalcFormula = Sum("Store Requisition Line New"."Approved Quantity" WHERE("Final Approval" = FILTER(Approved),
                                                                                      Processed = CONST(false),
                                                                                      "Req. Type" = FILTER(Issue | Invoice | Complementary | Transfer),
                                                                                      "Item No." = FIELD("Item No."),
                                                                                      "Store Location" = FIELD("Store Location"),
                                                                                      Rejected = CONST(false)));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Req. No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        StoreHead.SetFilter(StoreHead."Req. No", '%1', "Req. No.");
        if StoreHead.FindFirst() then
            if StoreHead."Final Approved" = 2 then Error('You Can Not Delete an Approved Requisition');
    end;

    trigger OnInsert()
    begin
        StoreHead.SetFilter(StoreHead."Req. No", '%1', "Req. No.");
        if StoreHead.FindFirst() then
            StoreHead.TestField(StoreHead."1st Approved", 0);
        if xRec."Line No." <> 0 then
            "Line No." := xRec."Line No." + 1000
        else
            "Line No." := 1000;
        StoreHead.SetFilter(StoreHead."Req. No", '%1', "Req. No.");
        if StoreHead.FindFirst() then begin
            "Req. Type" := StoreHead."Req. Type";
            "Req Date" := StoreHead."Req Date";
            if StoreHead."Req. Type" = StoreHead."Req. Type"::Purchase then begin
                "L1M S Date" := CalcDate('-1M', StoreHead."Req Date");
                "L3M S Date" := CalcDate('-3M', StoreHead."Req Date");
            end;
        end;
    end;

    trigger OnModify()
    begin
        StoreHead.SetFilter(StoreHead."Req. No", '%1', "Req. No.");
        if StoreHead.FindFirst() then
            if StoreHead."Document No." <> '' then Error('You Can Not Modify Processed Requisition');
        if StoreHead."Final Approved" <> StoreHead."Final Approved"::" " then
            Error('ÝOu Can Not Modify The Line After Final Approval');
    End;

    var
        ItemRec: Record Item;
        StoreHead: Record "Store Requisition Header New";
        StoreLine: Record "Store Requisition Line New";
        NicsArt: Record "Misc. Article Information";
        OldStLine: Record "Store Requisition Line New";
        ItemLedg: Record "Item Ledger Entry";
        Transline: Record "Transfer Line";
        TransLineQty: Decimal;
}
