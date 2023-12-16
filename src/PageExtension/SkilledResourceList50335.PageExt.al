pageextension 50335 "pageextension50335" extends "Skilled Resource List"
{
    var
        ServItemGrCode: Code[10];
        ServItemNo: Code[20];

    procedure InitializeForItem(Item: Record Item)
    begin
        ServItemGrCode := Item."Service Item Group";
        ServItemNo := Item."No.";
    end;
}
