pageextension 50320 "pageextension50320" extends "Location Card"
{
    layout
    {
        addafter("Bin Policies")
        {
            group(Vessel)
            {
                Caption = 'Vessel';
                field("Location Type"; Rec."Location Type")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        UpdateEnabled();
                    end;
                }
                // field(Captain; Captain)  //Revisit
                // {
                // }
                field("Ves Age"; Rec."Ves Age")
                {
                    ApplicationArea = All;
                }
                field("Insurance Rate"; Rec."Insurance Rate")
                {
                    ApplicationArea = All;
                }
                field("Depreciation Rate"; Rec."Depreciation Rate")
                {
                    ApplicationArea = All;
                }
                field("Budgeted Voyages"; Rec."Budgeted Voyages")
                {
                    ApplicationArea = All;
                }
                field("Current Operation"; Rec."Current Operation")
                {
                    ApplicationArea = All;
                }
                field("Current Voyage"; Rec."Current Voyage")
                {
                    ApplicationArea = All;
                }
                field("Rad Tel"; Rec."Rad Tel")
                {
                    ApplicationArea = All;
                }
                field(ExpCode; Rec.ExpCode)
                {
                    ApplicationArea = All;
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;
                }
                field("Vessel Endurance"; Rec."Vessel Endurance")
                {
                    ApplicationArea = All;
                }
                field("Port Captain"; Rec."Port Captain")
                {
                    ApplicationArea = All;
                }
                field("Vessel Type"; Rec."Vessel Type")
                {
                    ApplicationArea = All;
                }
                field("FA Code"; Rec."FA Code")
                {
                    ApplicationArea = All;
                }
                field("Sea Days"; Rec."Sea Days")
                {
                    ApplicationArea = All;
                }
            }
            group("Vessel Schedules")
            {
                Caption = 'Vessel Schedules';
                field("Lst Ovh"; Rec."Lst Ovh")
                {
                    ApplicationArea = All;
                }
                field("Nxt Ovh"; Rec."Nxt Ovh")
                {
                    ApplicationArea = All;
                }
                field("Lst Ddk"; Rec."Lst Ddk")
                {
                    ApplicationArea = All;
                }
                field("Nxt Ddk"; Rec."Nxt Ddk")
                {
                    ApplicationArea = All;
                }
                field("Brnd Pk"; Rec."Brnd Pk")
                {
                    ApplicationArea = All;
                }
                field("Inner P"; Rec."Inner P")
                {
                    ApplicationArea = All;
                }
                field(Grades; Rec.Grades)
                {
                    ApplicationArea = All;
                }
                field(Deratg; Rec.Deratg)
                {
                    ApplicationArea = All;
                }
                field("Crab CW"; Rec."Crab CW")
                {
                    ApplicationArea = All;
                }
                field("WT GL/W"; Rec."WT GL/W")
                {
                    ApplicationArea = All;
                }
                field(Batch; Rec.Batch)
                {
                    ApplicationArea = All;
                }
                field("R Flare"; Rec."R Flare")
                {
                    ApplicationArea = All;
                }
                field("Str Lic"; Rec."Str Lic")
                {
                    ApplicationArea = All;
                }
                field("Fsh Ins"; Rec."Fsh Ins")
                {
                    ApplicationArea = All;
                }
                field("Fsh Dst"; Rec."Fsh Dst")
                {
                    ApplicationArea = All;
                }
                field("Ins Sur"; Rec."Ins Sur")
                {
                    ApplicationArea = All;
                }
                field("Dst Sur"; Rec."Dst Sur")
                {
                    ApplicationArea = All;
                }
                field("Pow Ext"; Rec."Pow Ext")
                {
                    ApplicationArea = All;
                }
                field("Fom Ext"; Rec."Fom Ext")
                {
                    ApplicationArea = All;
                }
                field("CO2 Ext"; Rec."CO2 Ext")
                {
                    ApplicationArea = All;
                }
                field("Life Rf"; Rec."Life Rf")
                {
                    ApplicationArea = All;
                }
                field(Parchut; Rec.Parchut)
                {
                    ApplicationArea = All;
                }
                field("E.U. No"; Rec."E.U. No")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
