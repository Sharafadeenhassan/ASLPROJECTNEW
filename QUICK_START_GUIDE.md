# ASL Fishing Operation Management System - Quick Start Guide

**Version**: 18.5.1.461 | **Last Updated**: December 26, 2025

---

## Welcome to ASL Fishing Operation Management System

This quick start guide will help you begin using the system immediately. For detailed instructions, refer to the complete [Operational Manual](OPERATIONAL_MANUAL.md).

---

## 1. First-Time Login

### Accessing the System

1. Open web browser
2. Navigate to: `http://localhost:8080/BC180`
3. Enter your Windows credentials
4. Click **Sign In**

**[SCREENSHOT PLACEHOLDER: BC180 login screen]**

### Initial Dashboard

After login, you'll see your role-specific dashboard with shortcuts to frequently used pages.

---

## 2. Essential Tasks by Role

### 👤 HR / Payroll Officer

#### Generate Monthly Payroll (15 minutes)

**Quick Steps**:
1. Press **Alt + Q** (Search)
2. Type "Payroll Periods"
3. Verify current period is **Open**
4. Search "Payroll Payslip Header"
5. Click **Process** → **Generate Payslips**
6. Select period → Click **OK**
7. Review generated payslips
8. Process payments

**Key Shortcuts**:
- `Alt + Q` = Search
- `Ctrl + N` = New record
- `F5` = Refresh

#### Process Overtime

**Quick Steps**:
1. Search "Payroll E/D Codes"
2. Select appropriate OT code:
   - Junior: `OT-JNR-ORD` (1.5×) or `OT-JNR-SPC` (2.0×)
   - Grade 2: `OT-GR2-ORD` (1.6×) or `OT-GR2-SPC` (2.1×)
   - Grade 3: `OT-GR3-ORD` (1.7×) or `OT-GR3-SPC` (2.2×)
3. Enter hours on employee payslip
4. System calculates payment automatically

#### Create Staff Loan

**Quick Steps**:
1. Search "Loan"
2. Click **New** (`Ctrl + N`)
3. Fill in:
   - Employee No.
   - Loan Amount
   - Installment Amount
4. Save
5. Deductions auto-apply to payslips

---

### 🚢 Fleet / Operations Manager

#### Record Daily Catch (5 minutes)

**Quick Steps**:
1. Search "Sea Catch Y"
2. Click **New**
3. Enter:
   - Date (today)
   - Vessel code
   - Fishing area
   - Catch quantity
   - Destination (Export/Local)
4. Save

#### Track Vessel Performance (10 minutes)

**Quick Steps**:
1. Search "Vessel Performance By Sea Day"
2. Click **New**
3. Enter voyage data:
   - Vessel code
   - Voyage sea days (40/45/60)
   - Fishing days
   - Lost days
   - Revenue amounts
   - AGO consumption
4. System auto-calculates:
   - Rev/SD (Revenue per Sea Day)
   - Rev/FD (Revenue per Fishing Day)
   - AGO percentage
   - Gross margin

**Key Metrics to Monitor**:
| Metric | Good | Warning | Critical |
|--------|------|---------|----------|
| Rev/SD | > $15,000 | $10,000-$15,000 | < $10,000 |
| AGO % | < 15% | 15-20% | > 20% |
| Lost Days % | < 5% | 5-10% | > 10% |

#### Record Fuel Consumption

**Quick Steps**:
1. Search "AGO Table"
2. Click **New**
3. Enter:
   - Vessel
   - Date
   - Quantity (liters)
   - Cost
4. Link to voyage

---

### 📦 Warehouse / Procurement

#### Create Store Requisition (5 minutes)

**Quick Steps**:
1. Search "Store Requisition Header New"
2. Click **New**
3. Enter:
   - Department
   - Date
   - Required date
4. Click **Lines** button
5. Add items:
   - Item No. (or search)
   - Quantity
   - Location
6. Change status to **Submitted**

#### Check Inventory Levels

**Quick Steps**:
1. Search "Items"
2. Use filters for quick view:
   - Location: Your warehouse
   - Item Category: Relevant category
3. Check **Inventory** field
4. For details: Click item → **Navigate** → **Ledger Entries**

#### Process Purchase Variance

**Quick Steps**:
1. Receive purchase order
2. If quantity/quality issues:
   - Search "Purchase Variance Item"
   - Click **New**
   - Enter variance details
   - Select reason code
3. Save
4. System tracks for reporting

---

### 💰 Accountant / Finance

