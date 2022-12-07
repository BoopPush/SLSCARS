using Microsoft.AspNetCore.Mvc;
using SlSCarsServerStub.Models;
using System.Runtime.Serialization.Json;

namespace SlSCarsServerStub.Controllers
{
    [Route("cars")]
    [ApiController]
    public class TestController : ControllerBase
    {
        [HttpGet("all")]
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
