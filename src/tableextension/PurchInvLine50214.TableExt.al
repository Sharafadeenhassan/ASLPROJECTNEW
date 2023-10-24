tableextension 50214 "tableextension50214" extends "Purch. Inv. Line"
{
    fields
    {
        field(50005; "QtytoReceiveAmount(LCY)"; Decimal)
        {
            Description = 'LC';
        }
        field(50300; "Freight(LCY)"; Decimal)
        {
        }
        field(50301; "Ancillary(LCY)"; Decimal)
        {
        }
        field(50302; "Duty(LCY)"; Decimal)
        {
        }
        field(50303; "Insurance(LCY)"; Decimal)
        {
        }
        field(50304; "Surcharge Duty(LCY)"; Decimal)
        {
        }
        field(50305; "Ecowas Duty(LCY)"; Decimal)
        {
        }
        field(50306; "CISS(LCY)"; Decimal)
        {
        }
        field(50307; "Vat (LCY)"; Decimal)
        {
        }
        field(50308; "Clearing(LCY)"; Decimal)
        {
        }
        field(50309; "Interest(LCY)"; Decimal)
        {
        }
        field(50310; "Duty Rate%"; Decimal)
        {
        }
        field(50320; "Total Overhead(LCY)"; Decimal)
        {
        }
        field(50321; "LandedAmount(LCY)"; Decimal)
        {
        }
        field(50322; "Place Order"; Boolean)
        {
            InitValue = true;
        }
        field(50330; "ActualFreight(LCY)"; Decimal)
        {
        }
        field(50331; "ActualAncillary(LCY)"; Decimal)
        {
        }
        field(50332; "ActualDuty(LCY)"; Decimal)
        {
        }
        field(50333; "ActualInsurance(LCY)"; Decimal)
        {
        }
        field(50334; "ActualSurcharge Duty(LCY)"; Decimal)
        {
        }
        field(50335; "ActualEcowas Duty(LCY)"; Decimal)
        {
        }
        field(50336; "ActualCISS(LCY)"; Decimal)
        {
        }
        field(50337; "ActualVat (LCY)"; Decimal)
        {
        }
        field(50338; "ActualClearing(LCY)"; Decimal)
        {
        }
        field(50339; "ActualInterest(LCY)"; Decimal)
        {
        }
        field(50340; "ActualDuty Rate%"; Decimal)
        {
        }
        field(50341; "ActualTotal Overhead(LCY)"; Decimal)
        {
        }
        field(50342; "ActualLandedAmount(LCY)"; Decimal)
        {
        }
        field(50350; "Previous Purchase Price(LCY)"; Decimal)
        {
        }
        field(50351; "Quantity Ordered"; Decimal)
        {
        }
        field(50360; "Original Purc. Order No."; Code[20])
        {
        }
    }
    keys
    {
        key(ASLKey1; "No.")
        {
            SumIndexFields = "Unit Cost (LCY)";
        }
        key(ASLKey2; "Posting Date")
        {
        }
    }
}
