tableextension 50305 "tableextension50305" extends "Transfer Receipt Header"
{
    fields
    {
        field(50000; "Voyage No."; Code[10])
        {
        }
        field(50001; "Req. Type"; Option)
        {
            OptionMembers = " ",DECK,ELEC,LSFF,"FISHING GEAR",PACKING,ENGR,LUBS;
        }
        field(50002; "New Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
        }
        field(50300; "Transfer From Voy. No."; Code[10])
        {
            Editable = false;
        }
        field(50301; "Transfer To Voy. No."; Code[10])
        {
            Editable = false;
        }
        field(50311; "Requested By"; Code[30])
        {
            Editable = false;
        }
        field(50312; "Received By"; Code[30])
        {
            Editable = false;
        }
        field(50314; "Issued By"; Code[30])
        {
            Editable = false;
        }
        field(50315; "Approved By"; Code[30])
        {
            Editable = false;
        }
        field(50316; "Transfer Type"; Option)
        {
            Editable = false;
            OptionMembers = Regular,Repairs,"Dry Dock","Over Hauling";
        }
        field(50321; "Posting Date Old"; Date)
        {
            Editable = false;
        }
        field(50345; "Gen. Prod. Posting Grp. Filter"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            Editable = false;
            FieldClass = FlowFilter;
            TableRelation = "Gen. Product Posting Group";

            trigger OnValidate()
            begin
            end;
        }
        field(50399; "Transfer Value"; Decimal)
        {
            CalcFormula = Sum("Value Entry"."Cost Amount (Actual)" WHERE("Document No." = FIELD("No."),
                                                                          "Cost Amount (Actual)" = FILTER(> 0),
                                                                          "Gen. Prod. Posting Group" = FIELD("Gen. Prod. Posting Grp. Filter"),
                                                                          "Location Code" = FIELD("Transfer-to Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50400; NewVoyageNo; Code[10])
        {
            Editable = false;
        }
    }
    keys
    {
        // key(Key1; "Transfer-to Code", "Transfer To Voy. No.")
        // {
        // }
        // key(Key2; "Transfer Order No.")
        // {
        // }
        key(Key3; NewVoyageNo)
        {
        }
    }

    procedure ETA(): Date
    begin
        //AAA-Mar 06, 2003
        Jobs.SetCurrentKey(Jobs.Vessel);
        Jobs.SetRange(Jobs.Vessel, "Transfer-to Code");
        Jobs.SetRange(Jobs."Voyage No.", "Transfer To Voy. No.");
        if Jobs.Find('-') then exit(Jobs."Ending Date");
    end;

    procedure ETD(): Date
    begin
        //AAA-Mar 06, 2003
        Jobs.SetCurrentKey(Jobs.Vessel);
        Jobs.SetRange(Jobs.Vessel, "Transfer-to Code");
        Jobs.SetRange(Jobs."Voyage No.", "Transfer To Voy. No.");
        if Jobs.Find('-') then exit(Jobs."Starting Date");
    end;

    var
        Jobs: Record Job;
}
