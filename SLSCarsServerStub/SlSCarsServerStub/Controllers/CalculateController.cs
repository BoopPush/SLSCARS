using Microsoft.AspNetCore.Mvc;
using SlSCarsServerStub.Common;

namespace SlSCarsServerStub.Controllers
{
    public class CalculateController : ControllerBase
    {
        [HttpPost("calculate")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> CalculateBills([FromBody] Calculator calculator)
        {
            //TODO: return from db
            try
            {
                var rand = new Random();
                return Ok(rand.NextDouble() * rand.Next());
            }
            catch (Exception)
            {
                return BadRequest();
            }
        }
    }

    public class Calculator
    {
        public float price { get; set; }
        public string date { get; set; }
        public double capacity { get; set; }
        public string fueltype { get; set; }

    }
}
