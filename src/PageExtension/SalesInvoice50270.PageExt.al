pageextension 50270 "pageextension50270" extends "Sales Invoice"
{
    layout
    {
        modify("No.")
        {
            Visible = true;
        }
        modify("Sell-to Customer No.")
        {
            Visible = false;
        }
        addafter("No.")
        {
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            group("Other Documents")
            {
                action("Sales Delivery Note")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Delivery Note';
                    Image = Delivery;
                    // RunObject = Report "Sales Delivery Note";
                    //RunPageOnRec = true;
                    Promoted = true;

                    trigger OnAction()
                    var
                        TrasRec: Record "Sales Header";
                    begin
                        TrasRec.SetRange(TrasRec."No.", Rec."No.");
                        TrasRec.SetRange(TrasRec."Document Type", Rec."Document Type");
                        if TrasRec.FindFirst() then
                            REPORT.RunModal(50093, true, false, TrasRec);
                    end;
                }
                action("Sales Register Report")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Sales Register Report';
                    Image = Register;
                    RunObject = report "Sales Register";
                }
                action("Local Sales Report 1")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Local Sales Report 1';
                    Image = Sales;
                    RunObject = Report "Local Sales Report";
                }
                action("Local Sales Report 2")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Local Sales Report 2';
                    Image = Register;
                    RunObject = report "Local Sales Report 2";
                }
                action("Generate FS Sales")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Generate FS Sales';
                    Image = Import;
                    //RunObject = xmlport "Import FS daily sales";
                    Promoted = true;
                    trigger OnAction()
                    begin
                        rec.GenerateFSDailySales();
                    end;
                }
                action("Validate Quantity")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Update Quantity';
                    Promoted = true;
                    trigger OnAction()
                    begin
                        Rec.ValidateQuantity();
                    end;
                }
            }
        }
    }
}

//var

//}

//Unsupported feature: Property Modification (Level) on ""Sell-to Post Code"(Control 81)".

//Unsupported feature: Property Modification (Level) on ""Sell-to Country/Region Code"(Control 73)".

//Unsupported feature: Property Modification (Level) on ""Sell-to Contact No."(Control 87)".

//Unsupported feature: Property Modification (Level) on ""Sell-to Contact"(Control 8)".

//Unsupported feature: Property Modification (Level) on ""Your Reference"(Control 19)".

//Unsupported feature: Property Modification (Level) on ""Document Date"(Control 43)".

//Unsupported feature: Property Modification (Level) on ""Posting Date"(Control 12)".

//Unsupported feature: Property Modification (Level) on ""Due Date"(Control 28)".

//Unsupported feature: Property Modification (Level) on ""Incoming Document Entry No."(Control 13)".

//Unsupported feature: Property Modification (Level) on ""External Document No."(Control 126)".

//Unsupported feature: Property Modification (Level) on ""Salesperson Code"(Control 10)".

//Unsupported feature: Property Modification (Level) on ""Campaign No."(Control 129)".

//Unsupported feature: Property Modification (Level) on ""Responsibility Center"(Control 118)".

//Unsupported feature: Property Modification (Level) on ""Assigned User ID"(Control 67)".

//Unsupported feature: Property Modification (Level) on "Status(Control 112)".

//Unsupported feature: Property Modification (Level) on ""Job Queue Status"(Control 5)".

//Unsupported feature: Property Modification (Level) on ""Prices Including VAT"(Control 121)".

//Unsupported feature: Property Modification (Level) on ""VAT Bus. Posting Group"(Control 156)".

//Unsupported feature: Property Modification (Level) on ""Payment Terms Code"(Control 26)".

//Unsupported feature: Property Modification (Level) on ""Payment Method Code"(Control 101)".

//Unsupported feature: Property Modification (Level) on ""EU 3-Party Trade"(Control 72)".

//Unsupported feature: Property Modification (Level) on ""Shortcut Dimension 1 Code"(Control 84)".

//Unsupported feature: Property Modification (Level) on ""Shortcut Dimension 2 Code"(Control 88)".

//Unsupported feature: Property Modification (Level) on ""Payment Discount %"(Control 30)".

//Unsupported feature: Property Modification (Level) on ""Pmt. Discount Date"(Control 32)".

//Unsupported feature: Property Modification (Level) on ""Direct Debit Mandate ID"(Control 15)".

//Unsupported feature: Property Modification (Level) on ""Location Code"(Control 90)".

//Unsupported feature: Property Modification (Level) on ""Ship-to Post Code"(Control 80)".

//Unsupported feature: Property Modification (Level) on ""Ship-to Country/Region Code"(Control 17)".

//Unsupported feature: Property Modification (Level) on ""Ship-to Contact"(Control 44)".

//Unsupported feature: Property Modification (Level) on ""Bill-to County"(Control 92)".

//***field("Sell-to Customer No."; "Sell-to Customer No.")
//         // {
//         //     ApplicationArea = Basic, Suite;
//         //     Caption = 'Customer No.';
//         //     Importance = Additional;
//         //     NotBlank = true;
//         //     ToolTip = 'Specifies the number of the customer who will receive the products and be billed by default.';
//         //     Visible = NOT IsSaaS;

//             trigger OnAfterValidate()
//             begin
//                 SelltoCustomerNoOnAfterValidate(Rec, xRec);
//                 CurrPage.Update;
//             end;
//         }
//     }
// }
//     actions
//     {
//         addafter("Test Report")
//         {
//             action("Delivery Note")
//             {
//                 Image = Delivery;
//                 RunPageOnRec = true;

//                 trigger OnAction()
//                 begin
//                     TrasRec.SetRange(TrasRec."No.", "No.");
//                     TrasRec.SetRange(TrasRec."Document Type", "Document Type");
//                     if TrasRec.FindFirst then
//                         REPORT.RunModal(50093, true, false, TrasRec);
//                 end;
//             }
//         }
//     }

//     //Unsupported feature: Property Modification (Id) on "ApplicationAreaMgmtFacade(Variable 1011)".

//     //var
//     //>>>> ORIGINAL VALUE:
//     //ApplicationAreaMgmtFacade : 1011;
//     //Variable type has not been exported.
//     //>>>> MODIFIED VALUE:
//     //ApplicationAreaMgmtFacade : 1111;
//     //Variable type has not been exported.

//     var
//         ServMgtDocument: Boolean;
//         TrasRec: Record "Sales Header";
// }
