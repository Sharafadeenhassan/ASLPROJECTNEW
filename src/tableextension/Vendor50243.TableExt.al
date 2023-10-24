tableextension 50243 "tableextension50243" extends Vendor
{
    fields
    {
        //Unsupported feature: Property Modification (CalcFormula) on ""Debit Amount (LCY)"(Field 99)".

        //Unsupported feature: Property Modification (CalcFormula) on ""Credit Amount (LCY)"(Field 100)".

        field(50301; "Entry Type Filter"; Option)
        {
            Caption = 'Entry Type';
            Description = 'Balace at date rep.';
            FieldClass = FlowFilter;
            OptionCaption = ' ,Initial Entry,Application,Unrealized Loss,Unrealized Gain,Realized Loss,Realized Gain,Payment Discount,Payment Discount (VAT Excl.),Payment Discount (VAT Adjustment),Appln. Rounding,Correction of Remaining Amount';
            OptionMembers = " ","Initial Entry",Application,"Unrealized Loss","Unrealized Gain","Realized Loss","Realized Gain","Payment Discount","Payment Discount (VAT Excl.)","Payment Discount (VAT Adjustment)","Appln. Rounding","Correction of Remaining Amount";
        }
        field(60000; Hospital; Boolean)
        {
        }
        field(60001; Trainer; Boolean)
        {
        }
    }
}
