pageextension 50248 "pageextension50248" extends "Customer Ledger Entries"
{
    layout
    {
        modify("Credit Amount (LCY)")
        {
            Visible = false;
        }
        addafter("Credit Amount")
        {
            //*** field("Credit Amount (LCY)"; "Credit Amount (LCY)")

            //***P ApplicationArea = Basic, Suite;
            //***P ToolTip = 'Specifies the total of the ledger entries that represent credits, expressed in LCY.';
            //***P Visible = DebitCreditVisible;
        }
    }
}

/* actions
          addafter("Show Document")
     {
         action("Transaction with Different Group")
         {
             Image = Alerts;
             RunObject = Page "Cust.  Ledger with Diff. Grp";
         }
    }
 }
}*/
