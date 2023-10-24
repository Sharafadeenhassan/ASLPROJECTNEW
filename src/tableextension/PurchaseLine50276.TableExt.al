tableextension 50276 "tableextension50276" extends "Purchase Line"
{
    fields
    {
        modify(Quantity)
        {
            Trigger OnAfterValidate()
            begin
                "QtytoReceiveAmount(LCY)" := "Outstanding Amount (LCY)";
                IF ("Qty. to Receive" <> "Outstanding Quantity") THEN
                    "QtytoReceiveAmount(LCY)" := ROUND(("Qty. to Receive" * "Outstanding Amount (LCY)") / "Outstanding Quantity");
            end;
        }
        //Unsupported feature: Property Insertion (InitValue) on ""Indirect Cost %"(Field 54)".

        //Unsupported feature: Code Modification on ""Direct Unit Cost"(Field 22).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        Validate("Line Discount %");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin

        modify("Direct Unit Cost")
        {
            trigger OnAfterValidate()
            begin
                Validate("Line Discount %");
                //SSNL-Jul2020-Start
                "QtytoReceiveAmount(LCY)" := "Outstanding Amount (LCY)";
                if ("Qty. to Receive" <> "Outstanding Quantity") then
                    "QtytoReceiveAmount(LCY)" := Round(("Qty. to Receive" * "Outstanding Amount (LCY)") / "Outstanding Quantity");
            end;
            //SSNL-Jul2020-End
        }
        //end;

        //Unsupported feature: Property Deletion (MinValue) on ""Indirect Cost %"(Field 54)".

        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;
        TestField("Quantity Received",0);
        TestField("Qty. Received (Base)",0);
        TestField("Qty. Rcd. Not Invoiced",0);
        TestField("Return Qty. Shipped",0);
        TestField("Return Qty. Shipped (Base)",0);
        if "Unit of Measure Code" <> xRec."Unit of Measure Code" then begin
          TestField("Receipt No.",'');
          TestField("Return Shipment No.",'');
        #10..47
          "Qty. per Unit of Measure" := 0;

        Validate(Quantity);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..4
        #7..50
        */
        //end;
        field(50005; "QtytoReceiveAmount(LCY)"; Decimal)
        {
            Description = 'LC';
        }
        field(50300; "Freight(LCY)"; Decimal)
        {
        }
        field(50301; "Ancillary(LCY)"; Decimal)
        {
        }
        field(50302; "Duty(LCY)"; Decimal)
        {
        }
        field(50303; "Insurance(LCY)"; Decimal)
        {
        }
        field(50304; "Surcharge Duty(LCY)"; Decimal)
        {
        }
        field(50305; "Ecowas Duty(LCY)"; Decimal)
        {
        }
        field(50306; "CISS(LCY)"; Decimal)
        {
        }
        field(50307; "Vat (LCY)"; Decimal)
        {
        }
        field(50308; "Clearing(LCY)"; Decimal)
        {
        }
        field(50309; "Interest(LCY)"; Decimal)
        {
        }
        field(50310; "Duty Rate%"; Decimal)
        {
        }
        field(50320; "Total Overhead(LCY)"; Decimal)
        {
        }
        field(50321; "LandedAmount(LCY)"; Decimal)
        {
        }
        field(50322; "Place Order"; Boolean)
        {
            InitValue = true;
        }
        field(50330; "ActualFreight(LCY)"; Decimal)
        {
        }
        field(50331; "ActualAncillary(LCY)"; Decimal)
        {
        }
        field(50332; "ActualDuty(LCY)"; Decimal)
        {
        }
        field(50333; "ActualInsurance(LCY)"; Decimal)
        {
        }
        field(50334; "ActualSurcharge Duty(LCY)"; Decimal)
        {
        }
        field(50335; "ActualEcowas Duty(LCY)"; Decimal)
        {
        }
        field(50336; "ActualCISS(LCY)"; Decimal)
        {
        }
        field(50337; "ActualVat (LCY)"; Decimal)
        {
        }
        field(50338; "ActualClearing(LCY)"; Decimal)
        {
        }
        field(50339; "ActualInterest(LCY)"; Decimal)
        {
        }
        field(50340; "ActualDuty Rate%"; Decimal)
        {
        }
        field(50341; "ActualTotal Overhead(LCY)"; Decimal)
        {
        }
        field(50342; "ActualLandedAmount(LCY)"; Decimal)
        {
        }
        field(50350; "Previous Purchase Price(LCY)"; Decimal)
        {
        }
        field(50351; "Quantity Ordered"; Decimal)
        {
        }
        field(50352; "Pack Size"; Code[10])
        {
            TableRelation = "Unit of Measure" WHERE("In Use" = CONST(true),
                                                     "Catch Code" = FILTER(<> ''));

            trigger OnValidate()
            begin
                if UnitOfMeasure.Get("Pack Size") then "Pack Size Code" := UnitOfMeasure."Catch Code";
                GenNo();
            end;
        }
        field(50353; Brand; Code[10])
        {
            TableRelation = "Reason Code" WHERE("In Use" = CONST(true),
                                                 Type = CONST(Brands));

            trigger OnValidate()
            begin
                "Brand Code" := CopyStr(Brand, 1, 1);
                GenNo();
            end;
        }
        field(50354; "Pack Size Code"; Code[1])
        {
            TableRelation = "Unit of Measure" WHERE("In Use" = CONST(true),
                                                     "Catch Code" = FILTER(<> ''));
        }
        field(50355; "Brand Code"; Code[1])
        {
            TableRelation = "Reason Code" WHERE("In Use" = CONST(true),
                                                 Type = CONST(Brands));
        }
        field(50356; ProdCd; Code[3])
        {
            trigger OnValidate()
            begin
                GenNo();
            end;
        }
        field(50360; "Original Purc. Order No."; Code[20])
        {
        }
        field(50362; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
            TableRelation = IF ("Reason Code" = CONST('USAGEFA')) "Fixed Asset" WHERE("FA Class Code" = FILTER(<> 'TRAWLER'))
            ELSE
            IF ("Reason Code" = CONST('USAGERES')) Location WHERE("Location Type" = FILTER(Residence))
            ELSE
            IF ("Reason Code" = CONST('USAGEVES')) Location WHERE("Location Type" = FILTER(Vessel))
            ELSE
            IF ("Reason Code" = CONST('USAGEOTR')) "Standard Text" WHERE(Others = CONST(true));
        }
        field(50364; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";

            trigger OnValidate()
            begin
                // AAA -Feb 2002
                //IF "Reason Code"='USAGE' THEN "Gen. Bus. Posting Group":='LOCAL';
            end;
        }
        field(50365; "ASL Indirect Cost %"; Decimal)
        {
            trigger OnValidate()
            begin
                Validate("Indirect Cost %", "ASL Indirect Cost %")
            end;
        }
    }

    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Document Type" = "Document Type"::"Blanket Order") and
       ((Type <> xRec.Type) or ("No." <> xRec."No."))
    then begin
    #4..11
        until PurchLine2.Next = 0;
    end;

    if ((Quantity <> 0) or (xRec.Quantity <> 0)) and ItemExists(xRec."No.") then
      ReservePurchLine.VerifyChange(Rec,xRec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..14
    {
    //ReturnCheckReturn.PurchLineModify(Rec,xRec);

    ReservePurchLine.VerifyChange(Rec,xRec);

    //DistIntegration.RetCheckPurchLineModify(Rec,xRec);

    IF "Item Tracking No." <> 0 THEN
      ItemTrkgMgtPurchLine.ChangeItemTrackingPurchLine(Rec,xRec);
    //AAA-SEPT 17
    }  //#1
    if ((Quantity <> 0) or (xRec.Quantity <> 0)) and ItemExists(xRec."No.") then
      ReservePurchLine.VerifyChange(Rec,xRec);
    */
    //end;

    //Unsupported feature: Code Modification on "UpdateAmounts(PROCEDURE 3)".

    //procedure UpdateAmounts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if Type = Type::" " then
      exit;
    GetPurchHeader;
    #4..35
      UpdateItemChargeAssgnt;

    CalcPrepaymentToDeduct;

    OnAfterUpdateAmountsDone(Rec,xRec,CurrFieldNo);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..38
    //SSNL- Jul2020-Start
    "QtytoReceiveAmount(LCY)":="Outstanding Amount (LCY)";
    if ("Qty. to Receive"<>"Outstanding Quantity") then
               "QtytoReceiveAmount(LCY)":=Round(("Qty. to Receive"*"Outstanding Amount (LCY)")/"Outstanding Quantity");
    //SSNL-Jul2020-Start

    OnAfterUpdateAmountsDone(Rec,xRec,CurrFieldNo);
    */
    //end;

    //Unsupported feature: Property Modification (Attributes) on "UpdatePrepmtSetupFields(PROCEDURE 102)".

    //Unsupported feature: Property Deletion (Local) on "UpdateSalesCost(PROCEDURE 6)".

    //Unsupported feature: Property Deletion (Local) on "GetFAPostingGroup(PROCEDURE 10)".

    procedure "-----"()
    begin
    end;

    procedure Addon()
    begin
    end;

    procedure GenNo()
    begin
        if (ProdCd <> '') and
           ("Pack Size Code" <> '') and
           ("Brand Code" <> '')
        then
            "No." := ProdCd + "Pack Size Code" + "Brand Code";
    end;

    var
        UnitOfMeasure: Record "Unit of Measure";

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;
}
