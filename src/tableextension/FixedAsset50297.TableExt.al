tableextension 50297 "tableextension50297" extends "Fixed Asset"
{
    fields
    {
        //Unsupported feature: Property Insertion (InitValue) on ""Global Dimension 2 Code"(Field 8)".

        //Unsupported feature: Property Insertion (NotBlank) on ""Global Dimension 2 Code"(Field 8)".

        modify("Maintenance Vendor No.")
        {
            Description = 'V';
        }

        //Unsupported feature: Code Modification on ""FA Subclass Code"(Field 6).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        if "FA Subclass Code" = '' then begin
          Validate("FA Posting Group",'');
          exit;
        #4..11

        if "FA Posting Group" = '' then
          Validate("FA Posting Group",FASubclass."Default FA Posting Group");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        if "FA Subclass Code"='VESSEL' then "Location Code":="No.";
        if (xRec."FA Subclass Code"='VESSEL') and ("FA Subclass Code"<>'VESSEL') then "Location Code":='';
        #1..14
        */
        //end;

        //Unsupported feature: Code Modification on ""Global Dimension 2 Code"(Field 8).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Global Dimension 2 Code");
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        ValidateShortcutDimCode(2,"Global Dimension 2 Code");
        Modify;
        */
        //end;
        field(50300; "Voyage No."; Integer)
        {
            CalcFormula = Count(Job WHERE(Vessel = FIELD("No."),
                                           "Starting Date" = FIELD("FA Voyage Date Filter")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50301; "FA Voyage Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(50320; Overhauling; Date)
        {
        }
        field(50321; "Dry Dock"; Date)
        {
        }
        field(50322; "Derating Certificate"; Date)
        {
        }
        field(50323; "Pilotage Licence"; Date)
        {
        }
        field(50324; Fumigation; Date)
        {
        }
        field(50325; "Storage License"; Date)
        {
        }
        field(50326; "Life Rafts"; Date)
        {
        }
        field(50327; Extinguishers; Date)
        {
        }
        field(50328; "Fishing License"; Date)
        {
        }
        field(50329; "Survey Certificate"; Date)
        {
        }
        field(50427; Maintenance; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = Sum("Maintenance Ledger Entry".Amount WHERE("FA No." = FIELD("No."),
                                                                       "FA Posting Date" = FIELD("FA Posting Date Filter"),
                                                                       "Depreciation Book Code" = CONST('COMPANY')));
            Caption = 'Maintenance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50428; "Maintenance Amt"; Decimal)
        {
            Description = 'Last Reported Maintenance Amount';
        }
    }
    keys
    {
        key(ASLKey1; "Maintenance Amt")
        {
        }
        // key(Key2; "Serial No.")
        // {
        // }
    }

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      FASetup.Get;
      FASetup.TestField("Fixed Asset Nos.");
    #4..6
    "Main Asset/Component" := "Main Asset/Component"::" ";
    "Component of Main Asset" := '';

    DimMgt.UpdateDefaultDim(
      DATABASE::"Fixed Asset","No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    "Global Dimension 2 Code":='ATLANTIC';     //AAA - Oct 2002
    #10..12
    */
    //end;

    //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".
}
