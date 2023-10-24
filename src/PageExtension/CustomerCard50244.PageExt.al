pageextension 50244 "pageextension50244" extends "Customer Card"
{
    layout
    {
        modify("VAT Registration No.") { Visible = false; }

        addafter("Bill-to Customer No.")
        {
            field("ASL VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = Basic, Suite;
                ToolTip = 'Specifies the customer''s VAT registration number for customers in EU countries/regions.';

                trigger OnDrillDown()
                var
                    VATRegistrationLogMgt: Codeunit "VAT Registration Log Mgt.";
                begin
                    VATRegistrationLogMgt.AssistEditCustomerVATReg(Rec);
                end;
            }
        }
    }

    actions
    {
        addafter("Report Customer - Balance to Date")
        {
            action(test)
            {
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Customer Card";
                ApplicationArea = All;
            }
        }
    }
}

// Unsupported feature: Code Modification on ""No."(Control 2).OnAssistEdit".

//           trigger "(Control 2)()
//           Parameters and return type have not been exported.
//           >>>> ORIGINAL CODE:
//           begin

//         if AssistEdit(xRec) then
//           CurrPage.Update;

//           end;
//           >>>> MODIFIED CODE:
//           begin

//         {
//         IF AssistEdit(xRec) THEN
//           CurrPage.UPDATE;
//         IF "No." <> '' THEN
//         "Shipping Advice" := "Shipping Advice"::Complete;  srk
//         }   AAA
//         */
//           end;

// Unsupported feature: Code Insertion on ""Shipping Advice"(Control 123)".

//           trigger OnAfterValidate()
//           Parameters and return type have not been exported.
//           begin
/*
{
IF "No." <> '' THEN
"Shipping Advice" := "Shipping Advice"::Complete;  srk
}   AAA
*/
