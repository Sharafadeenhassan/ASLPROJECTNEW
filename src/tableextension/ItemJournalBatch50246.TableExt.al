tableextension 50246 "tableextension50246" extends "Item Journal Batch"
{
    fields
    {
        field(50300; "Transfer From"; Code[10])
        {
            TableRelation = Location;
        }
        field(50301; "Transfer To"; Code[10])
        {
            TableRelation = Location;
        }
        field(50302; "Document No."; Code[20])
        {
            CalcFormula = Max("Item Journal Line"."Document No." WHERE("Journal Template Name" = FIELD("Journal Template Name"),
                                                                        "Journal Batch Name" = FIELD(Name)));
            FieldClass = FlowField;
            Editable = false;
        }
        field(50358; "Gen. Bus. Posting Group"; Code[10])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group";

            trigger OnValidate()
            begin
                if "Gen. Bus. Posting Group" <> xRec."Gen. Bus. Posting Group" then begin
                    ItemJnlLine.SetRange("Journal Template Name", "Journal Template Name");
                    ItemJnlLine.SetRange("Journal Batch Name", Name);
                    ItemJnlLine.ModifyAll("Gen. Bus. Posting Group", "Gen. Bus. Posting Group");
                    Modify();
                end;
            end;
        }
        field(50359; "Entry Type"; Option)
        {
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output;
        }
        field(50360; "Lock batch"; Boolean)
        {
        }
    }
    var
        ItemJnlLine: Record "Item Journal Line";
}
