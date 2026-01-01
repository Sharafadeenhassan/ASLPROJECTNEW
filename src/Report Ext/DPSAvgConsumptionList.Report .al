report 50238 "DPS AVG Consumption List"
{
    ApplicationArea = All;
    Caption = 'DPS AVG Consumption Pattern';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/reportrdlc/DPSAvgConsumption.rdl';
    dataset
    {
        dataitem("DynamicsProcurementHeader"; "Dynamics Procurement Header")
        {
            RequestFilterFields = "DPS No.";
            RequestFilterHeading = 'DPS No.';
            PrintOnlyIfDetail = true;

            Column(DPS_No_; "DPS No.")
            { }
            Column(Req_Department; "Req Department")
            { }
            column(Location_Code; "Location Code")
            { }
            column(Base_Date; "Base Date")
            { }
            column(Process_Date; "Process Date")
            { }
            column(Requisition_Date; "Requisition Date")
            { }
            column(Approved_By; "Approved By") { }
            column(Send_For_Approval_By; "Send For Approval By") { }
            column(Process_By; "Process By") { }
            column(MDSig;MDSig) {}
            column(HODSig;HODSig){}  


            dataitem(DynamicsProcurementRegister; "Dynamics Procurement Register")
            {
                DataItemLink = "DPS Code" = field("DPS No.");
                DataItemTableView = sorting("Item No.");
                //PrintOnlyIfDetail = false;
                RequestFilterFields = "DPS Code";
                RequestFilterHeading = 'DPS Code';

                column(DPSCode; "DPS Code")
                {
                }
                column(ItemNo; "Item No.")
                {
                }
                column(Description; Description)
                {
                }
                column(LocationCode; "Location Code")
                {
                }
                column(MDApproved; "MD Approved")
                {
                }
                column(AvailableQuantity; "Available Quantity")
                {
                }
                column(RequestedQuantity; "Requested Quantity")
                {
                }
                column(HOD_Approved_Qty; "HOD Approved Qty")
                {
                }
                column(ReqAvaQty; "Req+Ava Qty")
                {
                }
                column(AvailableStockMonths; "Available Stock Months")
                {
                }
                column(ExpectedStockPeriod; "Expected Stock Period")
                {
                }
                column(LineAmount; "Line Amount")
                {
                }
                column(ReqDepartment; "Req Department")
                {
                }
                column(UnitPrice; "Unit Price")
                {
                }
                column(Ave3MonthConsumption; "Ave. 3 Month Consumption")
                {
                }
                column(AveOneYearConsumption; "Ave. One Year Consumption")
                {
                }
                column(Last3MonthsConsumption; "Last 3 Months Consumption")
                {
                }
                column(Last3YearsConsumption; "Last 3 Years Consumption")
                {
                }
                column(Last3YearsMonthlyAverage; "Last 3 Years Monthly Average")
                {
                }
                column(Last5YearsConsumption; "Last 5 Years Consumption")
                {
                }
                column(Last5YearsMonthlyAverage; "Last 5 Years Monthly Average")
                {
                }
                column(Last_3_Years_Monthly_Average; "Last 3 Years Monthly Average")
                {
                }
                column(Last_2_Years_Monthly_Average; "Last 2 Years Monthly Average")
                {
                    DecimalPlaces = 1 : 2;
                }
                column(Last_2_Years_Consumption; "Last 2 Years Consumption")
                {
                    DecimalPlaces = 1 : 2;
                }
                column(Last_Month_Consumption; "Last Month Consumption")
                {
                    DecimalPlaces = 1 : 2;
                }
                column(Last_4_Years_Monthly_Average; "Last 4 Years Monthly Average")
                {
                    DecimalPlaces = 1 : 2;
                }
                column(Last_4_Years_Consumption; "Last 4 Years Consumption")
                {
                    DecimalPlaces = 1 : 2;
                }

                column(PendingQuantity; "Pending Quantity")
                {
                }
                column(PendingRequisition; "Pending Requisition")
                {
                }
                column(Short_Supplied; "Short Supplied")
                { }
                column(Short_Supplied_Quantity; "Short Supplied Quantity")
                { }
                column(Remark; Remark)
                { }
                column(Qty_Supplied; "Qty Supplied")
                { }
                column(Inventory_Group; "Inventory Group")
                { }
                column(Gen_Product_Group;"Gen Product Group")
                { }
                column(SRNo;SRNo)
                { }
                column(LPPrice;LPPrice)
                {}

                trigger OnAfterGetRecord()
                begin
                    if ItemRec.Get("Item No.") then begin
                        GenProGrp := ItemRec."Gen. Prod. Posting Group";
                    end;
                    SRNo += 1;
                end;         
            }
            
        }
        
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnInitReport()
    begin
        SRNo := 0;
    end;
    var
        InvPosGrp: Code[20];
        GenProGrp: Code[20];
        SRNo: Integer;
        ItemRec: Record Item;
        MDSig: Label 'MD Signature and Date';
        HODSig: Label 'HOD Signature and Date';

}
