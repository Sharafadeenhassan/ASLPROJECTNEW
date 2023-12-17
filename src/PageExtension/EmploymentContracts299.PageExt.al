pageextension 50299 "pageextension50299" extends "Employment Contracts"
{
    layout
    {
        addafter(Description)
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
            }
            field(ResCode; Rec.ResCode)
            {
                ApplicationArea = All;
            }
            field(Group; Rec.Group)
            {
                ApplicationArea = All;
            }
            field("Unique Cd No"; Rec."Unique Cd No")
            {
                ApplicationArea = All;
            }
        }
    }
}
