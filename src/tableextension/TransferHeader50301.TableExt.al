tableextension 50301 "tableextension50301" extends "Transfer Header"
{
    fields
    {
        //Unsupported feature: Property Insertion (NotBlank) on ""Shortcut Dimension 2 Code"(Field 26)".

        //Unsupported feature: Property Insertion (Editable) on ""In-Transit Code"(Field 27)".

        //Unsupported feature: Code Modification on ""Transfer-from Code"(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;

        IsHandled := false;
        #4..58
          end else
            "Transfer-from Code" := xRec."Transfer-from Code";
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..61

        //AAA-14-Dec-01/STA
        "In-Transit Code":='OWN LOG.';
        if LocationRec.Get("Transfer-from Code") then
            "Shortcut Dimension 2 Code":=LocationRec."Shortcut Dimension 2 Code";
        //CALCFIELDS("Transfer From Voy. No.");
        */
        //end;

        //Unsupported feature: Code Modification on ""Transfer-to Code"(Field 11).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        TestStatusOpen;

        IsHandled := false;
        #4..56
          end else
            "Transfer-to Code" := xRec."Transfer-to Code";
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..59

        //AAA-14-Dec-01/STA
        "In-Transit Code":='OWN LOG.';
        if LocationRec.Get("Transfer-to Code") then
            "New Shortcut Dimension 2 Code":=LocationRec."Shortcut Dimension 2 Code";
        //CALCFIELDS("Transfer To Voy. No.");
        */
        //end;

        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 26).OnValidate".

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

        //AAA-Nov2001
        //UpdateTransLines(FIELDNO("Shortcut Dimension 2 Code"));
        */
        //end;
        field(50000; "Voyage No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Job.Status WHERE(Vessel = FIELD("Transfer-to Code"));
        }
        field(50001; "Req. Type"; Option)
        {
            OptionMembers = " ",DECK,ELEC,ENGR,LIFE,FSGR,LUBS,PACK,AGO;

            trigger OnValidate()
            begin
                //AAA
                if "In-Transit Code" = '' then Error('Remember to fill in in-transit-code');
                if LocationRec.Get("Transfer-to Code") then begin
                    Message('Vessel %1 Selected \' +
                            'Sea days is %2 \' +
                            'Supply category is %3',
                             "Transfer-to Name", LocationRec."Sea Days", "Req. Type");
                    OnSeaDays := LocationRec."Sea Days";
                end;
                InsertSpecialBomItem("Req. Type", OnSeaDays);
            end;
        }
        field(50002; "New Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
                Modify();
                //TESTFIELD("New Shortcut Dimension 2 Code","Shortcut Dimension 2 Code");
                //AAA-Nov2001
                "External Document No." := 'TRANSORD';
            end;
        }
        field(50020; "Lock Header"; Boolean)
        {
        }
        field(50300; "Transfer From Voy. No."; Code[10])
        {
            TableRelation = Job WHERE(Vessel = FIELD("Transfer-from Code"),
                                       "Voyage Ended" = CONST(false));

            trigger OnValidate()
            begin
                if Jobs.Get("Transfer From Voy. No.") then
                    "Transfer From Voy. No." := Jobs."Voyage No.";
            end;
        }
        field(50301; "Transfer To Voy. No."; Code[10])
        {
            NotBlank = true;
            TableRelation = Job WHERE(Vessel = FIELD("Transfer-to Code"),
                                       "Voyage Ended" = CONST(false));

            trigger OnValidate()
            begin
                if Jobs.Get("Transfer To Voy. No.") then
                    "Transfer To Voy. No." := Jobs."Voyage No.";
                "External Document No." := "Transfer To Voy. No.";
            end;
        }
        field(50310; "Previous Voyage Expensed"; Boolean)
        {
        }
        field(50311; "Requested By"; Code[30])
        {
        }
        field(50312; "Received By"; Code[30])
        {
        }
        field(50314; "Issued By"; Code[30])
        {
        }
        field(50315; "Approved By"; Code[30])
        {
        }
        field(50316; "Transfer Type"; Option)
        {
            OptionMembers = Regular,Repairs,"Dry Dock","Over Hauling";
        }
        field(50317; "No. Of DN Printed"; Integer)
        {
        }
        field(50318; "Transfer Template"; Boolean)
        {
        }
        modify("Transfer-from Code")
        {
            trigger OnAfterValidate()
            begin
                Validate("In-Transit Code", 'OWN LOG.');
                Validate("Transfer From Voy. No.");
            end;
        }
        modify("Transfer-to Code")
        {
            trigger OnAfterValidate()
            begin
                Validate("Transfer To Voy. No.");
            end;
        }
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    GetInventorySetup;
    if "No." = '' then begin
      TestNoSeries;
      NoSeriesMgt.InitSeries(GetNoSeriesCode,xRec."No. Series","Posting Date","No.","No. Series");
    end;
    InitRecord;
    Validate("Shipment Date",WorkDate);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..7

    "Shortcut Dimension 2 Code":='ATLANTIC';

    if "No." <> '' then
    Validate("In-Transit Code",'OWN LOG.');//AAA
      //AAA
    */
    //end;

    //Unsupported feature: Code Modification on "UpdateTransLines(PROCEDURE 15)".

    //procedure UpdateTransLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    TransferLine.SetRange("Document No.","No.");
    TransferLine.SetFilter("Item No.",'<>%1','');
    if TransferLine.FindSet then begin
    #4..13
              TransferLine.Validate("Shipment Date",TransferHeader."Shipment Date");
              TransferLine.Validate("Receipt Date",TransferHeader."Receipt Date");
              TransferLine.Validate("Shipping Time",TransferHeader."Shipping Time");
            end;
          FieldNo("Transfer-to Code"):
            begin
    #20..66
          FieldNo("Inbound Whse. Handling Time"):
            TransferLine.Validate("Inbound Whse. Handling Time",TransferHeader."Inbound Whse. Handling Time");
          FieldNo(Status):
            TransferLine.Validate(Status,TransferHeader.Status);
          FieldNo("Direct Transfer"):
            begin
              TransferLine.Validate("In-Transit Code",TransferHeader."In-Transit Code");
    #74..78
        TransferLine.Modify(true);
      until TransferLine.Next = 0;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
              LocationRec.Get("Transfer-from Code");
              TransferLine.Validate("Shortcut Dimension 2 Code",LocationRec."Shortcut Dimension 2 Code");  //AAA
    #17..69
            TransferLine.Validate("Variant Code",'ATLANTIC');
            //TransferLine.VALIDATE(Status,TransferHeader.Status);
    #71..81
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: ItemTrackingMgt) (VariableCollection) on "DeleteOneTransferOrder(PROCEDURE 4)".

    //Unsupported feature: Variable Insertion (Variable: WhseValidateSourceLine) (VariableCollection) on "DeleteOneTransferOrder(PROCEDURE 4)".

    local procedure InsertSpecialBomItem(ReqType: Integer; Seadays: Integer)
    begin

        TransLine.Init();
        TransLine."Document No." := "No.";
        TransLine."Line No." := 10000;

        if "Req. Type" > 0 then begin
            case ReqType of
                1:
                    if Seadays > 1 then
                        Supply := 'DECK' + '1' else
                        Supply := 'DECK';
                2:
                    Supply := 'ELEC';
                3:
                    if Seadays > 1 then
                        Supply := 'ENGR' + '1' else
                        Supply := 'ENGR';
                4:
                    Supply := 'LIFE';
                5:
                    Supply := 'FSGR';
                6:
                    if Seadays > 1 then
                        Supply := 'LUBS' + '1' else
                        Supply := 'LUBS';
                7:
                    Supply := 'PACK';
            end;
            TransLine.Validate(TransLine."Item No.", Supply);
            TransLine.Validate(TransLine."Qty. Reqd.", 1);
            TransLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
        end;
        if not TransLine.Insert() then TransLine.Modify();
    end;

    local procedure GetLocation(InLocationCode: Code[10])
    begin
    end;

    var
        LocationRec: Record Location;
        Jobs: Record Job;
        OnSeaDays: Integer;
        Supply: Code[20];
        TransLine: Record "Transfer Line";
}
