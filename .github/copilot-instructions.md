# ASL Fishing Operation Management System - AI Coding Agent Instructions

## Project Overview
This is a **Business Central AL extension** (OnPrem target) for ASL Fishing Operation Management System, a shipping/fishing industry ERP. The app extends Microsoft Dynamics 365 Business Central 18.5 (platform 1.0.0.0, runtime 7.1) with custom functionality for vessel operations, payroll, inventory, and e-invoicing.

- **Publisher**: SSNL
- **App ID**: 8e62b29d-0ae9-4b2d-b33a-ecd63cd7da24
- **Object ID Range**: 50000-99999
- **Current Version**: 18.5.1.461

## Architecture & Code Organization

### Directory Structure
```
src/
  ├── codeunit/          # Business logic and event subscribers
  ├── table/             # Custom tables (50+ objects)
  ├── tableextension/    # Extensions to standard BC tables
  ├── page/              # Custom pages
  ├── pageextension/     # Extensions to standard BC pages
  ├── report/            # Custom RDLC reports
  ├── reportextension/   # Extensions to standard BC reports
  ├── enum/              # Custom enumerations
  ├── enumextension/     # Extensions to standard BC enums
  ├── xmlport/           # Data import/export
  └── permissionset/     # Permission configurations
Apps/                    # Shared AL objects
PS/                      # PowerShell deployment & migration scripts
Translations/            # XLF translation files
```

### Critical Domain Areas

**1. Vessel & Fishing Operations**
- Tables: `VesselPerformanceBySeaDay`, `FishingArea`, `SeaCatchY`, `CatchDefault`, `DayofTide`
- Business logic for sea days, catch recording, AGO consumption tracking
- Revenue/sea day and revenue/fishing day calculations

**2. Payroll System**
- Core table: `ASLPayrollSetup` (Table 50000) - centralized configuration
- Tables: `PayrollPeriods`, `PayrollPayslipHeader/Lines`, `PayrollEDCodes` (Earnings/Deductions)
- Custom overtime calculations by employee grade (Junior, Grade 2, Grade 3)
- Night shift and day shift ED codes

**3. Inventory & Procurement**
- Custom inventory valuation with RDLC reports
- `StoreRequisitionHeaderNew/LineNew` - requisition workflow
- `PurchaseVarianceItem` - variance tracking
- Extended posting groups with category classifications

**4. E-Invoicing**
- `ElectronicExportSetup`, `InvoiceExportLog`, `InvoiceExportSetup`
- `ElectronicInvoicePort.XmlPort` for electronic invoice generation
- `ElectronicExportDashboard.Page` for monitoring exports

## AL Development Conventions

### Naming Patterns
**INCONSISTENT** - Legacy migration artifact:
- **TableExtensions**: Follow pattern `tableextension{ID}` (e.g., `tableextension50256`) with display name only in object declaration
- **Custom Objects**: Use descriptive names (e.g., `ASLPayrollSetup`, `VesselPerformanceBySeaDay`)
- **Event Subscribers**: Named with "Subscriber" suffix (e.g., `AssemblyPostSubscriber`, `AvailableMgmtSubscriber`)

### Extension Pattern
All extensions use the `extends` keyword targeting standard BC objects:
```al
tableextension 50256 "tableextension50256" extends "Bank Account"
{
    fields { field(50001; Category; Option) {...} }
}
```

### Event-Driven Architecture
Heavy use of event subscribers in [src/codeunit](src/codeunit):
- `[EventSubscriber(ObjectType::Codeunit, Codeunit::"Assembly-Post", 'OnBeforePostItemConsumption', '', true, true)]`
- Subscribers handle cross-module integration without modifying base objects
- Files: `AnalysisViewSubsciber`, `DistIntegrationSubscriber`, `ConfigValidateMgmtSubcriber`

### Procedure Patterns
Table extensions frequently contain calculation procedures:
```al
procedure InventoryTwo(InvtCode: Code[10]; LocFilter: Code[100]; DateFilter: Text[100]): Decimal
```
Example: [src/tableextension/InventoryPostingGroupExt.TableExt.al](src/tableextension/InventoryPostingGroupExt.TableExt.al) has multiple `InventoryTotal` variants

## Development Workflows

### Environment Setup
- **BC Server**: BC180 server (Business Central 18.0)
- **Server URL**: http://localhost:8080/BC180
- **Server Instance**: BC180
- **Authentication**: Windows
- **Port**: 6049
- **Target**: OnPrem deployment
- **Runtime Version**: 7.1
- **Platform**: 1.0.0.0
- **Startup Object**: Report 50010
- Launch configuration in [.vscode/launch.json](.vscode/launch.json) - use "Your own server" profile

