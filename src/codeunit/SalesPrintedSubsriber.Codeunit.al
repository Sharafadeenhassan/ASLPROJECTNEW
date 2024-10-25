codeunit 50011 "SalesPrintedSubsriber"
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Printed", 'OnBeforeModify', '', true, true)]
    local procedure SalesPrintedOnBeforeModify(var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.Status := SalesHeader.Status::Released;
    end;


}