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
);

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
    FilePath nvarchar(100) not null
);

create table Lots(
    ID int not null,
    Color nvarchar(100) not null,
    Mileage int not null,
    VIN nvarchar(100) not null,
    SaleDate date not null,
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
    AegAuto date not null,
    Coast float not null,
    EngineCapacityID int,
    FuelTypeID int,
    FOREIGN KEY (EngineCapacityID) REFERENCES EngineCapacities (ID) ON DELETE CASCADE,
    FOREIGN KEY (FuelTypeID) REFERENCES FuelTypes (ID) ON DELETE CASCADE,
);





