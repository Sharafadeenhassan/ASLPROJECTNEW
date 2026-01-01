pageextension 50800 "Posted Sales Credit Memo" extends "Posted Sales Credit Memos"
{
    layout
    {
        addlast(Content)
        {
            group("E-Invoice Details")
            {
                // Fields removed as they do not exist in Sales Cr.Memo Header
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(ExportCreditMemoJson)
            {
                Caption = 'Export Credit Memo JSON';
                Image = Export;
                ApplicationArea = All;

                trigger OnAction()
                var
                    ExportBuffer: Record "JSON Export Buffer";
                    ExPortBuffer2: Record "JSON Export Buffer";
                    JsonBuilder: Codeunit "Sales Invoice JSON Builder";
                    OutStream: OutStream;
                    JsonText: Text;
                begin
                    ExportBuffer.DELETEALL;
                    JsonText := JsonBuilder.BuildPostedSalesCrMemoJson(Rec);
                    ExportBuffer.Init();
                    if ExPortBuffer2.FindLast() then
                        ExportBuffer.ID := ExPortBuffer2.ID + 1
                    else
                        ExportBuffer.ID := 1;
                    ExportBuffer.FileName := 'CreditMemo_' + Rec."No." + '.json';
                    ExportBuffer.Content.CreateOutStream(OutStream);
                    OutStream.WriteText(JsonText);
                    ExportBuffer.Insert();
                    DownloadFromRecord1(ExportBuffer);
                end;
            }
            action(ExportElectronicCreditMemoExcel)
            {
                Caption = 'Export Electronic Credit Memo Excel';
                Image = ExportToExcel;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Report.Run(Report::"Elec Cr Memo Excel Export");
                end;
            }
        }
    }

    procedure DownloadFromRecord1(Buffer: Record "JSON Export Buffer")
    var
        InStream: InStream;
        FileName: Text;
    begin
        Buffer.Content.CreateInStream(InStream);
        FileName := Buffer.FileName;
        DownloadFromStream(InStream, Buffer.FileName, 'application/json', '*.json', FileName);
    end;
}