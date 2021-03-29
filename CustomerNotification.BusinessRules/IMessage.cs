using CustomerNotification.DataAccess.Models;
using System.Collections.Generic;

namespace CustomerNotification.BusinessRules
{
    public interface IMessage
    {
        Dictionary<string, string> ParseCustomerRecords(List<VGetCustomerDetail> customerRecords);

        string BuildMessage(string userId, string messageType, string bodyType, IDictionary<string, string> fields);
    }
}