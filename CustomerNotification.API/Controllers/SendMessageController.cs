using CustomerNotification.BusinessRules;
using CustomerNotification.DataAccess.Models;
using CustomerNotification.Services;
using Microsoft.AspNetCore.Mvc;


namespace CustomerNotification.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SendMessageController : ControllerBase
    {
        private readonly AppDbContext _context;
        private readonly MessagingService _messagingService = new MessagingService();

        public SendMessageController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet("{id}")]
        public string Get(int id)
        {
            Message _message = new Message(_context);

            string body = _message.PrepareMessage(id.ToString());

            if (body == "")
            {
                return "User no found";
            }
            else
            {
                _messagingService.SendMessageAsync(id.ToString(), "body");
            }

            return body;
        }
    }
}
