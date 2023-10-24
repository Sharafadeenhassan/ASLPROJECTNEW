/// <summary>
/// Report Location Vessel Sea Day (ID 50508).
/// </summary>
report 50508 "Location Vessel Sea Day"
{
    Caption = 'Location Vessel Sea Day';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All, Basic, Suite;
    DefaultLayout = RDLC;
    RDLCLayout = '.\LocationVesselSeaDay.rdlc';
    dataset
    {
        dataitem(Location; Location)
        {
            DataItemTableView = where("location type" = const(1));  //"location type" ::Vessel
            RequestFilterFields = "date filter";

            column(Code; "Code") { }
            column(Name; Name) { }
            column(VSDVal; VSDVal) { }
            column(Last_Reportd_Vessel_Pts; "Last Reportd Vessel Pts") { DecimalPlaces = 0 : 1; }
            column(LastRepOperationNoVal; "Last Rep Operation No. Val") { }

            trigger OnAfterGetRecord()
            begin
                "Last Rep Operation No. Val" := LastRepOpNo(Code, DateFilter);
                // VSDVal := VoySeaAnyTime(LastRepOptNo, Code, DateFilter);
                VSDVal := VoySeaAnyTime("Last Rep Operation No. Val", Code, DateFilter);
                if Operation.Get("Last Rep Operation No. Val") then
                    Operation.SetFilter(Operation."Date Filter", '%1', GetRangeMax("Date Filter"));

                "Last Reportd Vessel Pts" := Operation.PointZ(Operation."No.", Code, DateFilter, '', '', '', Operation.Vessel);
                Operation.SetFilter(Operation."Task Filter", 'SHR');
                "Last Reportd Shrimps Pts" := Operation.PointZ(Operation."No.", Code, DateFilter, '', 'SHR', '', Operation.Vessel);
                "Fishing Area" := Operation.FishingArea(Operation."No.", Code, DateFilter, '', '', '', Operation.Vessel);
                Operation.SetRange(Operation."Task Filter");
                Modify();
            end;

            trigger OnPreDataItem()
            begin
                DateFilter := Location.GetFilter("date filter");
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        DateFilter: Text;
        Operation: Record job;
}
