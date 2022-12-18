
create table Brands(
    ID int IDENTITY PRIMARY KEY  not null,
    BrandName nvarchar(100) NOT NULL,
);

create table Models(
    ID int IDENTITY PRIMARY KEY not null,
    ModelName nvarchar(500) not null,
    BrandID int,
    FOREIGN KEY (BrandID) REFERENCES Brands (ID) ON DELETE CASCADE,
);

create table Users(
    ID int IDENTITY primary key not null,
    Name nvarchar(100) not null ,
    Surname nvarchar(100) not null ,
    Password nvarchar(100) not null ,
    Email nvarchar(200) not null
);

drop table Users

create table Conditions(
    ID int IDENTITY primary key not null,
    PrimaryDamage nvarchar(100) not null,
    SecondaryDamage nvarchar(100) not null,
    Condition nvarchar(100) not null,
);

create table Auctions(
    ID int IDENTITY primary key not null,
    AuctionName nvarchar(100) not null,
    Documents nvarchar(100) not null,
    Location nvarchar(100) not null,
    Seller nvarchar(100) not null,
);

create table Notes(
    ID int IDENTITY primary key not null,
    Note nvarchar(500) not null,
);

create table Specs(
    ID int IDENTITY primary key not null,
    Transmission nvarchar(100) not null,
    Drive nvarchar(100) not null,
    Engine nvarchar(100) not null,
    Fuel nvarchar(100) not null,
);

create table Images(
    ID int IDENTITY primary key not null,
    FilePath nvarchar(200) not null
);

create table Lots(
    ID int IDENTITY primary key not null,
    Color nvarchar(100) not null,
    Mileage int not null,
    VIN nvarchar(100) not null,
    SaleDate nvarchar(100) not null,
    Age nvarchar(100) not null,
    Bid float not null,
    ModelID int,
    ConditionsID int UNIQUE REFERENCES Conditions (ID) ON DELETE CASCADE,
    AuctionID int UNIQUE REFERENCES Auctions (ID) ON DELETE CASCADE,
    NoteID int UNIQUE REFERENCES Notes (ID) ON DELETE CASCADE,
    SpecID int UNIQUE REFERENCES Specs (ID) ON DELETE CASCADE,
    ImageID int,
    FOREIGN KEY  (ModelID) REFERENCES Models (ID) ON DELETE CASCADE,
    FOREIGN KEY (ImageID) REFERENCES Images (ID) ON DELETE CASCADE,
);

create table FuelTypes(
    ID int IDENTITY primary key not null,
    FuelType nvarchar(100) not null,
);

create table EngineCapacities(
     ID int IDENTITY primary key not null,
     EngineCapacity float not null,
)

create table Calculator(
    ID int not null,
    AgeAuto date not null,
    Coast float not null,
    EngineCapacityID int,
    FuelTypeID int,
    FOREIGN KEY (EngineCapacityID) REFERENCES EngineCapacities (ID) ON DELETE CASCADE,
    FOREIGN KEY (FuelTypeID) REFERENCES FuelTypes (ID) ON DELETE CASCADE,
);

INSERT INTO Brands (BrandName)
VALUES ('Acura'),('Audi'),('BMW'),('Chevrolet'),('Ford'),('Honda'),('Mazda'),('Mercedes-Benz'),('Toyota')

INSERT INTO Models (ModelName)
VALUES ('CSX'),('ILX'),('Integra'),('TL'),('MDX'),('NSX'),('RDX'),('RL'),('RLX'),('TLX'),('A3'),('A4'),('A5'),('A6'),('A7'),('A8'),('Q3'),('Q5'),('Q7'),('Q8'),('320'),('325'),('428'),('435'),('530'),('540'),('X3'),('X5'),('X6'),('X7'),('Captiva'),('Camaro'),('Cobalt'),('Colorado'),('Cruze'),('Equinox'),('Malibu'),('Orlando'),('Tahoe'),('Volt'),('C-max'),('Cobra'),('Escape'),('Escort'),('Focus'),('Fusion'),('Mustang'),('Ranger'),('Taurus'),('Transit'),('Accord'),('Civic'),('Clarity'),('Cr-v'),('Element'),('Fit'),('Insight'),('Passport'),('Pilot'),('Ridgeline'),('3'),('5'),('6'),('Cx-3'),('Cx-5'),('Cx-7'),('Cx-9'),('Rx8'),('Speed'),('Tribute'),('A-class'),('C-class'),('E-class'),('EQS'),('G-class'),('GLC'),('GLE'),('GLS'),('S-class'),('Sprinter'),('4runner'),('Camry'),('Corolla'),('Highlander'),('Land cruiser'),('Matrix'),('Prius'),('Rav4'),('Supra'),('Venza')

