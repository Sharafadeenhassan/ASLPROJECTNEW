tableextension 50302 "tableextension50302" extends "Transfer Line"
{
    fields
    {
        //Unsupported feature: Property Modification (Editable) on ""Quantity Shipped"(Field 8)".

        //Unsupported feature: Code Modification on ""Item No."(Field 3).OnValidate".

        //trigger "(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestField("Quantity Shipped",0);
        if CurrFieldNo <> 0 then
          TestStatusOpen;
        #4..39

        CreateDim(DATABASE::Item,"Item No.");
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID","Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..42

        //Customized
        if "Item No."<>'' then
        begin
          ItemRec.Get("Item No.");
          ItemLedgLn.SetCurrentKey(ItemLedgLn."Entry Type",ItemLedgLn."Item No.",ItemLedgLn."Posting Date",ItemLedgLn."Location Code");
          ItemLedgLn.SetFilter(ItemLedgLn."Entry Type",'4');
          ItemLedgLn.SetFilter(ItemLedgLn."Item No.","Item No.");
          ItemLedgLn.SetFilter(ItemLedgLn."Location Code","Transfer-to Code");
          if ItemLedgLn.FindLast then
          begin
            "Last Issued Date":=ItemLedgLn."Posting Date";
            "Last Issued Qty.":=Abs(ItemLedgLn.Quantity);
          end
          else
          begin
            "Last Issued Date":=0D;
            "Last Issued Qty.":=0;
          end;
        end
        else
          begin
            "Last Issued Date":=0D;
            "Last Issued Qty.":=0;
          end;
        // Customized
        */
        //end;

        //Unsupported feature: Code Modification on "Quantity(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if CurrFieldNo <> 0 then
          TestStatusOpen;
        if Quantity <> 0 then
        #4..19
        ReserveTransferLine.VerifyQuantity(Rec,xRec);

        UpdateWithWarehouseShipReceive;

        IsHandled := false;
        OnValidateQuantityOnBeforeTransLineVerifyChange(Rec,xRec,IsHandled);
        if not IsHandled then
          WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..22
        #24..27
        if "Lock Line" then
          begin
            if xRec.Quantity <> Quantity then
                Error('You can Not Change quantity on the Line');
            end;
        */
        //end;

        //Unsupported feature: Code Modification on ""Qty. to Receive"(Field 7).OnValidate".

        //trigger  to Receive"(Field 7)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        GetLocation("Transfer-to Code");
        if CurrFieldNo <> 0 then begin
          if Location."Require Receive" and
             ("Qty. to Receive" <> 0)
          then
            CheckWarehouse("Transfer-to Code",true);
          WhseValidateSourceLine.TransLineVerifyChange(Rec,xRec);
        end;

        GetTransferHeaderNoVerification;

        if not TransHeader."Direct Transfer" and ("Direct Transfer" = xRec."Direct Transfer") then
        #13..17
            else
              Error(Text009);
        "Qty. to Receive (Base)" := CalcBaseQty("Qty. to Receive");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..8
        #10..20
        */
        //end;
        field(50020; "Lock Line"; Boolean)
        {
            Editable = false;
        }
        field(50300; "Qty. Reqd."; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                Validate(Quantity, "Qty. Reqd.");
            end;
        }
        field(50301; ROB; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                /*IF ROB > "Qty. Reqd." THEN ERROR('ROB can not be greater that Quantity Required');
                VALIDATE(Quantity,"Qty. Reqd."-ROB);
                */
            end;
        }
        field(50302; "Last Issued Qty."; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(50303; "Last Issued Date"; Date)
        {
            Editable = false;
        }
    }
}
