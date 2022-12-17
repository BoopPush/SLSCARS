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
                return Ok(Convert.ToDateTime(calculator.date));
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