INSERT INTO Conditions (PrimaryDamage, SecondaryDamage, Condition)
VALUES ('Front End','Minor Dent/Scratches','Run And Drive'),('Storm Damage','Flood','Stationary'),('Rear End','Unspecified','Run And Drive'),('Right Front','Left Front','Run And Drive'),('Left Rear','Rear','Run And Drive'),('Rear End','Unspecified','Enhanced Vehicles'),('Flood','Unspecified','Run and Drive'),('Front End','Unspecified','Stationary'),('Front End','Minor Dent/Scratches','Enhanced Vehicles'),('Right Side','Unspecified','Run and Drive'),('Flood','Unspecified','Run and Drive'),('Flood','Unspecified','Stationary'),('Left and Right Side','Unspecified','Stationary'),('Exterior Burn','Unspecified','Run and Drive'),('Left Front','Unspecified','Run and Drive'),('Flood','Unspecified','Stationary'),('Flood','Unspecified','Stationary'),('Flood','Unspecified','Stationary'),('Flood','Unspecified','Run and Drive'),('Minor Dent/Scratches','Unspecified','Run and Drive'),('Mechanical','Minor Dent/Scratches','Run And Drive'),('Side','Unspecified','Enhanced Vehicles'),('Water/Flood','Unspecified','Run And Drive'),('Front End','Unspecified','Enhanced Vehicles'),('Flood','Unspecified','Stationary'),('Storm Damage','Flood','Stationary'),('Flood','Unspecified','Stationary'),('Flood','Unspecified','Stationary'),('Flood','Unspecified','Stationary'),('Water/Flood','Unspecified','Run And Drive'),('Right Front','Unspecified','Stationary'),('Right Front','Unspecified','Starts'),('Front End','Unspecified','Stationary'),('Mechanical','Unspecified','Run and Drive'),('Unknown','Unspecified','Run and Drive'),('Right Front','Unspecified','Run and Drive'),('Left and Right Side','Front End','Run and Drive'),('Front End','Unspecified','Run And Drive'),('Unknown','Unspecified','Run and Drive'),('Unknown','Unspecified','Stationary'),('Unknown','Unspecified','Stationary'),('Front End','Unspecified','Run And Drive'),('Left Front','Right Side','Stationary'),('Minor Dent/Scratches','Unspecified','Run And Drive'),('Left Front','Unspecified','Stationary'),('Left and Right Side','Unspecified','Run and Drive'),('Right Front','Unspecified','Run and Drive'),('Storm Damage','Unspecified','Run and Drive'),('Front End','Unspecified','Run and Drive'),('Left and Right Side','Unspecified','Run and Drive'),('Right Side','Suspension','Starts'),('Front End','Unspecified','Stationary'),('Front End','Left Front','Run and Drive'),('Front End','Unspecified','Run and Drive'),('Front End','Unspecified','Stationary'),('Right Front','Mechanical','Run and Drive'),('Right Side','Front End','Run and Drive'),('Right Front','All Over','Run and Drive'),('Right Rear','Unspecified','Run and Drive'),('Front End','Left and Right Side','Run and Drive'),('Left Front','Unspecified','Run and Drive'),('Front End','Unspecified','Run and Drive'),('Right Front','Unspecified','Run and Drive'),('Front End','Mechanical','Stationary'),('Right Rear','Left Side','Stationary'),('Front End','Unspecified','Run and Drive'),('Left Front','Unspecified','Run and Drive'),('Unknown','Unspecified','Stationary'),('Side','Mechanical','Run And Drive'),('Mechanical','Minor Dent/Scratches','Run And Drive'),('Undercarriage','Front End','Enhanced Vehicles'),('Front End','Repossession','Run and Drive'),('Unknown','Unspecified','Run and Drive'),('Flood','Storm Damage','Stationary'),('Flood','Unspecified','Stationary'),('Front End','Unspecified','Stationary'),('Flood','Storm Damage','Stationary'),('Flood','Unspecified','Stationary'),('Unknown','Unspecified','Run and Drive'),('Unknown','Unspecified','Stationary'),('All Over','Unspecified','Stationary'),('Front End','Unspecified','Stationary'),('Unknown','Unspecified','Run and Drive'),('Right Front','Unspecified','Starts'),('Front End','Unspecified','Run And Drive'),('Left Front','Front End','Stationary'),('Unknown','Unspecified','Run and Drive'),('Normal Wear and Tear','Unspecified','Stationary'),('Front End','Side','Enhanced Vehicles'),('Rollover','All Over','Stationary')

