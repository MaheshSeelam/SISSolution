using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StudentInformationMVC.Models
{
    public class StudentViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Class { get; set; }
        public string Address { get; set; }
        public string PhoneNo { get; set; }
        public string EmailId { get; set; }
    }
}