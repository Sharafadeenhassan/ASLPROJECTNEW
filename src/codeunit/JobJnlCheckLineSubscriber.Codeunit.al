codeunit 50024 "JobJnlCheckLineSubscriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Check Line", 'OnRunCheckOnBeforeTestFieldJobStatus', '', true, true)]
    local procedure JobJnlCheckLineOnRunCheckOnBeforeTestFieldJobStatus(var JobJnlLine: Record "Job Journal Line"; var IsHandled: Boolean)
    var
        Job: Record Job;
    begin
        Job.Get(JobJnlLine."Job No.");
        Job.TestField(Status, Job.Status::"Open");
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Job Jnl.-Check Line", 'OnBeforeCheckItemQuantityJobJnl', '', true, true)]
    local procedure JobJnlCheckLineOnBeforeCheckItemQuantityJobJnl(var JobJnlLine: Record "Job Journal Line"; var IsHandled: Boolean)
    var
        Job: Record Job;

    begin
        if JobJnlline.IsNonInventoriableItem() then
            exit;

        Job.Get(JobJnlline."Job No.");
        if (Job.GetQuantityAvailable(JobJnlline."No.", JobJnlline."Location Code", JobJnlline."Variant Code", 0, 2) +
            JobJnlline."Quantity (Base)") = 0
        then
            ;
        IsHandled := true;
    end;

}