### Build Process
Use VS Code task: `Build AL Project` (dotnet build) - defined in [tasks.json](.vscode/tasks.json)
- Generates `.app` file (currently version 18.5.1.461)
- Auto-generates `ASL Upgrade Operation.g.xlf` in [Translations/](Translations/)

### Translation Management
- Uses XLF format in [Translations/](Translations/)
- Features enabled: `TranslationFile`, `GenerateCaptions`
- Update `.g.xlf` after each build, then sync language-specific XLF files

### Deployment
PowerShell scripts in [PS/](PS/) directory:
- [UpgradeV14ToV18.ps1](PS/UpgradeV14ToV18.ps1) - BC 14→18 migration
- [App Installation.ps1](PS/App Installation.ps1) - app deployment
- [Install Apps ASL.ps1](PS/Install Apps ASL.ps1) - multi-app installation

### Migration Context
This codebase resulted from BC 14→18 upgrade using `txt2al` conversion:
- Legacy C/AL comments remain (e.g., "Unsupported feature: Code Insertion")
- Some objects retain non-descriptive names from auto-conversion
- [ASLFinalUpgrade from BC14to18.ps1](ASLFinalUpgrade from BC14to18.ps1) contains full upgrade procedure

## Key Integration Points

### Standard BC Dependencies
- No explicit dependencies declared in `app.json` (relies on base application)
- Heavy reliance on standard tables: `Cust. Ledger Entry`, `Item Ledger Entry`, `Bank Account`, `G/L Account`
- **LS Retail integration**: System integrates with LS Retail for retail store operations (referenced in sales and transfer documents)

### Permission Model
Custom permission set: [src/permissionset/GeneratedPermission.PermissionSet.al](src/permissionset/GeneratedPermission.PermissionSet.al)
- Explicit `Permissions = TableData "..." = imd` declarations in codeunits (e.g., `Cust. Entry-Edit.`)

### RDLC Reports
Report layouts stored separately:
- `.rdlc` files in root: `AppraisalOrder.rdlc`, `InventoryValuation.rdlc`
- `reportrdlc/` folder contains additional layouts
- Report extensions modify existing BC reports (e.g., `InventPostgTest_pte`)

## Critical Gotchas

1. **NoImplicitWith Feature**: Enabled - always qualify field references with `Rec.` or variable name
2. **ID Range**: Strictly 50000-99999 - never use IDs outside this range
3. **Object Naming**: When creating new table/page extensions, follow existing `tableextension{ID}` pattern for consistency
4. **Event Subscribers**: Use `EventSubscriberInstance = StaticAutomatic` pattern (see [AssemblyPostSubscriber.Codeunit.al](src/codeunit/AssemblyPostSubscriber.Codeunit.al))
5. **Upgrade Context**: When modifying objects, check for C/AL migration comments that may indicate incomplete conversions

## Testing & Debugging

### Manual Testing Procedures

**Critical Test Scenarios**:

1. **Payroll Processing**
   - Create payroll period and generate payslips
   - Verify overtime calculations for each grade (Junior, Grade 2, Grade 3)
   - Test night shift vs day shift ED code applications
   - Validate earnings/deductions against `ASLPayrollSetup` configuration
   - Check staff loan deductions from control account

2. **Vessel Operations**
   - Record sea catch data for a vessel
   - Calculate vessel performance by sea day
   - Verify AGO consumption tracking and percentages
   - Test revenue/sea day and revenue/fishing day calculations
   - Validate lost days and fishing days metrics

3. **Inventory & Procurement**
   - Create store requisition (header/lines)
   - Test inventory valuation reports
   - Record purchase variance items
   - Verify inventory posting group calculations (`InventoryTwo`, `InventoryTotal2`, etc.)

4. **E-Invoicing**
   - Configure `ElectronicExportSetup` and `InvoiceExportSetup`
   - Generate electronic invoice via `ElectronicInvoicePort` XMLPort
   - Monitor export status in `ElectronicExportDashboard`
   - Verify invoice export log entries

### Debugging
- Debug using BC web client with AL debugger
- Set breakpoints in event subscribers to trace cross-module interactions
- Use BC180 server web client for testing changes

## Domain-Specific Knowledge

**Fishing Industry Terms**:
- **Sea Day**: Days vessel is at sea (used in performance calculations)
- **Fishing Day**: Subset of sea days actively fishing
- **Lost Days**: Non-productive sea time
- **AGO**: Automotive Gas Oil (diesel) consumption tracking
- **Cycle Day**: Full operational cycle including port time

**Payroll Grades**:
- Junior, Grade 2, Grade 3 - each with distinct OT rates (ordinary/special)
- ED Codes: Earnings/Deductions configuration stored in setup
