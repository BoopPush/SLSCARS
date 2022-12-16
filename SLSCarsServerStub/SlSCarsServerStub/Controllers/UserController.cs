using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using SlSCarsServerStub.Common;

namespace SlSCarsServerStub.Controllers
{
    [Route("user")]
    public class UserController : ControllerBase
    {
        [HttpPost("registrate")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> PostUser(string email, string password)
        {
            try
            {
                var emailTest = new MailAddress(email).Address;
                return Ok(email);
            }
            catch (FormatException)
            {
                return BadRequest();
            }
        }

        [HttpGet("login")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetUser(string email, string password)
        {
            return Ok(email);
        }
    }
}
