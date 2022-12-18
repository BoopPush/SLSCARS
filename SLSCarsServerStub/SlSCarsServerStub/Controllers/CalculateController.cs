using Microsoft.AspNetCore.Mvc;
using SlSCarsServerStub.Common;
using System.Data.SqlClient;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text.Json;

namespace SlSCarsServerStub.Controllers
{
    public class CalculateController : ControllerBase
    {
        private readonly IConfiguration config_;
        public CalculateController(IConfiguration configuration)
        {
            config_ = configuration;
        }

        [HttpPost("calculate")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> CalculateBills([FromBody] Calculator calculator)
        {
            var conn = config_.GetConnectionString("sls");
            try
            {

                using (var ctx = new SqlConnection(conn))
                {
                    calculator.result = (int)(calculator.price * (calculator.capacity * 0.0001));
                    ctx.Open();
                    SqlCommand command = new SqlCommand($"insert into Engines values ('{calculator.capacity}','{calculator.fueltype}'); select scope_identity();", ctx);
                    int check = Decimal.ToInt32((decimal)command.ExecuteScalar());
                    command = new SqlCommand($"insert into Calculator values ({calculator.age},{calculator.price},{check},{calculator.result})", ctx);
                    command.ExecuteNonQuery();
                    ctx.Close();
                }

                var stream = new MemoryStream();
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(Calculator));
                serializer.WriteObject(stream, calculator.result);
                stream.Position = 0;
                var test = JsonSerializer.Serialize(calculator);
                return Ok(test);
            }
            catch (Exception)
            {

                return BadRequest();
            }
        }
    }

    [DataContract]
    public class Calculator
    {
        public int price { get; set; }
        public int age { get; set; }
        public double capacity { get; set; }
        public string fueltype { get; set; }
        [DataMember(Name ="result")]
        public int result { get; set; }

    }
}
