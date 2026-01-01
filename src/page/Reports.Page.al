page 50053 "Reports"
{
    Caption = 'ASL Reports List';
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
    }

    actions
    {
        area(creation)
        {
            group("Purchase&Payables")
            {
                Image = Report;
                action("Vendor -summary Agng")
                {
                    Image = Report;
                    RunObject = Report "Vendor - Summary Aging";
                    ApplicationArea = All;
                }
                action("Vendor-top 10 List")
                {
                    Image = Report;
                    RunObject = Report "Vendor - Top 10 List";
                    ApplicationArea = All;
                }
                action("Vendor- Item purchase")
                {
                    Image = Report;
                    RunObject = Report "Vendor/Item Purchases";
                    ApplicationArea = All;
                }
                action("Quotes Comparision Report")
                {
                    Image = Report;
                    RunObject = Report "Payroll Rprt- WITH DELETED EMP";
                    ApplicationArea = All;
                }
                action("Compare Standard &Atual Rate")
                {
                    Image = Report;
                    RunObject = Report "Transfer Waybill";
                    ApplicationArea = All;
                }
                action("Purchase Import status ")
                {
                    Image = Report;
                    RunObject = Report "Purchase Import Status";
                    ApplicationArea = All;
                }
                action("Pending purchase Orde")
                {
                    Image = Report;
                    RunObject = Report "Pending Purchase Orders";
                    ApplicationArea = All;
                }
                action("Purchase variance report")
                {
                    Image = Report;
                    RunObject = Report "Sales Returns Register";
                    ApplicationArea = All;
                }
                action("Purchase reorder")
                {
                    Image = Report;
                    RunObject = Report "Purchase Re-order";
                    ApplicationArea = All;
                }
                action("Vendor -Balance to date")
                {
                    Image = Report;
                    RunObject = Report "Vendor - Balance to Date";
                    ApplicationArea = All;
                }
                action("Purchase register ")
                {
                    Image = Report;
                    RunObject = Report "Purchase Register(LCY)";
                    ApplicationArea = All;
                }
                action("Purchase return register")
                {
                    Image = Report;
                    RunObject = Report "Purchase Returns Register";
                    ApplicationArea = All;
                }
            }
        }
        area(processing)
        {
            group(Jobs)
            {
                Image = Report;
                action("Consolidatdd daily Point Rep!")
                {
                    Image = Report;
                    RunObject = Report "Sales Test/Confirmation Report";
                    ApplicationArea = All;
                }
                action("New daily points report fast")
                {
                    Image = Report;
                    RunObject = Report "New Daily Points Report Fast";
                    ApplicationArea = All;
                }
                action("Historical  daily points rep")
                {
                    Image = Report;
                    RunObject = Report "Historical Daily Points Rep!";
                    ApplicationArea = All;
                }
                action("Consolidated narration")
                {
                    Image = Report;
                    RunObject = Report "Container By Month Shipment";
                    ApplicationArea = All;
                }
                action("Voyage Narration")
                {
                    Image = Report;
                    RunObject = Report "Voyage Narration";
                    ApplicationArea = All;
                }
                action("New daily point s by capt rep")
                {
                    Image = Report;
                    RunObject = Report "New Daily Points by Capt Rep";
                    ApplicationArea = All;
                }
                action("Points summary report")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //***R RunObject = Report "Points Summary VJ";
                }
                action("Consolidated narration-kkk")
                {
                    Image = Report;
                    RunObject = Report "Consolidated Narration";
                    ApplicationArea = All;
                }
                action("Skipper/vessel performance")
                {
                    Image = Report;
                    RunObject = Report "Skipper/Vessel Performance";
                    ApplicationArea = All;
                }
                action("Catch incentive")
                {
                    Image = Report;
                    RunObject = Report "Catch Incentive";
                    ApplicationArea = All;
                }
                action("Job-Transaction Detail")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report1204;
                }
                action("Daily points-with fishhold Temp")
                {
                    Image = Report;
                    RunObject = Report "NewDailyPointsReport Fast-AP";
                    ApplicationArea = All;
                }
                action(Organoleptic)
                {
                    Image = Report;
                    RunObject = Report Organoleptic0809;
                    ApplicationArea = All;
                }
                action("Consolidatdd daily Points")
                {
                    Image = Report;
                    RunObject = Report "Balance At Date (Cust/Vend)";
                    ApplicationArea = All;
                }
                action("Voyage End consumption Report")
                {
                    Image = Report;
                    // RunObject = Report "Voyage Ending Inv Cons exp3";
                    ApplicationArea = All;
                }
                action("Daily Breakup by Vessel Rep 1")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //***p RunObject = Report "Daily BreakUp by Vessel Rep 1";
                }
                action("Daily Breakup by Vessel Rep 2")
                {
                    Image = Report;
                    RunObject = Report "Daily BreakUp by Vessel Rep 2";
                    ApplicationArea = All;
                }
                action("Daily Breakup by Vessel Rep 3")
                {
                    Image = Report;
                    RunObject = Report "Daily BreakUp by Vessel Rep 3";
                    ApplicationArea = All;
                }
                action("Daily Breakup by Vessel Rep 4")
                {
                    Image = Report;
                    RunObject = Report "Foreign Banks Report";
                    ApplicationArea = All;
                }
                action("Daily Breakup by Vessel")
                {
                    Image = Report;
                    RunObject = Report "Daily Break Up By Vessel";
                    ApplicationArea = All;
                }
                action("Daily Breakup by Vess summary ")
                {
                    Image = Report;
                    RunObject = Report "Daily BreakUp by Vess Summary";
                    ApplicationArea = All;
                }
                action("Job-Transaction Detail2")
                {
                    Image = Report;
                    RunObject = Report "Job - Transaction Detail";
                    ApplicationArea = All;
                }
                action("Inventory-Transaction Detail")
                {
                    Image = Report;
                    RunObject = Report "Inventory - Transaction Detail";
                    ApplicationArea = All;
                }
                action("Transfer to Vessel")
                {
                    Image = Report;
                    RunObject = Report "Transfer To Vessel";
                    ApplicationArea = All;
                }
                action("Vessel Daily log")
                {
                    Image = Report;
                    RunObject = Report "Vessel Daily Log";
                    ApplicationArea = All;
                }
                action("Job-Transaction Detail 2")
                {
                    Image = Report;
                    RunObject = Report "Job - Transaction Detail 2";
                    ApplicationArea = All;
                }
                action("Periodic Landing Report")
                {
                    Image = Report;
                    RunObject = Report "Account Schedule BS";
                    ApplicationArea = All;
                }
                action("Voyage Narration(Points)")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //***R RunObject = Report "Voyage Narration (Points)";
                }
                action("Stock on bord")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //***R RunObject = Report "Stock On Board";
                }
            }
        }
        area(navigation)
        {
            group(Inventory)
            {
                Image = Report;
                action("Inventory-Transaction Detail(Bin card)")
                {
                    Caption = '<Inventory-Transaction Detail(Bin card)';
                    Image = Report;
                    RunObject = Report "Inventory - Transaction Detail";
                    ApplicationArea = All;
                }
                action("Item Age Composition-Quantity")
                {
                    Image = Report;
                    RunObject = Report "Item Age Composition - Qty.";
                    ApplicationArea = All;
                }
                action("Transfer to vessel Report(Issues)")
                {
                    Image = Report;
                    RunObject = Report "Transfer To Vessel";
                    ApplicationArea = All;
                }
                action("Issues to cost centers")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report50107;
                }
                action("Periodic stock production")
                {
                    Image = Report;
                    RunObject = Report "Periodic Stock Position-CODEWA";
                    ApplicationArea = All;
                }
                action("Inventory Avg. Monthly Demand")
                {
                    Image = Report;
                    RunObject = Report "Inventory Avg. Monthly Demand";
                    ApplicationArea = All;
                }
                action("Job-Transaction Detail1")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report1204;
                }
                action("Phys. Inventory List")
                {
                    Image = Report;
                    RunObject = Report "Phys. Inventory List";
                    ApplicationArea = All;
                }
                action("Inventory avaliability")
                {
                    Image = Report;
                    RunObject = Report "Inventory - Transaction Detail";
                    ApplicationArea = All;
                }
                action("Short Supply by vessel")
                {
                    Image = Report;
                    RunObject = Report "Short Supply thru Posted Trans";
                    ApplicationArea = All;
                }
                action("Inventory-Trans for D period")
                {
                    Image = Report;
                    RunObject = Report "Inventory - Transaction 123";
                    ApplicationArea = All;
                }
                action("Transfer Processing/Fishshop")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report50105;
                }
                action("Inventory Valuation")
                {
                    Image = Report;
                    RunObject = Report "Inventory Valuation";
                    ApplicationArea = All;
                }
                action("BOM-Finished Goods")
                {
                    Image = Report;
                    RunObject = Report "Assembly BOM - End Items";
                    ApplicationArea = All;
                }
                action("BOM Journal-test")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report802;
                }
                action("BOM-Raw Materials")
                {
                    Image = Report;
                    RunObject = Report "Assembly BOM - Raw Materials";
                    ApplicationArea = All;
                }
                action("BOM Register")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report803;
                }
                action("BOM-Requirmnet Planning")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report807;
                }
                action("BOM-Requirment Calculation")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //*** RunObject = Report Report808;
                }
                action("BOM-Sub-Assemblies")
                {
                    Image = Report;
                    RunObject = Report "Assembly BOM - Subassemblies";
                    ApplicationArea = All;
                }
                action(BOMs)
                {
                    Image = Report;
                    RunObject = Report "Assembly BOMs";
                    ApplicationArea = All;
                }
                action("Where-Used List")
                {
                    Image = Report;
                    RunObject = Report "Where-Used List";
                    ApplicationArea = All;
                }
            }
        }
        area(reporting)
        {
            group("Sales&Receviables")
            {
                Image = Report;
                action("Organoleptic Report")
                {
                    Image = Report;
                    RunObject = Report Organoleptic;
                    ApplicationArea = All;
                }
                action("Fish Shop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("Sales Invoice Check Report")
                {
                    Image = Report;
                    RunObject = Report "Consolidatdd Daily Points Rep!";
                    ApplicationArea = All;
                }
                action("Local sales report")
                {
                    Image = Report;
                    RunObject = Report "Local Sales Report1";
                    ApplicationArea = All;
                }
                action("Fish Shop Sales Report-new")
                {
                    Image = Report;
                    RunObject = Report "Fish Shop Sales Rep";
                    ApplicationArea = All;
                }
                action("Fish Shop Print-Before Posting ")
                {
                    Image = Report;
                    RunObject = Report "FIsh And Shop";
                    ApplicationArea = All;
                }
                action("Periodic Stock Position by Grip")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //***R RunObject = Report "Periodic Stock Position by Grp";
                }
                action("Apapa Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "Apapa Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("VI  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "VI Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("ABUJA  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "ABUJA Fish Shop Sales Report.";
                    ApplicationArea = All;
                }
                action("IKEJA  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "IKEJA Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("LEKKI  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "LEKKI Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("SURULERE Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "SURULERE Fish Shop SalesReport";
                    ApplicationArea = All;
                }
                action("FESTAC  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "FESTAC Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("IBADAN  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "IBADAN Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("ALL  Fishshop Sales Report")
                {
                    Image = Report;
                    RunObject = Report "ALL Fish Shop Sales Report";
                    ApplicationArea = All;
                }
                action("Local sales report-Import Fish")
                {
                    Image = Report;
                    RunObject = Report "Local Sales Report 2";
                    ApplicationArea = All;
                }
                action("Institutional Sales Report")
                {
                    Image = Report;
                    RunObject = Report "Institutional Sales Report";
                    ApplicationArea = All;
                }
                action("Customer - Balance to Date")
                {
                    Image = Report;
                    RunObject = Report "Customer - Balance to Date";
                    ApplicationArea = All;
                }
                action("Customer/Item Sales")
                {
                    Image = Report;
                    RunObject = Report "Customer/Item Sales";
                    ApplicationArea = All;
                }
            }
            group("General Leadger")
            {
                Image = Report;
                action("Bank Acc.- Detail Trail Bal.")
                {
                    Image = Report;
                    RunObject = Report "Bank Acc. - Detail Trial Bal.";
                    ApplicationArea = All;
                }
                action("Closing Trail Balance")
                {
                    Image = Report;
                    RunObject = Report "Closing Trial Balance";
                    ApplicationArea = All;
                }
                action("Detail Trial Balance")
                {
                    Image = Report;
                    RunObject = Report "Detail Trial Balance";
                    ApplicationArea = All;
                }
                action("Foreign Currency  Balance")
                {
                    Image = Report;
                    RunObject = Report "Foreign Currency Balance";
                    ApplicationArea = All;
                }
                action("G/L Register")
                {
                    Image = Report;
                    RunObject = Report "G/L Register";
                    ApplicationArea = All;
                }
                action("No. Series Check")
                {
                    Image = Report;
                    RunObject = Report "No. Series Check";
                    ApplicationArea = All;
                }
                action("Receivables-Payables")
                {
                    Image = Report;
                    RunObject = Report "Receivables-Payables";
                    ApplicationArea = All;
                }
                action("Reconcile Cust and vend Accs")
                {
                    Image = Report;
                    RunObject = Report "Reconcile Cust. and Vend. Accs";
                    ApplicationArea = All;
                }
                action("Trial Balance")
                {
                    Image = Report;
                    RunObject = Report "Trial Balance";
                    ApplicationArea = All;
                }
                action("Trial Balance/Budget")
                {
                    Image = Report;
                    RunObject = Report "Trial Balance/Budget";
                    ApplicationArea = All;
                }
                action("Trial Balance/previous Year")
                {
                    Image = Report;
                    RunObject = Report "Trial Balance/Previous Year";
                    ApplicationArea = All;
                }
                action("IOU Status Report")
                {
                    Image = Report;
                    RunObject = Report "IOU Status Report";
                    ApplicationArea = All;
                }
                action("Periodic Landing Report1")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //***R RunObject = Report "Periodic Landing Report";
                }
                action("Bank LIST local currency")
                {
                    Image = Report;
                    RunObject = Report "BANK LIST local currency";
                    ApplicationArea = All;
                }
                action("Bank LIST Foreign  currency")
                {
                    Image = Report;
                    RunObject = Report "BANK LIST foreign currency";
                    ApplicationArea = All;
                }
                action("Bank balance")
                {
                    Image = Report;
                    RunObject = Report "Banks Balances";
                    ApplicationArea = All;
                }
                action("Balance at date (cust/vend)")
                {
                    Image = Report;
                    RunObject = Report "Voyage P &  L";
                    ApplicationArea = All;
                }
                action("OUTSTANDING LOANS")
                {
                    Image = Report;
                    RunObject = Report "Online loan";
                    ApplicationArea = All;
                }
                action("Vendor- Summary aging")
                {
                    Image = Report;
                    RunObject = Report "Vendor - Summary Aging";
                    ApplicationArea = All;
                }
                action("Customer-Summary aging")
                {
                    Image = Report;
                    RunObject = Report "Customer - Summary Aging";
                    ApplicationArea = All;
                }
                action("Account schedule Portait")
                {
                    Image = Report;
                    RunObject = Report "Account Schedule Portrait";
                    ApplicationArea = All;
                }
                action("Periodic stock position by Grp")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //**** RunObject = Report "Periodic Stock Position by Grp";
                }
                action("Journal Register")
                {
                    Image = Report;
                    RunObject = Report "Journal Register";
                    ApplicationArea = All;
                }
                action("New Trail Balance")
                {
                    Image = Report;
                    RunObject = Report "New Trial Balance";
                    ApplicationArea = All;
                }
                action("Sales register")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //RunObject = Report Report50145;
                }
            }
            group("Human Resource")
            {
                Image = Report;
                action("Employee-Staff Absences")
                {
                    Image = Report;
                    RunObject = Report "Employee - Staff Absences";
                    ApplicationArea = All;
                }
                action("Employee-Absences by Causes")
                {
                    Image = Report;
                    RunObject = Report "Employee - Absences by Causes";
                    ApplicationArea = All;
                }
                action("Man power budget report")
                {
                    Image = Report;
                    RunObject = Report "Mp Budget report";
                    ApplicationArea = All;
                }
                action("Payrol report-NSITF")
                {
                    Image = Report;
                    ApplicationArea = All;
                    //RunObject = Report Report50162;
                }
                action("Staff position count")
                {
                    Image = Report;
                    RunObject = Report "Staff Position as at";
                    ApplicationArea = All;
                }
                action("Staff position -Group Wise")
                {
                    Image = Report;
                    RunObject = Report "Staff Position as at by PG";
                    ApplicationArea = All;
                }
                action("Employee-List")
                {
                    Image = Report;
                    RunObject = Report "Employee - List";
                    ApplicationArea = All;
                }
                action("Employee-Bank Acc No.s")
                {
                    Image = Report;
                    RunObject = Report "Inventory(Value) - Top 10 List";
                    ApplicationArea = All;
                }
            }
            group("Fixed assets")
            {
                Image = Report;
                action("Fixed asset Register")
                {
                    Image = Report;
                    RunObject = Report "Fixed Asset Register";
                    ApplicationArea = All;
                }
                action("Fixed Asset -Analysis")
                {
                    Image = Report;
                    RunObject = Report "Fixed Asset - Analysis";
                    ApplicationArea = All;
                }
                action("Fixed Asset-Detail")
                {
                    Image = Report;
                    RunObject = Report "Fixed Asset - Details";
                    ApplicationArea = All;
                }
                action("Fixed Asset-G/L Analysis")
                {
                    Image = Report;
                    RunObject = Report "Fixed Asset - G/L Analysis";
                    ApplicationArea = All;
                }
                action("Maintenance Register")
                {
                    Image = Report;
                    RunObject = Report "Maintenance Register";
                    ApplicationArea = All;
                }
                action("Maintainance- Analysis")
                {
                    Image = Report;
                    RunObject = Report "Maintenance - Analysis";
                    ApplicationArea = All;
                }
                action("Maintainance- Detail")
                {
                    Image = Report;
                    RunObject = Report "Maintenance - Details";
                    ApplicationArea = All;
                }
                action("Maintainance-Next Service")
                {
                    Image = Report;
                    RunObject = Report "Maintenance - Next Service";
                    ApplicationArea = All;
                }
                action("Vehicle Maintainance-Analysis")
                {
                    Image = Report;
                    RunObject = Report "Voyage P & L Batch";
                    ApplicationArea = All;
                }
                action("Customer- Detail Trail Bal.")
                {
                    Image = Report;
                    RunObject = Report "Customer - Detail Trial Bal.";
                    ApplicationArea = All;
                }
                action("Vendor-Detail Trail bal.")
                {
                    Image = Report;
                    RunObject = Report "Vendor - Detail Trial Balance";
                    ApplicationArea = All;
                }
                action("Customer-Balance to Date")
                {
                    Image = Report;
                    RunObject = Report "Customer - Balance to Date";
                    ApplicationArea = All;
                }
                action("Inventory-Top 10List")
                {
                    Image = Report;
                    RunObject = Report "Inventory - Top 10 List";
                    ApplicationArea = All;
                }
                action("Inventory Valuation2")
                {
                    Image = Report;
                    RunObject = Report "Voyage P &  L";
                    ApplicationArea = All;
                }
                action("Group Inventory Valuation ")
                {
                    Image = Report;
                    RunObject = Report "Purchase Request List";
                    ApplicationArea = All;
                }
                action("Item Age Composition-Value")
                {
                    Image = Report;
                    RunObject = Report "Item Age Composition - Value";
                    ApplicationArea = All;
                }
                action("Inventory Valuation1")
                {
                    Image = Report;
                    RunObject = Report "Inventory Valuation";
                    ApplicationArea = All;
                }
                action("Customer-Detail Trail Bal.")
                {
                    Image = Report;
                    RunObject = Report "Customer - Detail Trial Bal.";
                    ApplicationArea = All;
                }
                action("Export order Summary")
                {
                    Image = Report;
                    RunObject = Report "Export Order Details";
                    ApplicationArea = All;
                }
                action("Export Order Container Detail")
                {
                    Image = Report;
                    RunObject = Report "Appraisal Order";
                    ApplicationArea = All;
                }
                action("Item Age Composition-Value1")
                {
                    Image = Report;
                    RunObject = Report "Item Age Composition - Qty.";
                    ApplicationArea = All;
                }
                action("Vendor-Detail Trail bal.1")
                {
                    Image = Report;
                    RunObject = Report "Vendor - Detail Trial Balance";
                    ApplicationArea = All;
                }
                action("Bank Acc-Detail Trail Bal-1404")
                {
                    Image = Report;
                    RunObject = Report "Bank Acc-Detail Trial Bal-1404";
                    ApplicationArea = All;
                }
                action("Detail Trial Balance-4")
                {
                    Image = Report;
                    RunObject = Report "Detail Trial Balance-4";
                    ApplicationArea = All;
                }
                action("Vendor- Detail Trial Balance-304")
                {
                    Image = Report;
                    RunObject = Report "Vendor-Detail Trial Balanc-304";
                    ApplicationArea = All;
                }
                action("Inventory-Transaction-704")
                {
                    Image = Report;
                    RunObject = Report "Inventory - BINCARD 704";
                    ApplicationArea = All;
                }
                action("Consumptions Vessel Wise VJ")
                {
                    Image = Report;
                    RunObject = Report "Consumptions Vessel Wise VJ";
                    ApplicationArea = All;
                }
                action("Inventory-BINCARD 704 B")
                {
                    Image = Report;
                    RunObject = Report "Inventory - BINCARD 704 B";
                    ApplicationArea = All;
                }
                action("Import item summary VJ")
                {
                    Image = Report;
                    RunObject = Report "Import Items Summary VJ";
                    ApplicationArea = All;
                }
                action("Vessel Performance ")
                {
                    Image = Report;
                    RunObject = Report "Vessel Performance";
                    ApplicationArea = All;
                }
                action("Cummulative Payroll Report")
                {
                    Image = Report;
                    RunObject = Report "Cummulative Payroll Report";
                    ApplicationArea = All;
                }
                action("Import Summary for a Period")
                {
                    Image = Report;
                    RunObject = Report "Import for a period 2 VJ";
                    ApplicationArea = All;
                }
                action("FISH SHOP Sales Statistics")
                {
                    Image = Report;
                    RunObject = Report "Inventory - Sales Statistics";
                    ApplicationArea = All;
                }
                action("Posted Catch Reconcilation")
                {
                    Image = Report;
                    RunObject = Report "Catch Reconciliatn Posted";
                    ApplicationArea = All;
                }
                action("Detail Trail Balnce-5")
                {
                    Image = Report;
                    RunObject = Report "Detail Trial Balance - 5";
                    ApplicationArea = All;
                }
            }
            group(Resource)
            {
                Image = Report;
                action("Resource List")
                {
                    Image = Report;
                    RunObject = Report "Resource - List";
                    ApplicationArea = All;
                }
            }
            group(PayRolls)
            {
                Image = Report;
                action("ASL Create New Payslips ")
                {
                    Image = Report;
                    RunObject = Report "ASL Create New payslips - New";
                    ApplicationArea = All;
                }
                action("ASL Monthly Payslip")
                {
                    Image = Report;
                    RunObject = Report "Monthly Payslip";
                    ApplicationArea = All;
                }
                action("Personal Record List")
                {
                    Image = Report;
                    RunObject = Report "Sales Delivery Note";
                    ApplicationArea = All;
                }
                action("Payroll Report")
                {
                    Image = Report;
                    RunObject = Report "Payroll Report";
                    ApplicationArea = All;
                }
                action("Online loan")
                {
                    Image = Report;
                    RunObject = Report "OUTSTANDING LOANS";
                    ApplicationArea = All;
                }
                action("IOU Balance")
                {
                    Image = Report;
                    RunObject = Report "IOU Balance";
                    ApplicationArea = All;
                }
                action("ASL Outstanding Loans")
                {
                    Image = Report;
                    RunObject = Report "Local Sales Report1";
                    ApplicationArea = All;
                }
                action("Employee-Bank Accts")
                {
                    Image = Report;
                    RunObject = Report "Employee-Bank Acct";
                    ApplicationArea = All;
                }
                action("Payroll Rprt-WITH DELETED EMP")
                {
                    Image = Report;
                    RunObject = Report "Payroll Rprt- WITH DELETED EMP";
                    ApplicationArea = All;
                }
            }
        }
    }
}
