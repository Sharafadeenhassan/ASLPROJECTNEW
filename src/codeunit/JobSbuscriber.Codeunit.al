codeunit 50037 "JobSbuscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterOnInsert', '', true, true)]
    local procedure OnAfterOnInsertJob(var Job: Record Job)
    begin
        Job."Global Dimension 2 Code" := 'ATLANTIC';
        Job."Starting Date" := Today;
        if Job.Vessel <> '' then
            Job."Ending Date" := CalcDate('+50D', Today);
        Job."Creation Date" := Today;
        // Job."Creation Date" := Today;
        Job."Last Date Modified" := Job."Creation Date";
        if (Job."Project Manager" <> '') and (Job.Status = Job.Status::"Open") then;
        //Job.AddToMyJobs(Job."Project Manager"); //Revisit
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure OnAfterValidateNo(var Rec: Record Job)
    begin
        rec.Status := rec.Status::Planning;
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterValidateEvent', 'Global Dimension 2 Code', true, true)]
    local procedure OnAfterValidateGlobalDimesnion2Code(var Rec: Record Job)
    begin
        rec.TestField("Global Dimension 2 Code");
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeValidateEvent', 'Starting Date', true, true)]
    local procedure OnAfterValidateStartingDate(var Rec: Record Job)
    begin
        UpdateVoyageDate(Rec);
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeValidateEvent', 'Ending Date', true, true)]
    local procedure OnAfterValidatEndingDate(var Rec: Record Job)
    begin
        UpdateVoyageDate(Rec);
    end;

    local procedure UpdateVoyageDate(var rec: Record Job)
    var
        Loc: Record Location;
        xRec: Record Job;
    begin
        // Get previous record state
        if not xRec.Get(rec."No.") then
            exit;

        // Always allow Sea Days recalculation if dates are manually changed
        // But prevent automatic recalculation on status change to Completed (unless from Voyage Start)
        if (rec."Ending Date" <> 0D) and (rec."Starting Date" <> 0D) then begin
            // Only update Sea Days if:
            // 1. Status is not Completed, OR
            // 2. We're closing from Voyage Start (first closure), OR
            // 3. User manually changed the dates (dates changed but status didn't)
            if (rec.Status <> rec.Status::Completed) or
               (xRec.Status = 2) or // Status 2 = Voyage Start (first closure)
               ((rec."Ending Date" <> xRec."Ending Date") or (rec."Starting Date" <> xRec."Starting Date")) then
                rec."Sea Days" := rec."Ending Date" - rec."Starting Date";
        end;

        // Update vessel location dates only on first closure or if not completed
        if ((rec.Status <> rec.Status::Completed) or (xRec.Status = 2)) and (rec.Vessel <> '') then
            if Loc.Get(rec.Vessel) then begin
                Loc.ETD := rec."Starting Date";
                Loc.ETA := rec."Ending Date";
                Loc.Modify();
            end;
    end;

    [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeValidateEvent', 'Status', true, true)]
    local procedure OnBeforeValidateEventStatus(var Rec: Record Job; var xRec: Record Job)
    begin
        ChangeJobStatusVessel(Rec, xRec);
    end;

    local procedure ChangeJobStatusVessel(var Rec: Record Job; var xRec: Record Job)
    var
        GenSetup: Record "General Ledger Setup";

    begin
        GenSetup.Get();
        if UserId <> GenSetup.Administrator then
            if Rec.Status.AsInteger() < xRec.Status.AsInteger() then
                Error('Sorry You Need Administrator to Go Back to previous Status');
        exit;
    end;

    /* [EventSubscriber(ObjectType::Table, Database::Job, 'OnBeforeChangeJobCompletionStatus', '', True, True)]
     local procedure OnBeforeChangeJobCompletionStatus(var Job: Record Job; var IsHandled: Boolean)
     begin
         if Job."Arrival Time" <> 0D then Job."Ending Date" := Job."Arrival Time";
         IsHandled := true;
     end;
 */
    [EventSubscriber(ObjectType::Table, Database::Job, 'OnAfterChangeJobCompletionStatus', '', True, True)]
    local procedure OnAfterChangeJobCompletionStatus(var Job: Record Job)
    var
        xRec: Record Job;
    begin
        // Only update Ending Date on first closure from Voyage Start (Status 2)
        xRec.Get(Job."No.");
        if (xRec.Status = 2) and (Job."Arrival Time" <> 0D) then // Status 2 = Voyage Start
            Job."Ending Date" := Job."Arrival Time";
        //IsHandled := true;
    end;
}