INSERT INTO Auctions (AuctionName, Documents, Location, Seller)
VALUES ('Copart','Ab - Bos - Salvage','Ab - Edmonton','Unspecified'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('Copart','Nj - Cert Of Title-Salvage','Ny - Newburgh','Unspecified'),('IAAI','SALVAGE (Georgia)','Savannah (GA)','Progressive Casualty Insurance'),('IAAI','SALVAGE (Virginia)','Richmond (VA)','Progressive Casualty Insurance'),('Copart','Az - Cert Of Title - Salvage','Az - Phoenix','Unspecified'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CLEAR (Michigan)','Detroit (MI)','Hanover Insurance'),('Copart','Or - Salvage Title Certificate','Or - Eugene','Unspecified'),('IAAI','SALVAGE (Mississippi)','Gulf Coast (MS)','Alfa Insurance Group'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','REBUILDABLE (Florida)','Fort Myers (FL)','Mercury Insurance'),('IAAI','BILL OF SALE (Georgia)','Atlanta (GA)','Progressive Casualty Insurance'),('IAAI','ORIGINAL (Texas)','Houston South (TX)','Progressive Casualty Insurance'),('IAAI','SALVAGE (Georgia)','Atlanta East (GA)','State Farm Group Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','rogressive Casualty Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI',' CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('Copart','Fl - Certificate Of Destruction','Fl - Punta Gorda South','Unspecified'),('Copart','Nv - Dlr/Dis/Exp-Ct Others-','Ca - Hayward','Unspecified'),('Copart','Il - Salvage Certificate','Il - Chicago North','Il - Chicago North'),('Copart','Fl - Cert Of Title-Slvg Rebld Flood','Fl - Miami Central','Unspecified'),('Copart','Nm - Cert Of Title-Salvage','Nm - Albuquerque','Unspecified'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI',' CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI',' CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI',' CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('Copart','Fl - Cert Of Title-Slvg Rebld Flood','Fl - Punta Gorda South','Unspecified'),('IAAI','CLEAR (Pennsylvania)','Bridgeport (PA)','Unspecified'),('IAAI','SALVAGE CERTIFICATE (California)','ACE - Perris (CA)','Auto Club of Southern CA (ACSC)'),('IAAI','SALVAGE (Pennsylvania)','Philadelphia (PA)','Inspection Services'),('IAAI','CLEAR (Massachusetts)','Templeton (MA)','Unspecified'),('IAAI','REGULAR (Nevada)','Reno (NV)','Unspecified'),('IAAI','CLEAR (Pennsylvania)','Bridgeport (PA)','Unspecified'),('IAAI','SALVAGE TITLE (Texas)','Richmond (VA)','Unspecified'),('Copart','On - Permit No Brand - Unfit','Ns - Halifax','Unspecified'),('IAAI','CLEAR (Illinois)','Atlanta (GA)','Unspecified'),('IAAI','CLEAR (Georgia)','Atlanta (GA)','Unspecified'),('IAAI','CLEAR (Pennsylvania)','Bridgeport (PA)','Unspecified'),('Copart','Fl - Dlr/Dis/Exp-Ct Others-Ca Acq','Ca - Hayward','Unspecified'),('IAAI','CLEAR (Massachusetts)','Boston - Shirley (MA)','MAPFRE USA'),('Copart','Co - Bill Of Sale','Ma - North Boston','Unspecified'),('IAAI','CLEAR (Virginia)','Richmond (VA)','Unspecified'),('IAAI','CLEAR (Virginia)','Richmond (VA)','Unspecified'),('IAAI','CLEAR (Indiana)','Richmond (VA)','Enterprise Vehicle Exchange'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CLEAR (Pennsylvania)','Philadelphia (PA)','Wheelzy'),('IAAI','CLEAR (Texas)','Houston South (TX)','Element Fleet Management'),('IAAI','SALVAGE CERTIFICATE (California)','ACE - Perris (CA)','Auto Club of Southern CA (ACSC)'),('IAAI','ORIGINAL (Texas)','Houston South (TX)','Unspecified'),('IAAI','SALVAGE CERTIFICATE (California)','East Bay (CA)','Progressive Casualty Insurance'),('IAAI','SALVAGE (Pennsylvania)','Philadelphia (PA)','USAA'),('IAAI','SALVAGE (North Dakota)','Fargo (ND)','North Star Insurance'),('IAAI','SALVAGE (North Carolina)','Asheville (NC)','Unspecified'),('IAAI','SALVAGE (Arkansas)','Fayetteville (AR)','Arkansas Farm Bureau'),('IAAI','SALVAGE (Utah)','Salt Lake City (UT)','Progressive Casualty Insurance'),('IAAI','CLEAR (Massachusetts)','Boston - Shirley (MA)','Wheelzy'),('IAAI','SALVAGE (Massachusetts)','Templeton (MA)','Hanover Insurance'),('IAAI','CLEAR (Idaho)','Boise (ID)','Unspecified'),('IAAI','CLEAR (Georgia)','Atlanta (GA)','Unspecified'),('IAAI','SALVAGE (North Carolina)','Asheville (NC)','Unspecified'),('IAAI','SALVAGE TITLE (Texas)','Houston South (TX)','USAA'),('IAAI','SALVAGE CERTIFICATE (California)','ACE - Perris (CA)','Auto Club of Southern CA (ACSC)'),('IAAI','CLEAR (Massachusetts)','Boston - Shirley (MA)','Progressive Casualty Insurance'),('IAAI','ORIGINAL (Texas)','Houston South (TX)','Mid'),('IAAI','CLEAR (North Carolina)','Raleigh (NC)','Unspecified'),('Copart','Tx - Salvage Vehicle Title (P)','Tx - Dallas South','Unspecified'),('Copart','Ca - Cert Of Title Or Salvage Acq','Ca - So Sacramento','Unspecified'),('Copart','Tx - Salvage Vehicle Title (P)','Tx - Houston','Unspecified'),('IAAI','REPOSSESSION PAPERWORK (Georgia)','Atlanta (GA)','Unspecified'),('IAAI','SALVAGE TITLE (Texas)','Atlanta (GA)','Unspecified'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Dream Rides','Progressive Casualty Insurance'),('IAAI','SALVAGE (Pennsylvania)','Philadelphia (PA)','Progressive Casualty Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CERTIFICATE OF DESTRUCTION (Florida)','Fort Myers (FL)','Progressive Casualty Insurance'),('IAAI','CLEAR (Pennsylvania)','Bridgeport (PA)','Unspecified'),('IAAI','CLEAR (Pennsylvania)','Bridgeport (PA)','Unspecified'),('IAAI','SALVAGE CERTIFICATE (California)','ACE - Perris (CA)','Auto Club of Southern CA (ACSC)'),('IAAI','CLEAR (Georgia)','Atlanta (GA)','Unspecified'),('IAAI','SALVAGE (Massachusetts)','Boston - Shirley (MA)','Unspecified'),('IAAI','CLEAR (Virginia)','Richmond (VA)','Enterprise Vehicle Exchange - 21 Newport News'),('Copart','Pa - Certificate Of Salvage',' Pa - Pittsburgh North','Unspecified'),('IAAI','SALVAGE (Kansas)','Wichita (KS)','State Farm Group Insurance'),('IAAI','CLEAR (Utah)','Boston - Shirley (MA)','Unspecified'),('IAAI','CLEAR (New Hampshire)','Boston - Shirley (MA)','Unspecified'),('Copart','Md - Cert Of Salvage > 75% Damage (P)','Md - Baltimore East','Unspecified'),('IAAI','CLEAR (Massachusetts)','Boston - Shirley (MA)','Unspecified')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','2.0L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/11/acura-csx-techno-2010-2hhfd5f74ah200194-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','216308','2HHFD5F74AH200194','08.12.2022','2010','2450','1','1','1','1','1','1')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','2.0L SOHC I-VTEC 16-VALVE I4','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/acura-ilx-2013-19vde1f71de011494-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','1','19VDE1F71DE011494','16.12.2022','2013','700','2','2','2','2','2','2')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','1.5L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/11/acura-integra-a-2023-19ude4h34pa002591-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Blue','2958','19UDE4H34PA002591','08.12.2022','2022','13900','3','3','3','3','3','3')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','3.5L SOHC PGM-FI 24-VALVE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/acura-tl-2012-19uua8f52ca018841-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Blue','81290','19UUA8F52CA018841','16.12.2022','2012','4825','4','4','4','4','4','4')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.5L 24V SOHC I-VTEC V6','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/acura-mdx-2018-5j8yd4h34jl014806-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','79333','5J8YD4H34JL014806','16.12.2022','2018','9650','5','5','5','5','5','5')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.5L 6','Hybrid Engine')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/08/acura-nsx-2017-19unc1b02hy000144-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','36033','19UNC1B02HY000144','05.12.2022','2017','65000','6','6','6','6','6','6')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','3.5L SOHC V6 24V I-VTEC','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/acura-rdx-2016-5j8tb3h39gl019101-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Brown','111935','5J8TB3H39GL019101','16.12.2022','2016','3175','7','7','7','7','7','7')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.7L SOHC PGM-FI 24-VALVE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/acura-rl-2012-jh4kb2f6xcc000387-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Silver','125120','JH4KB2F6XCC000387','15.12.2022','2012','750','8','8','8','8','8','8')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','3.5L 6','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/15/acura-rlx-tech-2018-jh4kc1f51jc000127-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','20','JH4KC1F51JC000127','13.12.2022','2018','6100','9','9','9','9','9','9')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','3.5L SOHC 24-VALVE VTEC V6','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/acura-tlx-2015-19uub2f37fa019304-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','103193','19UUB2F37FA019304','16.12.2022','2015','4375','10','10','10','10','10','10')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','2.0 TFSI 4 CYLINDER 186 HP','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-a3-sedan-2018-wauaugff1j1025382-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Silver','33141','WAUAUGFF1J1025382','16.12.2022','2018','4375','11','11','11','11','11','11')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','2.0L DOHC TFSI 16-VALVE I4','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-a4-2008-wauaf48h98k011466-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Gray','74504','WAUAF48H98K011466','16.12.2022','2008','350','12','12','12','12','12','12')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','2.0L DOHC TFSI TURBOCHARGED','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-a5-2012-waulfafh3cn001243-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','92208','WAULFAFH3CN001243','16.12.2022','2012','700','13','13','13','13','13','13')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0L DOHC TFSI 24-VALVE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-a6-2012-wauhgafcxcn175110-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','92153','WAUHGAFCXCN175110','16.12.2022','2012','5025','14','14','14','14','14','14')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0L SUPERCHARGED V6 DOHC','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-a7-2014-wau2gafc7en015615-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','99921','WAU2GAFC7EN015615','16.12.2022','2014','5300','15','15','15','15','15','15')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0 TFSI 6 CYLINDER 333 HP','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-a8-l-2017-wau44afd6hn018651-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Gray','1','WAU44AFD6HN018651','16.12.2022','2017','4375','16','16','16','16','16','16')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','2.0 TFSI 4-CYLINDER 16-VALVE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-q3-2022-wa1decf31n1057471-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Blue','1','WA1DECF31N1057471','16.12.2022','2022','2800','17','17','17','17','17','17')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','2.0L I4 FI DOHC 16V NF4','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-q5-2017-wa1c2afp1ha079180-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','1','WA1C2AFP1HA079180','16.12.2022','2017','3675','18','18','18','18','18','18')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','2.0L TFSI 4 CYLINDER DOHC','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-q7-2021-wa1ajaf74md025813-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','22057','WA1AJAF74MD025813','16.12.2022','2021','26675','19','19','19','19','19','19')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0L 6','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/audi-q8-premium-2019-wa1avaf18kd013077-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','21135','WA1AVAF18KD013077','15.12.2022','2019','41250','20','20','20','20','20','20')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Rear-Wheel Drive','2.0L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-320-i-2016-wba8e1g54gnt34988-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','133209','WBA8E1G54GNT34988','15.12.2022','2016','3500','21','21','21','21','21','21')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Rear-Wheel Drive','2.0L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-11/12/bmw-325-i-2014-wba3a5g50enp28238-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','80242','WBA3A5G50ENP28238','10.11.2022','2014','3750','22','22','22','22','22','22')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Rear-Wheel Drive','2.0L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-428-i-sule-2016-wba3v7c52g5a28734-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Blue','69453','WBA3V7C52G5A28734','15.12.2022','2016','8800','23','23','23','23','23','23')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Rear-Wheel Drive','3.0L 6','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-435-i-2015-wba3t3c59fp939609-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','54296','WBA3T3C59FP939609','15.12.2022','2015','8600','24','24','24','24','24','24')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Rear-Wheel Drive','2.0L 4 CYLINDER TURBO','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-530i-2019-wbaja5c53kwa57802-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','1','WBAJA5C53KWA57802','16.12.2022','2019','8175','25','25','25','25','25','25')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0L 6 CYLINDER TURBO','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-540i-xdrive-2017-wbaje7c3xhg479497-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','1','WBAJE7C3XHG479497','16.12.2022','2017','11325','26','26','26','26','26','26')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','2.0L TWINPOWER TURBO IN-LINE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-x3-2020-5uxty5c05llt34900-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Blue','35000','5UXTY5C05LLT34900','16.12.2022','2020','13475','27','27','27','27','27','27')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0L DOHC I-6 24V TWINPOWER','Other')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-x5-2021-5uxta6c04m9d83940-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Gray','1','5UXTA6C04M9D83940','16.12.2022','2021','21475','28','28','28','28','28','28')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','3.0L DOHC 24 VALVE INLINE 6','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('VALUES (https://bidfax.info/uploads/posts/2022-12/17/bmw-x6-2017-5uxku2c38h0x47967-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','1','5UXKU2C38H0X47967','16.12.2022','2017','14225','29','29','29','29','29','29')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','4.4L 8','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/bmw-x7-m50i-2022-5uxcx6c09n9m94657-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','775','5UXCX6C09N9M94657','15.12.2022','2022','73000','30','30','30','30','30','30')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','2.4L DOHC 4-CYLINDER SIDI','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-captiva-sport-fleet-2014-3gnal2ek0es511815-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','125453','3GNAL2EK0ES511815','14.12.2022','2014','725','31','31','31','31','31','31')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Rear Wheel Drive','6.2L 376 CI V8 DI 455 HP','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-camaro-2017-1g1fh1r70h0200888-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','66752','1G1FH1R70H0200888','16.12.2022','2017','10475','32','32','32','32','32','32')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','ECOTEC 2.2L CONTINUOUS','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-cobalt-2010-1g1ad5f52a7219827-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Silver','1','1G1AD5F52A7219827','16.12.2022','2010','500','33','33','33','33','33','33')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','4X4 Drive','3.7L DOHC 5-CYLINDER SFI 242','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-colorado-2010-1gcjtcde8a8110347-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','121965','1GCJTCDE8A8110347','16.12.2022','2010','1000','34','34','34','34','34','34')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','ECOTEC TURBO 1.4L VARIABLE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-cruze-2013-1g1pc5sb2d7129655-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Blue','208747','1G1PC5SB2D7129655','16.12.2022','2013','1150','35','35','35','35','35','35')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','All Wheel Drive','2.4L DOHC','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-equinox-2011-2cnflnecxb6292540-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Red','1','2CNFLNECXB6292540','16.12.2022','2011','675','36','36','36','36','36','36')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','ECOTEC 2.4L DOHC 4-CYLINDER','Other')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/18/chevrolet-malibu-2013-1g11f5rr3df110067-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','212532','1G11F5RR3DF110067','16.12.2022','2013','425','37','37','37','37','37','37')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','2.4L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/16/chevrolet-orlando-lt-2012-kl77p2em7ck574943-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Burgundy','230332','KL77P2EM7CK574943','13.12.2022','2012','550','38','38','38','38','38','38')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','4X4 Drive','5.3L ECOTEC3 V8 WITH ACTIVE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-tahoe-2020-1gnskbkc1lr307917-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','66575','1GNSKBKC1LR307917','16.12.2022','2020','22225','39','39','39','39','39','39')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','1.4L RANGE EXTENDER','Other')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/chevrolet-volt-2012-1g1rd6e47cu106770-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('White','78040','1G1RD6E47CU106770','16.12.2022','2012','3525','40','40','40','40','40','40')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','2.0L IVCT ATKINSON-CYCLE I-4','Other')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/ford-c-max-hybrid-2017-1fadp5au0hl111322-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Silver','1','1FADP5AU0HL111322','16.12.2022','2017','2850','41','41','41','41','41','41')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front Wheel Drive','2.0L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-09/04/ford-4-door-2012-1fahp3n25cl290609-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Silver','103959','1FAHP3N25CL290609','01.09.2022','2012','1300','42','42','42','42','42','42')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','4X4 Drive','2.5L I4 DURATEC ENGINE','Gasoline')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/18/ford-escape-2011-1fmcu9d74bkb29312-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Silver','108027','1FMCU9D74BKB29312','16.12.2022','2011','950','43','43','43','43','43','43')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','2.0L 4','Gas')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-06/24/ford-escort-2015-1fadp3f29el456579-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Black','12123','1FADP3F29EL456579','22.06.2022','2015','4550','44','44','44','44','44','44')

/**/

INSERT INTO Notes (Note)
VALUES ('Missing')

INSERT INTO Specs (Transmission, Drive, Engine, Fuel)
VALUES ('Automatic','Front-Wheel Drive','2.0L I-4 GDI TI-VCT FLEX FUEL','Other')

INSERT INTO Images (FilePath)
VALUES ('https://bidfax.info/uploads/posts/2022-12/17/ford-focus-2014-1fadp3f27el419143-img1.jpg')

INSERT INTO Lots (Color, Mileage, VIN, SaleDate, Age, Bid, ModelID, ImageID, ConditionsID, AuctionID, NoteID, SpecID)
VALUES ('Red','162603','1FADP3F27EL419143','16.12.2022','2014','550','45','45','45','45','45','45')

drop table Calculator
drop table EngineCapacities
drop table FuelTypes

create table Engines(
    ID int IDENTITY PRIMARY KEY  not null,
    Capacity int NOT NULL ,
    Fuel nvarchar(100) NOT NULL
)

create table Calculator(
       ID int IDENTITY PRIMARY KEY  not null,
       Age int not null,
       Coast int not null,
       EngineID int not null,
       Result int not null,
       FOREIGN KEY (EngineID) references Engines(ID)
)

UPDATE Models
SET BrandID = '1'
WHERE ID = '1'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '2'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '3'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '4'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '5'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '6'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '7'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '8'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '9'
/**/
UPDATE Models
SET BrandID = '1'
WHERE ID = '10'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '11'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '12'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '13'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '14'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '15'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '16'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '17'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '18'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '19'
/**/
UPDATE Models
SET BrandID = '2'
WHERE ID = '20'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '21'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '22'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '23'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '24'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '25'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '26'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '27'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '28'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '29'
/**/
UPDATE Models
SET BrandID = '3'
WHERE ID = '30'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '31'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '32'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '33'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '34'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '35'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '36'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '37'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '38'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '39'
/**/
UPDATE Models
SET BrandID = '4'
WHERE ID = '40'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '41'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '42'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '43'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '44'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '45'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '46'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '47'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '48'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '49'
/**/
UPDATE Models
SET BrandID = '5'
WHERE ID = '50'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '51'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '52'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '53'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '54'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '55'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '56'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '57'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '58'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '59'
/**/
UPDATE Models
SET BrandID = '6'
WHERE ID = '60'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '61'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '62'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '63'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '64'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '65'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '66'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '67'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '68'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '69'
/**/
UPDATE Models
SET BrandID = '7'
WHERE ID = '70'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '71'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '72'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '73'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '74'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '75'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '76'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '77'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '78'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '79'
/**/
UPDATE Models
SET BrandID = '8'
WHERE ID = '80'
/**/
UPDATE Models
SET BrandID = '9'
WHERE ID = '81'
UPDATE Models
SET BrandID = '9'
WHERE ID = '82'
UPDATE Models
SET BrandID = '9'
WHERE ID = '83'
UPDATE Models
SET BrandID = '9'
WHERE ID = '84'
UPDATE Models
SET BrandID = '9'
WHERE ID = '85'
UPDATE Models
SET BrandID = '9'
WHERE ID = '86'
UPDATE Models
SET BrandID = '9'
WHERE ID = '87'
UPDATE Models
SET BrandID = '9'
WHERE ID = '88'
UPDATE Models
SET BrandID = '9'
WHERE ID = '89'
UPDATE Models
SET BrandID = '9'
WHERE ID = '90'


