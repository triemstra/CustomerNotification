using CustomerNotification.DataAccess.Models;
using FormatterPlugins;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CustomerNotification.BusinessRules
{
    public class Message
    {
        private readonly AppDbContext _context;

        public Message(AppDbContext context)
        {
            _context = context;
        }

        private Dictionary<string, string> ParseCustomerRecords(List<VGetCustomerDetail> customerRecords)
        {
            var dictionary = new Dictionary<string, string>();

            List<string> fields = (from f in customerRecords
                                   select f.FieldName).ToList();

            List<string> values = new List<string>();

            string userId = (from c in customerRecords
                             select c.CustomerId).FirstOrDefault();

            dictionary.Add("UserId", userId);

            string FirstName = (from fn in customerRecords
                                select fn.FirstName).FirstOrDefault();

            dictionary.Add("FirstName", FirstName);

            string LastName = (from ln in customerRecords
                               select ln.LastName).FirstOrDefault();

            dictionary.Add("LastName", LastName);

            string Email = (from e in customerRecords
                            select e.Email).FirstOrDefault();

            dictionary.Add("Email", Email);

            return dictionary;
        }

        private string BuildMessage(string userId, string messageType, string bodyType, IDictionary<string, string> fields)
        {
            string body = "";

            // Plugin functionality
            //
            var formatters = new Dictionary<string, IBaseBodyFormatter>();

            // Must be populated from DB
            formatters.Add("JSON", new JSON_Formatter());
            formatters.Add("CSV", new CSV_Formatter());

            IBaseBodyFormatter value;

            formatters.TryGetValue(bodyType.Trim(), out value);

            body = value.BuildMessage(userId, messageType, bodyType, fields);

            return body;
        }

        public string PrepareMessage(string id)
        {
            string body = "";

            var customerRecords = (from u in _context.VGetCustomerDetails
                                       where u.CustomerId == id.ToString()
                                       select u).ToList();

            if(customerRecords.Count() > 0 && customerRecords != null)
            {
                Dictionary<string, string> messageFields = ParseCustomerRecords(customerRecords);

                string messageType = (from m in customerRecords
                                        select m.MessageType).FirstOrDefault().Trim();

                string bodyType = (from b in customerRecords
                                        select b.BodyType).FirstOrDefault().Trim();

                body = BuildMessage(id, messageType, bodyType, messageFields);

                return body;
            }

            return body;
        }
    }
}
