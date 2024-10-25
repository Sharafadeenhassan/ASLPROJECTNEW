PageExtension 50287 "pageextension50287" extends "Purchase Invoice"
{
     layout
      {
          modify("No.")
          {
              Visible = true;
          }
          modify("Responsibility Center")
          {
              Visible = false;
          }
          addafter("No.")
          {
              field("Posting No."; Rec."Posting No.")
              {
              }
              field("Your Reference";rec."Your Reference")
              {
Editable = rec."Req Locked" = false;
              }
          }
      }
}