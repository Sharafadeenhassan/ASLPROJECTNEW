pageextension 50283 "pageextension50283" extends "Item Availability by Location"
{
    layout
    {
        addafter(AmountType)
        {
             field("Calendar.""Period Start"""; Calendar."Starting Date-Time")
             {
             }
        }
    }
    
var Calendar:Record "Calendar Entry";
}

