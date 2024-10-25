table 50052 "Dynamics Procurement Register"
{
    Caption = 'Dynamics Procurement Register';
    LookupPageId = 50129;
    DrillDownPageId = 50129;
    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; "Item No."; Code[20])
        {
            TableRelation = Item."No.";

            trigger OnValidate()
            begin
                if ItemRec.Get("Item No.") then begin
                    DPSHeader.Get("DPS Code");
                    if DPSHeader.Approved then Error('This Document has been Approved By HOD You Cannot Change/Add Item');
                    "Location Code" := DPSHeader."Location Code";
                    if DPSHeader."Base Date" = 0D then
                        "Base Date" := today
                    else
                        "Base Date" := DPSHeader."Base Date";
                    M1Date := CalcDate('-1M', "Base Date");
                    M3Date := CalcDate('-3M', "Base Date");
                    M6Date := CalcDate('-6M', "Base Date");
                    M12Date := CalcDate('-1Y', "Base Date");
                    Description := ItemRec.Description;
                    "Maximum Stock" := ItemRec."Maximum Inventory";
                    "Inventory Group" := ItemRec."Inventory Posting Group";
                    "Lead Time" := ItemRec."Lead Time Calculation";
                    "Item Category" := ItemRec."Item Category Code";
                    if ItemRec."Average Consumption Base" <> 0 then
                        "Average Consumption Base" := ItemRec."Average Consumption Base"
                    else
                        Rec."Average Consumption Base" := DPSHeader."Average Consumption Base";
                    ItemLedg.SetCurrentKey("Item No.", "Location Code", "Posting Date", Positive);
                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    //ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M1Date, "Base Date");
                    if ItemLedg.FindFirst() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last Month Consumption" := -ItemLedg.Quantity;
                    end else
                        "Last Month Consumption" := 0;

                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    //ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M3Date, "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last 3 Months Consumption" := -ItemLedg.Quantity;
                    end else
                        "Last 3 Months Consumption" := 0;
                    if "Last 3 Months Consumption" <> 0 then
                        "Ave. 3 Month Consumption" := "Last 3 Months Consumption" / 3;

                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    // if "Location Code" <> '' then
                    //   ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M6Date, "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last 6 Month Consumption" := -ItemLedg.Quantity;
                    end else
                        "Last 6 Month Consumption" := 0;
                    if "Last 6 Month Consumption" <> 0 then
                        "Ave. 6 Month Consumption" := "Last 6 Month Consumption" / 6;

                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    // ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M12Date, "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last One Year Consumption" := -ItemLedg.Quantity;
                    end else
                        "Last One Year Consumption" := 0;
                    if "Last One Year Consumption" <> 0 then
                        "Ave. One Year Consumption" := "Last One Year Consumption" / 12 else
                        "Ave. One year Consumption" := 0;
                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    //  ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-2Y', "Base Date")), "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last 2 Years Consumption" := -ItemLedg.Quantity;
                        if "Last 2 Years Consumption" <> 0 then
                            "Last 2 Years Monthly Average" := "Last 2 Years Consumption" / 24
                        else
                            "Last 2 Years Monthly Average" := 0;
                    end else
                        "Last 2 Years Consumption" := 0;
                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    //  ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-3Y', "Base Date")), "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last 3 Years Consumption" := -ItemLedg.Quantity;
                        if "Last 3 Years Consumption" <> 0 then
                            "Last 3 Years Monthly Average" := "Last 3 Years Consumption" / 36
                        else
                            "Last 3 Years Monthly Average" := 0;
                    end else
                        "Last 3 Years Consumption" := 0;

                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    //  ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-4Y', "Base Date")), "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last 4 Years Consumption" := -ItemLedg.Quantity;
                        if "Last 4 Years Consumption" <> 0 then
                            "Last 4 Years Monthly Average" := "Last 4 Years Consumption" / 48
                        else
                            "Last 4 Years Monthly Average" := 0;
                    end else
                        "Last 4 Years Consumption" := 0;

                    ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                    //if "Location Code" <> '' then
                    //  ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                    ItemLedg.setrange(ItemLedg."Entry Type", ItemLedg."Entry Type"::"Negative Adjmt.");
                    ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
                    ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-5Y', "Base Date")), "Base Date");
                    if ItemLedg.FindSet() then begin
                        ItemLedg.CalcSums(ItemLedg.Quantity);
                        "Last 5 Years Consumption" := -ItemLedg.Quantity;
                        if "Last 5 Years Consumption" <> 0 then
                            "Last 5 Years Monthly Average" := "Last 5 Years Consumption" / 60
                        else
                            "Last 5 Years Monthly Average" := 0;
                    end else
                        "Last 5 Years Consumption" := 0;
                end;
                ItemRec.SetFilter(ItemRec."Location Filter", "Location Code");
                ItemRec.SetFilter(ItemRec."No.", '%1', "Item No.");
                ItemRec.SetFilter(ItemRec."Date Filter", '..%1', "Base Date");
                ItemRec.CalcFields(ItemRec."Net Change", ItemRec."Qty. on Purch. Order", ItemRec."MR Approved Qty", ItemRec."MR Pending  Qty");
                "Available Quantity" := ItemRec."Net Change";
                "Pending Requisition" := ItemRec."MR Approved Qty";
                "Unit Price" := ItemRec."Last Direct Cost";
                ItemLedg.Reset();
                ItemLedg.SetCurrentKey(ItemLedg."Item No.", ItemLedg."Location Code", ItemLedg."Posting Date", ItemLedg."Entry Type");
                ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
                if "Location Code" <> '' then
                    ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
                ItemLedg.SetFilter(ItemLedg.Positive, '%1', true);
                ItemLedg.SetFilter(ItemLedg."Entry Type", '%1', ItemLedg."Entry Type"::Purchase);
                if ItemLedg.FindLast() then begin
                    ItemLedg.CalcFields(ItemLedg."Cost Amount (Actual)");
                    if ItemLedg."Cost Amount (Actual)" > 0 then
                        "Unit Price" := ItemLedg."Cost Amount (Actual)" / ItemLedg.Quantity
                    else
                        "Unit Price" := ItemRec."Last Direct Cost";
                end;
                if "Available Quantity" <> 0 then begin
                    if "Ave. One Year Consumption" <> 0 then
                        "Available Stock Months" := ("Available Quantity" / "Last 2 Years Monthly Average")
                    else
                        "Available Stock Months" := 999;
                    if ("Available Stock Months" > 0) and ("Available Stock Months" <= 6) then "Item Status" := "Item Status"::"Fast Moving";
                    if ("Available Stock Months" > 6) and ("Available Stock Months" <= 12) then "Item Status" := "Item Status"::"Slow Moving";
                    if ("Available Stock Months" > 12) and ("Available Stock Months" <= 24) then "Item Status" := "Item Status"::"Non Moving";
                    if "Available Stock Months" > 24 then "Item Status" := "Item Status"::Obsolete;
                end else
                    "Available Stock Months" := 0;
                Validate("Maximum Stock Period", DPSHeader."Maxmum Order Period");
            end;
        }
        field(3; Description; Text[50])
        {
            Editable = false;
        }
        field(4; "Location Code"; Code[20])
        {
            TableRelation = Location.Code;

            trigger OnValidate()
            begin
                DPSHeader.Get("DPS Code");
                if DPSHeader.Approved then Error('This Document has been Approved By HOD You Cannot Change/Add Location');
                Validate("Item No.");
                Validate("Requested Quantity");
            end;
        }
        field(5; "Available Quantity"; Decimal)
        {
            Editable = false;
        }
        field(6; "Pending Quantity"; Decimal)
        {
            Description = 'This is the quantity on Purchase Request yet to be supplied';
            Editable = false;
        }
        field(7; "Pending Requisition"; Decimal)
        {
            Editable = false;
        }
        field(8; "Last Month Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(9; "Last 3 Months Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(10; "Last 6 Month Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(11; "Last One Year Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(12; "Ave. 3 Month Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(13; "Ave. 6 Month Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(14; "Ave. One Year Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(15; "Maximum Stock"; Decimal)
        {
            Editable = false;
        }
        field(16; "Lead Time"; DateFormula)
        {
            trigger OnValidate()
            begin
                Validate(Update, true);
            end;
        }
        field(17; "Suggested Order Quantity"; Decimal)
        {
            Caption = 'Suggested Order Quantity';
            DecimalPlaces = 0 : 2;
        }
        field(18; "Supply by"; Code[20])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                if SupRec.Get("Supply by") then
                    "Supplier Name" := SupRec.Name;
            end;
        }
        field(19; "Supplier Name"; Text[50])
        {

        }
        field(20; "Delivery Term"; DateFormula)
        {
        }
        field(21; "Order Date"; Date)
        {
        }
        field(22; "Expected Delivery date"; Date)
        {
        }
        field(23; "DPS Code"; Code[20])
        {
            TableRelation = "Dynamics Procurement Header"."DPS No.";
        }
        field(24; processed; Boolean)
        {
        }
        field(25; "process By"; Code[20])
        {
        }
        field(26; "Order No."; Code[20])
        {
            TableRelation = "Purchase Header"."No.";
        }
        field(27; "Base Date"; Date)
        {
        }
        field(28; "Item Category"; Code[20])
        {
            TableRelation = "Item Category".Code;
        }
        field(29; "Inventory Group"; Code[20])
        {
            TableRelation = "Inventory Posting Group".Code;
        }
        field(30; "Maximum Stock Period"; DateFormula)
        {
            trigger OnValidate()
            begin
                if "Maximum Stock" <> 0 then
                    if Confirm('Maximum Stock Has a Value, do you want it Updated', false) then
                        "Maximum Stock" := 0;
                Validate(Update, true);
            end;
        }
        field(31; Update; Boolean)
        {
            trigger OnValidate()
            begin
                if "Maximum Stock" = 0 then begin
                    /*  IF "Base Date" = 0D THEN "Base Date" := TODAY;
                      ItemLedg.SETCURRENTKEY("Item No.","Location Code","Posting Date",Positive);
                      IF "Location Code" <>'' THEN
                      ItemLedg.SETRANGE(ItemLedg."Location Code","Location Code");
                      ItemLedg.SETRANGE(ItemLedg."Item No.","Item No.");
                      ItemLedg.SETFILTER(ItemLedg.Positive,'%1',FALSE);
                      ItemLedg.SETFILTER(ItemLedg."Posting Date",'%1..%2',(CALCDATE(('-'+ FORMAT("Maximum Stock Period")),"Base Date")),"Base Date");
                      IF ItemLedg.FINDSET THEN
                      ItemLedg.CALCSUMS(ItemLedg.Quantity);
                      "Maxmum Stock" := -ItemLedg.Quantity;
                    END ELSE
                    ERROR('Maximum Stock Has A Value Put 0 in Maximum Stock to Recalculate');
                    */

                    LeadS := DelChr(Format("Lead Time"), '=', 'MDYC');
                    if Evaluate(LeadP, LeadS) then;
                    StocS := DelChr(Format("Maximum Stock Period"), '=', 'MDYC');
                    if Evaluate(StocP, StocS) then
                        if "Last 3 Years Monthly Average" <> 0 then
                            "Maximum Stock" := (StocP + LeadP) * "Last 3 Years Monthly Average";
                    if "Maximum Stock" > "Available Quantity" then
                        "Suggested Order Quantity" := "Maximum Stock" - "Available Quantity"
                    else
                        "Suggested Order Quantity" := 0;
                    "Line Amount" := "Suggested Order Quantity" * "Unit Price";
                    // validate("Approved Order Quantity","Surgested Order Quantity");
                end;
            end;
        }
        field(32; "Item Status"; Option)
        {
            OptionCaption = ' ,Fast Moving,Slow Moving,Not Moving,Obsolete';
            OptionMembers = " ","Fast Moving","Slow Moving","Non Moving",Obsolete;
        }
        field(33; "Last 2 Years Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(34; "Last 3 Years Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(35; "Last 4 Years Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(36; "Last 5 Years Consumption"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(37; "Available Stock Months"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(38; "Approved Order Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                if "Approved Order Quantity" < 0 then Error('Quantity Cannot be Negative');
                if processed then Error('Process Document cannot be Changed');
                if DPSHeader.get("DPS Code") then begin
                    DPSHeader.TestField(DPSHeader.Approved, true);
                    if "Approved Order Quantity" > "HOD Approved Qty" then Error('You CanNot Approve More Than HOD Approved Qty');
                    "Line Amount" := "Approved Order Quantity" * "Unit Price";
                    Approved := true;
                    //processed := true;

                end
            end;
        }
        field(39; "Last 2 Years Monthly Average"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(40; "Last 5 Years Monthly Average"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
        field(41; Approved; Boolean)
        {
            Caption = 'Store Approved';
            /*
                     trigger OnValidate()
                        begin
                            DPSHeader.Get(rec."DPS Code");
                            DPSHeader.TestField(DPSHeader."Send For Approval",true);
                            if Approved then
                                if "Approved Order Quantity" <= 0 then if Confirm('HOD Approved Qty will be Taking as Approved Quantity',false) then
                                    Validate(rec."Approved Order Quantity", rec."HOD Approved Qty");                      
                        end;
                    */
        }
        field(42; "Unit Price"; Decimal)
        {
            Editable = false;
            trigger OnValidate()
            begin
                TestField(Approved, false);
                if "Approved Order Quantity" <> 0 then
                    "Line Amount" := "Unit Price" * "Approved Order Quantity"
                else
                    rec."Line Amount" := "Unit Price" * "HOD Approved Qty";
            end;
        }
        field(43; "Line Amount"; Decimal)
        {
            DecimalPlaces = 0 : 2;
        }
        field(44; "Process Mode"; Option)
        {
            OptionCaption = ' ,Purchase Order,Purch. Req.';
            OptionMembers = " ","Purchase Order","Purch. Req. Systems";
            InitValue = 2;
        }
        field(45; "Last 3 Years Monthly Average"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
        field(46; "Last 4 Years Monthly Average"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
        field(47; "Average Consumption Base"; Option)
        {
            OptionMembers = " ","1M","3M","6M","1Y","2Y","3Y","4Y","5Y";
            OptionCaption = ' ,1Month,3Months,6Months,1Year,2Years,3Years,4Years,5Years';
            trigger OnValidate()
            begin
                Validate("HOD Approved Qty");
            end;
        }
        field(48; "Requested Quantity"; Decimal)
        {
            trigger OnValidate()
            begin
                DPSHeader.Get("DPS Code");
                if DPSHeader."Send For Approval" then error('You Cannot Change Requested Quantity');
                if DPSHeader.Approved then Error('This Document has been Approved By HOD You Cannot Change Requested Qty');
                   rec.validate(Rec."HOD Approved Qty",rec."Requested Quantity");
            end;     
        }
        field(49; "Req+Ava Qty"; Decimal)
        {
            Editable = false;
            trigger OnValidate()
            begin
                DPSHeader.Get("DPS Code");
                if DPSHeader.Approved then Error('This Document has been Approved By HOD You Cannot Change Requested Qty');
                if "Suggested Order Quantity" = 0 then validate("Suggested Order Quantity", "Requested Quantity");
                    rec.Validate(rec."Line Amount", rec."HOD Approved Qty" * rec."Unit Price");
                case rec."Average Consumption Base" of
                    0:
                        if "Last 3 Years Monthly Average" <> 0 then
                            "Expected Stock Period" := ("Req+Ava Qty" / "Last 2 Years Monthly Average")
                        else
                            "Expected Stock Period" := 0;
                    1:
                        begin
                            if "Last Month Consumption" <> 0 then
                                "Expected Stock Period" := "Req+Ava Qty" / "Last Month Consumption"
                            else
                                "Expected Stock Period" := 0;
                        end;
                    2:
                        begin
                            if "Ave. 3 Month Consumption" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Ave. 3 Month Consumption")
                            else
                                "Expected Stock Period" := 0;
                        end;
                    3:
                        begin
                            if "Ave. 6 Month Consumption" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Ave. 6 Month Consumption")
                            else
                                "Expected Stock Period" := 0;
                        end;
                    4:
                        begin
                            if "Ave. One Year Consumption" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Ave. One Year Consumption")
                            else
                                "Expected Stock Period" := 0;
                        end;
                    5:
                        begin
                            if "Last 2 Years Monthly Average" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Last 2 Years Monthly Average")
                            else
                                "Expected Stock Period" := 0;
                        end;
                    6:
                        begin
                            if "Last 3 Years Monthly Average" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Last 3 Years Monthly Average")
                            else
                                "Expected Stock Period" := 0;
                        end;
                    7:
                        begin
                            if "Last 4 Years Monthly Average" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Last 4 Years Monthly Average")
                            else
                                "Expected Stock Period" := 0;
                        end;
                    8:
                        begin
                            if "Last 5 Years Monthly Average" <> 0 then
                                "Expected Stock Period" := ("Req+Ava Qty" / "Last 5 Years Monthly Average")
                            else
                                "Expected Stock Period" := 0;
                        end;
                end;
            end;
        }
        field(50; "Expected Stock Period"; Decimal)
        {
            Editable = false;
            DecimalPlaces = 0 : 2;
        }
        field(51; "Req Department"; code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(52; "Process Date"; Date)
        {
        }
        field(53; "Last 3 Months Average"; Decimal)
        {
            DecimalPlaces = 0 : 2;
        }
        field(54; "MD Approved"; Boolean)
        {

        }
        field(55; "HOD Approved Qty"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            trigger OnValidate()
            begin
                IF "HOD Approved Qty" < 0 then Error('Quantity Cannot be Negative'); 
                rec.Validate("Req+Ava Qty",("HOD Approved Qty" + "Available Quantity"));                 
            end;
        }
        field(56;"Security Check";Boolean)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = exist("Purchase Requisition1" where("Req No."=field("DPS Code"),"Req. Line No."= field("Line No."),"Security checked"=const(true)));
            }
        field(57;"Qcc Checked";Boolean)
        {
            Editable = false;
             FieldClass = FlowField;
            CalcFormula = exist("Purchase Requisition1" where("Req No."=field("DPS Code"),"Req. Line No."= field("Line No."),"QCC Check"=const(true)));
        }
        field(58;"Ready For GRN";Boolean)
        {
            Editable = false;
             FieldClass = FlowField;
            CalcFormula = exist("Purchase Requisition1" where("Req No."=field("DPS Code"),"Req. Line No."= field("Line No."),
            "Security checked"=const(true),"QCC Check" = const(true),"Procurement Mgr. Action"=const(Approved)));
        }
        field(59;"PO No.";Code[20])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("Purchase Requisition1"."Invoice No." where("Req No." =field("DPS Code"),
                                "Req. Line No." = field("Line No.")));
            TableRelation = "Purchase Header"."No.";
            ValidateTableRelation = false;
        }
        field(60;"PI No.";Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Purch. Inv. Header"."No." where ("Order No."= field("PO No.")));
            Editable = false;
        }

    }

    keys
    {
        key(Key1; "DPS Code", "Line No.")
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

    trigger OnInsert()
    begin
        DPSHeader.Get("DPS Code");
       if DPSHeader."Send For Approval" then error('You Cannot Insert a new Line Once Document Has been sent for HOD Approval');
        DPSHeader.SetFilter(DPSHeader."DPS No.", '%1', "DPS Code");
        if DPSHeader.FindFirst() then begin
            DPSHeader.TestField(DPSHeader."Base Date");
            "Base Date" := DPSHeader."Base Date";
            "Location Code" := DPSHeader."Location Code";
            "Maximum Stock Period" := DPSHeader."Maxmum Order Period";
            "Req Department" := DPSHeader."Req Department";
            rec."Average Consumption Base" := DPSHeader."Average Consumption Base";
        end;
    end;

    trigger OnModify()
    begin
        if xRec.Processed then error('You cannot Modify Already processed Line');
    end;

    trigger OnDelete()
    begin
        if DPSHeader.Get(rec."DPS Code") then
        begin
            DPSHeader.TestField(DPSHeader."Send For Approval",false);
            DPSHeader.TestField(DPSHeader.Approved, false);
        end;

    end;

    var
        ItemRec: Record Item;
        SupRec: Record Vendor;
        ItemLedg: Record "Item Ledger Entry";
        M1Date: Date;
        M3Date: Date;
        M6Date: Date;
        M12Date: Date;
        DPSHeader: Record "Dynamics Procurement Header";
        StocP: Integer;
        LeadP: Integer;
        LeadS: Text;
        StocS: Text;
        Text0001: Label 'Purchase Order No. ''%1'' has been Created for %2 ';

    //[Scope('OnPrem')]
    procedure CreatePurchInv()
    var
        LineNo: Integer;
        noseriesmgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        PurchSetup: Record "Purchases & Payables Setup";
        PurchInv: Record "Purchase Header";
        PurchInvLine: Record "Purchase Line";
        ReqLines: Record "Dynamics Procurement Register";
        UserRec: Record User;
    begin
        //TESTFIELD("Req. Type",6);
        UserRec.SetRange("User Name", UserId);
        if UserRec.FindFirst() then;
        ReqLines.SetRange(ReqLines."Supply by", "Supply by");
        ReqLines.SetFilter(ReqLines."Approved Order Quantity", '<>%1', 0);
        ReqLines.SetFilter(ReqLines.Approved, '%1', true);
        ReqLines.SetFilter(ReqLines.processed, '%1', false);
        ReqLines.SetRange(ReqLines."Process Mode", ReqLines."Process Mode"::"Purchase Order");
        if not ReqLines.FindSet() then
            Error('Notting To Process. No Line(s) is Ready for Process')
        else begin
            PurchSetup.Get();
            DocNo := noseriesmgt.GetNextNo(PurchSetup."Order Nos.", Today, true);
            PurchInv.Init();
            PurchInv."Document Type" := PurchInv."Document Type"::Order;
            PurchInv.Validate(PurchInv."No.", DocNo);
            PurchInv.Insert(true);
            PurchInv.Validate("Posting Date", Today);
            PurchInv.Validate(PurchInv."Buy-from Vendor No.", ReqLines."Supply by");
            PurchInv."Posting Description" := 'Supply Request from DPS ' + "DPS Code";
            PurchInv."Your Reference" := "DPS Code";
            PurchInv.Modify();

            LineNo := 0;
            if ReqLines.FindSet() then
                repeat
                    LineNo += 10000;
                    PurchInvLine."Document Type" := PurchInvLine."Document Type"::Order;
                    PurchInvLine."Document No." := DocNo;
                    PurchInvLine."Line No." := LineNo;
                    PurchInvLine.Insert(true);
                    PurchInvLine.Validate(PurchInvLine.Type, PurchInvLine.Type::Item);
                    PurchInvLine."Location Code" := ReqLines."Location Code";
                    PurchInvLine.Validate("No.", ReqLines."Item No.");
                    PurchInvLine.Validate(Quantity, ReqLines."Approved Order Quantity");
                    PurchInvLine.Validate(PurchInvLine."Direct Unit Cost", ReqLines."Unit Price");
                    //PurchInvLine.VALIDATE(PurchInvLine."Expected Receipt Date",TODAY);
                    PurchInvLine.Modify();
                    ReqLines.processed := true;
                    UserRec.SetRange("User Name", UserId);
                    if UserRec.FindSet() then
                        ReqLines."process By" := UserRec."Full Name";
                    //ReqLines.Process Date":= CURRENTDATETIME;
                    ReqLines."Order No." := DocNo;
                    ReqLines.Modify();
                until ReqLines.Next() = 0;
            Message(Text0001, DocNo, ReqLines."Supplier Name");
        end;
    end;

    //[Scope('OnPrem')]
    procedure UpdatePurReq()
    var
        Purcreq: Record "Purchase Requisition1";
        DPSRec: Record "Dynamics Procurement Register";
        Purchreq: Record "Purchase Requisition1";
        "LineNo.": Integer;
    begin
        DPSRec.SetRange(DPSRec."DPS Code", "DPS Code");
        DPSRec.SetFilter(DPSRec.Approved, '%1', true);
        DPSRec.SetFilter(DPSRec.processed, '%1', false);
        DPSRec.SetRange(DPSRec."Process Mode", DPSRec."Process Mode"::"Purch. Req. Systems");
        if Purchreq.FindLast() then "LineNo." := Purchreq."Puch.Req Line No.";
        if DPSRec.FindFirst() then
            repeat
                "LineNo." += 10000;
                Purcreq.Init();
                Purcreq.Validate(Purcreq."Req No.", DPSRec."DPS Code");
                Purcreq.Validate(Purcreq."Item No.", DPSRec."Item No.");
                Purcreq.Description := DPSRec.Description;
                Purcreq."Req. Line No." := DPSRec."Line No.";
                Purcreq."Req Location" := DPSRec."Location Code";
                Purcreq.Quantity := DPSRec."Approved Order Quantity";
                Purcreq."Puch.Req Line No." := "LineNo.";
                // Purcreq."Req. By" := "1st Approval to";
                Purcreq.Insert();
                DPSRec."Order No." := 'PurchReg';
                DPSRec.Validate(DPSRec.processed, true);
                DPSRec.Modify();
            until DPSRec.Next() = 0;
    end;

    procedure LastMthConsCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", rec."Item No.");
        if rec."Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", rec."Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M1Date, rec."Base Date");
        if ItemLedg.FindFirst() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            rec."Last Month Consumption" := -ItemLedg.Quantity;
        end else
            rec."Last Month Consumption" := 0;
    end;

    procedure Last3MthConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if rec."Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M3Date, "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last 3 Months Consumption" := -ItemLedg.Quantity;
        end else
            "Last 3 Months Consumption" := 0;
        if "Last 3 Months Consumption" <> 0 then
            "Ave. 3 Month Consumption" := "Last 3 Months Consumption" / 3;
    end;

    procedure Last6MthConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if "Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M6Date, "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last 6 Month Consumption" := -ItemLedg.Quantity;
        end else
            "Last 6 Month Consumption" := 0;
        if "Last 6 Month Consumption" <> 0 then
            "Ave. 6 Month Consumption" := "Last 6 Month Consumption" / 6;
    end;

    procedure Last1YearConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if "Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', M12Date, "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last One Year Consumption" := -ItemLedg.Quantity;
        end else
            "Last One Year Consumption" := 0;
        if "Last One Year Consumption" <> 0 then
            "Ave. One Year Consumption" := "Last One Year Consumption" / 12;
    end;

    procedure Last2YearConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if "Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-2Y', "Base Date")), "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last 2 Years Consumption" := -ItemLedg.Quantity;
            if "Last 2 Years Consumption" <> 0 then
                "Last 2 Years Monthly Average" := "Last 2 Years Consumption" / 24
            else
                "Last 2 Years Monthly Average" := 0;
        end else
            "Last 2 Years Consumption" := 0;

    end;

    procedure Last3YearConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if "Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-3Y', "Base Date")), "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last 3 Years Consumption" := -ItemLedg.Quantity;
            if "Last 3 Years Consumption" <> 0 then
                "Last 3 Years Monthly Average" := "Last 3 Years Consumption" / 36
            else
                "Last 3 Years Monthly Average" := 0;
        end else
            "Last 3 Years Consumption" := 0;
    end;

    procedure Last4yearConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if "Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-4Y', "Base Date")), "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last 4 Years Consumption" := -ItemLedg.Quantity;
            if "Last 4 Years Consumption" <> 0 then
                "Last 4 Years Monthly Average" := "Last 4 Years Consumption" / 48
            else
                "Last 4 Years Monthly Average" := 0;
        end else
            "Last 4 Years Consumption" := 0;
    end;

    procedure Last5YearConCalc()
    begin
        ItemLedg.SetRange(ItemLedg."Item No.", "Item No.");
        if "Location Code" <> '' then
            ItemLedg.SetRange(ItemLedg."Location Code", "Location Code");
        ItemLedg.SetFilter(ItemLedg.Quantity, '<%1', 0);
        ItemLedg.SetFilter(ItemLedg."Posting Date", '%1..%2', (CalcDate('-5Y', "Base Date")), "Base Date");
        if ItemLedg.FindSet() then begin
            ItemLedg.CalcSums(ItemLedg.Quantity);
            "Last 5 Years Consumption" := -ItemLedg.Quantity;
            if "Last 5 Years Consumption" <> 0 then
                "Last 5 Years Monthly Average" := "Last 5 Years Consumption" / 60
            else
                "Last 5 Years Monthly Average" := 0;
        end else
            "Last 5 Years Consumption" := 0;
    end;
}
