using Microsoft.AspNetCore.Mvc;
using SlSCarsServerStub.Common;
using SlSCarsServerStub.Models;
using System.Runtime.Serialization.Json;

namespace SlSCarsServerStub.Controllers
{
    [Route("cars")]
    [ApiController]
    public class CarController : ControllerBase
    {
        [HttpGet("all")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetAllCars()
        {
            var stream = new MemoryStream();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(LotsStorage));
            LotsStorage storage = LotsStorage.GenerateAll();
            serializer.WriteObject(stream, storage);
            stream.Position = 0;
            return Ok(stream);
        }

        [HttpGet("{vin}")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetCar(string vin)
        {
            var stream = new MemoryStream();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(LotsStorage));
            LotsStorage storage = LotsStorage.Generate(vin);
            serializer.WriteObject(stream, storage);
            stream.Position = 0;
            return Ok(stream);
        }
    }
}
