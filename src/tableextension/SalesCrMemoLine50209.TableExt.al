tableextension 50209 "tableextension50209" extends "Sales Cr.Memo Line"
{
    fields
    {
        field(50350; Numbers; Decimal)
        {
            Description = 'factor of Quantity';
        }
        field(50351; Packing; Decimal)
        {
            Description = 'factor of Quantity';
        }
    }

    //Unsupported feature: Property Insertion (Local) on "ShowItemReturnRcptLines(PROCEDURE 9)".

    //Unsupported feature: Code Modification on "ShowLineComments(PROCEDURE 5)".

    //procedure ShowLineComments();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SalesCommentLine.ShowComments(SalesCommentLine."Document Type"::"Posted Credit Memo","Document No.","Line No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SalesCommentLine.ShowComments(SalesCommentLine."Document Type"::"Posted Invoice","Document No.","Line No.");
    */
    //end;
}
