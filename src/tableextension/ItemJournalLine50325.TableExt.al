tableextension 50325 "tableextension50325" extends "Item Journal Line"
{
    fields
    {
        modify("Reason Code")
        {
            TableRelation = "Reason Code" WHERE(Type = FILTER("Item Jl" | Usage));
        }
        modify("External Document No.")
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

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Item No." <> xRec."Item No." then begin
          "Variant Code" := '';
          "Bin Code" := '';
        #4..136

        OnBeforeVerifyReservedQty(Rec,xRec,FieldNo("Item No."));
        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..139

        //AAA-July 12 2002
        if "Journal Template Name"<>'PHYS. INVE' then
        begin
          "Shortcut Dimension 2 Code":='ATLANTIC';
          "Location Code":='GNRL ASL';
        end;
        //"Gen. Bus. Posting Group":='LOCAL';
        */
        //end;

        //Unsupported feature: Code Modification on "Quantity(Field 13).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if ("Entry Type" <= "Entry Type"::Transfer) and (Quantity <> 0) then
          TestField("Item No.");

        #4..42

        if Item."Item Tracking Code" <> '' then
          ReserveItemJnlLine.VerifyQuantity(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..45
        //VALIDATE("BOM EXPLODED",TRUE);
        if "Lock Qty" then
          begin
            if xRec.Quantity <> Quantity then
                Error('You can Not Change quantity on the Line');
            end;
        */
        //end;

        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 35).OnValidate".

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
        //VALIDATE("Variant Code","Shortcut Dimension 2 Code");
        */
        //end;

        //Unsupported feature: Code Insertion on ""Reason Code"(Field 42)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*

        // AAA -Feb 2002
        //IF "Reason Code"='USAGE' THEN "Gen. Bus. Posting Group":='LOCAL';
        */
        //end;

        //Unsupported feature: Code Modification on ""New Location Code"(Field 50).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Entry Type","Entry Type"::Transfer);
        if "New Location Code" <> xRec."New Location Code" then begin
          "New Bin Code" := '';
        #4..6
              WMSManagement.GetDefaultBin("Item No.","Variant Code","New Location Code","New Bin Code")
          end;
        end;

        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..9
        //VALIDATE("BOM EXPLODED",TRUE);
        ReserveItemJnlLine.VerifyChange(Rec,xRec);
        */
        //end;

        //Unsupported feature: Code Insertion on ""External Document No."(Field 62)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*

        //AAA Feb 2002
        if "Reason Code"='USAGE' then
          if FixAs.Get("External Document No.") then
            Validate("Shortcut Dimension 2 Code",FixAs."Global Dimension 2 Code");
        */
        //end;

        //Unsupported feature: Code Modification on ""Variant Code"(Field 5402).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "Entry Type" in ["Entry Type"::Consumption,"Entry Type"::Output] then
          WhseValidateSourceLine.ItemLineVerifyChange(Rec,xRec);

        #4..28
        end else begin
          GetItem;
          Description := Item.Description;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..31
            //Description := ItemVariant.Description;  //previous Location

          // AAA/BRP-2001
          //Description := ItemVariant.Description; //OLD
          if Description ='' then Description := ItemVariant.Description;
        end;
        */
        //end;

        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        OnBeforeValidateUnitOfMeasureCode(Rec,IsHandled);
        if IsHandled then
          exit;
        #4..9

        if CurrFieldNo <> 0 then
          WMSManagement.CheckItemJnlLineFieldChange(Rec,xRec,FieldCaption("Unit of Measure Code"));

        GetUnitAmount(FieldNo("Unit of Measure Code"));
        if "Value Entry Type" = "Value Entry Type"::Revaluation then
          TestField("Qty. per Unit of Measure",1);
        #17..39
          Validate(Quantity);

        CheckItemAvailable(FieldNo("Unit of Measure Code"));
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..12
        #14..42
        */
        //end;

        //Unsupported feature: Code Modification on ""Scrap Quantity"(Field 5847).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Entry Type","Entry Type"::Output);
        "Scrap Quantity (Base)" := UOMMgt.CalcBaseQty("Scrap Quantity","Qty. per Unit of Measure");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*

        if ("Entry Type" <> "Entry Type"::Output) and ("Entry Type" <> "Entry Type"::Consumption) then  //CODEWARE
          Error('Scrap Quantity can only be used for Consumption and Output entries');

        "Scrap Quantity (Base)" := UOMMgt.CalcBaseQty("Scrap Quantity","Qty. per Unit of Measure");
        */
        //end;
        field(50000; "BOM EXPLODED"; Boolean)
        {
            trigger OnValidate()
            begin
                //AAA
                ItemSetup.Get();
                if ItemSetup."Automatic BOM Explosion" then
                    ExplodeBom.Run(Rec)
                else
                    "BOM EXPLODED" := false;
            end;
        }
        field(50001; "Item List Cat"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
        }
        field(50003; "Consumed Quantity"; Decimal)
        {
        }
        field(50004; "Lock Qty"; Boolean)
        {
        }
        field(50316; "Issue Type"; Option)
        {
            Description = 'From Regular,Repairs,Dry Dock,Over Hauling to';
            OptionMembers = Mainte,Fuel;
        }
        field(50355; "Vessel Type"; Option)
        {
            OptionCaption = ' ,Short Voyage ';
            OptionMembers = " ","Short Voyage ";
        }
        field(50405; "CRM / STR"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                  "Location Code" = FILTER('GNRL ASL' | 'GNRL COS' | 'GNRL ICF' | 'GNRL SSC' | 'CRM-ASL' | 'CRM-COS' | 'CRM-ICF' | 'CRM-SSC')));
            DecimalPlaces = 0 : 5;
            Description = 'Inventory of items in Cold Room/Store';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    keys
    {
        key(ASLKey1; "Document No.")
        {
        }
        key(ASLKey2; "Item No.")
        {
        }
    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    ReserveItemJnlLine.DeleteLine(Rec);

    CalcFields("Reserved Qty. (Base)");
    TestField("Reserved Qty. (Base)",0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..4
    ItemJnlBatch.Get("Journal Template Name","Journal Batch Name");
    if ItemJnlBatch."Lock batch" then Error('You Can Not Delete Item from this Batch');
    */
    //end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    LockTable;
    ItemJnlTemplate.Get("Journal Template Name");
    ItemJnlBatch.Get("Journal Template Name","Journal Batch Name");

    ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
    ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
    ValidateNewShortcutDimCode(1,"New Shortcut Dimension 1 Code");
    ValidateNewShortcutDimCode(2,"New Shortcut Dimension 2 Code");

    CheckPlanningAssignment;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    "Shortcut Dimension 2 Code":='ATLANTIC';
    #5..10
    if ItemJnlBatch."Lock batch" then Error('You Can Not Insert a new Line to this Batch');
    */
    //end;

    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    OnBeforeVerifyReservedQty(Rec,xRec,0);
    ReserveItemJnlLine.VerifyChange(Rec,xRec);
    CheckPlanningAssignment;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..3
    if xRec."Lock Qty" then Error('You Area NOT allowed to change anything from Approved Requsition Journal');
    */
    //end;

    //Unsupported feature: Code Modification on "SetUpNewLine(PROCEDURE 8)".

    //procedure SetUpNewLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    MfgSetup.Get;
    ItemJnlTemplate.Get("Journal Template Name");
    ItemJnlBatch.Get("Journal Template Name","Journal Batch Name");
    #4..32
    "Entry Type" := LastItemJnlLine."Entry Type";
    "Source Code" := ItemJnlTemplate."Source Code";
    "Reason Code" := ItemJnlBatch."Reason Code";
    "Posting No. Series" := ItemJnlBatch."Posting No. Series";
    if ItemJnlTemplate.Type = ItemJnlTemplate.Type::Revaluation then begin
      "Value Entry Type" := "Value Entry Type"::Revaluation;
      "Entry Type" := "Entry Type"::"Positive Adjmt.";
    #40..45
        "Location Code" := UserMgt.GetLocation(0,'',UserMgt.GetSalesFilter);
      "Entry Type"::Output:
        Clear(DimMgt);
    end;

    if Location.Get("Location Code") then
      if  Location."Directed Put-away and Pick" then
        "Location Code" := '';

    OnAfterSetupNewLine(Rec,LastItemJnlLine,ItemJnlTemplate);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..35
     "Gen. Bus. Posting Group":=ItemJnlBatch."Gen. Bus. Posting Group";
    "Posting No. Series" := ItemJnlBatch."Posting No. Series";
     //AAA
          if CopyStr(ItemJnlBatch."Transfer To",1,3)='RES' then
              "External Document No.":=ItemJnlBatch."Transfer To";
          "Shortcut Dimension 2 Code":='ATLANTIC';
    #37..48
      //AAA
    #49..55
    */
    //end;

    //Unsupported feature: Code Modification on "GetUnitAmount(PROCEDURE 6)".

    //procedure GetUnitAmount();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    RetrieveCosts;
    if ("Value Entry Type" <> "Value Entry Type"::"Direct Cost") or
       ("Item Charge No." <> '')
    then
      exit;

    OnBeforeGetUnitAmount(Rec,CalledByFieldNo,IsHandled);
    if IsHandled then
    #9..19
      "Entry Type"::Sale:
        SalesPriceCalcMgt.FindItemJnlLinePrice(Rec,CalledByFieldNo);
      "Entry Type"::"Positive Adjmt.":
        "Unit Amount" :=
          Round(
            ((UnitCostValue - "Overhead Rate") * "Qty. per Unit of Measure") / (1 + "Indirect Cost %" / 100),
            GLSetup."Unit-Amount Rounding Precision");
      "Entry Type"::"Negative Adjmt.":
        "Unit Amount" := UnitCostValue * "Qty. per Unit of Measure";
      "Entry Type"::Transfer:
        "Unit Amount" := 0;
    end;
    OnAfterGetUnitAmount(Rec);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..5
       //Inserted by ssnl to control Costless product on 07062021 begin
         if Item.Get("Item No.") then
           if Item."Indirect Cost %" < 0 then
             UnitCost := 0;
      //Inserted by ssnl to control Costless product on 07062021 end
    #6..22
        //Inserted by ssnl to control Costless product on 28052021 begin
         if Item.Get("Item No.") then
           if Item."Indirect Cost %" < 0 then
             begin
                UnitCost := 0;
                Validate("Unit Amount",0) end
                else
       //Inserted by ssnl to control Costless product on 28052021 end
            begin
              "Unit Amount" :=
               Round(
                ((UnitCostValue - "Overhead Rate") * "Qty. per Unit of Measure") / (1 + "Indirect Cost %" / 100),
                  GLSetup."Unit-Amount Rounding Precision");
              "Unit Amount" := UnitCostValue * "Qty. per Unit of Measure";
            end;
        "Entry Type"::Transfer:
    #30..32
    */
    //end;

    //Unsupported feature: Code Modification on "ClearSingleAndRolledUpCosts(PROCEDURE 4)".

    //procedure ClearSingleAndRolledUpCosts();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Single-Level Material Cost" := "Unit Cost (Revalued)";
    "Single-Level Capacity Cost" := 0;
    "Single-Level Subcontrd. Cost" := 0;
    #4..7
    "Rolled-up Subcontracted Cost" := 0;
    "Rolled-up Mfg. Ovhd Cost" := 0;
    "Rolled-up Cap. Overhead Cost" := 0;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..10
     {
          //AAA
          COMMIT;
          ItemSetup.GET;
          IF ItemSetup."Automatic BOM Explosion" THEN ExplodeBom.RUN(Rec);
        }
    */
    //end;

    var
        ItemSetup: Record "Inventory Setup";
        ExplodeBom: Codeunit "Item Jnl.-Explode BOM";
}
