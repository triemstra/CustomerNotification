using System;
using System.Collections.Generic;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class VGetCustomerDetail
    {
        public int Id { get; set; }
        public string CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public int PreferredChanneld { get; set; }
        public string FieldName { get; set; }
        public string MessageType { get; set; }
        public string BodyType { get; set; }
    }
}
