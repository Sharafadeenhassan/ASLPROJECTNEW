table 50003 "Payroll-Lookup Lines."
{
    LookupPageID = "Table Lookup Lines.";
    Caption = 'Payroll-Lookup Lines.';
    fields
    {
        field(1; TableId; Code[20])
        {
            Editable = true;
            NotBlank = true;
            TableRelation = "Payroll-Lookup Header.".TableId;
        }
        field(2; "Lower Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                LookupHeader.Get(Rec.TableId);
                if LookupHeader.Type = 1 then
                    "Lower Amount" := 0;
            end;
        }
        field(3; "Upper Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;

            trigger OnValidate()
            begin
                LookupHeader.Get(Rec.TableId);
                if LookupHeader.Type = 1 then
                    "Upper Amount" := 0;

                if LookupHeader.Type = 2 then
                    Validate("Tax Rate %");
            end;
        }
        field(4; "Lower Code"; Code[20])
        {
            trigger OnValidate()
            begin
                LookupHeader.Get(Rec.TableId);
                if (LookupHeader.Type = 0) or
                   (LookupHeader.Type = 2) then
                    "Lower Code" := '';
            end;
        }
        field(5; "Upper Code"; Code[20])
        {
            trigger OnValidate()
            begin
                LookupHeader.Get(Rec.TableId);
                if (LookupHeader.Type = 0) or
                   (LookupHeader.Type = 2) then
                    "Upper Code" := '';
            end;
        }
        field(8; "Extract Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                LookupHeader.Get(Rec.TableId);
                if (LookupHeader.Type = 2) then
                    "Extract Amount" := 0;
            end;
        }
        field(9; "Tax Rate %"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                LookupHeader.Get(Rec.TableId);
                if (LookupHeader.Type = 0) or (LookupHeader.Type = 1) then begin
                    "Tax Rate %" := 0;
                    "Cum. Tax Payable" := 0
                end
                else begin
                    LookupLines.SetRange(TableId, TableId);
                    LookupLines.SetRange("Lower Code", '');
                    if not LookupLines.Find('-') then begin
                        /* This is the first record being created for this tax table */
                        if "Upper Amount" <> 0 then
                            if not LookupHeader."Use Slabs" then
                                "Cum. Tax Payable" := (1 / 100) * ("Tax Rate %" *
                                                      ("Upper Amount" - "Lower Amount"))
                            else
                                "Cum. Tax Payable" := (1 / 100) * ("Tax Rate %" * "Upper Amount")
                    end
                    else begin
                        if LookupLines."Lower Amount" = "Lower Amount" then
                            /* We are at the record being edited currently*/
                      LookupLines := Rec;

                        if LookupLines."Upper Amount" <> 0 then
                            if not LookupHeader."Use Slabs" then
                                LookupLines."Cum. Tax Payable" := (1 / 100) *
                                (LookupLines."Tax Rate %" * (LookupLines."Upper Amount"
                                                            - LookupLines."Lower Amount"))
                            else
                                LookupLines."Cum. Tax Payable" := (1 / 100) *
                                (LookupLines."Tax Rate %" * LookupLines."Upper Amount")
                        else
                            LookupLines."Cum. Tax Payable" := 0;

                        if LookupLines."Lower Amount" = "Lower Amount" then
                            /* We are at the record being edited currently*/
                      "Cum. Tax Payable" := LookupLines."Cum. Tax Payable"
                        else
                            LookupLines.Modify();
                        PrevRec := LookupLines;

                        if (LookupLines.Next() <> 0) then
                            repeat

                                if LookupLines."Lower Amount" = "Lower Amount" then
                                    /* We are at the record being edited currently*/
                        LookupLines := Rec;

                                if LookupLines."Upper Amount" = 0 then
                                    LookupLines."Cum. Tax Payable" := 0
                                else begin
                                    if not LookupHeader."Use Slabs" then begin
                                        LookupLines."Cum. Tax Payable" := (1 / 100) *
                                        (LookupLines."Tax Rate %" * (LookupLines."Upper Amount" -
                                                                     PrevRec."Upper Amount"));
                                        LookupLines."Cum. Tax Payable" := LookupLines."Cum. Tax Payable" +
                                                                       PrevRec."Cum. Tax Payable"
                                    end else begin
                                        LookupLines."Cum. Tax Payable" := (1 / 100) *
                                                (LookupLines."Tax Rate %" * (LookupLines."Upper Amount"));
                                        LookupLines."Cum. Tax Payable" := LookupLines."Cum. Tax Payable";
                                    end;

                                end;
                                if LookupLines."Lower Amount" = "Lower Amount" then
                                    /* We are at the record being edited currently*/
                        "Cum. Tax Payable" := LookupLines."Cum. Tax Payable"
                                else
                                    LookupLines.Modify();
                                PrevRec := LookupLines;
                            until (LookupLines.Next() = 0)
                    end
                end
            end;
        }
        field(10; "Cum. Tax Payable"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Editable = false;
        }
    }

    keys
    {
        key(Key1; TableId, "Lower Amount", "Lower Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; TableId)
        {
        }
    }

    var
        LookupHeader: Record "Payroll-Lookup Header.";
        LookupLines: Record "Payroll-Lookup Lines.";
        PrevRec: Record "Payroll-Lookup Lines.";
}
