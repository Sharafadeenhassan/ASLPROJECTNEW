table 50002 "Payroll-Lookup Header."
{
    LookupPageID = "Table Lookup Survey.";
    Caption = 'Payroll-Lookup Header.';
    fields
    {
        field(1; TableId; Code[20])
        {
            NotBlank = true;

            trigger OnLookup()
            begin
                SpecialRelation(FieldNo(TableId));
            end;

            trigger OnValidate()
            begin
                "Search Name" := TableId;
            end;
        }
        field(2; Type; Option)
        {
            NotBlank = true;
            OptionMembers = Numeric,"Code",Tax;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Search Name"; Code[20])
        {
        }
        field(6; "Max. Extract Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(7; "Min. Extract Amount"; Decimal)
        {
            DecimalPlaces = 0 : 5;
        }
        field(8; "Input Factor"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            InitValue = 1;
            MinValue = 0;
            NotBlank = true;
        }
        field(9; "Output Factor"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            InitValue = 1;
            MinValue = 0;
            NotBlank = true;
        }
        field(10; "Rounding Precision"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            MinValue = 0;
        }
        field(11; "Rounding Direction"; Option)
        {
            OptionMembers = Nearest,Higher,Lower;
        }
        field(12;"Use Slabs";Boolean)
        {            
        }
    }

    keys
    {
        key(Key1; TableId)
        {
            Clustered = true;
        }
        key(Key2; "Search Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; TableId, Description)
        {
        }
    }

    trigger OnDelete()
    begin
        /* Confirm */
        if not Confirm('All entries for this lookup table ' +
                        'will be deleted!' +
                        'Proceed with Deletion?    ')
        then
            Error('Nothing was deleted');

        /* Lock 'parent' and 'child' files*/
        LockTable();
        LookLinesRec.LockTable();

        /* First delete the detail lines */
        LookLinesRec.SetRange(TableId, TableId);
        LookLinesRec.DeleteAll();

        /* Delete the 'parent record'*/
        Delete();

        /* Disable the locking effect */
        Commit();
    end;

    trigger OnInsert()
    begin
        //INSERT := TRUE;
        //LookLinesRec.SETRANGE(TableId,TableId);
        /*IF LookLinesRec.FINDSET THEN BEGIN
          LookLinesRec.TableId := TableId;
        END;*/
    end;

    var
        LookLinesRec: Record "Payroll-Lookup Lines.";

    //[Scope('OnPrem')]
    procedure SpecialRelation("FieldNo.": Integer)
    begin
        exit;
    end;
}
