report 50094 "Store Materia Requisition"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/StoreMateriaRequisition.rdlc';
    Caption = 'Store Materia Requisition';
    dataset
    {
        dataitem("Store Requisition Header New"; "Store Requisition Header New")
        {
            RequestFilterFields = "Req. No", "Req. Type";
            column(RequisitionNo; "Store Requisition Header New"."Req. No")
            {
            }
            column(Type; "Store Requisition Header New"."Req. Type")
            {
            }
            column(Description; "Store Requisition Header New".Description)
            {
            }
            column(TobeCollected; "Store Requisition Header New"."To Be Collected By")
            {
            }
            column(RequisitioDate; "Store Requisition Header New"."Req Date")
            {
            }
            column(Sender; "Store Requisition Header New".Sender)
            {
            }
            column(DocumentNo; "Store Requisition Header New"."Document No.")
            {
            }
            column(DepartmentalApprovalBy; "Store Requisition Header New"."1st Approval Name")
            {
            }
            column(Approved1; "Store Requisition Header New"."1st Approved")
            {
            }
            column(StoreApprovalBy; "Store Requisition Header New"."Final Approval Name")
            {
            }
            column(ApprovedF; "Store Requisition Header New"."Final Approved")
            {
            }
            column(ProcessBy; "Store Requisition Header New"."Processed By")
            {
            }
            column(TransferTo; "Store Requisition Header New"."Transfer To.")
            {
            }
            column(ClaimBy; ClaimPer)
            {
            }
            column(iSSUEDBY; "Store Requisition Header New"."Issued By")
            {
            }
            column(CaptureBy; "Store Requisition Header New"."Captured By")
            {
            }
            column(From; "Store Requisition Header New"."Transfer From")
            {
            }
            column(Voyage; "Store Requisition Header New"."Voyage No.")
            {
            }
            column(Department; "Store Requisition Header New"."Global Dimension 1 Code")
            {
            }
            dataitem("Store Requisition Line New"; "Store Requisition Line New")
            {
                DataItemLink = "Req. No." = FIELD("Req. No");
                DataItemTableView = SORTING("Req. No.", "Line No.");
                column(ItemNo; "Store Requisition Line New"."Item No.")
                {
                }
                column(ItemDescription; "Store Requisition Line New"."Item Description")
                {
                }
                column(ReqQty; "Store Requisition Line New"."Requested Quantity")
                {
                }
                column(ApprovedQty; "Store Requisition Line New"."Approved Quantity")
                {
                }
                column(IssueQty; "Store Requisition Line New"."Issued Quantity")
                {
                }
                column(StoreLocation; "Store Requisition Line New"."Store Location")
                {
                }
                column(EmployeeNo; "Store Requisition Line New"."Claim by Employee")
                {
                }
                column(Collecteddate; "Store Requisition Line New"."Last Replacement Date")
                {
                }
                column(Comment; "Store Requisition Line New".Comment)
                {
                }
                column(InvPGrp; "Store Requisition Line New"."Inventory Posting Group")
                {
                }
                column(SRN; SRN)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if EmpRec.Get("Store Requisition Line New"."Claim by Employee") then
                        "Store Requisition Line New".Comment := EmpRec.FullName();
                    if "Store Requisition Line New"."Inventory Posting Group" = '' then begin
                        if itemRec.Get("Store Requisition Line New"."Item No.") then
                            "Store Requisition Line New"."Inventory Posting Group" := itemRec."Inventory Posting Group";
                        "Store Requisition Line New".Modify();
                    end;
                    SRN := SRN + 1;
                end;

                trigger OnPreDataItem()
                begin
                    SRN := 0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                if "Store Requisition Header New"."Claim by Employee" <> '' then begin
                    EmpRec.Get("Store Requisition Header New"."Claim by Employee");
                    ClaimPer := EmpRec.FullName();
                end else
                    if "Store Requisition Header New"."Claim by Resources" <> '' then begin
                        ResRec.Get("Store Requisition Header New"."Claim by Resources");
                        ClaimPer := ResRec.Name;
                    end;
                UserRec.SetRange("User Name", UserId);
                if UserRec.FindSet() then;
            end;
        }
    }

    requestpage
    {
        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if not CurrReport.Preview then begin
            if Storerec.Get("Store Requisition Header New".GetFilter("Store Requisition Header New"."Req. No")) then
                "Store Requisition Header New" := Storerec;

            if "Store Requisition Header New"."No of Copies" > 0 then begin
                Usersetup.Get(UserId);
                if not Usersetup."Reprint MR" then Error('You are NOT Allowed TO Reprint Material Requisition');
            end;
            "Store Requisition Header New"."No of Copies" := "Store Requisition Header New"."No of Copies" + 1;
            "Store Requisition Header New".Printed := true;
            "Store Requisition Header New".Modify();
        end;
    end;

    var
        Usersetup: Record "User Setup";
        Storerec: Record "Store Requisition Header New";
        EmpRec: Record Employee;
        ResRec: Record Resource;
        ClaimPer: Text[50];
        UserRec: Record User;
        SRN: Integer;
        itemRec: Record Item;
}
