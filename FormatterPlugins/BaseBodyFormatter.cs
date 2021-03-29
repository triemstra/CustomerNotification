using System.Collections.Generic;

namespace FormatterPlugins
{
    public class BaseBodyFormatter : IBaseBodyFormatter
    {
        public virtual string BuildMessage(string userId, string messageType, string bodyType, IDictionary<string, string> fields)
        {
            return "this is the body";
        }
    }
}
