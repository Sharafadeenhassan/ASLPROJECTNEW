tableextension 50264 "Inventory Setup Ext" extends "Inventory Setup"
{
    fields
    {
        field(50000; "Automatic BOM Explosion"; Boolean)
        {
        }
        field(50001; "Catches Class"; Code[1])
        {
            Description = 'Here Product cathes are categoried into class so as to filter them when been reported (This is catches Default before actual Code is given)';
        }
        field(50002; "Default Store"; Code[10])
        {
            TableRelation = Location WHERE("Location Type" = FILTER(Store));
        }
        field(50003; "Default Cold Room"; Code[10])
        {
            TableRelation = Location WHERE("Location Type" = FILTER(Store));
        }
        field(50004; "FA Acquisition"; Code[10])
        {
            TableRelation = "Reason Code";

            trigger OnValidate()
            begin
                if "FA Acquisition" = "FA Maintenance" then Error('Maintenance and Acquisition code must be Unique');
            end;
        }
        field(50005; "FA Acquisition Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50006; "FA Maintenance"; Code[10])
        {
            TableRelation = "Reason Code";

            trigger OnValidate()
            begin
                if "FA Acquisition" = "FA Maintenance" then Error('Maintenance and Acquisition code must be Unique');
            end;
        }
        field(50007; "FA Maintenance Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(50008; "Store Requisition No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50009; "Auto Post Issue Req"; Boolean)
        {
        }
        field(50010; "Auto Post Transfer Req"; Boolean)
        {
        }
        field(50011; "Auto Post Purchase Req"; Boolean)
        {
        }
        field(50012; "Auto Post Job Journal"; Boolean)
        {
        }
        field(50013; "DPS No. Series"; Code[10])
        {
            Description = 'Dynamics Procurement System No series';
            TableRelation = "No. Series";
        }
        field(50014; "Store Req. Transfer No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50015; "Store Req. Purchase No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50016; "Store Req. Add-In No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50017; "Store Req. Compliment No."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(50018; "Store Req. Invoice No."; Code[10])
        {
            TableRelation = "No. Series";
        }
    }
}
