using System;
using System.Collections.Generic;
using System.Text;

namespace FormatterPlugins
{
    public class CSV_Formatter : IBaseBodyFormatter
    {
        public string BuildMessage(string userId, string messageType, string bodyType, IDictionary<string, string> fields)
        {
            string body = messageType + ",";

            foreach (KeyValuePair<string, string> pair in fields)
            {
                body = body + "\"" + pair.Value + "\",";
            }

            //Last comma out
            body = body.Remove(body.Length - 1);

            return body;
        }
    }
}
