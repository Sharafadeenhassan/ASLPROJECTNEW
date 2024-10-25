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
    begin
        if (rec."Ending Date" <> 0D) and (rec."Starting Date" <> 0D) then
            rec."Sea Days" := rec."Ending Date" - rec."Starting Date";
        if rec.Vessel <> '' then
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
            if Rec.Status < xRec.Status then
            Error('Sorry You Need Administrator to Go Back to previous Status');
                exit;
        // {
        //  IF Rec.Status < xRec.Status THEN
        //         ERROR(Text001);
        //     ChangeJobStatus :=
        //       CONFIRM(
        //         Text002 +
        //         Text003, FALSE,
        //         rec.FieldCaption(Rec.Status));
        //     IF NOT ChangeJobStatus THEN BEGIN
        //         Rec.Status := xRec.Status;
        //         EXIT;
        //     END;
        // //  }
        //  if (Status = Status::"Close Job Card") and (CopyStr(Job."No.",1,1)='J') then
        //    TestField("Voyage Ended",true);
        // if xRec.Status <> Status then
        // begin
        // end;
    end;
}

// OnValidate Status
//>>>> MODIFIED CODE:
//begin
/*
GenSetup.Get;
if UserId<>GenSetup.Administrator then
begin
  if Status = xRec.Status then
   exit;
{
 IF Status < xRec.Status THEN
   ERROR(Text001);

 ChangeJobStatus :=
   CONFIRM(
     Text002+
     Text003,FALSE,
     FIELDCAPTION(Status));

 IF NOT ChangeJobStatus THEN
 BEGIN
   Status := xRec.Status;
   EXIT;
 END;
 }
 if (Status = Status::"Close Job Card") and (CopyStr(Job."No.",1,1)='J') then
   TestField("Voyage Ended",true);
if xRec.Status <> Status then
begin
#2..11
  if JobPlanningLine.FindSet then
  begin
#13..20
end;
*/
//end;

//OnValidate
//""Person Responsible"(Field 20)".

//trigger OnValidate()
//Parameters and return type have not been exported.
//begin
/*
if "Person Responsible" = '' then
  exit;

SetRange("Person Responsible",Res."No.");
if Res.Get("Person Responsible") then
  Validate(Captain, Res.Name);

JobTask.SetRange(JobTask."Job No.","No.");
JobTask.SetRange(JobTask."Job Task No.",'temp');
if JobTask.FindFirst then begin
  InitPlanningLines;
end else begin
  JobTask.Init;
  JobTask."Job No." := "No.";
  JobTask."Job Task No." := 'temp';
  JobTask."Job Task Type" := JobTask."Job Task Type"::Posting;
  JobTask."Job Posting Group" := 'OPERATION';
  JobTask.Description := Description;
  JobTask.Insert(true);
  InitPlanningLines;
end;
*/
//end;

//Unsupported feature: Code Modification on ""Apply Usage Link"(Field 1025).OnValidate".

//trigger OnValidate()
//Parameters and return type have not been exported.
//>>>> ORIGINAL CODE:
//begin
/*
if "Apply Usage Link" then begin
  JobLedgerEntry.SetCurrentKey("Job No.");
  JobLedgerEntry.SetRange("Job No.","No.");
  JobLedgerEntry.SetRange("Entry Type",JobLedgerEntry."Entry Type"::Usage);
  if JobLedgerEntry.FindFirst then begin
    JobUsageLink.SetRange("Entry No.",JobLedgerEntry."Entry No.");
    if JobUsageLink.IsEmpty then
      Error(ApplyUsageLinkErr,TableCaption);
  end;
#10..18
      JobPlanningLine.Modify(true);
    until JobPlanningLine.Next = 0;
end;
*/
//end;
//>>>> MODIFIED CODE:
//begin
/*
#1..5
    //JobUsageLink.SETRANGE("Entry No.",JobLedgerEntry."Entry No.");
#7..21
*/
//end;

//Unsupported feature: Code Modification on "OnModify".

//trigger OnModify()
//>>>> ORIGINAL CODE:
//begin
/*
"Last Date Modified" := Today;

if (("Project Manager" <> xRec."Project Manager") and (xRec."Project Manager" <> '')) or (Status <> Status::Open) then
  RemoveFromMyJobs;

if ("Project Manager" <> '') and (xRec."Project Manager" <> "Project Manager") then
  if Status = Status::Open then
    AddToMyJobs("Project Manager");
*/
//end;
//>>>> MODIFIED CODE:
//begin
/*
"Last Date Modified" := Today;

if (("Project Manager" <> xRec."Project Manager") and (xRec."Project Manager" <> '')) or (Status <> Status::"Voyage Start") then
#4..6
  if Status = Status::"Voyage Start" then
    AddToMyJobs("Project Manager");
*/
//end;
