



pageextension 50332 "pageextension50332" extends "Demand Overview"
{
    layout
    {
        //Unsupported feature: Code Modification on "DemandNoCtrl(Control 45).OnLookup".

        //trigger OnLookup(var Text: Text): Boolean
        //>>>> ORIGINAL CODE:
        //begin
        /*
        case DemandType of
          DemandType::Sales:
            begin
        #4..36
            end;
          DemandType::Jobs:
            begin
              Job.SetRange(Status,Job.Status::Open);
              JobList.SetTableView(Job);
              JobList.LookupMode := true;
              if JobList.RunModal = ACTION::LookupOK then begin
        #44..59
              exit(false);
            end;
        end;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..39
              Job.SetRange(Status,Job.Status::"Voyage Start");
        #41..62
        */
        //end;
    }
}
