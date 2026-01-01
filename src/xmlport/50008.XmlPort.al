xmlport 90994 "Payroll Employee Group Import"
{
    Format = VariableText;
    Caption = 'Payroll Employee Group Import';
    schema
    {
        textelement(Rootnode)
        {
            tableelement("Payroll-Employee Group Lines."; "Payroll-Employee Group Lines.")
            {
                XmlName = 'Payroll-EmployeeGroupLines';
                fieldelement(a; "Payroll-Employee Group Lines."."Employee Group")
                {
                }
                fieldelement(b; "Payroll-Employee Group Lines."."E/D Code")
                {
                }
                fieldelement(c; "Payroll-Employee Group Lines.".Units)
                {
                }
                fieldelement(d; "Payroll-Employee Group Lines.".Rate)
                {
                }
                fieldelement(e; "Payroll-Employee Group Lines.".Quantity)
                {
                }
                fieldelement(f; "Payroll-Employee Group Lines.".Flag)
                {
                }
                fieldelement(g; "Payroll-Employee Group Lines."."Default Amount")
                {
                }
                fieldelement(h; "Payroll-Employee Group Lines.".ChangeOthers)
                {
                }
                fieldelement(i; "Payroll-Employee Group Lines.".HasBeenChanged)
                {
                }
                fieldelement(j; "Payroll-Employee Group Lines.".ChangeCounter)
                {
                }
                fieldelement(k; "Payroll-Employee Group Lines."."Employee Name")
                {
                }
                fieldelement(l; "Payroll-Employee Group Lines."."ED Category")
                {
                }
                fieldelement(m; "Payroll-Employee Group Lines."."Old Default Amount")
                {
                }
                fieldelement(n; "Payroll-Employee Group Lines."."Date Changed")
                {
                }
                fieldelement(o; "Payroll-Employee Group Lines."."Payslip Group ID")
                {
                }
            }
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
}
