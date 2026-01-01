tableextension 50237 "CustomerExt" extends Customer
{
    fields
    {
        //modify("Shipping Advice")
        // {
        //OptionCaption = 'Complete,Partial';

        //Unsupported feature: Property Modification (OptionString) on ""Shipping Advice"(Field 5750)".

        //  }
        field(50200;"Business Description"; Text[150])
        {
            Caption = 'Business Description';
            DataClassification = CustomerContent;
        }
        field(50201; "Tax Registration No."; Code[20])
        {
            Caption = 'Tax Registration No.';
            DataClassification = CustomerContent;
        }
        field(50300; "Operation Type"; Boolean)
        {
            Description = 'Customer Type is Operation : Customers to be listed on Operation (Job) Card';
            InitValue = false;
        }
        field(50301; "Entry Type Filter"; Option)
        {
            Caption = 'Entry Type';
            Description = 'Balace at date rep.';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Initial Entry,Application,Unrealized Loss,Unrealized Gain,Realized Loss,Realized Gain,Payment Discount,Payment Discount (VAT Excl.),Payment Discount (VAT Adjustment),Appln. Rounding,Correction of Remaining Amount';
            OptionMembers = " ","Initial Entry",Application,"Unrealized Loss","Unrealized Gain","Realized Loss","Realized Gain","Payment Discount","Payment Discount (VAT Excl.)","Payment Discount (VAT Adjustment)","Appln. Rounding","Correction of Remaining Amount";
        }
    }

    keys
    {
        key(ASLKey1; "Operation Type")
        {
        }
    }

    trigger OnInsert()
    begin
        if UserRec.Get(UserId) then
            if not UserRec."Modify Customer" then Error('You Can Not Create New Customer');
        "Global Dimension 2 Code" := 'ATLANTIC';     //AAA - Oct 2002
        if "No." <> '' then
            "Shipping Advice" := "Shipping Advice"::Partial; //#1
        UpdateReferencedIds();
        // SetLastModifiedDateTime;
    end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "No." = '' then begin
      SalesSetup.Get;
      SalesSetup.TestField("Customer Nos.");
    #4..8

    if (not (InsertFromContact or (InsertFromTemplate and (Contact <> '')) or IsTemporary)) or ForceUpdateContact then
      UpdateContFromCust.OnInsert(Rec);

    if "Salesperson Code" = '' then
      SetDefaultSalesperson;

    DimMgt.UpdateDefaultDim(
      DATABASE::Customer,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");

    UpdateReferencedIds;
    SetLastModifiedDateTime;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    if UserRec.Get(UserId) then
      if not UserRec."Modify Customer" then Error('You Can Not Create New Customer');
    #1..11
    "Global Dimension 2 Code":='ATLANTIC';     //AAA - Oct 2002
    #12..18
    if "No." <> '' then
    "Shipping Advice" := "Shipping Advice"::Partial; //#1
    UpdateReferencedIds;
    SetLastModifiedDateTime;
    */
    //end;

    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    UpdateReferencedIds;
    SetLastModifiedDateTime;
    if IsContactUpdateNeeded then begin
    #4..7
        if Find then;
      end;
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //The code has been merged but contained errors that could prevent import
    //and the code has been put in comments. Use Shift+Ctrl+O to Uncomment
    //{>>>>>>>} ORIGINAL
    //"Last Date Modified" := TODAY;
    //
    //IF (Name <> xRec.Name) OR
    //   ("Search Name" <> xRec."Search Name") OR
    //   ("Name 2" <> xRec."Name 2") OR
    //   (Address <> xRec.Address) OR
    //   ("Address 2" <> xRec."Address 2") OR
    //   (City <> xRec.City) OR
    //   ("Phone No." <> xRec."Phone No.") OR
    //   ("Telex No." <> xRec."Telex No.") OR
    //   ("Territory Code" <> xRec."Territory Code") OR
    //   ("Currency Code" <> xRec."Currency Code") OR
    //   ("Language Code" <> xRec."Language Code") OR
    //   ("Salesperson Code" <> xRec."Salesperson Code") OR
    //   ("Country/Region Code" <> xRec."Country/Region Code") OR
    //   ("Fax No." <> xRec."Fax No.") OR
    //   ("Telex Answer Back" <> xRec."Telex Answer Back") OR
    //   ("VAT Registration No." <> xRec."VAT Registration No.") OR
    //   ("Post Code" <> xRec."Post Code") OR
    //   (County <> xRec.County) OR
    //   ("E-Mail" <> xRec."E-Mail") OR
    //   ("Home Page" <> xRec."Home Page") OR
    //   (Contact <> xRec.Contact)
    //THEN BEGIN
    //{=======} MODIFIED
    if UserRec.Get(UserId) then
     if not UserRec."Modify Customer" then Error('You Can Not Modify Any Customer');
    "Last Date Modified" := Today;
    //
    //IF (Name <> xRec.Name) OR
    //   ("Search Name" <> xRec."Search Name") OR
    //   ("Name 2" <> xRec."Name 2") OR
    //   (Address <> xRec.Address) OR
    //   ("Address 2" <> xRec."Address 2") OR
    //   (City <> xRec.City) OR
    //   ("Phone No." <> xRec."Phone No.") OR
    //   ("Telex No." <> xRec."Telex No.") OR
    //   ("Territory Code" <> xRec."Territory Code") OR
    //   ("Currency Code" <> xRec."Currency Code") OR
    //   ("Language Code" <> xRec."Language Code") OR
    //   ("Salesperson Code" <> xRec."Salesperson Code") OR
    //   ("Country/Region Code" <> xRec."Country/Region Code") OR
    //   ("Fax No." <> xRec."Fax No.") OR
    //   ("Telex Answer Back" <> xRec."Telex Answer Back") OR
    //   ("VAT Registration No." <> xRec."VAT Registration No.") OR
    //   ("Post Code" <> xRec."Post Code") OR
    //   (County <> xRec.County) OR
    //   ("E-Mail" <> xRec."E-Mail") OR
    //   ("Home Page" <> xRec."Home Page") OR
    //   (Contact <> xRec.Contact)
    //THEN BEGIN

    #1..10
    */
    //end;

    //Unsupported feature: Property Modification (Fields) on "DropDown(FieldGroup 1)".

    var
        UserRec: Record "User Setup";
}
