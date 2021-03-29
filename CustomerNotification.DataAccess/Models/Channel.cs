using System;
using System.Collections.Generic;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class Channel
    {
        public Channel()
        {
            Customers = new HashSet<Customer>();
        }

        public int Id { get; set; }
        public string Channel1 { get; set; }
        public int BodyTypeId { get; set; }

        public virtual BodyDataType BodyType { get; set; }
        public virtual ICollection<Customer> Customers { get; set; }
    }
}
