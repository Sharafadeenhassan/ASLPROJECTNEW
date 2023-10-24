tableextension 50221 "tableextension50221" extends "Incoming Document Attachment"
{
    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    IncomingDocumentAttachment.SetRange("Incoming Document Entry No.","Incoming Document Entry No.");
    IncomingDocumentAttachment.SetFilter("Line No.",'<>%1',"Line No.");

    if Default then begin
      if not IncomingDocumentAttachment.IsEmpty then
    #6..9
      if not IncomingDocumentAttachment.IsEmpty then
        Error(MainAttachErr);
    end;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    IncomingDocumentAttachment.SetRange("Incoming Document Entry No.","Incoming Document Entry No.");
    IncomingDocumentAttachment.SetFilter("Line No.",'<>%1',IncomingDocumentAttachment."Line No.");
    #3..12
    */
    //end;
}
