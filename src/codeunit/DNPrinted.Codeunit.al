codeunit 50006 "DN-Printed"
{
    TableNo = "Sales Header";

    trigger OnRun()
    begin
        Rec.Find();
        if Usersetup.Get(UserId) then begin
            if rec."No. Of DN Printed" = 0 then begin
                if Usersetup."Print DN" then begin
                    rec."No. Of DN Printed" := rec."No. Of DN Printed" + 1;
                    Rec.Status := Rec.Status::Released;
                end else
                    Error('You Are Not Allowed to Print Delivery Note');
            end else
                if Usersetup."Reprint DN" then begin
                    rec."No. Of DN Printed" := rec."No. Of DN Printed" + 1;
                    Rec.Status := Rec.Status::Released;
                end else
                    Error('You Are Not Allowed to Re-Print Delivery Note');
        end else
            Error('You are Not Allowed to Use this System');
        Rec.Modify();
        Commit();
    end;

    var
        Usersetup: Record "User Setup";

    [Scope('OnPrem')]
    procedure "Transfer DN Printer"(var TranRec: Record "Transfer Header")
    begin
        TranRec.Find();
        if Usersetup.Get(UserId) then begin
            if TranRec."No. Of DN Printed" = 0 then begin
                if Usersetup."Print DN" then begin
                    TranRec."No. Of DN Printed" := TranRec."No. Of DN Printed" + 1;
                    TranRec.Status := TranRec.Status::Released;
                end else
                    Error('You Are Not Allowed to Print Delivery Note');
            end else
                if Usersetup."Reprint DN" then begin
                    TranRec."No. Of DN Printed" := TranRec."No. Of DN Printed" + 1;
                    TranRec.Status := TranRec.Status::Released;
                end else
                    Error('You Are Not Allowed to Re-Print Delivery Note');
        end else
            Error('You are Not Allowed to Use this System');
        TranRec.Modify();
        Commit();
    end;
}
