using System;
using System.Collections.Generic;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class FieldName
    {
        public int Id { get; set; }
        public int MessageTypeId { get; set; }
        public string FieldName1 { get; set; }

        public virtual MessageType MessageType { get; set; }
    }
}