#### Generate Electronic Invoice (5 minutes)

**Quick Steps**:
1. Post sales invoice normally
2. Search "Electronic Export Dashboard"
3. Find your invoice (status: Pending)
4. Select invoice
5. Click **Generate Electronic Invoice**
6. Verify status changes to **Exported**
7. Check "Invoice Export Log" for confirmation

#### Monitor Export Status

**Quick Steps**:
1. Open "Electronic Export Dashboard"
2. Review invoices by status:
   - **Pending**: Not yet exported
   - **Exported**: Successfully exported
   - **Failed**: Needs attention
3. For failed exports:
   - Open "Invoice Export Log"
   - Review error message
   - Correct issue
   - Re-export

#### Run Financial Reports

**Common Reports**:
| Report | Navigation | Use Case |
|--------|-----------|----------|
| Inventory Valuation | Reports → Inventory Valuation | Month-end stock value |
| Payroll Register | Reports → Payroll Register | Payroll verification |
| Fleet Performance | Reports → Location Vessel Sea Day | Vessel profitability |

---

## 3. Common Keyboard Shortcuts

| Action | Shortcut | Usage |
|--------|----------|-------|
| Search | `Alt + Q` | Find any page/report |
| New Record | `Ctrl + N` | Create new entry |
| Save | `Ctrl + S` | Save changes |
| Refresh | `F5` | Reload data |
| Find | `Ctrl + F` | Search within list |
| Copy Line | `Ctrl + C` → `Ctrl + V` | Duplicate entry |
| Navigate Up | `↑` | Previous record |
| Navigate Down | `↓` | Next record |
| Open Card | `Shift + F5` | View details |
| Post Document | `Ctrl + P` | Post transaction |

---

## 4. Daily Workflows

### ☀️ Morning Routine (30 minutes)

#### For Operations Staff:
- [ ] Check vessel positions/status
- [ ] Review overnight catch reports
- [ ] Enter catch data from vessels at sea
- [ ] Update AGO consumption records
- [ ] Check pending requisitions

#### For Payroll Staff:
- [ ] Review pending overtime entries
- [ ] Process urgent loan requests
- [ ] Check payroll period status
- [ ] Verify employee changes

#### For Finance Staff:
- [ ] Review failed invoice exports (if any)
- [ ] Process pending invoices for export
- [ ] Check bank reconciliation items
- [ ] Monitor inventory values

### 🌙 End-of-Day Tasks (15 minutes)

#### All Users:
- [ ] Complete all data entry for the day
- [ ] Review your work for errors
- [ ] Update status of pending items
- [ ] Log out properly

#### Operations:
- [ ] Finalize catch data entry
- [ ] Update vessel status
- [ ] Close completed requisitions

#### Finance:
- [ ] Export all posted invoices
- [ ] Verify export success
- [ ] Post any pending transactions

---

## 5. Quick Troubleshooting

### ❌ Problem: Can't find a page

**Solution**:
1. Press `Alt + Q`
2. Type the page name slowly
3. Look for suggestions
4. If not found, check with administrator

### ❌ Problem: Overtime not calculating

**Solution**:
1. Verify employee has grade assigned
2. Check ASL Payroll Setup has OT rates
3. Ensure correct E/D code is used
4. Contact payroll administrator

### ❌ Problem: Electronic invoice export fails

**Solution**:
1. Open "Invoice Export Log"
2. Find your invoice
3. Read error message
4. Common fixes:
   - Missing customer data: Complete customer card
   - File path error: Check export setup
   - Validation error: Review invoice details

### ❌ Problem: Inventory shows zero but stock exists

**Solution**:
1. Check date filter (remove or adjust)
2. Verify location filter
3. Check if item was transferred to different location
4. Review item ledger entries

### ❌ Problem: Report taking too long

**Solution**:
1. Cancel the report (`Esc`)
2. Add date filter (e.g., last 30 days)
3. Add location filter
4. Run for smaller data set first

---

## 6. Important Terminology

### Fishing Industry Terms

| Term | Meaning | Example |
|------|---------|---------|
| **Sea Day** | Day vessel is at sea | 45-day voyage = 45 sea days |
| **Fishing Day** | Day actively fishing | Caught fish for 38 of 45 days |
| **Lost Day** | Unproductive sea day | Bad weather, repairs |
| **AGO** | Diesel fuel for vessels | 50,000 liters consumed |
| **Cycle Day** | Sea days + port days | 45 sea + 5 port = 50 cycle |

### Payroll Terms

