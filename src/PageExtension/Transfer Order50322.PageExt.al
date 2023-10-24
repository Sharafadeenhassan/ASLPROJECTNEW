pageextension 50322 "pageextension50322" extends "Transfer Order"
{
    layout
    {
        addafter("Transfer-from")
        {
            field("Transfer From Voy. No."; Rec."Transfer From Voy. No.")
            {
                ApplicationArea = All;
            }
            field("Transfer To Voy. No."; Rec."Transfer To Voy. No.")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter(PostAndPrint)
        {
            action("Transfer Waybill")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Transfer Waybill';
                Image = Delivery;
                //RunObject = Report "Transfer Waybill";
                //RunPageOnRec = true;
                Promoted = true;

                trigger OnAction()
                var
                    TrasRec: Record "Transfer Header";
                begin
                    TrasRec.SetRange(TrasRec."No.", Rec."No.");
                    if TrasRec.FindFirst() then
                        REPORT.runmodal(50033, true, false, TrasRec);
                end;
            }
        }
    }

    //         moveafter("Transfer-to Code"; "Direct Transfer")
    //         modify("Direct Transfer")
    //         {
    //             ApplicationArea = Location;
    //             Editable = (rec.Status = rec.Status::Open); //AND EnableTransferFields;  //Refactor
    //             Importance = Promoted;
    //             ToolTip = 'Specifies that the transfer does not use an in-transit location. When you transfer directly, the Qty. to Receive field will be locked with the same value as the quantity to ship.';

    //             trigger OnAfterValidate()
    //             begin
    //                 CurrPage.Update;
    //             end;
    //         }

    //         addafter("Posting Date")
    //         {
    //             field("Transfer Template"; "Transfer Template")
    //             {
    //             }
    //         }
    //         moveafter("Assigned User ID"; "Transfer-from County")
    //         modify("Transfer-from County")
    //         {
    //             ApplicationArea = Location;
    //             Caption = 'County';
    //             Importance = Additional;
    //             QuickEntry = false;
    //         }

    //         moveafter("Transfer-to Post Code"; "Trsf.-to Country/Region Code")
    //         modify("Trsf.-to Country/Region Code")
    //         {
    //             ApplicationArea = Location;
    //             Caption = 'Country/Region';
    //             Importance = Additional;
    //             QuickEntry = false;
    //         }
    //     }
    //     actions
    //     {
    //         addfirst("O&rder")
    //         {
    //             action("Short Supply")
    //             {
    //                 RunObject = Report "Sales Register";
    //             }
    //         }
    /* addafter("&Print")
     {
         action("Print Delivery Note")
         {
             Image = Delivery;
             RunPageOnRec = true;

             trigger OnAction()
             begin
                 TrasRec.SetRange(TrasRec."No.", "No.");
                 if TrasRec.FindFirst() then
                     REPORT.runmodal(50033, true, false, TrasRec);
             end;
         }
     }*/
    //         addafter(PostAndPrint)
    //         {
    //             action("Post Through")
    //             {
    //                 Caption = 'Post Through';
    //                 Image = Post;

    //                 trigger OnAction()
    //                 begin
    //                     if Loc.Get("Transfer-from Code") then;
    //                     if Loc."Location Type" = 1 then TestField("Transfer From Voy. No.");
    //                     if Loc.Get("Transfer-to Code") then;
    //                     if Loc."Location Type" = 1 then TestField("Transfer To Voy. No.");
    //                     //TESTFIELD("Previous Voyage Expensed",TRUE);
    //                     CODEUNIT.Run(CODEUNIT::"TransferOrder-Post Shipment", Rec);
    //                     CurrPage.Update;
    //                     CODEUNIT.Run(CODEUNIT::"TransferOrder-Post Receipt", Rec);
    //                     IF UserSetup.GET("Assigned User ID") THEN
    //                       Recipient := UserSetup."E-Mail";
    //                     IF Recipient <> '' THEN BEGIN
    //                       MailBody := '';
    //                       MailBody := Mail.FormatTextForHtml(STRSUBSTNO('Hello,<br /> Your transfer order: %1 has been processed. <br />Regards.<br />',"No."));
    //                       Subject := STRSUBSTNO('Processed Transfer Order for Production - %1',"No.");
    //                       Mail.CreateMessage(Recipient,'','',Subject,MailBody,FALSE,FALSE);
    //                       Mail.Send;

    //                       END ELSE BEGIN
    //                       MailBody := Mail.FormatTextForHtml(STRSUBSTNO('Hello,<br /> Your transfer order: %1 has been processed. <br />Regards',"No."));
    //                       Subject := STRSUBSTNO('Processed Transfer Order for Production - %1',"No.");
    //                       Mail.NewMessage('','','',Subject,MailBody,'',TRUE);
    //                     END;

    //                 end;
    //             }
    //             group(Notification)
    //             {
    //                 Caption = 'Notification';
    //             }
    //         }
    //     }

    //     var
    //         Loc: Record Location;
    //         UserSetup: Record "User Setup";
    //         Mail: Codeunit Mail;
    //         MailBody: Text;
    //         Subject: Text;
    //         Recipient: Text;
    //         TrasRec: Record "Transfer Header";

    //  }

    // // //Unsupported feature: Code Insertion on "OnInsertRecord".

    // // //trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    // // //begin
    // // /*
    // //  "Assigned User ID" := UserId;
    // //   //IF UserSetup.GET(USERID) THEN
    // //     //"Requested By" := UserSetup.
    // // */
    // // //end;
}