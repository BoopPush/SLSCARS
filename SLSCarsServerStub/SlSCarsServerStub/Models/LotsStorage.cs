using System.Data.SqlClient;
using System.Runtime.Serialization;
using System.Text;

namespace SlSCarsServerStub.Models
{
    [DataContract]
    public class LotsStorage
    {

        private readonly static string ConnectionString = "Server=mssql_db;Database=master;User ID=sa;Password=Testpass123;MultipleActiveResultSets=true";
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
            var ctx = new SqlConnection(ConnectionString);
            ctx.Open();
            var command = new SqlCommand(@$"select * from Lots
    join Models on Lots.ModelID = Models.ID
    join Brands on Models.BrandID = Brands.ID
    join Auctions on Auctions.ID = Lots.AuctionID
    join Conditions on Conditions.ID = Lots.ConditionsID
    join Images on Images.ID = Lots.ImageID
    join Specs on Specs.ID = Lots.SpecID
    join Notes on Notes.ID = Lots.NoteID", ctx);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var lot = new LotData();
                lot.Color = (string)reader.GetValue(1);
                lot.Mileage = (int)reader.GetValue(2);
                lot.VIN = (string)reader.GetValue(3);
                lot.SaleDate = (string)reader.GetValue(4);
                lot.Year = Convert.ToInt32((string)reader.GetValue(5));
                lot.Bid = (double)reader.GetValue(6);
                lot.Model = (string)reader.GetValue(17) + " " + (string)reader.GetValue(14);
                lot.Auction = (string)reader.GetValue(19);
                lot.Docs = (string)reader.GetValue(20);
                lot.Location = (string)reader.GetValue(21);
                lot.Seller = (string)reader.GetValue(22);
                lot.PrimaryDamage = (string)reader.GetValue(24);
                lot.SecondaryDamage = (string)reader.GetValue(25);
                lot.Condition = (string)reader.GetValue(26);
                lot.Image = (string)reader.GetValue(28);
                lot.Transmission = (string)reader.GetValue(30);
                lot.Drive = (string)reader.GetValue(31);
                lot.Engine = (string)reader.GetValue(32);
                lot.Fuel = (string)reader.GetValue(33);
                lot.Note = (string)reader.GetValue(35);

                storage.Lots.Add(lot);
            }

            ctx.Close();
            return storage;
        }

