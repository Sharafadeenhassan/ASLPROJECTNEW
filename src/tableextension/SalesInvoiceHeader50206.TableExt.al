tableextension 50206 "Sales Invoice Header Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "IRN Code"; Code[50])
        {        
        }
        field(50101; "QR Code"; Blob)
        {        
        }
        field(50102; "E-Invoice Status"; Option)
        {
            OptionMembers = Pending,Generated,Cancelled,Error;
        }
        field(50301; "Contr. Code/Postn.  Applied"; Option)
        {
            OptionMembers = "01-Skipper","02-Marine Eng","03-Coxswain","04-Eng Superv","05-Shr Mast/Sail","06-Mec/Carp/Wel/Secu","07-Others";
        }
        field(50302; "Appraisal Selection"; Option)
        {
            Description = ' ,Interview,Skill & Performance';
            OptionMembers = " ",Interview,"Skill & Performance";
        }
        field(50303; "Skill Score"; Decimal)
        {
        }
        field(50304; "Skill Total"; Decimal)
        {
        }
        field(50305; "Skill Percentage"; Decimal)
        {
            trigger OnLookup()
            begin
                /*//Univision Start 31/10/01 Yusuf
                  "Skill Percentage":=0;
                 IF "Skill Total" > 0 THEN
                    "Skill Percentage":=("Skill Score"/"Skill Total")*100
                ELSE
                 "Skill Percentage":=0;
                // Univision Finish 31/10/01 Yusuf
                */
            end;
        }
        field(50306; "Performance Score"; Decimal)
        {
        }
        field(50307; "Performance Total"; Decimal)
        {
        }
        field(50308; "Performance Percentage"; Decimal)
        {
            trigger OnLookup()
            begin

                /*//Univision Start 31/10/01 Yusuf
                "Performance Percentage":=0;
                IF "Performance Total" >0 THEN
                   "Performance Percentage":=("Performance Score"/"Performance Total")*100
                ELSE
                  "Performance Percentage":=0;

                // Univision Finish 31/10/01 Yusuf
                */
            end;
        }
        field(50309; "Total Percentage"; Decimal)
        {
            trigger OnLookup()
            begin
                /*
                // Univision Start 31/10/01 Yusuf
                "Total Percentage":=0;
                  ttscore:= "Skill Score"+"Performance Score";
                 Result:= "Skill Total"+"Performance Total";
                 IF Result>0 THEN
                 "Total Percentage":=(ttscore/Result)*100
                 ELSE
                 "Total Percentage":=0;

                // Univision Finish 31/10/01 Yusuf
                */
            end;
        }
        field(50380; "Container Code"; Code[10])
        {
        }
        field(50381; "Seal No"; Code[15])
        {
        }
        field(50384; "Shipment Month"; Option)
        {
            OptionMembers = Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec;
        }
    }
    procedure EInvoiceGenerateStatusText(var SalesInvoiceHeaderRec: Record "Sales Invoice Header");
                var
                    ExportBuffer: Record "JSON Export Buffer";
                    ExPortBuffer2: Record "JSON Export Buffer";
                    JsonBuilder: Codeunit "Sales Invoice JSON Builder";
                    OutStream: OutStream;
                    JsonText: Text;
                begin
                    ExportBuffer.DELETEALL;
                    JsonText := JsonBuilder.BuildPostedSalesInvoiceJson(SalesInvoiceHeaderRec);
                    ExportBuffer.Init();
                    if ExPortBuffer2.FindLast() then
                        ExportBuffer.ID := ExPortBuffer2.ID + 1
                    else
                        ExportBuffer.ID := 1;
                    ExportBuffer.FileName := 'Invoice_' + SalesInvoiceHeaderRec."No." + '.json';
                    ExportBuffer.Content.CreateOutStream(OutStream);
                    OutStream.WriteText(JsonText);
                    ExportBuffer.Insert();
                   // SalesInvoiceHeaderRec."IRN Code" := ExportBuffer.FileName;
                    //SalesInvoiceHeaderRec."E-Invoice Status" := 1; // Generated
                    //SalesInvoiceHeaderRec.Modify(true);

                    DownloadFromRecord(ExportBuffer); // ✅ Now this works
                end;
procedure DownloadFromRecord(Buffer: Record "JSON Export Buffer")
    var
        InStream: InStream;
        FileName: Text;
    begin
        Buffer.Content.CreateInStream(InStream);
        FileName := Buffer.FileName;
        DownloadFromStream(InStream, Buffer.FileName, 'application/json', '*.json', FileName);
    end;

}
