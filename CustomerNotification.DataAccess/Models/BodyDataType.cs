using System;
using System.Collections.Generic;

#nullable disable

namespace CustomerNotification.DataAccess.Models
{
    public partial class BodyDataType
    {
        public BodyDataType()
        {
            Channels = new HashSet<Channel>();
        }

        public int Id { get; set; }
        public string BodyType { get; set; }

        public virtual ICollection<Channel> Channels { get; set; }
    }
}
