using System.Runtime.Serialization;
using System.Text;

namespace SlSCarsServerStub.Models
{
    [DataContract]
    public class LotsStorage
    {
        private static readonly Random rand_ = new Random();
        #region Data

        public static string[] AuctionArr = new string[] { "Copart", "IAAI" };

        public static string[] ConditionArr = new string[] { "Stationary", "Run and Drive", "Starts" };

        public static string[] DamageArr = new string[] { "Front", "End", "Side", "Undercarriage", "None", "Mechanical", "Water/Flood" };

        public static Dictionary<string, string[]> ModelMap = new Dictionary<string, string[]>()
        {
            {"BMW", new string[]{ "X1","M3","I8" } },
            {"Audi", new string[]{ "RS6","A3","Q7" } },
            {"Mercedes", new string[]{ "E","G","X" } },
            {"Alfa Romeo", new string[]{ "Guilia","Stelvio","240" } },
            {"Volkswagen", new string[]{ "Passat","Golf","Touareg" } },
            {"Volvo", new string[]{ "S60","XC80","S90" } },
            {"Toyota", new string[]{ "Highlander","Supra","Corolla" } },
            {"Huindai", new string[]{ "Kuga","Sonata","Tucson" } },
        };

        public static string[] DriveArr = new string[] { "Front Wheel", "Rear Wheel", "All Wheel" };

        public static string[] FuelArr = new string[] { "Gas", "Gasoline", "Electric" };

        public static string[] EngineArr = new string[] { "2.0 TFSI 4 CYLINDER 186 HP", "3.8L 8", "3.0L DOHC I-6 24V TWINPOWER" };

        public static string[] Transmission = new string[] { "Automatic", "Manual" };
        //public Spec spec; 

        public static string[] ColorArr = new string[] { "Blue", "White", "Orange", "Black", "Olive", "Silver" };

        #endregion

        [DataMember(Name = "lots")]
        public List<LotData> Lots;
        public LotsStorage()
        {
            Lots = new List<LotData>();
        }
        public static LotsStorage GenerateAll()
        {
            var storage = new LotsStorage();

            for (int r = 0; r < 100; r++)
            {
                var lot = new LotData()
                {
                    Mileage = rand_.Next(1000000),
                    Bid = rand_.NextDouble() * rand_.Next(100000),
                    SaleDate = DateTime.Today.ToString(),
                    Auction = AuctionArr[rand_.Next(AuctionArr.Length)],
                    Condition = ConditionArr[rand_.Next(ConditionArr.Length)],
                    PrimaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                    SecondaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                    Color = ColorArr[rand_.Next(ColorArr.Length)],
                    VIN = GenerateVIN(),
                    Model = GetModel(),
                    Transmission = Transmission[rand_.Next(Transmission.Length)],
                    Drive = DriveArr[rand_.Next(DriveArr.Length)],
                    Engine = EngineArr[rand_.Next(EngineArr.Length)],
                    Fuel = FuelArr[rand_.Next(FuelArr.Length)],
                    Year = GenerateYear()

                };

                storage.Lots.Add(lot);
            }

            return storage;
        }

        public static LotsStorage GenerateByVIN(string vin)
        {
            var storage = new LotsStorage();


            var lot = new LotData()
            {
                Mileage = rand_.Next(1000000),
                Bid = rand_.NextDouble() * rand_.Next(100000),
                SaleDate = DateTime.Today.ToString(),
                Auction = AuctionArr[rand_.Next(AuctionArr.Length)],
                Condition = ConditionArr[rand_.Next(ConditionArr.Length)],
                PrimaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                SecondaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                Color = ColorArr[rand_.Next(ColorArr.Length)],
                VIN =vin,
                Model = GetModel(),
                Transmission = Transmission[rand_.Next(Transmission.Length)],
                Drive = DriveArr[rand_.Next(DriveArr.Length)],
                Engine = EngineArr[rand_.Next(EngineArr.Length)],
                Fuel = FuelArr[rand_.Next(FuelArr.Length)],
                Year = GenerateYear()
            };

            storage.Lots.Add(lot);

            return storage;
        }

