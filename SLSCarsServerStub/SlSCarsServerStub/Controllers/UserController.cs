using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using SlSCarsServerStub.Common;

namespace SlSCarsServerStub.Controllers
{
    public class UserController : ControllerBase
    {
        [HttpGet("login")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetUser(/*string email, string password*/[FromBody] User user)
        {
            //TODO: go to db, take user
            return Ok(user.email);

        }

        [HttpPost("signup")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> PostUser([FromBody] User user)
        {
            //TODO: insert user into db
            try
            {
                var emailTest = new MailAddress(user.email).Address;
                return Ok(user.email);
            }
            catch (FormatException)
            {
                return BadRequest();
            }

        }
    }

    public class User
    {
        
        public string name { get; set; }

        public string surname { get; set; }  

        public string email { get; set; }   
        
        public string password { get; set; }
    }
}
