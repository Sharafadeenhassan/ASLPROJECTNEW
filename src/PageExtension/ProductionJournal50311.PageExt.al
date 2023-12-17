pageextension 50311 "pageextension50311" extends "Production Journal"
{
    layout
    {
        modify(Type)
        {
            OptionCaption = 'Work Center,Machine Center';
        }
        movebefore("Consump. Qty."; Quantity)
        modify(Quantity)
        {
            Visible = True;
        }
        modify("Location Code")
        {
            Visible = true;
        }
        modify("Gen. Prod. Posting Group")
        {
            Visible = true;
        }
        addafter("Scrap Quantity")
        {
            field("Consumed Quantity"; Rec."Consumed Quantity")
            {
                Visible = true;
                ApplicationArea = All;
            }
        }
    }

    //Unsupported feature: Property Deletion (CaptionML) on "Quantity(Control 23)".

    //Unsupported feature: Code Insertion on ""Scrap Quantity"(Control 128)".

    //trigger OnAfterValidate()
    //Parameters and return type have not been exported.
    //begin
    /*
    {
    IF "Entry Type" = "Entry Type"::Consumption THEN BEGIN
      IF (Quantity <> 0) AND ("Consumed Quantity" <> 0) AND ("Scrap Quantity" <> 0) THEN
      "Consumed Quantity" :=  Quantity - "Scrap Quantity";
     END;
     }
    */
    //end;
    //Unsupported feature: Property Modification (Id) on "DimVisible8(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimVisible8 : 1000;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimVisible8 : 1100;
    //Variable type has not been exported.
    //Unsupported feature: Code Modification on "ControlsMngt(PROCEDURE 1)".

    //procedure ControlsMngt();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if ("Entry Type" = "Entry Type"::Output) and
       ("Operation No." <> '')
    then
    #4..13
    WorkShiftCodeEditable := OperationExist;

    FinishedEditable := "Entry Type" = "Entry Type"::Output;
    ScrapCodeEditable := "Entry Type" = "Entry Type"::Output;
    ScrapQuantityEditable := "Entry Type" = "Entry Type"::Output;
    OutputQuantityEditable := "Entry Type" = "Entry Type"::Output;

    QuantityEditable := "Entry Type" = "Entry Type"::Consumption;
    AppliesFromEntryEditable := "Entry Type" = "Entry Type"::Consumption;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..16
    //ScrapCodeEditable := "Entry Type" = "Entry Type"::Output;
    //ScrapQuantityEditable := "Entry Type" = "Entry Type"::Output;
    OutputQuantityEditable := "Entry Type" = "Entry Type"::Output;

    ConsumedQuantityEditable := "Entry Type" = "Entry Type"::Consumption; //CODEWARE
    //QuantityEditable := "Entry Type" = "Entry Type"::Consumption;
    AppliesFromEntryEditable := "Entry Type" = "Entry Type"::Consumption;
    {<<<<<<<}
    */
    //end;

    //Unsupported feature: Code Modification on "ScrapQuantityOnFormat(PROCEDURE 19017313)".

    //procedure ScrapQuantityOnFormat();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    if "Entry Type" = "Entry Type"::Consumption then
      ScrapQuantityHideValue := true;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
      ScrapQuantityHideValue := true;
    */
    //end;
}
