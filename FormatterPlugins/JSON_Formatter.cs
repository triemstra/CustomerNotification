using Newtonsoft.Json;
using System.Collections.Generic;

namespace FormatterPlugins
{
    public class JSON_Formatter : IBaseBodyFormatter
    {
        public string BuildMessage(string userId, string messageType, string bodyType, IDictionary<string, string> fields)
        {
            string header = "{\"mesageType\":" + "\"" + messageType.Trim() + "\"" + ",\"data:\"";

            string json = JsonConvert.SerializeObject(fields, Formatting.Indented);

            string body = header + json + "}";

            return body;
        }
    }
}
