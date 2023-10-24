pageextension 50231 "pageextension50231" extends "Workflow Step Responses"
{
    //Unsupported feature: Code Modification on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    WorkflowStep.Get("Workflow Code","Response Step ID");
    "Response Description" := WorkflowStep.GetDescription;
    Modify;

    UpdateNextStepDescription;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    WorkflowStep.Get("Workflow Code","Response Step ID");
    "Response Description" := WorkflowStep.GetResponseDescription;
    #3..5
    */
    //end;
}
