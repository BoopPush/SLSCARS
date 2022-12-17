using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using SlSCarsServerStub.Common;

namespace SlSCarsServerStub.Controllers
{
    public class UserController : ControllerBase
    {
        [HttpGet("login")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetUser(string email, string password)
        {
            //TODO: go to db, take user
            return Ok(email);

        }

        [HttpPost("signup")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> PostUser(string name,string surname,string email, string password)
        {
            //TODO: insert user into db
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
    }
}
