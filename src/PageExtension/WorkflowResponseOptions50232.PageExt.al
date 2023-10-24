pageextension 50232 "pageextension50232" extends "Workflow Response Options"
{
    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    SetVisibilityOptions;
    GetEventTable;
    CalcFields("Field Caption");
    TableFieldCaption := "Field Caption";
    ApplyAllValues := ("Field No." = 0);
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    SetVisibilityOptions;
    #3..5
    */
    //end;

    //Unsupported feature: Variable Insertion (Variable: WorkflowStep) (VariableCollection) on "LookupFieldCaptionForApplyNewValues(PROCEDURE 17)".

    //Unsupported feature: Code Modification on "LookupFieldCaptionForApplyNewValues(PROCEDURE 17)".

    //procedure LookupFieldCaptionForApplyNewValues();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WorkflowStepApply.SetRange(Argument,ID);
    if WorkflowStepApply.FindFirst then begin
      WorkflowStepRevert.SetRange("Workflow Code",WorkflowStepApply."Workflow Code");
      WorkflowStepRevert.SetRange("Function Name",WorkflowResponseHandling.RevertValueForFieldCode);

      if WorkflowStepRevert.FindSet then
        repeat
          WorkflowStepArgument.Get(WorkflowStepRevert.Argument);
          if WorkflowStepArgument."Field No." <> 0 then begin
            if AddSeparator then
              Separator := '|';
            AddSeparator := true;
            FilterForTable += Separator + Format(WorkflowStepArgument."Table No.");
            FilterForField += Separator + Format(WorkflowStepArgument."Field No.");
          end;
        until WorkflowStepRevert.Next = 0;

      exit(LookupFieldCaption(FilterForTable,FilterForField));
    end;
    exit('');
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WorkflowStep.SetRange(Argument,ID);
    if WorkflowStep.FindFirst then begin
      WorkflowStep.SetRange("Workflow Code",WorkflowStep."Workflow Code");
      WorkflowStep.SetRange("Function Name",WorkflowResponseHandling.RevertValueForFieldCode);

      if WorkflowStep.FindSet then
        repeat
          WorkflowStepArgument.Get(WorkflowStep.Argument);
    #9..15
        until WorkflowStep.Next = 0;
    #17..20
    */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "LookupFieldCaptionForApplyNewValues(PROCEDURE 17).WorkflowStepApply(Variable 1001)".

    //Unsupported feature: Deletion (VariableCollection) on "LookupFieldCaptionForApplyNewValues(PROCEDURE 17).WorkflowStepRevert(Variable 1000)".
}