        public static LotsStorage GenerateByBrand(string brand)
        {
            var storage = new LotsStorage();

            for (int r = 0; r < 10; r++)
            {
                var lot = new LotData()
                {
                    Mileage = rand_.Next(1000000),
                    Bid = rand_.NextDouble() * rand_.Next(100000),
                    SaleDate = DateTime.Today.ToString(),
                    Auction = AuctionArr[rand_.Next(AuctionArr.Length)],
                    Condition = ConditionArr[rand_.Next(ConditionArr.Length)],
                    PrimaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                    SecondaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                    Color = ColorArr[rand_.Next(ColorArr.Length)],
                    VIN = GenerateVIN(),
                    Model = GetModelsByBrand(brand),
                    Transmission = Transmission[rand_.Next(Transmission.Length)],
                    Drive = DriveArr[rand_.Next(DriveArr.Length)],
                    Engine = EngineArr[rand_.Next(EngineArr.Length)],
                    Fuel = FuelArr[rand_.Next(FuelArr.Length)],
                    Year = GenerateYear()
                };

                storage.Lots.Add(lot);
            }

            return storage;
        }

        public static LotsStorage GenerateByModel(string brand,string model)
        {
            var storage = new LotsStorage();

            for (int r = 0; r < 5; r++)
            {
                var lot = new LotData()
                { 
                    Mileage = rand_.Next(1000000),
                    Bid = rand_.NextDouble() * rand_.Next(100000),
                    SaleDate = DateTime.Today.ToString(),
                    Auction = AuctionArr[rand_.Next(AuctionArr.Length)],
                    Condition = ConditionArr[rand_.Next(ConditionArr.Length)],
                    PrimaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                    SecondaryDamage = DamageArr[rand_.Next(DamageArr.Length)],
                    Color = ColorArr[rand_.Next(ColorArr.Length)],
                    VIN = GenerateVIN(),
                    Model = brand + ' ' + model,
                    Transmission = Transmission[rand_.Next(Transmission.Length)],
                    Drive = DriveArr[rand_.Next(DriveArr.Length)],
                    Engine = EngineArr[rand_.Next(EngineArr.Length)],
                    Fuel = FuelArr[rand_.Next(FuelArr.Length)],
                    Year = GenerateYear()
                };

                storage.Lots.Add(lot);
            }

            return storage;
        }

        private static int GenerateYear()
        {
            return rand_.Next(2000, 2021);
        }

        private static string GenerateVIN()
        {
            StringBuilder vin = new StringBuilder();

            for (int i = 0; i < 17; i++)
            {
                char c = new char();
                if (rand_.NextDouble() > 0.5)
                {
                    c = (char)rand_.Next('1','9');
                }
                else
                {
                    c = (char)rand_.Next('A','Z');
                }

                vin.Append(c);
            }

            return vin.ToString();
        }

        private static string GetModel()
        {
            var r = rand_.Next(ModelMap.Count);
            var brand = ModelMap.ElementAt(r).Key;
            var model = ModelMap.ElementAt(r).Value[rand_.Next(3)];

            return brand + ' ' + model;
        }

        private static string GetModelsByBrand(string brand)
        {
            var model = ModelMap[brand][rand_.Next(3)];

            return brand + ' ' + model;
        }

    }



    [DataContract]
    public class LotData
    {
        [DataMember(Name = "mileage")]
        public int Mileage;

        [DataMember(Name = "bid")]
        public double Bid;

        [DataMember(Name = "saledate")]
        public string SaleDate;

        [DataMember(Name = "note")]
        public string Note;

        [DataMember(Name = "auction")]
        public string Auction;

        [DataMember(Name = "condition")]
        public string Condition;

        [DataMember(Name = "primarydam")]
        public string PrimaryDamage;

        [DataMember(Name = "secondarydam")]
        public string SecondaryDamage;

        [DataMember(Name = "color")]
        public string Color;

        [DataMember(Name = "vin")]
        public string VIN;

        [DataMember(Name = "model")]
        public string Model;

        [DataMember(Name = "trans")]
        public string Transmission;

        [DataMember(Name = "drive")]
        public string Drive;

        [DataMember(Name = "engine")]
        public string Engine;

        [DataMember(Name = "fuel")]
        public string Fuel;

         [DataMember(Name = "imagesrc")]
        public string Image = "https://bidfax.info/uploads/posts/2022-12/16/audi-a3-sedan-2018-wauj8gff5j1082723-img1.jpg";

        [DataMember(Name = "year")]
        public int Year;

        [DataMember(Name = "docs")]
        public string Docs = "Fl - Certificate Of Destruction";

        [DataMember(Name = "location")]
        public string Location = "Ca - Martinez";

        [DataMember(Name = "seller")]
        public string Seller = "Not specified";


    }
}
