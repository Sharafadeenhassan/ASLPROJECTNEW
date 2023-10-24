tableextension 50228 "tableextension50228" extends Resource
{
    fields
    {
        modify("Base Unit of Measure")
        {
            TableRelation = "Unit of Measure" WHERE(UOMTYPE = CONST(Standard));
        }
        field(50300; Posted; Boolean)
        {
        }
        field(50301; "Sick Leave"; Boolean)
        {
        }
        field(50302; "Annual Leave"; Boolean)
        {
        }
        field(50303; "Casual Leave"; Boolean)
        {
        }
        field(50304; Suspension; Boolean)
        {
        }
        field(50305; "Posted To Operation"; Integer)
        {
            BlankZero = true;
        }
        field(50306; "Posted To Operation Voyage No."; Code[10])
        {
            CalcFormula = Max("Job Planning Line"."Job No." WHERE(Type = CONST(Resource),
                                                                   "No." = FIELD("No."),
                                                                   "Ended Voyage" = CONST(false)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50320; Points; Decimal)
        {
            CalcFormula = Sum(Job."Points Sort Bay" WHERE(Captain = FIELD("No."),
                                                           "Voyage Ended" = CONST(false)));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50322; "Points Sort Bay"; Decimal)
        {
            Description = 'To retain Value from calculated field points in prep for sorting the records';
        }
        field(50324; "Points Average"; Decimal)
        {
            CalcFormula = Average(Job."Points Sort Bay" WHERE(Captain = FIELD("No."),
                                                               "Points Sort Bay" = FILTER(<> 0),
                                                               "Voyage Ended" = CONST(false)));
            DecimalPlaces = 0 : 5;
            Description = 'Average of only Vessels with Points';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50326; "Points Average Sort Bay"; Decimal)
        {
            Description = 'To retain Average point';
        }
        field(50327; "Country Code"; Code[10])
        {
            Caption = 'Country Code';
        }
        field(50328; "Passport No."; Code[15])
        {
        }
        field(50329; Nationality; Option)
        {
            OptionCaption = ',Nigerian,Indian,Ghanaian';
            OptionMembers = ,Nigerian,Indian,Ghanaian;
        }
        field(50330; "Valid From"; Date)
        {
        }
        field(50331; "Valid To"; Date)
        {
        }
    }
    keys
    {
        //Unsupported feature: Deletion (KeyCollection) on "Type(Key)".

        key(ASLKey1; Posted)
        {
        }
        key(Key2; "Points Sort Bay")
        {
        }
        key(Key3; "Points Average Sort Bay")
        {
        }

        //Unsupported feature: Move on ""Base Unit of Measure"(Key)".
    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CheckJobPlanningLine;

    MoveEntries.MoveResEntries(Rec);
    #4..40
    ResUnitMeasure.DeleteAll;

    SalesOrderLine.SetCurrentKey(Type,"No.");
    SalesOrderLine.SetRange(Type,SalesOrderLine.Type::Resource);
    SalesOrderLine.SetRange("No.","No.");
    if SalesOrderLine.FindFirst then
      Error(SalesDocumentExistsErr,"No.",SalesOrderLine."Document Type");

    if ExistUnprocessedTimeSheets then
      Error(Text006,TableCaption,"No.");

    DimMgt.DeleteDefaultDim(DATABASE::Resource,"No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..43
    SalesOrderLine.SetFilter("Document Type",'%1|%2',
      SalesOrderLine."Document Type"::Order,
      SalesOrderLine."Document Type"::Appraisal);
    SalesOrderLine.SetRange(Type,SalesOrderLine.Type::Resource);
    SalesOrderLine.SetRange("No.","No.");
    if SalesOrderLine.FindFirst then begin
      if SalesOrderLine."Document Type" = SalesOrderLine."Document Type"::Order then
        Error(Text000,TableCaption,"No.");
      if SalesOrderLine."Document Type" = SalesOrderLine."Document Type"::Appraisal then
        Error(Text003,TableCaption,"No.");
    end;
    #48..52
    */
    //end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      ResSetup.Get;
      ResSetup.TestField("Resource Nos.");
    #4..6
    if GetFilter("Resource Group No.") <> '' then
      if GetRangeMin("Resource Group No.") = GetRangeMax("Resource Group No.") then
        Validate("Resource Group No.",GetRangeMin("Resource Group No."));

    DimMgt.UpdateDefaultDim(
      DATABASE::Resource,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..9
    "Global Dimension 2 Code":='ATLANTIC';     //AAA - Oct 2002
    #11..13
      userrec.Get(UserId);
    if not userrec."Edit Resource" then
    Error('You cannot make changes in this form');
    */
    //end;

    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Date Modified" := Today;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    {
    userrec.GET(USERID);
                   IF NOT userrec."Edit Resource" THEN
                     ERROR('You cannot make changes in this PAGE');
    "Last Date Modified" := TODAY;
    }
    */
    //end;

    local procedure "Employee No."(): Text[100]
    begin
        employee.SetCurrentKey(employee."Resource No.");
        employee.SetRange(employee."Resource No.", "No.");
        if employee.Find('-') then
            exit(employee."No.");
    end;

    var
        employee: Record Employee;
}
