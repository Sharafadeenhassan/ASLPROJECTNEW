tableextension 50238 "tableextension50238" extends "Unit of Measure"
{
    fields
    {
        field(50300; "In Use"; Boolean)
        {
            InitValue = true;
        }
        field(50301; "Catch Code"; Code[10])
        {
        }
        field(50302; UOMTYPE; Option)
        {
            OptionMembers = Standard,Operation;
        }
    }
}
