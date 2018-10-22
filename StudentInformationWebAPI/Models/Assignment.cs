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
    
    public partial class Assignment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Assignment()
        {
            this.AssignmentScores = new HashSet<AssignmentScore>();
        }
    
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
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AssignmentScore> AssignmentScores { get; set; }
    }
}