        public static LotsStorage GenerateByVIN(string vin)
        {
            var storage = new LotsStorage();
            var ctx = new SqlConnection(ConnectionString);
            ctx.Open();
            var command = new SqlCommand(@$"select * from Lots
    join Models on Lots.ModelID = Models.ID
    join Brands on Models.BrandID = Brands.ID
    join Auctions on Auctions.ID = Lots.AuctionID
    join Conditions on Conditions.ID = Lots.ConditionsID
    join Images on Images.ID = Lots.ImageID
    join Specs on Specs.ID = Lots.SpecID
    join Notes on Notes.ID = Lots.NoteID where Lots.VIN = '{vin}'", ctx);
            var reader = command.ExecuteReader();
            reader.Read();
                var lot = new LotData();
                lot.Color = (string)reader.GetValue(1);
                lot.Mileage = (int)reader.GetValue(2);
                lot.VIN = (string)reader.GetValue(3);
                lot.SaleDate = (string)reader.GetValue(4);
                lot.Year = Convert.ToInt32((string)reader.GetValue(5));
                lot.Bid = (double)reader.GetValue(6);
                lot.Model = (string)reader.GetValue(17) + " " + (string)reader.GetValue(14);
                lot.Auction = (string)reader.GetValue(19);
                lot.Docs = (string)reader.GetValue(20);
                lot.Location = (string)reader.GetValue(21);
                lot.Seller = (string)reader.GetValue(22);
                lot.PrimaryDamage = (string)reader.GetValue(24);
                lot.SecondaryDamage = (string)reader.GetValue(25);
                lot.Condition = (string)reader.GetValue(26);
                lot.Image = (string)reader.GetValue(28);
                lot.Transmission = (string)reader.GetValue(30);
                lot.Drive = (string)reader.GetValue(31);
                lot.Engine = (string)reader.GetValue(32);
                lot.Fuel = (string)reader.GetValue(33);
                lot.Note = (string)reader.GetValue(35);

                storage.Lots.Add(lot);

            ctx.Close();
            return storage;
        }

        private static void Test()
        {

            var storage = new LotsStorage();
            var ctx = new SqlConnection(ConnectionString);
            ctx.Open();
            var command = new SqlCommand(@$"select * from Lots
    join Models on Lots.ModelID = Models.ID
    join Brands on Models.BrandID = Brands.ID
    join Auctions on Auctions.ID = Lots.AuctionID
    join Conditions on Conditions.ID = Lots.ConditionsID
    join Images on Images.ID = Lots.ImageID
    join Specs on Specs.ID = Lots.SpecID
    join Notes on Notes.ID = Lots.NoteID", ctx);
            var reader = command.ExecuteReader();
            if (!reader.HasRows)
            {
            }

            while (reader.Read())
            {
                var temp = reader.GetValue(20);
            }
        }

        public static LotsStorage GenerateByBrand(string brand)
        {

            var storage = new LotsStorage();
            var ctx = new SqlConnection(ConnectionString);
            ctx.Open();
            var command = new SqlCommand(@$"select * from Lots
    join Models on Lots.ModelID = Models.ID
    join Brands on Models.BrandID = Brands.ID
    join Auctions on Auctions.ID = Lots.AuctionID
    join Conditions on Conditions.ID = Lots.ConditionsID
    join Images on Images.ID = Lots.ImageID
    join Specs on Specs.ID = Lots.SpecID
    join Notes on Notes.ID = Lots.NoteID where Brands.BrandName = '{brand}'", ctx);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var lot = new LotData();
                lot.Color = (string)reader.GetValue(1);
                lot.Mileage = (int)reader.GetValue(2);
                lot.VIN = (string)reader.GetValue(3);
                lot.SaleDate = (string)reader.GetValue(4);
                lot.Year = Convert.ToInt32((string)reader.GetValue(5));
                lot.Bid = (double)reader.GetValue(6);
                lot.Model = (string)reader.GetValue(17) + " " + (string)reader.GetValue(14);
                lot.Auction = (string)reader.GetValue(19);
                lot.Docs = (string)reader.GetValue(20);
                lot.Location = (string)reader.GetValue(21);
                lot.Seller = (string)reader.GetValue(22);
                lot.PrimaryDamage = (string)reader.GetValue(24);
                lot.SecondaryDamage = (string)reader.GetValue(25);
                lot.Condition = (string)reader.GetValue(26);
                lot.Image = (string)reader.GetValue(28);
                lot.Transmission = (string)reader.GetValue(30);
                lot.Drive = (string)reader.GetValue(31);
                lot.Engine = (string)reader.GetValue(32);
                lot.Fuel = (string)reader.GetValue(33);
                lot.Note = (string)reader.GetValue(35);

                storage.Lots.Add(lot);
            }
            ctx.Close();
            return storage;
        }


        public static LotsStorage GenerateByModel(string brand,string model)
        {
            var storage = new LotsStorage();
            var ctx = new SqlConnection(ConnectionString);
            ctx.Open();
            var command = new SqlCommand(@$"select * from Lots
    join Models on Lots.ModelID = Models.ID
    join Brands on Models.BrandID = Brands.ID
    join Auctions on Auctions.ID = Lots.AuctionID
    join Conditions on Conditions.ID = Lots.ConditionsID
    join Images on Images.ID = Lots.ImageID
    join Specs on Specs.ID = Lots.SpecID
    join Notes on Notes.ID = Lots.NoteID where Models.ModelName= '{model}'", ctx);
            var reader = command.ExecuteReader();
            while (reader.Read())
            {
                var lot = new LotData();
                lot.Color = (string)reader.GetValue(1);
                lot.Mileage = (int)reader.GetValue(2);
                lot.VIN = (string)reader.GetValue(3);
                lot.SaleDate = (string)reader.GetValue(4);
                lot.Year = Convert.ToInt32((string)reader.GetValue(5));
                lot.Bid = (double)reader.GetValue(6);
                lot.Model = (string)reader.GetValue(17) + " " + (string)reader.GetValue(14);
                lot.Auction = (string)reader.GetValue(19);
                lot.Docs = (string)reader.GetValue(20);
                lot.Location = (string)reader.GetValue(21);
                lot.Seller = (string)reader.GetValue(22);
                lot.PrimaryDamage = (string)reader.GetValue(24);
                lot.SecondaryDamage = (string)reader.GetValue(25);
                lot.Condition = (string)reader.GetValue(26);
                lot.Image = (string)reader.GetValue(28);
                lot.Transmission = (string)reader.GetValue(30);
                lot.Drive = (string)reader.GetValue(31);
                lot.Engine = (string)reader.GetValue(32);
                lot.Fuel = (string)reader.GetValue(33);
                lot.Note = (string)reader.GetValue(35);

                storage.Lots.Add(lot);
            }
            ctx.Close();
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
