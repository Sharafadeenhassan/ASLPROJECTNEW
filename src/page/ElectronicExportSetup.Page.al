page 50189 "Electronic Export Setup Part"
{
    PageType = CardPart;
    SourceTable = "Electronic Export Setup";
    Caption = 'Electronic Export Setup';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Export Folder Path"; Rec."Export Folder Path")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specify the default folder path for exporting files.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec."Primary Key" := 'DEFAULT';
            if Rec.Insert() then;
        end;
    end;
}