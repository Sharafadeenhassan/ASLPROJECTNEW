tableextension 50292 "tableextension50292" extends "Misc. Article Information"
{
    fields
    {
        //Unsupported feature: Code Modification on ""Misc. Article Code"(Field 2).OnValidate".
        modify("Misc. Article Code")
        {
            trigger onaftervalidate()
            var
                MiscArticle: Record "Misc. Article";
            begin
                "Mat Type" := MiscArticle."Mat Type";
                "Item No." := MiscArticle."Item No.";
                Returnable := MiscArticle.Replaceable;
                "Replacement Interval" := MiscArticle."Replacement Interval";
            end;
        }
        //trigger  Article Code"(Field 2)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        MiscArticle.Get("Misc. Article Code");
        Description := MiscArticle.Description;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        MiscArticle.Get("Misc. Article Code");
        Description := MiscArticle.Description;
        */
        //end;
        field(50000; "Mat Type"; Option)
        {
            OptionMembers = " ","Stock Item";
        }
        field(50001; "Item No."; Code[20])
        {
            TableRelation = IF ("Mat Type" = CONST("Stock Item")) Item."No.";
        }
        field(50002; Returnable; Boolean)
        {
        }
        field(50003; "Last Date Collected"; Date)
        {
        }
        field(50004; "Replacement Interval"; DateFormula)
        {
        }
        field(50005; "Default Quantity"; Decimal)
        {
            InitValue = 1;
        }
    }
}
