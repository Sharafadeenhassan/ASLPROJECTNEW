report 80225 "Testing"
{
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportrdlc/Testing.rdlc';
    Caption = 'Testing';
    dataset
    {
        dataitem("Sea Food categories"; "Sea Food categories")
        {
            DataItemTableView = SORTING("Sea food code");
            PrintOnlyIfDetail = true;
            column(USERID; UserId)
            {
            }
            column(COMPANYNAME; CompanyName)
            {
            }
            column(CurrReport_PAGENO; CurrReport.PageNo())
            {
            }
            column(FORMAT_TODAY_0_4_; Format(Today, 0, 4))
            {
            }
            column(RepFilter; RepFilter)
            {
            }
            column(Sea_Food_categories__Sea_food_Description_; "Sea food Description")
            {
            }
            column(COPYSTR__Sea_food_code__5_; CopyStr("Sea food code", 5))
            {
            }
            column(TotSales; TotSales)
            {
            }
            column(TotSales_Control1000000012; TotSales)
            {
            }
            column(Item__Sales__LCY__Caption; Item.FieldCaption("Sales (LCY)"))
            {
            }
            column(Item__Sales__Qty___Caption; Item.FieldCaption("Sales (Qty.)"))
            {
            }
            column(Item_DescriptionCaption; Item.FieldCaption(Description))
            {
            }
            column(Item__No__Caption; Item.FieldCaption("No."))
            {
            }
            column(Sea_Food_categories__Sea_food_Description_Caption; FieldCaption("Sea food Description"))
            {
            }
            column(Sea_Food_categories_Sea_food_code; "Sea food code")
            {
            }
            dataitem(Item; Item)
            {
                DataItemTableView = SORTING("No.") WHERE("Gen. Prod. Posting Group" = FILTER('FIS'), "Sales (Qty.)" = FILTER(<> 0), "Location Filter" = FILTER('LEKKIFSHOP'));
                RequestFilterFields = "Date Filter";
                column(Item__Item_Category_Code_; "Item Category Code")
                {
                }
                column(ItemNo; Item."No.")
                {
                }
                column(ItemDescription; Item.Description)
                {
                }
                column(Item__No__; "No.")
                {
                }
                column(Item_Description; Description)
                {
                }
                column(Item__Sales__Qty___; "Sales (Qty.)")
                {
                }
                column(Sales__LCY____Sales__Qty___; "Sales (LCY)" / "Sales (Qty.)")
                {
                }
                column(Item__Sales__LCY__; "Sales (LCY)")
                {
                }
                column(Item__Sales__Qty____Control1000000032; "Sales (Qty.)")
                {
                }
                column(Item__Sales__LCY___Control1000000033; "Sales (LCY)")
                {
                }
                column(Item__Item_Category_Code_Caption; FieldCaption("Item Category Code"))
                {
                }
                column(Item_SF_Cat; "SF Cat")
                {
                }

                trigger OnPreDataItem()
                begin
                    /*
                    LastFieldNo := FIELDNO("No. 2");
                    IF GETFILTER("Date Filter") = '' THEN
                      SETRANGE("Date Filter",CALCDATE('-1D',WORKDATE));
                    SETRANGE("SF Cat",COPYSTR("Sea Food categories"."Sea food code",5));
                    RepFilter:=GETFILTERS;
                    TotSales:=TotSales+"Sales (LCY)";
                    */  //
                end;
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

    labels
    {
    }

    var
        RepFilter: Text[120];
        TotSales: Decimal;
}