| Term | Meaning | Example |
|------|---------|---------|
| **E/D Code** | Earnings or Deduction | BASIC = Basic Pay |
| **OT Ordinary** | Regular overtime | 1.5× base rate |
| **OT Special** | Premium overtime | 2.0× base rate |
| **Grade** | Employee level | Junior, Grade 2, Grade 3 |
| **Control Account** | G/L summary account | Staff Loans Control |

### System Terms

| Term | Meaning | Example |
|------|---------|---------|
| **BC180** | Business Central 18.0 | Server version |
| **XMLPort** | Data import/export | Electronic invoice export |
| **RIMD** | Read, Insert, Modify, Delete | Permission types |
| **FlowField** | Calculated field | Inventory balance |

---

## 7. Where to Get Help

### In-System Help
- Press `F1` on any page for context help
- Click `?` icon in top-right corner
- Search for "Setup" pages for configuration

### Documentation
- **Full Manual**: [OPERATIONAL_MANUAL.md](OPERATIONAL_MANUAL.md)
- **Technical Docs**: `.github/copilot-instructions.md`
- **System Setup**: Check "ASL Payroll Setup" page

### Support Contacts
- **System Administrator**: [Your IT contact]
- **Payroll Issues**: [Payroll manager]
- **Operations Issues**: [Fleet manager]
- **Technical Support**: SSNL

### Training Resources
- **New User Training**: 2-hour session covering basics
- **Role-Specific Training**: 1-hour session per role
- **Monthly Tips**: Check for monthly feature updates

---

## 8. Quick Setup Checklist

### For New Users

#### First-Time Setup (Done by Administrator)
- [ ] User account created
- [ ] Permissions assigned (role-based)
- [ ] Access to BC180 server verified
- [ ] Default workspace configured

#### User Configuration
- [ ] Set your preferences (Ctrl + Alt + F1)
- [ ] Customize your role center
- [ ] Bookmark frequently used pages
- [ ] Set up notifications (if needed)

### For System Setup (Administrator)

#### Payroll Configuration
- [ ] ASL Payroll Setup completed
- [ ] Payroll E/D Codes defined
- [ ] Employee grades assigned
- [ ] OT rates configured
- [ ] Staff Loans Control Account set

#### Operations Configuration
- [ ] Vessels registered
- [ ] Fishing areas defined
- [ ] Locations set up
- [ ] Performance metrics baselines set

#### Finance Configuration
- [ ] Electronic Export Setup configured
- [ ] Invoice Export Setup per customer
- [ ] Bank accounts with categories
- [ ] G/L accounts mapped

---

## 9. Best Practices

### ✅ Do's

- **Save frequently**: Don't lose your work
- **Use filters**: Narrow down lists before searching
- **Check twice**: Verify payroll before processing
- **Document issues**: Note errors for support
- **Backup data**: Export critical reports
- **Review logs**: Check export logs daily
- **Update promptly**: Enter catch data same day

### ❌ Don'ts

- **Don't** skip payroll verification
- **Don't** close payroll periods prematurely
- **Don't** ignore export failures
- **Don't** delete records (void/reverse instead)
- **Don't** share passwords
- **Don't** work in production without testing
- **Don't** modify setup without approval

---

## 10. Success Metrics

### Track Your Performance

#### Operations Team
- **Target**: 90% data entry same-day
- **Target**: < 5% lost days per voyage
- **Target**: > $15,000 revenue/sea day

#### Payroll Team
- **Target**: Zero payroll errors per period
- **Target**: Process payroll in < 2 hours
- **Target**: < 48 hours loan processing time

#### Finance Team
- **Target**: 100% invoice export success rate
- **Target**: < 1 day invoice export lag
- **Target**: Zero bank reconciliation variances

#### Warehouse Team
- **Target**: < 48 hours requisition processing
- **Target**: < 3% purchase variance
- **Target**: 95%+ inventory accuracy

---

## Need More Details?

📖 **Full Operational Manual**: [OPERATIONAL_MANUAL.md](OPERATIONAL_MANUAL.md)

🔧 **Technical Reference**: [.github/copilot-instructions.md](.github/copilot-instructions.md)

💻 **System Configuration**: Search "ASL Payroll Setup" in BC180

📞 **Support**: Contact your system administrator

---

**Quick Start Guide Complete!**

*You're now ready to use ASL Fishing Operation Management System effectively. Remember to refer to the full manual for detailed procedures and advanced features.*

**Version 18.5.1.461 | SSNL | December 26, 2025**
