tableextension 50250 "tableextension50250" extends "Requisition Line"
{
    fields
    {
        //Unsupported feature: Property Modification (Data type) on ""Production BOM Version Code"(Field 99000885)".

        //Unsupported feature: Property Modification (Data type) on ""Routing Version Code"(Field 99000886)".

        //Unsupported feature: Code Modification on ""No."(Field 5).OnValidate".

        //trigger "(Field 5)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckActionMessageNew;
        ReserveReqLine.VerifyChange(Rec,xRec);
        DeleteRelations;
        #4..35
        CreateDim(
          DimMgt.TypeToTableID3(Type),
          "No.",DATABASE::Vendor,"Vendor No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..38

        "Action Message":=1; {New}
        Validate("Requester ID",UserId);
        */
        //end;

        //Unsupported feature: Code Modification on "Quantity(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        "Quantity (Base)" := CalcBaseQty(Quantity);
        if Type = Type::Item then begin
          GetDirectCost(FieldNo(Quantity));
        #4..20
            end;
          ReserveReqLine.VerifyQuantity(Rec,xRec);
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..23

        if Type=2 then
        begin
          It.Get("No.");
          if It."Order Multiple" <>0 then Modus:=Quantity/It."Order Multiple";
          //IF Modus>ROUND(Modus, 0.001, '<') THEN
          //ERROR('The entry in not a multiple of order multiple given on Item table');
        end;
        */
        //end;

        //Unsupported feature: Code Modification on ""Vendor No."(Field 9).OnValidate".

        //trigger "(Field 9)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CheckActionMessageNew;
        "Order Address Code" := '';
        if "Vendor No." <> '' then
        #4..50
        CreateDim(
          DATABASE::Vendor,"Vendor No.",
          DimMgt.TypeToTableID3(Type),"No.");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..53

        if VendorRec.Get("Vendor No.") then "Vendor Name":=VendorRec.Name;
        */
        //end;
        field(50300; "Print Line"; Boolean)
        {
            InitValue = true;
        }
        field(50301; Approved; Boolean)
        {
        }
        field(50302; "Vendor Name"; Text[30])
        {
        }
    }
}
