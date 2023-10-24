tableextension 50208 "tableextension50208" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50301; "Contr. Code/Postn.  Applied"; Option)
        {
            OptionMembers = "01-Skipper","02-Marine Eng","03-Coxswain","04-Eng Superv","05-Shr Mast/Sail","06-Mec/Carp/Wel/Secu","07-Others";
        }
        field(50302; "Appraisal Selection"; Option)
        {
            Description = ' ,Interview,Skill & Performance';
            OptionMembers = " ",Interview,"Skill & Performance";
        }
        field(50303; "Skill Score"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE(Type = CONST(1),
                                                           "Document No." = FIELD("No."),
                                                           "Document Type" = CONST(Order)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50304; "Skill Total"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE("Document No." = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50305; "Skill Percentage"; Decimal)
        {
        }
        field(50306; "Performance Score"; Decimal)
        {
            CalcFormula = Sum("Sales Line".Quantity WHERE(
                                                           "Document No." = FIELD("No."),
                                                           "Document Type" = CONST(Order)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50307; "Performance Total"; Decimal)
        {
            CalcFormula = Sum("Sales Line".quantity1 WHERE(
                                                      "Document No." = FIELD("No.")));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50308; "Performance Percentage"; Decimal)
        {
        }
        field(50309; "Total Percentage"; Decimal)
        {
        }
        field(50380; "Container Code"; Code[10])
        {
        }
        field(50381; "Seal No"; Code[15])
        {
        }
        field(50385; "Return Quantity"; Decimal)
        {
            CalcFormula = - Sum("Sales Cr.Memo Line".Quantity WHERE("Document No." = FIELD("No."),
                                                                    "Item Category Code" = FIELD("Item Category Code filter")));
            DecimalPlaces = 0 : 0;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50386; "Item Category Code filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Item Category";
        }
    }
}
