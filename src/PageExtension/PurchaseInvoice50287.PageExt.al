/*PageExtension 50287 "pageextension50287" extends "Purchase Invoice"
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
          addafter("Assigned User ID")
          {s
              field("Posting No."; "Posting No.")
              {
              }
          }
      }
}*/