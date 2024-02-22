pageextension 50259 "Item Card Ext" extends "Item Card"
{
    layout
    {
        // modify("Item Category Code") {Visible = true;}
        modify("Shelf No.") { Caption = 'Phy. Verification Date'; }
        modify("Qty. on Prod. Order") { Importance = Additional; }
        modify("Qty. on Component Lines") { Importance = Additional; }
        modify("Costing Method") { Editable = false; }
        // modify("Standard Cost") {Editable = false;}
        modify("Last Direct Cost") { Editable = false; }
        modify("Indirect Cost %")
        {
            Importance = Standard;
            Editable = false;
        }
        modify("Allow Invoice Disc.") { Importance = Additional; }
        modify("Stockkeeping Unit Exists") { Importance = Additional; }
        modify("Safety Lead Time") { Importance = Additional; }
        modify("Safety Stock Quantity") { Importance = Additional; }
        modify("Maximum Inventory") { Importance = Additional; }
        modify("Minimum Order Quantity") { Importance = Additional; }
        modify("Maximum Order Quantity") { Visible = true; }

        addafter(Inventory)
        {
            field("CRM / STR"; "CRM / STR")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Item Category Code")
        {
            field("FT Product";"FT Product")
            {
                ApplicationArea = All;
            }
            field("Last Imported Cost"; Rec."Last Imported Cost")
            {
                ApplicationArea = All;
            }
        }
        addafter("Unit Price")
        {
            field("Foreign Posting Group"; Rec."Foreign Posting Group")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
            }
            field("Local Posting Group"; Rec."Local Posting Group")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
            }
            field("Last Purchase Cost"; Rec."Last Purchase Cost")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
            }
            field("Last Local Cost"; Rec."Last Local Cost")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
            }
            field("Last Direct Cost2"; Rec."Last Direct Cost2")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
            }
        }

        addafter("Indirect Cost %")
        {
            field("Inventory Value Zero"; Rec."Inventory Value Zero")
            {
                ApplicationArea = all;

                trigger OnValidate()
                begin
                    Rec."Indirect Cost %" := Rec."ASL Indirect Cost %";
                end;
            }
            field("ASL Indirect Cost %"; Rec."ASL Indirect Cost %")
            {
                ApplicationArea = Basic, Suite;
                Importance = Additional;
            }
        }

        //Unsupported feature: Property Modification (Level) on "GTIN(Control 135)".
        //Unsupported feature: Property Modification (Level) on "Inventory(Control 14)".
        //Unsupported feature: Property Modification (Name) on "Inventory(Control 14)".
        //Unsupported feature: Property Modification (SourceExpr) on "Inventory(Control 14)".
        //Unsupported feature: Property Modification (Level) on "InventoryNonFoundation(Control 205)".
        //Unsupported feature: Property Modification (Level) on ""Net Weight"(Control 196)".
        //Unsupported feature: Property Modification (Level) on ""Gross Weight"(Control 235)".
        //Unsupported feature: Property Modification (Level) on ""Unit Volume"(Control 60)".
        //Unsupported feature: Property Modification (Level) on ""Costing Method"(Control 24)".
        //Unsupported feature: Property Modification (Level) on ""Standard Cost"(Control 28)".
        //Unsupported feature: Property Modification (Level) on ""Unit Cost"(Control 30)".
        //Unsupported feature: Property Modification (Level) on ""Indirect Cost %"(Control 155)".
        //Unsupported feature: Property Modification (Name) on ""Indirect Cost %"(Control 155)".
        //Unsupported feature: Property Modification (SourceExpr) on ""Indirect Cost %"(Control 155)".
        //Unsupported feature: Property Modification (ImplicitType) on ""Indirect Cost %"(Control 155)".
        //Unsupported feature: Property Modification (Level) on ""Last Direct Cost"(Control 32)".
        //Unsupported feature: Property Modification (Level) on ""Cost is Adjusted"(Control 238)".
        //Unsupported feature: Property Modification (Level) on ""Cost is Posted to G/L"(Control 26)".
        //Unsupported feature: Property Modification (Level) on ""Gen. Prod. Posting Group"(Control 95)".
        //Unsupported feature: Property Modification (Level) on ""VAT Prod. Posting Group"(Control 66)".
        //Unsupported feature: Property Modification (Level) on ""Inventory Posting Group"(Control 40)".
        //Unsupported feature: Property Modification (Level) on ""Default Deferral Template Code"(Control 136)".
        //Unsupported feature: Property Modification (Level) on ""Tariff No."(Control 62)".
        //Unsupported feature: Property Modification (Level) on ""Country/Region of Origin Code"(Control 93)".
        //Unsupported feature: Property Modification (Level) on ""Purchasing Blocked"(Control 216)".
        //Unsupported feature: Property Modification (Level) on ""Overhead Rate"(Control 153)".
        //Unsupported feature: Property Modification (Level) on "Control8(Control 8)".
        //Unsupported feature: Property Modification (Name) on "Reserve(Control 59)".
        //Unsupported feature: Property Modification (SourceExpr) on "Reserve(Control 59)".
        //Unsupported feature: Property Modification (ImplicitType) on "Reserve(Control 59)".
        //Unsupported feature: Property Deletion (Importance) on "Inventory(Control 14)".

        //***
        modify(ItemAttributesFactbox) { Visible = false; }
        addfirst(OrderModifiers)
        {
            field("Monthly Consumption"; rec."Monthly Consumption")
            {
                ApplicationArea = All;
            }
        }
        addafter("Use Cross-Docking")
        {
            field("Commission Group"; Rec."Commission Group")
            {
                ApplicationArea = All;
            }
            field("SF Cat"; Rec."SF Cat")
            {
                ApplicationArea = All;
            }
            field("S/No."; Rec."S/No.")
            {
                ApplicationArea = All;
            }
            field("Pack Size (Kg)."; Rec."Pack Size (Kg).")
            {
                ApplicationArea = All;
            }
            field(Pack; Rec.Pack)
            {
                ApplicationArea = All;
            }
            field("Ves Budg Type 1"; Rec."Ves Budg Type 1")
            {
                ApplicationArea = All;
            }
            field("Ves Budg Type 2"; Rec."Ves Budg Type 2")
            {
                ApplicationArea = All;
            }
            field("Ves Budg Type 3"; Rec."Ves Budg Type 3")
            {
                ApplicationArea = All;
            }
            field("Annual Budget Method"; Rec."Annual Budget Method")
            {
                ApplicationArea = All;
            }
            field("Transferred (Qty.)"; Rec."Transferred (Qty.)")
            {
                ApplicationArea = All;
            }
        }
        addafter("Base Unit of Measure")
        {
            field(Points; Rec.Points)
            {
                ApplicationArea = All;
            }
        }
        addafter("Use Cross-Docking")
        {
            field("Statistics Group"; Rec."Statistics Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Attached Documents")
        {
            part(ItemAttributesFactbox2; "Item Attributes Factbox")
            {
                ApplicationArea = Basic, Suite;
            }
        }

        //****AAA - the below moveafter requires refactoring
        // moveafter(Description; Type)
        // moveafter("Base Unit of Measure"; "Item Category Code")
        // moveafter("Item Category Code"; "Last Direct Cost")
        // moveafter("Last Direct Cost"; "Service Item Group")
        // moveafter("Search Description"; "Qty. on Purch. Order")
        // moveafter("Qty. on Job Order"; Reserve)
        // moveafter("Item Category Code"; "Qty. on Assembly Order")
        // moveafter("Last Date Modified"; StockoutWarningDefaultYes)
        // moveafter(PreventNegInventoryDefaultNo; "Prices & Sales")
        // moveafter("Prices & Sales"; "Costing Method")
        // moveafter("Costing Method"; "Cost is Adjusted")
        // moveafter("Cost is Posted to G/L"; "Standard Cost")
        // moveafter("Unit Cost"; "Overhead Rate")
        // moveafter("Overhead Rate"; "Price/Profit Calculation")
        // moveafter("Price/Profit Calculation"; SpecialPricesAndDiscountsTxt)
        moveafter(SpecialPricesAndDiscountsTxt; "Unit Price", "Gen. Prod. Posting Group")
        // moveafter("Default Deferral Template Code"; "Allow Invoice Disc.")
        // moveafter("Sales Unit of Measure"; "Application Wksh. User ID")
        // moveafter("Application Wksh. User ID"; "Indirect Cost %")
        // moveafter(Reserve; Replenishment)
        // // moveafter("Purch. Unit of Measure"; Control230)
        // moveafter("Flushing Method"; "Scrap %")
        // moveafter("Assembly Policy"; Planning)
        // moveafter("Reordering Policy"; "Order Tracking Policy")
        // // moveafter("Order Modifiers"; "Unit Volume")
        // moveafter("Unit Volume"; Control61)
        // moveafter(GTIN; "Tariff No.")
        // moveafter("Country/Region of Origin Code"; "Net Weight")
    }
    actions
    {
        // modify(ActionContainer1900000003)
        // {
        //     //Unsupported feature: Property Modification (Name) on "ActionContainer1900000003(Action 1900000003)".

        //     Caption = 'Operation';
        // }
        modify(Sales) { Visible = false; }
        modify("Item Journal") { Visible = false; }
        modify("Item Reclassification Journal") { Visible = false; }

        //Unsupported feature: Property Deletion (Level) on "ActionContainer1900000003(Action 1900000003)".

        addafter(Navigation_Warehouse)
        {
            group(Action201)
            {
                Caption = 'Operation';
            }
        }
    }

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.geT(UserId) then
            if not UserSetup."Modify Item" then
                CurrPage.Editable(false)
            else
                CurrPage.Editable(true);
    end;
}
