using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentInformationMVC.Models
{
    public class AssignmentViewModel
    {
      

            public int Id { get; set; }
            public string Subject { get; set; }
            public string Type { get; set; }
            public Nullable<System.DateTime> DateCreated { get; set; }
            public Nullable<System.DateTime> DueDate { get; set; }
            public string Score { get; set; }
            public string Grade { get; set; }
            public string Notes { get; set; }
            public string Result { get; set; }
            public Nullable<System.DateTime> DateModified { get; set; }
            public string Reviewed { get; set; }
            public string DocumentLink { get; set; }
            public string Name { get; set; }

        
    }
}