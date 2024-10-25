table 50054 "Shop Lines"
{
    Caption = 'Shop Lines';
    DataClassification = ToBeClassified;
    LookupPageId = 50094;
    DrillDownPageId = 50094;
    fields
    {
        field(1;Code; Code[20])
        {
            Caption = 'Shop Code';
            TableRelation = "Shop Setup"."Shop Code";
        }
        field(2; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
        }
        field(3;"Line No.";Integer)
        {
            Caption = 'Line No.';
        
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item."No."; 
            trigger OnValidate()
            var ItemRec : Record Item;
            begin
                if ItemRec.get("Item No.") then
                Description := ItemRec.Description;        
                UnitPrice();
                Validate(Quantity);

            end;
            /*trigger OnLookup()
            var ItemRec : Record Item;            
            begin
               ItemRec.SetFilter(ItemRec."Location Filter",Code);
               ItemRec.CalcFields(ItemRec.Inventory,ItemRec."CRM / STR") 
            end; */      
        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
            Editable = false;
        }
        field(6; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            Editable = false;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0:5;
            trigger OnValidate()
            begin
                "Line Amount" := Quantity * "Unit Price";
                "Line Amount Due" := "Line Amount" - Discount;
            end;
        }
        field(8; "Line Amount"; Decimal)
        {
            Caption = 'Line Amount';
            Editable = false;
        }
        field(9; Discount; Decimal)
        {
            Caption = 'Discount';
            trigger OnValidate()
            begin
                "Line Amount Due" := "Line Amount"-Discount;
            end;
        }
        field(10; "Line Amount Due"; Decimal)
        {
            Caption = 'Line Amount Due';
            Editable = false;
        }
        field(11; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            Editable = false;
           // Enabled = false;
            
        }
        field(12; "General Device"; Code[20])
        {
            Caption = 'General Device';
            TableRelation = "Dimension Value".Code where("Global Dimension No."= const(2),"Dimension Value Type" = const(Standard));
        }
        field(13;Posted;Boolean)
        {
            Caption = 'Invoiced';
        }
        field(14;"Price Group";Code[20])
        {
            Caption = 'Customer Price group';
            TableRelation = "Customer Price Group".Code;
        }
        field(15;"Terminal No.";Code[20])
        {

        }
        field(16;"Transaction Date";Date)
        {
            Caption = 'Transaction Date';
            trigger OnValidate()
            begin
                rec."Posting Date" := rec."Transaction Date";
            end;
            
        }
        field(17;"Restore Header";Boolean)
        { 
        trigger OnValidate()
        var SaleInv: Record "Sales Invoice Header";
        begin
            SaleInv.SetRange("External Document No.",Rec."Invoice No.");
            if SaleInv.FindFirst() then;
            if not RecHeader.Get(rec.Code,rec."Invoice No.") then
            begin
                RecHeader.Init();
                RecHeader."Shop Code" := rec.Code;
                RecHeader."Invoice No.":= rec."Invoice No.";

                RecHeader."Posting date" := rec."Posting Date";
                RecHeader."General Device" := rec."General Device";
                RecHeader."Terminal No." := rec."Terminal No.";
                RecHeader.Post := true;
                RecHeader.paid := true;
                RecHeader."Customer No." := SaleInv."Bill-to Customer No."; 
                RecHeader."Cashier Code" := UserId;
                RecHeader.Insert();
            end;
        end;

        }
        field(18;"Header Exist";Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist(ShopHeader WHERE("Invoice No." = FIELD("Invoice No.")));
            Editable = false;        
        }
    
    }
    keys
    {
        key(PK; Code,"Invoice No.","Line No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        if RecHeader.Get(Code,"Invoice No.")  Then begin
            RecHeader.TestField(Post,false);
            "Terminal No." := RecHeader."Terminal No.";
            "Price Group" := RecHeader."Price Group";
            if RecHeader."Posting date" = 0D then 
            Validate("Transaction Date",Today) else
            Validate("Transaction Date",RecHeader."Posting date");
            "General Device" := RecHeader."General Device";
            
            if xRec."Line No." <> 0 then
            "Line No." := xRec."Line No." + 1000
        else
            "Line No." := 1000;
        
         //"Line No." += 10000;
        end;
        
    end;
    
    var PriceList : Record "Sales Price";
    ItemRec: Record Item; CustRec : Record Customer; RecHeader : Record ShopHeader;   

local procedure UnitPrice()
begin
    RecHeader.Get(Code,"Invoice No.");
    CustRec.get(RecHeader."Customer No.");
    PriceList.SetRange(PriceList."Item No.","Item No.");
    PriceList.SetRange(PriceList."Sales Code",CustRec."Customer Price Group");
    PriceList.Ascending;
    if PriceList.FindLast() then
    rec."Unit Price" := PriceList."Unit Price";
end;

}
