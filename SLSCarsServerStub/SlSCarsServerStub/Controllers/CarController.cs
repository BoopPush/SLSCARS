    using Microsoft.AspNetCore.Mvc;
using SlSCarsServerStub.Common;
using SlSCarsServerStub.Models;
using System.Runtime.Serialization.Json;

namespace SlSCarsServerStub.Controllers
{
    public class CarController : Controller
    {

        [HttpGet("cars")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> CarRoute(string vin, string brand,string model) => 
            vin is null ? brand is null ? GetAllCars() : GetCarByBrand(brand,model) : GetCarByVIN(vin);


        //TODO: return all cars from db
        public IActionResult GetAllCars()
        {
            var stream = new MemoryStream();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(LotsStorage));
            LotsStorage storage = LotsStorage.GenerateAll();
            serializer.WriteObject(stream, storage);
            stream.Position = 0;
            return Ok(stream);
        }


        //TODO: get car by vin in db
        public IActionResult GetCarByVIN(string vin)
        {
            var stream = new MemoryStream();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(LotsStorage));
            LotsStorage storage = LotsStorage.GenerateByVIN(vin);
            serializer.WriteObject(stream, storage);
            stream.Position = 0;
            return Ok(stream);
        }



        public IActionResult GetCarByBrand(string brand,string model)
        {
            var stream = new MemoryStream();
            DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(LotsStorage));
            LotsStorage storage = new LotsStorage();
            if (model is not null && brand is not null)
            {
                 storage = LotsStorage.GenerateByModel(brand,model);

            }
            else
            {
                 storage = LotsStorage.GenerateByBrand(brand);
            }
            serializer.WriteObject(stream, storage);
            stream.Position = 0;
            return Ok(stream);
        }

    }
}
