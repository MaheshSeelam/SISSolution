using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentInformationMVC.Models
{
    public class AssignmentScoresViewModel
    {
        public int Id { get; set; }
        public string Score { get; set; }
        public int AssignmentId { get; set; }
        public int StudentId { get; set; }
        public string Grade { get; set; }
        public string Notes { get; set; }
        public string Result { get; set; }
        public string DocumentLink { get; set; }

    }
}