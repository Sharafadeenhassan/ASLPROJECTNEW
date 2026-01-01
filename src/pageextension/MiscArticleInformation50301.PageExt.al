pageextension 50301 "pageextension50301" extends "Misc. Article Information"
{
    layout
    {
        addafter("In Use")
        {
            field("Mat Type"; Rec."Mat Type")
            {
                ApplicationArea = All;
            }
            field("Item No."; Rec."Item No.")
            {
                ApplicationArea = All;
            }
            field(Returnable; Rec.Returnable)
            {
                ApplicationArea = All;
            }
            field("Default Quantity"; Rec."Default Quantity")
            {
                ApplicationArea = All;
            }
            field("Last Date Collected"; Rec."Last Date Collected")
            {
                ApplicationArea = All;
            }
        }
        addafter(Control1905767507)
        {
            part("Collection History"; "Employee Material Issue")
            {
                SubPageLink = "Claim by Employee" = FIELD("Employee No."),
                              Processed = CONST(true),
                              "Item No." = FIELD("Item No.");
                ApplicationArea = All;
            }
        }
    }
}
