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
    
    public partial class NotificationPreference
    {
        public int Id { get; set; }
        public string EmailId { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
        public Nullable<bool> EmailOptIn { get; set; }
        public Nullable<bool> SMSOptIn { get; set; }
        public Nullable<bool> MailOptIn { get; set; }
        public int StudentId { get; set; }
    
        public virtual Student Student { get; set; }
    }
}
