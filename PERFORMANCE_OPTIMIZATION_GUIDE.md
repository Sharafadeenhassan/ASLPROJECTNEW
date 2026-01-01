# Performance Optimization Guide
## ASL Fishing Operation Management System

**Date**: December 29, 2025  
**App Version**: 18.5.1.462

## Current Performance Issues Identified

### 1. **Slow Compilation/Propagation (2,382 Errors)**
All XMLPort objects show "AL Object ID Ninja" warnings. These are non-critical but slow down compilation significantly.

**Root Cause**: XMLPorts in the Object ID range (50000-99999) are not registered with AL Object ID Ninja extension.

**Solution Options**:
1. **Recommended**: Disable AL Object ID Ninja extension for this workspace
   - Open `.vscode/settings.json`
   - Add: `"al.enableCodeAnalysis": false,`
   
2. **Alternative**: Register all XMLPort IDs with the extension (time-consuming)

### 2. **Excel Export Not Responding - Memory Buildup**

**Issues Fixed**:
✅ `ElectronicInvoiceExcel.Report.al` (Report 50258)
✅ `ElectronicCrMemoExcel.Report.al` (Report 50257)

**Optimizations Applied**:
- Added `ExcelBuffer.DeleteAll()` and `Reset()` in `OnPreReport()` trigger
- Create column headers only ONCE per sheet (not on every record)
- Added `HeadersSheetCreated` and `LinesSheetCreated` flags
- Proper buffer cleanup before each export run

**Before**:
```al
trigger OnPreReport()
begin
    if FolderPath = '' then
        FolderPath := 'C:\\Exports';
end;
```

**After**:
```al
trigger OnPreReport()
begin
    // Performance: Clear Excel Buffer to prevent memory buildup
    ExcelBuffer.Reset();
    ExcelBuffer.DeleteAll();
    HeadersSheetCreated := false;
    
    if FolderPath = '' then
        if ExportSetup.Get('DEFAULT') then
            FolderPath := ExportSetup."Export Folder Path"
        else
            FolderPath := 'C:\\Exports';
end;
```

### 3. **CalcFields Performance Issues**

**Findings**: 20+ instances of `CalcFields` operations throughout codebase. Each CalcFields triggers a database query for FlowFields.

**High-Impact Files**:
- [SalesHeader50269.TableExt.al](src/tableextension/SalesHeader50269.TableExt.al) - Line 659
- [SalesLineExt.TableExt.al](src/tableextension/SalesLineExt.TableExt.al) - Multiple instances
- [DynamicsProcurementRegister.Table.al](src/table/DynamicsProcurementRegister.Table.al) - Lines 161, 173
- [ShopLines.Table.al](src/table/ShopLines.Table.al) - Line 40

**Recommendations**:
1. **Batch CalcFields**: Instead of multiple calls, use single call with all fields
   ```al
   // ❌ Slow
   ItemRec.CalcFields("Net Change");
   ItemRec.CalcFields("Qty. on Purch. Order");
   ItemRec.CalcFields("MR Approved Qty");
   
   // ✅ Fast
   ItemRec.CalcFields("Net Change", "Qty. on Purch. Order", "MR Approved Qty");
   ```

2. **Cache FlowField Results**: If same field used multiple times, store in variable
   ```al
   // ❌ Slow
   if Item.Inventory > 0 then begin
       Item.CalcFields(Inventory);
       Message('Stock: %1', Item.Inventory);
   end;
   
   // ✅ Fast
   Item.CalcFields(Inventory);
   InventoryQty := Item.Inventory;
   if InventoryQty > 0 then
       Message('Stock: %1', InventoryQty);
   ```

3. **Use SIFT Indexes**: Ensure FlowFields have proper SumIndexFields defined in table definitions

### 4. **Additional Performance Optimization Opportunities**

#### A. Excel Buffer Legacy Code
Multiple reports use old `Excel Buffer 4 P&L` (Table 50047) with commented-out Automation code:
- [BanksBalances.Report.al](src/Report%20Ext/BanksBalances.Report.al)
- [PaymentReport.Report.al](src/Report%20Ext/PaymentReport.Report.al)
- [VesselPerformanceConsolidax2.Report.al](src/Report%20Ext/VesselPerformanceConsolidax2.Report.al)

**Recommendation**: Migrate these reports to use standard `Excel Buffer` (temporary) instead of custom table.

#### B. Unused Src2 Directory
The `/Src2/` folder contains duplicate/obsolete code that may conflict:
- `ExcelBuffer4PL.Table.al` with commented Automation references
- Duplicate table extensions

**Recommendation**: Remove `/Src2/` directory after verifying no active references.

#### C. Database Optimization
Check SQL Server indexes for these heavily-queried tables:
- `Job Ledger Entry` (used in vessel performance calculations)
- `Item Ledger Entry` (inventory valuations, catch records)
- `Value Entry` (cost calculations)
- `Payroll Payslip Lines` (payroll processing)

Run SQL Server Index Tuning Advisor on BC database.

## Implementation Priority

### **Immediate (Do Now)**
1. ✅ Excel Buffer cleanup - **COMPLETED**
2. Disable AL Object ID Ninja extension warnings
3. Build and deploy to test performance

### **Short Term (This Week)**
1. Audit and batch all CalcFields operations
2. Test compile time after disabling Object ID Ninja
3. Monitor Excel export performance with users

### **Medium Term (Next Sprint)**
1. Migrate legacy Excel Buffer 4 P&L reports
2. Remove `/Src2/` obsolete code
3. Add SQL Server index optimization
4. Implement caching for frequently calculated FlowFields

### **Long Term (Next Month)**
1. Profile BC server performance with telemetry
2. Review event subscriber performance (96+ subscribers)
3. Optimize RDLC report queries
4. Implement background job queues for heavy reports

## Testing Checklist

After applying optimizations, test:
- [ ] Compile time reduced (measure before/after)
- [ ] Excel invoice export completes < 30 seconds for 100 records
- [ ] Excel credit memo export completes < 30 seconds for 100 records
- [ ] No memory errors during export
- [ ] Headers and Lines on separate sheets
- [ ] File downloads successfully
- [ ] BC web client responsive during export

## Monitoring

### Key Performance Indicators (KPIs)
- **Compile Time**: Target < 2 minutes (currently unknown)
- **Excel Export Time**: Target < 30 seconds for 100 invoices
- **Page Load Time**: Target < 3 seconds for Job Card page
- **Report Generation**: Target < 60 seconds for vessel performance reports

### Tools
- BC Admin Center > Telemetry
- SQL Server Activity Monitor
- Windows Performance Monitor (BC Server)
- Application Insights (if configured)

## Support & Escalation

If performance issues persist after optimizations:
1. Check BC Platform hotfixes (currently on 18.5.0.0)
2. Review SQL Server query execution plans
3. Consider upgrading BC version (18.5 → 19.x → 20.x)
4. Contact Microsoft BC Support with telemetry data

---

**Next Steps**: Build the app and test compile time + Excel export performance.
