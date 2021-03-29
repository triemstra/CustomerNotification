using System;
using System.Collections.Generic;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class MessageType
    {
        public MessageType()
        {
            FieldNames = new HashSet<FieldName>();
        }

        public int Id { get; set; }
        public string MessageType1 { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual ICollection<FieldName> FieldNames { get; set; }
    }
}
