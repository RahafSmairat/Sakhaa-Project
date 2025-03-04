create table Users (
    Id int primary key identity(1,1),
    FirstName varchar(100) not null,
    LastName varchar(100) not null,
    Email varchar(255) unique not null,
    PhoneNumber varchar(20) null,
    Country varchar(100) not null,
    Password varchar(255) not null,
    CreatedAt datetime
);

create table DonationPrograms (
    Id int primary key identity(1,1),
    Name varchar(100) not null unique,
    Description text not null,
    MinimumDonationAmount decimal(10,2) not null
);

create table Donations (
    Id int primary key identity(1,1),
    UserId int not null,
    ProgramId int not null,
    Amount decimal(10,2) not null,
    DonationDate datetime,
    ImpactDescription text null,
    foreign key (UserId) references Users(Id),
    foreign key (ProgramId) references DonationPrograms(Id)
);

create table Subscriptions (
    Id int primary key identity(1,1),
    UserId int not null,
    ProgramId int not null,
    StartDate date not null,
    EndDate date not null,
    Status varchar(50),
    foreign key (UserId) references Users(Id),
    foreign key (ProgramId) references DonationPrograms(Id)
);

create table DonationReports (
    Id int primary key identity(1,1),
    UserId int not null,
    SubscriptionId int null,
    DonationId int null,
    ReportDate datetime,
    ReportType varchar(50),
    Amount decimal(10,2) null,
    ImpactDescription text null,
    foreign key (UserId) references Users(Id),
    foreign key (SubscriptionId) references Subscriptions(Id),
    foreign key (DonationId) references Donations(Id)
);

create table PublicReports (
    Id int primary key identity(1,1),
    ReportYear int not null,
    ReportContent text not null,
    CreatedAt datetime
);

create table SuccessStories (
    Id int primary key identity(1,1),
    Title varchar(255) not null,
    Content text not null,
    CreatedAt datetime
);

create table NewsEvents (
    Id int primary key identity(1,1),
    Title varchar(255) not null,
    Content text not null,
    EventDate datetime not null,
    CreatedAt datetime
);

create table CorporatePartnerships (
    Id int primary key identity(1,1),
    CompanyName varchar(255) not null,
    LogoUrl varchar(255) null,
    PartnershipDate datetime
);

create table BeneficiaryFeedback (
    Id int primary key identity(1,1),
    BeneficiaryName varchar(255) not null,
    Feedback text not null,
    CreatedAt datetime
);

create table ContactMessages (
    Id int primary key identity(1,1),
    FullName varchar(255) not null,
    Email varchar(255) not null,
    Subject varchar(255) not null,
    Message text not null,
    CreatedAt datetime
);

create table GiftDonations (
    Id int primary key identity(1,1),
    GiverName varchar(255) not null,
    GiverEmail varchar(255) not null,
    GiverPhone varchar(20) null,
    ReceiverName varchar(255) not null,
    ReceiverEmail varchar(255) not null,
    ReceiverPhone varchar(20) null,
    DonationType varchar(100) not null,
    Amount decimal(10,2) not null,
    IncludeReport bit not null,
    ShowAmount bit not null,
    PersonalMessage text null,
    CreatedAt datetime
);

create table BeneficiaryApplications (
    Id int primary key identity(1,1),
    FullName varchar(255) not null,
    FamilyBookUrl varchar(255) not null,
    AidVerificationDocument varchar(255) not null,
    InsuranceStatusDocument varchar(255) not null,
    PhoneNumber varchar(20) not null
);

create table Payments (
    Id int primary key identity(1,1),
    UserId int not null,
    DonationId int null,  
    SubscriptionId int null, 
    GiftDonationId int null, 
    PaymentMethod varchar(50),
    TransactionId varchar(255) unique null, 
    Amount decimal(10,2) not null,
    Status varchar(50),
    PaymentDate datetime,
    foreign key (UserId) references Users(Id),
    foreign key (DonationId) references Donations(Id),
    foreign key (SubscriptionId) references Subscriptions(Id),
    foreign key (GiftDonationId) references GiftDonations(Id)
);
