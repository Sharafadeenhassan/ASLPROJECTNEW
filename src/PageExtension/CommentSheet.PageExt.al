pageextension 50211 "pageextension50211" extends "Comment Sheet"
{
    layout
    {
        //Unsupported feature: Property Modification (ImplicitType) on "Comment(Control 4)".
        modify(Comment)
        {
            Visible = false;
        }
        addafter("Code")
        {
            field("Fuel Consumed"; Rec."Fuel Consumed")
            {
                ApplicationArea = All;
            }
            field("Fuel Days"; Rec."Fuel Days")
            {
                ApplicationArea = All;
            }
            field("Fuel Average"; Rec."Fuel Average")
            {
                ApplicationArea = All;
            }
            field("Comment Temp"; "Comment Temp")
            {
                ApplicationArea = All;
                Caption = 'ASL Comment';
                Editable = true;

               /* trigger OnValidate()
                begin
                    rec.Comment := CopyStr(rec."Comment Temp", 1, 80);
                end;
                */
            }
        }
    }

    //Unsupported feature: Code Modification on "OnNewRecord".

    //trigger OnNewRecord(BelowxRec: Boolean)
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetUpNewLine;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    //SetUpNewLine;
    SetUpNewLine(Rec); ///AAA
    */
    //end;
}
