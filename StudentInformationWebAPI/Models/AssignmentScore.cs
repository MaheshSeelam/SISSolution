//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace StudentInformationWebAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class AssignmentScore
    {
        public int Id { get; set; }
        public string Score { get; set; }
        public int AssignmentId { get; set; }
        public int StudentId { get; set; }
        public string Grade { get; set; }
        public string Notes { get; set; }
        public string Result { get; set; }
        public string DocumentLink { get; set; }
    
        public virtual Assignment Assignment { get; set; }
        public virtual Student Student { get; set; }
    }
}
