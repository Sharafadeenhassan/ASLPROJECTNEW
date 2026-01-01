pageextension 50200 "Posted Sales Invoice " extends "Posted Sales Invoices"
{
    layout
    {
        addlast(Content)
        {
            group("E-Invoice Details")
            {
                field("IRN Code"; Rec."IRN Code")
                {
                    ApplicationArea = All;
                }
                field("QR Code"; Rec."QR Code")
                {
                    ApplicationArea = All;
                }
                field("E-Invoice Status"; Rec."E-Invoice Status")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        addlast(Processing)
        {
            action(ExportInvoiceJson)
            {
                Caption = 'Export Invoice JSON';
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
                    JsonText := JsonBuilder.BuildPostedSalesInvoiceJson(Rec);
                    ExportBuffer.Init();
                    if ExPortBuffer2.FindLast() then
                        ExportBuffer.ID := ExPortBuffer2.ID + 1
                    else
                        ExportBuffer.ID := 1;
                    ExportBuffer.FileName := 'Invoice_' + Rec."No." + '.json';
                    ExportBuffer.Content.CreateOutStream(OutStream);
                    OutStream.WriteText(JsonText);
                    ExportBuffer.Insert();
                    //rec."IRN Code" := ExportBuffer.FileName;
                    //rec."E-Invoice Status" := 1; // Generated
                    //rec.Modify(true);

                    DownloadFromRecord1(ExportBuffer); // ✅ Now this works
                end;
            }
            action(ExportElectronicInvoiceXml)
            {
                Caption = 'Export Electronic Invoice';
                Image = Export;
                ApplicationArea = All;
                RunObject = XMLport "Electronic Invoice Port";

            }
            action(ExportElectronicInvoiceExcel)
            {
                Caption = 'Export Electronic Invoice Excel';
                Image = ExportToExcel;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Report.Run(Report::"Elec Inv Excel Export");
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

