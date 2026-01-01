page 50024 "Applicant Picture"
{
    PageType = Card;
    SourceTable = Applicants;
    Caption = 'Applicant Picture';
    layout
    {
        area(content)
        {
            field(Picture; Rec.Picture)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Picture")
            {
                Caption = '&Picture';
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;
                    ApplicationArea = All;

                    /* trigger OnAction()
                     begin
                         PictureExists := Picture.HasValue;
                         if Picture.Import('*.bmp', true) = '' then
                             exit;
                         if PictureExists then
                             if not Confirm('Do you want to replace the existing picture of %1 %2?', false, TableName, "No.") then
                                 exit;
                         CurrPage.SaveRecord;
                     end; */
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;
                    ApplicationArea = All;

                    /*  trigger OnAction()
                      begin
                          if Picture.HasValue then
                           Picture.Export('*.bmp', true);
                      end;
                      */
                }
                action(Delete)
                {
                    Caption = 'Delete';
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        if Rec.Picture.HasValue then
                            if Confirm('Do you want to delete the picture of %1 %2?', false, Rec.TableName, Rec."No.") then begin
                                Clear(Rec.Picture);
                                CurrPage.SaveRecord();
                            end;
                    end;
                }
            }
        }
    }
}
