using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using SlSCarsServerStub.Common;
using System.Data.SqlClient;

namespace SlSCarsServerStub.Controllers
{
    public class UserController : ControllerBase
    {
        private readonly IConfiguration config_;
        public UserController(IConfiguration configuration)
        {
            config_ = configuration;
        }

        [HttpGet("login")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetUser([FromBody] User user)
        {
            //TODO: go to db, take user
            var connection = config_.GetConnectionString("sls");
            var ctx = new SqlConnection(connection);
            ctx.Open();
            var command = new SqlCommand($"select * from Users where Email = '{user.email}' and password = '{user.password}'",ctx);
            var reader = command.ExecuteReader();
            reader.Read();
            try
            {
                if ((string)reader["email"] != "")
                {
                    ctx.Close();
                    return Ok();
                }
                else
                {
                    ctx.Close();
                    return BadRequest();
                }
            }
            catch (Exception)
            {
                return BadRequest();
            }
// юзер не найден
        }

        [HttpPost("signup")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> PostUser([FromBody] User user)
        {
            //TODO: add valid return
            try
            {
                var conn = config_.GetConnectionString("sls");
                string res = string.Empty;

                using (var ctx = new SqlConnection(conn))
                {
                    ctx.Open();
                    var email = new MailAddress(user.email).Address;
                    var command = new SqlCommand($"insert into Users values ('{user.name}','{user.surname}','{user.password}','{email}')",ctx);
                    command.ExecuteNonQuery();
                    ctx.Close();
                }
                return Ok();
            }
            catch (SqlException)
            {
                return BadRequest("email already exist");
            }
            catch (FormatException)
            {
                return BadRequest("invalid email");
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
