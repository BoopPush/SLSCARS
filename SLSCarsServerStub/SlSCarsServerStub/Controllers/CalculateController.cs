using Microsoft.AspNetCore.Mvc;
using SlSCarsServerStub.Common;

namespace SlSCarsServerStub.Controllers
{
    public class CalculateController : ControllerBase
    {
        [HttpPost("calculate")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> CalculateBills(float price, DateTime date,double capacity,string fueltype)
        {
            //TODO: return from db
            return Ok(fueltype);
        }
    }
}
