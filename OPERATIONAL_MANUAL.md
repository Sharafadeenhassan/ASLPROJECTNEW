# ASL Fishing Operation Management System - Operational Manual

**Version**: 18.5.1.461  
**Publisher**: SSNL  
**Last Updated**: December 26, 2025

---

## Table of Contents

1. [System Overview](#system-overview)
2. [Payroll Management](#payroll-management)
3. [Vessel Operations Management](#vessel-operations-management)
4. [Inventory & Procurement](#inventory--procurement)
5. [Electronic Invoicing](#electronic-invoicing)
6. [System Configuration](#system-configuration)
7. [Troubleshooting](#troubleshooting)

---

## 1. System Overview

### Introduction

ASL Fishing Operation Management System is a Business Central extension designed specifically for the shipping and fishing industry. The system manages:

- **Vessel operations and performance tracking**
- **Payroll with maritime industry-specific calculations**
- **Inventory management for marine operations**
- **Electronic invoice generation and export**

### Key Modules

| Module | Purpose | Primary Users |
|--------|---------|---------------|
| Payroll | Employee compensation, overtime, loans | HR, Payroll Officers |
| Vessel Operations | Sea days, catch tracking, performance | Operations, Fleet Managers |
| Inventory | Stock management, requisitions, valuation | Warehouse, Procurement |
| E-Invoicing | Electronic invoice generation and export | Accounting, Sales |

---

## 2. Payroll Management

### 2.1 Payroll Setup

#### Accessing Payroll Setup

1. Navigate to **Search** (Alt + Q)
2. Type "ASL Payroll Setup"
3. Press Enter to open the setup page

**[SCREENSHOT PLACEHOLDER: ASL Payroll Setup page showing all configuration fields]**

#### Key Configuration Fields

| Field | Description | Example |
|-------|-------------|---------|
| Loan Nos. | Number series for staff loans | LOAN-001 |
| Employee Nos. | Number series for employees | EMP-001 |
| Overtime Nos. | Number series for overtime records | OT-001 |
| OT Rate Ordinary Jnr | Ordinary overtime rate for Junior staff | 1.5 |
| OT Rate Special Jnr | Special overtime rate for Junior staff | 2.0 |
| Night Shift ED | Earnings/Deduction code for night shift | NSHIFT |
| Day Shift ED | Earnings/Deduction code for day shift | DSHIFT |
| Staff Loans Control Account | G/L account for loan tracking | 2150 |

#### Employee Grade Structure

The system supports three employee grades with different overtime rates:

1. **Junior (Jnr)** - Entry-level maritime staff
   - Ordinary OT Rate: 1.5x base rate
   - Special OT Rate: 2.0x base rate

2. **Grade 2 (Grd2)** - Intermediate maritime staff
   - Ordinary OT Rate: 1.6x base rate
   - Special OT Rate: 2.1x base rate

3. **Grade 3 (Grd3)** - Senior maritime staff
   - Ordinary OT Rate: 1.7x base rate
   - Special OT Rate: 2.2x base rate

### 2.2 Managing Payroll Periods

#### Creating a New Payroll Period

1. Search for "Payroll Periods"
2. Click **New** (Ctrl + N)
3. Enter the following information:
   - **Period Code**: YYYY-MM (e.g., 2025-12)
   - **Start Date**: First day of the period
   - **End Date**: Last day of the period
   - **Payment Date**: Date when employees will be paid
4. Click **OK** to save

**[SCREENSHOT PLACEHOLDER: Payroll Periods list showing multiple periods]**

#### Period Status

- **Open**: Period is active and can accept payroll entries
- **Closed**: Period is finalized, no further changes allowed
- **Processing**: Payslips are being generated

### 2.3 Generating Payslips

#### Step-by-Step Process

1. Navigate to "Payroll Payslip Header"
2. Click **Process** > **Generate Payslips**
3. Select the payroll period
4. Set filters (optional):
   - Department
   - Employee range
   - Grade level
5. Click **OK** to generate

**[SCREENSHOT PLACEHOLDER: Generate Payslips batch job dialog]**

#### Payslip Components

Each payslip consists of:

**Header Information**:
- Employee No.
- Employee Name
- Period Code
- Payment Date
- Bank Account

**Line Items** (Payroll Payslip Lines):
- Earnings (Basic Pay, Allowances, Overtime)
- Deductions (Taxes, Loans, Insurance)
- Net Pay calculation

**[SCREENSHOT PLACEHOLDER: Payroll Payslip showing header and lines]**

### 2.4 Processing Overtime

#### Recording Overtime

1. Open "Payroll E/D Codes"
2. Locate the appropriate OT code:
   - Junior Ordinary: OT-JNR-ORD
   - Junior Special: OT-JNR-SPC
   - Grade 2 Ordinary: OT-GR2-ORD
   - Grade 2 Special: OT-GR2-SPC
   - Grade 3 Ordinary: OT-GR3-ORD
   - Grade 3 Special: OT-GR3-SPC

**[SCREENSHOT PLACEHOLDER: Payroll E/D Codes list]**

#### Overtime Calculation Example

**Scenario**: Junior employee worked 10 hours overtime (5 ordinary, 5 special)
- Base hourly rate: $15.00
- Ordinary OT (5 hrs × $15.00 × 1.5): $112.50
- Special OT (5 hrs × $15.00 × 2.0): $150.00
- **Total OT Pay**: $262.50

### 2.5 Managing Staff Loans

#### Creating a Loan

1. Navigate to "Loan" table
2. Click **New**
3. Enter loan details:
   - Employee No.
   - Loan Amount
   - Start Date
   - Installment Amount
   - Number of Installments
4. The system automatically:
   - Posts to Staff Loans Control Account
   - Creates deduction entries in payslips
   - Tracks outstanding balance

**[SCREENSHOT PLACEHOLDER: Loan card showing loan details and repayment schedule]**

---

## 3. Vessel Operations Management

### 3.1 Vessel Operations (Job Card)

#### Managing Voyage Status

The Job Card tracks vessel operations through four status levels:
1. **Budget** - Planning phase
2. **Preparation** - Vessel prep before departure
3. **Voyage Start** - Active voyage
4. **Close Job Card** (Completed) - Voyage ended

**Important: ETA and Sea Days Preservation**

When closing and reopening voyages:
- **First Closure** (Voyage Start → Close Job Card):
  - ETA (Ending Date) is set from Arrival Time
  - Sea Days are calculated automatically
  - All performance metrics are computed

- **Reopening and Subsequent Closures**:
  - Original ETA date is preserved
  - Original Sea Days remain unchanged
  - Material consumption and ledger entries always reflect real-time data
  - Manual date changes will recalculate Sea Days

This ensures historical voyage data integrity when reviewing or making adjustments to closed voyages.

#### Recording Vessel Performance

1. Search for "Vessel Performance By Sea Day"
2. Click **New**
3. Enter voyage information:
   - **Vessel Code** (Vess field)
   - **Voyage Sea Days**: Select 40, 45, or 60 days
   - **Cycle Day**: Total days including port time
   - **Fishing Days**: Actual days spent fishing
   - **Lost Days**: Non-productive sea days
   - **Port Days**: Days in port

**[SCREENSHOT PLACEHOLDER: Vessel Performance By Sea Day card]**

#### Performance Metrics

The system automatically calculates:

| Metric | Formula | Purpose |
|--------|---------|---------|
| Rev/SD | Revenue ÷ Sea Days | Revenue efficiency per sea day |
| Rev/FD | Revenue ÷ Fishing Days | Revenue efficiency per fishing day |
| AGO Perct | (AGO Cost ÷ Revenue) × 100 | Fuel cost percentage |
| Gross Margin Perc | ((Revenue - Direct Costs) ÷ Revenue) × 100 | Profitability measure |

### 3.2 Sea Catch Recording

#### Entering Catch Data

1. Open "Sea Catch Y" table
2. Create new catch record:
   - Date of catch
   - Vessel
   - Fishing Area (from "Fishing Area" table)
   - Catch quantity by species
   - Market destination (Export/Local)

**[SCREENSHOT PLACEHOLDER: Sea Catch Y entry form]**

#### Fishing Areas

Common fishing areas tracked:
- Coastal waters
- Deep sea zones
- Exclusive Economic Zone (EEZ)
- International waters

**[SCREENSHOT PLACEHOLDER: Fishing Area list]**

### 3.3 AGO (Fuel) Consumption Tracking

#### Recording Fuel Usage

1. Navigate to "AGO Table"
2. Enter consumption data:
   - Vessel
   - Date
   - Quantity (liters)
   - Cost
3. Link to specific voyage

**[SCREENSHOT PLACEHOLDER: AGO Table with consumption records]**

#### Monitoring Fuel Efficiency

The system calculates:
- AGO consumption per sea day
- AGO percentage of revenue
- Variance from expected consumption
- Trend analysis over multiple voyages

### 3.4 Revenue Analysis

#### Revenue Breakdown

Revenue is tracked by:

1. **Export Value (N)** - International sales
2. **Local Value (N)** - Domestic sales
3. **Total Revenue** - Sum of export and local

**Formula**: Revenue = Export Val (N) + Local Val (N)

#### Performance Reports

Run these reports for analysis:
- Revenue per Sea Day by Vessel
- Fishing Day Efficiency
- Lost Days Analysis
- AGO Consumption Trends

**[SCREENSHOT PLACEHOLDER: Location Vessel Sea Day report sample]**

---

## 4. Inventory & Procurement

### 4.1 Store Requisitions

#### Creating a Requisition

1. Search for "Store Requisition Header New"
2. Click **New**
3. Fill in header information:
   - Requisition No. (auto-generated)
   - Requesting Department
   - Date
   - Required Date
   - Status (Open/Submitted/Approved)

**[SCREENSHOT PLACEHOLDER: Store Requisition Header card]**

#### Adding Requisition Lines

1. In the requisition header, select **Lines**
2. For each item needed:
   - Item No.
   - Description
   - Quantity
   - Unit of Measure
   - Location Code
   - Estimated Cost

**[SCREENSHOT PLACEHOLDER: Store Requisition Lines showing multiple items]**

#### Requisition Workflow

```
Open → Submit for Approval → Approved → Purchase Order Created → Received → Posted
```

### 4.2 Inventory Valuation

#### Running Valuation Reports

1. Navigate to **Reports** > "Inventory Valuation"
2. Set filters:
   - Date range
   - Location
   - Inventory Posting Group
   - Item category
3. Click **Preview** or **Print**

**[SCREENSHOT PLACEHOLDER: Inventory Valuation report with sample data]**

#### Valuation Methods

The system supports:
- FIFO (First In, First Out)
- Average Cost
- Standard Cost

#### Custom Valuation Calculations

The system includes custom procedures for inventory totals:
- `InventoryTwo` - Location and date filtered inventory
- `InventoryTotal2` - Consolidated inventory by date
- `InventoryThree` - Category-specific inventory
- `InventoryTotal3` - Aggregate category inventory
- `InventoryFour` - Source code filtered inventory

### 4.3 Purchase Variance Tracking

#### Recording Purchase Variances

1. Open "Purchase Variance Item"
2. Enter variance details:
   - Item No.
   - Purchase Order No.
   - Expected Quantity
   - Received Quantity
   - Variance Quantity
   - Variance Amount
   - Reason Code

**[SCREENSHOT PLACEHOLDER: Purchase Variance Item entry]**

#### Variance Analysis

Common variance reasons:
- Damaged goods
- Short delivery
- Quantity discrepancies
- Quality issues
- Supplier errors

### 4.4 Inventory Posting Groups

#### Extended Posting Group Features

The system extends standard posting groups with:
- **Category** classification
- Multiple inventory calculation procedures
- Custom valuation logic

**[SCREENSHOT PLACEHOLDER: Inventory Posting Group extended fields]**

---

## 5. Electronic Invoicing

### 5.1 E-Invoicing Setup

#### Configuring Electronic Export

1. Navigate to "Electronic Export Setup"
2. Configure:
   - Export path/folder
   - File naming convention
   - Export format
   - Automatic export settings

**[SCREENSHOT PLACEHOLDER: Electronic Export Setup page]**

#### Invoice Export Setup

1. Open "Invoice Export Setup"
2. Define:
   - Customer-specific export rules
   - Document types to export
   - Frequency (manual/automatic)
   - Notification settings

**[SCREENSHOT PLACEHOLDER: Invoice Export Setup page]**

### 5.2 Generating Electronic Invoices

#### Manual Export Process

1. Post sales invoices normally in Business Central
2. Navigate to "Electronic Export Dashboard"
3. Select invoices to export
4. Click **Generate Electronic Invoice**
5. The system:
   - Creates XML file via "Electronic Invoice Port" XMLPort
   - Logs export in "Invoice Export Log"
   - Updates invoice status

**[SCREENSHOT PLACEHOLDER: Electronic Export Dashboard showing pending invoices]**

#### Automated Export

Configure automatic export by:
1. Setting export schedule in setup
2. Defining trigger conditions (e.g., immediately after posting)
3. Specifying export destination

### 5.3 Monitoring Exports

#### Export Dashboard

The Electronic Export Dashboard shows:

| Column | Information |
|--------|-------------|
| Invoice No. | Sales invoice number |
| Customer | Customer name |
| Amount | Invoice amount |
| Export Status | Pending/Exported/Failed |
| Export Date | Date/time of export |
| File Name | Generated XML file name |

**[SCREENSHOT PLACEHOLDER: Electronic Export Dashboard with multiple invoices in different statuses]**

#### Export Log

1. Open "Invoice Export Log"
2. View detailed export history:
   - Timestamp
   - User who initiated export
   - Success/failure status
   - Error messages (if any)
   - File location

**[SCREENSHOT PLACEHOLDER: Invoice Export Log with history records]**

### 5.4 Troubleshooting Export Issues

#### Common Issues and Solutions

| Issue | Possible Cause | Solution |
|-------|----------------|----------|
| Export fails | Missing customer data | Verify customer setup is complete |
| XML validation error | Invalid characters | Check for special characters in descriptions |
| File not created | Path access denied | Verify export folder permissions |
| Wrong format | Setup misconfiguration | Review Electronic Export Setup |

---

## 6. System Configuration

### 6.1 Bank Account Categories

Extended bank accounts include category classification:

1. **Cash/Cheques** - Petty cash and check accounts
2. **Local Bank** - Domestic bank accounts
3. **Foreign Bank** - International/foreign currency accounts
4. **Term Deposit** - Fixed deposit accounts

**[SCREENSHOT PLACEHOLDER: Bank Account card showing Category field]**

### 6.2 Custom Enumerations

The system includes custom enums:
- **ASL Entry Exit Report Type** - Report classification
- Employee grades
- Vessel performance periods

### 6.3 Permission Management

#### Permission Set

The system includes a custom permission set: "Generated Permission"

To assign permissions:
1. Navigate to **Users**
2. Select user
3. Open **User Permission Sets**
4. Add "Generated Permission"
5. Save

**[SCREENSHOT PLACEHOLDER: User Permission Sets page]**

---

## 7. Troubleshooting

### 7.1 Common Issues

#### Payroll Issues

**Issue**: Overtime not calculating correctly
- **Check**: ASL Payroll Setup has correct OT rates
- **Check**: Employee grade is assigned
- **Check**: Correct E/D code is used

**Issue**: Staff loan deduction missing from payslip
- **Check**: Loan is active and not fully paid
- **Check**: Staff Loans Control Account is configured
- **Check**: Payroll period includes loan start date

#### Vessel Operations Issues

**Issue**: Revenue/Sea Day not calculating
- **Check**: Voyage Sea Days is populated
- **Check**: Revenue field has value
- **Check**: Sea days > 0

**Issue**: AGO percentage showing incorrect
- **Check**: AGO amount is entered
- **Check**: Revenue is not zero
- **Check**: Calculation formula: (AGO ÷ Revenue) × 100

#### Inventory Issues

**Issue**: Inventory valuation report shows zero
- **Check**: Date filters are correct
- **Check**: Location filter includes relevant locations
- **Check**: Items have inventory transactions

**Issue**: Store requisition cannot be approved
- **Check**: All required fields are filled
- **Check**: Requisition status is "Submitted"
- **Check**: User has approval permissions

#### E-Invoicing Issues

**Issue**: Electronic invoice export fails
- **Check**: Electronic Export Setup is configured
- **Check**: Export folder path exists and is accessible
- **Check**: Invoice is fully posted (not draft)
- **Check**: Customer has electronic invoice enabled

**Issue**: XML file not found after export
- **Check**: Export path in setup
- **Check**: File system permissions
- **Check**: Invoice Export Log for errors

### 7.2 Getting Help

For technical support:
1. Check Invoice Export Log for specific error messages
2. Review system event logs
3. Contact system administrator
4. Refer to Business Central standard documentation for base functionality

### 7.3 Best Practices

#### Payroll
- Always verify overtime rates before payroll run
- Close payroll periods after verification
- Backup payroll data before processing
- Review payslips before finalizing

#### Vessel Operations
- Record catch data daily while at sea
- Update AGO consumption immediately after refueling
- Review performance metrics after each voyage
- Reconcile fishing days with crew reports

#### Inventory
- Process requisitions within 24 hours
- Conduct regular physical counts
- Investigate variances immediately
- Keep location codes consistent

#### E-Invoicing
- Test export setup with sample invoices
- Monitor export dashboard daily
- Archive exported files regularly
- Verify customer receiving exported files

---

## Appendix A: Glossary

| Term | Definition |
|------|------------|
| **AGO** | Automotive Gas Oil (diesel fuel used by vessels) |
| **Sea Day** | Day when vessel is at sea (includes fishing and transit) |
| **Fishing Day** | Day when vessel actively fishes (subset of sea days) |
| **Lost Day** | Sea day without productive fishing activity |
| **Cycle Day** | Complete operational cycle (sea days + port days) |
| **E/D Code** | Earnings/Deduction code for payroll items |
| **Rev/SD** | Revenue per Sea Day |
| **Rev/FD** | Revenue per Fishing Day |
| **Voyage Sea Days** | Planned duration of voyage (40, 45, or 60 days) |

---

## Appendix B: Quick Reference

### Important Object IDs

| Object Type | ID | Name | Purpose |
|-------------|-----|------|---------|
| Table | 50000 | ASL Payroll Setup | Payroll configuration |
| Table | 50042 | Vessel Performance By Sea Day | Vessel metrics |
| Page | - | Electronic Export Dashboard | E-invoice monitoring |
| Report | 50010 | Startup Report | System startup object |

### Common Tasks Quick Guide

| Task | Navigation Path |
|------|-----------------|
| Create Employee | Search > Employee > New |
| Generate Payslips | Payroll Payslip Header > Process |
| Record Catch | Sea Catch Y > New |
| Create Requisition | Store Requisition Header New > New |
| Export Invoices | Electronic Export Dashboard > Generate |
| View Vessel Performance | Vessel Performance By Sea Day |

---

## 8. Reporting & Analytics

### 8.1 Standard Reports

#### Payroll Reports

| Report Name | Purpose | Key Information |
|-------------|---------|-----------------|
| Payroll Register | Detailed payroll summary by period | Earnings, deductions, net pay by employee |
| Overtime Analysis | Overtime hours and costs | Hours by type and grade, cost analysis |
| Loan Statement | Staff loan balances | Outstanding loans, repayment schedules |
| E/D Code Summary | Earnings/Deductions totals | Aggregated payroll components |

**[SCREENSHOT PLACEHOLDER: Payroll Register report sample]**

#### Vessel Reports

| Report Name | Purpose | Key Information |
|-------------|---------|-----------------|
| Location Vessel Sea Day | Vessel performance by location | Revenue, AGO, sea days by vessel/location |
| Fishing Area Analysis | Catch analysis by area | Quantity, value by fishing area |
| Fleet Performance | All vessels comparison | KPIs across entire fleet |
| AGO Consumption Report | Fuel usage tracking | Consumption trends, efficiency metrics |

**[SCREENSHOT PLACEHOLDER: Fleet Performance report]**

#### Inventory Reports

| Report Name | Purpose | Key Information |
|-------------|---------|-----------------|
| Inventory Valuation | Stock value by date | Quantity, unit cost, total value |
| Bin Card | Item movement history | Receipts, issues, balance by item |
| Requisition Summary | Pending/processed requisitions | Status, value, department breakdown |
| Purchase Variance | Variance analysis | Expected vs. actual, reasons |

### 8.2 Custom Analytics

#### Creating Custom Queries

1. Navigate to **Analysis Views**
2. Create new analysis dimensions:
   - By Department
   - By Vessel
   - By Period
   - By Product Category

**[SCREENSHOT PLACEHOLDER: Analysis View setup]**

#### Key Performance Indicators (KPIs)

**Vessel Operations KPIs**:
- Average Revenue per Sea Day (target: $XX,XXX)
- AGO % of Revenue (target: < 15%)
- Fishing Day Efficiency (target: > 85%)
- Lost Days % (target: < 5%)

**Payroll KPIs**:
- Overtime % of Total Pay (monitor trend)
- Average Pay per Grade
- Loan Default Rate (target: < 2%)

**Inventory KPIs**:
- Inventory Turnover Ratio
- Stockout Incidents
- Requisition Processing Time (target: < 48 hours)
- Purchase Variance % (target: < 3%)

### 8.3 Report Scheduling

#### Setting Up Automated Reports

1. Open report
2. Click **Schedule**
3. Configure:
   - Frequency (Daily/Weekly/Monthly)
   - Recipients
   - Output format (PDF/Excel)
   - Delivery method (Email/File share)

---

## 9. Data Management

### 9.1 Data Import/Export

#### XMLPort Objects

The system includes XMLPort objects for data exchange:

**Electronic Invoice Port** (`ElectronicInvoicePort.XmlPort`):
- Exports sales invoices to XML format
- Used for electronic invoice submission
- Validates data before export

#### Importing Master Data

**Bulk Import Process**:

1. Prepare Excel/CSV file with required columns
2. Use Configuration Packages:
   - Navigate to **Configuration Packages**
   - Create new package
   - Add tables (Employee, Item, Vessel, etc.)
   - Import from Excel
   - Apply package

**[SCREENSHOT PLACEHOLDER: Configuration Package import screen]**

#### Common Import Scenarios

| Scenario | Tables Involved | Key Considerations |
|----------|----------------|-------------------|
| New Employees | Employee, Employee Posting Group | Assign correct grade |
| Vessel Master Data | Vessel (custom table) | Link to locations |
| Items/Products | Item, Item Unit of Measure | Set up posting groups |
| Chart of Accounts | G/L Account | Maintain account structure |

### 9.2 Data Backup and Recovery

#### Backup Recommendations

**Daily Backups**:
- Payroll transactions (before processing)
- Vessel catch data (end of day)
- Invoice exports (after generation)

**Weekly Backups**:
- Complete database backup
- Configuration settings
- Custom reports and layouts

**Before Major Operations**:
- Before payroll period close
- Before version upgrades
- Before bulk data imports

#### Data Archival

**Recommended Archival Schedule**:
- Closed payroll periods: After 2 years
- Completed voyages: After 3 years
- Posted invoices: After 7 years (legal requirement)
- Historical catch data: Never (retain for trend analysis)

### 9.3 Data Integrity Checks

#### Regular Validation Tasks

**Weekly Checks**:
1. Reconcile Staff Loans Control Account with individual loans
2. Verify vessel catch totals match revenue records
3. Confirm inventory values match G/L postings
4. Review electronic invoice export failures

**Monthly Checks**:
1. Payroll reconciliation (gross to net)
2. Vessel AGO consumption vs. purchases
3. Inventory physical count vs. system
4. Bank reconciliations

---

## 10. Integration & Extensions

### 10.1 LS Retail Integration

The system integrates with LS Retail for retail store operations.

#### Integration Points

**Sales Documents**:
- Sales orders from retail stores
- Transfer orders between locations
- Return processing

**Inventory**:
- Real-time stock updates
- Inter-location transfers
- Stock requisitions from stores

**Reports**:
- Sales delivery notes include "Retail Store" references
- Transfer waybills for retail locations

**[SCREENSHOT PLACEHOLDER: Sales document showing retail store integration]**

#### Retail Store Setup

1. Configure LS Retail connection in setup
2. Map retail locations to BC locations
3. Define synchronization schedule
4. Test data flow both directions

### 10.2 External System Interfaces

#### Electronic Invoice Submission

**Process Flow**:
```
BC Sales Invoice → Electronic Invoice Port → XML File → 
External System/Portal → Customer Receipt Confirmation
```

**Supported Formats**:
- Standard XML format
- Customer-specific formats (via setup)
- Government e-invoice formats

#### Bank Integration

**Automated Features**:
- Bank statement import
- Payment file generation
- Reconciliation automation

### 10.3 API and Web Services

#### Available Web Services

The system can expose these objects as web services:

| Object Type | Name | Purpose |
|-------------|------|---------|
| Page | Vessel Performance By Sea Day | External performance monitoring |
| Page | Sea Catch Y | Mobile catch recording app |
| Page | Payroll Payslip Header | Employee self-service portal |
| Codeunit | (Custom) | Business logic for integrations |

#### Setting Up Web Services

1. Navigate to **Web Services**
2. Click **New**
3. Select object type and ID
4. Enter service name
5. Check **Published**
6. Copy OData URL for external systems

**[SCREENSHOT PLACEHOLDER: Web Services list]**

---

## 11. User Management & Security

### 11.1 User Roles

#### Recommended Role Structure

| Role | Access Level | Typical Users |
|------|-------------|---------------|
| Payroll Administrator | Full payroll access | HR Manager, Payroll Officers |
| Fleet Manager | Vessel operations, catch data | Operations Manager, Fleet Supervisor |
| Warehouse Manager | Inventory, requisitions | Warehouse Supervisor, Procurement |
| Accountant | Financial postings, invoicing | Finance team, Controllers |
| Operator | Data entry only | Data entry clerks, Store staff |
| Viewer | Read-only access | Management, Auditors |

#### Creating User Roles

1. Navigate to **Permission Sets**
2. Copy "Generated Permission" as base
3. Modify permissions:
   - Remove unnecessary tables
   - Set appropriate RIMD permissions
   - Test with dummy user

**[SCREENSHOT PLACEHOLDER: Permission Set configuration]**

### 11.2 Security Best Practices

#### Access Control

**Payroll Security**:
- Restrict payroll access to authorized users only
- Require approval for overtime entries > threshold
- Log all payroll modifications
- Separate duties: data entry vs. approval

**Financial Security**:
- Limit G/L posting permissions
- Require second approval for journal batches
- Audit trail for invoice exports
- Regular review of user access logs

#### Password Policies

Recommended policies:
- Minimum 8 characters
- Mix of letters, numbers, symbols
- Expire every 90 days
- No password reuse (last 5)

### 11.3 Audit Trail

#### Tracking Changes

**Change Log Setup**:
1. Navigate to **Change Log Setup**
2. Enable for critical tables:
   - ASL Payroll Setup
   - Payroll Payslip Header/Lines
   - Vessel Performance By Sea Day
   - Electronic Export Setup
3. Track all field changes (Insert, Modify, Delete)

**[SCREENSHOT PLACEHOLDER: Change Log Setup]**

#### Reviewing Audit Logs

**Regular Review Schedule**:
- Daily: Electronic invoice exports
- Weekly: Payroll changes
- Monthly: User access patterns
- Quarterly: Permission set changes

**Key Audit Reports**:
- User Activity Log
- Posted Document Changes
- Master Data Modifications
- Failed Login Attempts

---

## 12. Maintenance & Optimization

### 12.1 Regular Maintenance Tasks

#### Daily Tasks
- [ ] Monitor electronic invoice export queue
- [ ] Review failed transactions/postings
- [ ] Check system performance metrics
- [ ] Backup transaction data

#### Weekly Tasks
- [ ] Review and close old requisitions
- [ ] Update vessel performance data
- [ ] Reconcile inventory variances
- [ ] Clean up temporary data

#### Monthly Tasks
- [ ] Close and verify payroll period
- [ ] Generate month-end reports
- [ ] Review and archive old data
- [ ] Update exchange rates (if applicable)
- [ ] System health check

#### Quarterly Tasks
- [ ] Database optimization
- [ ] Review and update permission sets
- [ ] Audit user access logs
- [ ] Test backup restoration
- [ ] Update documentation

### 12.2 Performance Optimization

#### Common Performance Issues

**Issue**: Slow report generation
- **Solution**: Add appropriate indexes to custom tables
- **Solution**: Filter data before running reports
- **Solution**: Schedule large reports for off-hours

**Issue**: Slow page load times
- **Solution**: Optimize FlowFields and FlowFilters
- **Solution**: Reduce SIFT entries
- **Solution**: Archive historical data

**Issue**: Inventory valuation timeout
- **Solution**: Run valuation by location segments
- **Solution**: Use date ranges instead of "all dates"
- **Solution**: Archive old item ledger entries

#### Database Optimization

**SQL Server Maintenance**:
1. Regular index rebuilds
2. Update statistics weekly
3. Monitor database size growth
4. Defragment indexes monthly

### 12.3 System Health Monitoring

#### Key Metrics to Monitor

| Metric | Threshold | Action if Exceeded |
|--------|-----------|-------------------|
| Database Size | 80% of allocated | Plan expansion |
| Response Time | > 3 seconds | Investigate queries |
| Failed Exports | > 5 per day | Review export setup |
| Concurrent Users | Near license limit | Review usage patterns |

**[SCREENSHOT PLACEHOLDER: System health dashboard or SQL management]**

---

## 13. Upgrade & Migration

### 13.1 Version History

This application was migrated from Business Central 14 to Business Central 18.

#### Migration Notes

- Original C/AL code converted to AL using txt2al tool
- Some objects retain legacy naming conventions
- Migration comments preserved in code
- Full upgrade script: `ASLFinalUpgrade from BC14to18.ps1`

#### Version Tracking

Current version: **18.5.1.461**

Recent updates:
- E-Invoicing enhancements
- Vessel performance calculations
- Payroll grade structure
- LS Retail integration

### 13.2 Applying Updates

#### Update Process

1. **Pre-Update Checklist**:
   - [ ] Full database backup
   - [ ] Test in sandbox environment
   - [ ] Review release notes
   - [ ] Notify users of downtime
   - [ ] Close all payroll periods
   - [ ] Export critical data

2. **Update Steps**:
   - Deploy new .app file to server
   - Run data upgrade if required
   - Synchronize schema changes
   - Test critical functions
   - Update documentation

3. **Post-Update Verification**:
   - [ ] Test payroll calculations
   - [ ] Verify vessel operations
   - [ ] Check electronic invoice exports
   - [ ] Run sample reports
   - [ ] Review error logs

**Update Script Location**: `PS/App Installation.ps1`

### 13.3 Rollback Procedures

#### Emergency Rollback

If critical issues occur after update:

1. Stop BC service
2. Restore database from backup
3. Reinstall previous .app version
4. Synchronize schema
5. Restart BC service
6. Verify system functionality
7. Document rollback reason

**Rollback Time Estimate**: 30-60 minutes

---

**End of Operational Manual**

*For additional assistance, contact your system administrator or SSNL support.*
