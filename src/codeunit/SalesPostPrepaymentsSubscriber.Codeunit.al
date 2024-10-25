codeunit 50020 "SalesPostPrepaymentsSubscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post Prepayments", 'OnAfterCheckPrepmtDoc', '', true, true)]
    local procedure MyProcedure()
    begin
    end;
}

// OBJECT Modification "Sales-Post Prepayments"(Codeunit 442)
// {
//   CHANGES
//   {There appears to be data type mismatch this code require review
//     { Refactor(new procedure should be inserted to take care of this rather than modify)CodeModification  ;OriginalCode=BEGIN
//                                         if not SalesSetup."Copy Comments Order to Invoice" then
//                                           exit;

//                                         with SalesCommentLine do
//                                           case ToDocType of
//                                             DATABASE::"Sales Invoice Header":
//                                               CopyHeaderComments("Document Type"::Order,"Document Type"::"Posted Invoice",FromNumber,ToNumber);
//                                             DATABASE::"Sales Cr.Memo Header":
//                                               CopyHeaderComments("Document Type"::Order,"Document Type"::"Posted Credit Memo",FromNumber,ToNumber);
//                                           end;
//                                       END;

//                          ModifiedCode=BEGIN
//                                         #1..6
//                                               CopyHeaderComments("Document Type"::Order,"Document Type"::Shipment,FromNumber,ToNumber);
//                                             DATABASE::"Sales Cr.Memo Header":
//                                               CopyHeaderComments("Document Type"::Order,"Document Type"::"Posted Invoice",FromNumber,ToNumber);
//                                           end;
//                                       END;

//                          Target=CopyHeaderCommentLines(PROCEDURE 22) }
//     { CodeModification  ;OriginalCode=BEGIN
//                                         if not SalesSetup."Copy Comments Order to Invoice" then
//                                           exit;

//                                         with SalesCommentLine do
//                                           case ToDocType of
//                                             DATABASE::"Sales Invoice Header":
//                                               CopyLineComments("Document Type"::Order,"Document Type"::"Posted Invoice",FromNumber,ToNumber,FromLineNo,ToLineNo);
//                                             DATABASE::"Sales Cr.Memo Header":
//                                               CopyLineComments("Document Type"::Order,"Document Type"::"Posted Credit Memo",FromNumber,ToNumber,FromLineNo,ToLineNo);
//                                           end;
//                                       END;

//                          ModifiedCode=BEGIN
//                                         #1..6
//                                               CopyLineComments("Document Type"::Order,"Document Type"::Shipment,FromNumber,ToNumber,FromLineNo,ToLineNo);
//                                             DATABASE::"Sales Cr.Memo Header":
//                                               CopyLineComments("Document Type"::Order,"Document Type"::"Posted Invoice",FromNumber,ToNumber,FromLineNo,ToLineNo);
//                                           end;
//                                       END;

//                          Target=CopyLineCommentLines(PROCEDURE 83) }
//     { CodeModification  ;OriginalCode=BEGIN
//                                         if not SalesSetup."Copy Comments Order to Invoice" then
//                                           exit;

//                                         with SalesCommentLine do
//                                           case ToDocType of
//                                             DATABASE::"Sales Invoice Header":
//                                               CopyLineCommentsFromSalesLines(
//                                                 "Document Type"::Order,"Document Type"::"Posted Invoice",FromNumber,ToNumber,TempSalesLine);
//                                             DATABASE::"Sales Cr.Memo Header":
//                                               CopyLineCommentsFromSalesLines(
//                                                 "Document Type"::Order,"Document Type"::"Posted Credit Memo",FromNumber,ToNumber,TempSalesLine);
//                                           end;
//                                       END;

//                          ModifiedCode=BEGIN
//                                         #1..7
//                                                 "Document Type"::Order,"Document Type"::Shipment,FromNumber,ToNumber,TempSalesLine);
//                                             DATABASE::"Sales Cr.Memo Header":
//                                               CopyLineCommentsFromSalesLines(
//                                                 "Document Type"::Order,"Document Type"::"Posted Invoice",FromNumber,ToNumber,TempSalesLine);
//                                           end;
//                                       END;

//                          Target=CopyLineCommentLinesCompressedPrepayment(PROCEDURE 84) }
//   }
//   CODE
//   {
//     BEGIN
//     END.
//   }
// }
