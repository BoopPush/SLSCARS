    using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SlSCarsServerStub.Common;
using SlSCarsServerStub.Models;
using System.Data.SqlClient;
using System.Runtime.Serialization.Json;

namespace SlSCarsServerStub.Controllers
{
    public class CarController : Controller
    {
        private readonly IConfiguration config_;
        public CarController(IConfiguration configuration)
        {
            config_ = configuration;
        }

        [HttpGet("cars")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> CarRoute(string vin, string brand,string model) => 
            vin is null ? brand is null ? GetAllCars() : GetCarByBrand(brand,model) : GetCarByVIN(vin);


        [HttpGet("cars/allbrands")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetModels()
        {
            var models = new List<string>();
            var ctx = new SqlConnection(config_.GetConnectionString("sls"));
            ctx.Open();
            var command = new SqlCommand("select BrandName from Brands", ctx);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                models.Add((string)reader.GetValue(0));
            }
            var result = JsonConvert.SerializeObject(models.ToArray());
            return Ok(result);
        }

        [HttpGet("cars/allbrands/{brand}")]
        [TypeFilter(typeof(LogFilterAsync), IsReusable = true)]
        public async Task<IActionResult> GetModels(string brand)
        {
            var models = new List<string>();
            var ctx = new SqlConnection(config_.GetConnectionString("sls"));
            ctx.Open();
            var command = new SqlCommand($"select ModelName from Models join Brands on Models.BrandID = Brands.ID where BrandName = '{brand}'", ctx);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                models.Add((string)reader.GetValue(0));
            }
            var result = JsonConvert.SerializeObject(models.ToArray());
            return Ok(result);
        }
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
