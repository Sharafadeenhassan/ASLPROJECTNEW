report 50219 "DPS Request List"
{
    ApplicationArea = All;
    Caption = 'DPS Request List';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './src/reportrdlc/DPSRequestList.rdl';
    dataset
    {
        dataitem("DynamicsProcurementHeader";"Dynamics Procurement Header")
        {
            RequestFilterFields = "DPS No.";
            RequestFilterHeading = 'DPS No.';
            PrintOnlyIfDetail = true;

            Column(DPS_No_;"DPS No.")
            {}
            Column(Req_Department;"Req Department")
            {}
            column(Location_Code;"Location Code")
            {}
        
        dataitem(DynamicsProcurementRegister; "Dynamics Procurement Register")
        {
            DataItemLink = "DPS Code" = field("DPS No.");
            DataItemTableView = sorting("DPS Code");
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
            column(HOD_Approved_Qty;"HOD Approved Qty")
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
            column(Last_3_Years_Monthly_Average;"Last 3 Years Monthly Average")
            {                
            }
            column(Last_2_Years_Monthly_Average;"Last 2 Years Monthly Average")
            {}
            column(Last_2_Years_Consumption;"Last 2 Years Consumption")
            {}
            column(PendingQuantity; "Pending Quantity")
            {
            }
            column(PendingRequisition; "Pending Requisition")
            {
            }
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
}
