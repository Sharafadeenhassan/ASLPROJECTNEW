tableextension 50260 "tableextension50260" extends "Entry/Exit Point"
{
    // UNL-ASL3.60.01.004 (Santus) May 11, 2005
    fields
    {
        field(50000; "Entry No."; Integer)
        {
        }
        field(50001; Date; Date)
        {
        }
        field(50002; Type; Option)
        {
            OptionMembers = " ","Average",Median;
        }
        field(50003; Vessel; Text[30])
        {
            TableRelation = Location;
        }
        field(50004; Country; Code[10])
        {
        }
        field(50005; Skipper; Text[30])
        {
        }
        field(50006; "Sea Days"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(50007; "Sea Area"; Code[10])
        {
        }
        field(50008; "Day Fish Pts"; Decimal)
        {
        }
        field(50009; "Day Shrimp Pts"; Decimal)
        {
        }
        field(50010; "Day Points"; Decimal)
        {
        }
        field(50011; "Cumm. Fish Pts"; Decimal)
        {
        }
        field(50012; "Cumm. Shrimp Pts"; Decimal)
        {
        }
        field(50013; "Cumm. Total Pts"; Decimal)
        {
        }
        field(50014; "Avg Fish Pts"; Decimal)
        {
        }
        field(50015; "Avg Shrimp Pts"; Decimal)
        {
        }
        field(50016; "Total Avg Pts"; Decimal)
        {
        }
        field(50017; "Vessel Count"; Integer)
        {
        }
        field(50018; "Report Type"; Option)
        {
            OptionMembers = " ",Points;
        }
    }
    keys
    {
        //Unsupported feature: Property Deletion (Clustered) on "Code(Key)".

        // key(ASLKey1; "Entry No.")
        // {
        //     Clustered = true;
        // }
        // key(Key2; Date, Vessel, Type)
        // {
        // }
    }
}
