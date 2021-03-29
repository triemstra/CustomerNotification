using System.Collections.Generic;

namespace FormatterPlugins
{
    public interface IBaseBodyFormatter
    {
        string BuildMessage(string userId, string messageType, string bodyType, IDictionary<string, string> fields);
    }
}