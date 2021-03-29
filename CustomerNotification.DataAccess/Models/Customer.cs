using System;
using System.Collections.Generic;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class Customer
    {
        public int Id { get; set; }
        public string CustomerId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public int PreferredChanneld { get; set; }
        public int MessageTypeId { get; set; }

        public virtual MessageType IdNavigation { get; set; }
        public virtual Channel MessageType { get; set; }
    }
}
