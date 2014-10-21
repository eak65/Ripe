
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/07/2014 22:52:17
-- Generated from EDMX file: C:\Users\Ethan\Documents\Visual Studio 2013\Projects\Ripe\Ripe\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ripeit];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_MenuSectionFoodItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[FoodItems] DROP CONSTRAINT [FK_MenuSectionFoodItem];
GO
IF OBJECT_ID(N'[dbo].[FK_FoodItemRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_FoodItemRating];
GO
IF OBJECT_ID(N'[dbo].[FK_UserRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_UserRating];
GO
IF OBJECT_ID(N'[dbo].[FK_PhotoUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Photos] DROP CONSTRAINT [FK_PhotoUser];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantDessert]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Desserts] DROP CONSTRAINT [FK_RestaurantDessert];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantOther]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Other] DROP CONSTRAINT [FK_RestaurantOther];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantSoupSalad]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SoupSalads] DROP CONSTRAINT [FK_RestaurantSoupSalad];
GO
IF OBJECT_ID(N'[dbo].[FK_DrinkRestaurant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Drinks] DROP CONSTRAINT [FK_DrinkRestaurant];
GO
IF OBJECT_ID(N'[dbo].[FK_EntreeRestaurant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entrees] DROP CONSTRAINT [FK_EntreeRestaurant];
GO
IF OBJECT_ID(N'[dbo].[FK_DessertMenuSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_DessertMenuSection];
GO
IF OBJECT_ID(N'[dbo].[FK_DrinkMenuSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_DrinkMenuSection];
GO
IF OBJECT_ID(N'[dbo].[FK_SoupSaladMenuSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_SoupSaladMenuSection];
GO
IF OBJECT_ID(N'[dbo].[FK_AppetizerMenuSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_AppetizerMenuSection];
GO
IF OBJECT_ID(N'[dbo].[FK_OtherMenuSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_OtherMenuSection];
GO
IF OBJECT_ID(N'[dbo].[FK_FoodItemPhoto]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Photos] DROP CONSTRAINT [FK_FoodItemPhoto];
GO
IF OBJECT_ID(N'[dbo].[FK_EntreeMenuSection]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_EntreeMenuSection];
GO
IF OBJECT_ID(N'[dbo].[FK_AppetizerRestaurant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Appetizers] DROP CONSTRAINT [FK_AppetizerRestaurant];
GO
IF OBJECT_ID(N'[dbo].[FK_MenuSectionSpecial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_MenuSectionSpecial];
GO
IF OBJECT_ID(N'[dbo].[FK_MenuSectionBreakfast]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_MenuSectionBreakfast];
GO
IF OBJECT_ID(N'[dbo].[FK_MenuSectionSide]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_MenuSectionSide];
GO
IF OBJECT_ID(N'[dbo].[FK_MenuSectionSauce]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MenuSections] DROP CONSTRAINT [FK_MenuSectionSauce];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantSpecial]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Specials] DROP CONSTRAINT [FK_RestaurantSpecial];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantBreakfast]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Breakfasts] DROP CONSTRAINT [FK_RestaurantBreakfast];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantSide]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sides] DROP CONSTRAINT [FK_RestaurantSide];
GO
IF OBJECT_ID(N'[dbo].[FK_RestaurantSauce]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Sauces] DROP CONSTRAINT [FK_RestaurantSauce];
GO
IF OBJECT_ID(N'[dbo].[FK_ProfileImageUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProfileImages] DROP CONSTRAINT [FK_ProfileImageUser];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Appetizers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Appetizers];
GO
IF OBJECT_ID(N'[dbo].[Restaurants]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Restaurants];
GO
IF OBJECT_ID(N'[dbo].[MenuSections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MenuSections];
GO
IF OBJECT_ID(N'[dbo].[FoodItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[FoodItems];
GO
IF OBJECT_ID(N'[dbo].[Ratings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ratings];
GO
IF OBJECT_ID(N'[dbo].[Photos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Photos];
GO
IF OBJECT_ID(N'[dbo].[Entrees]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entrees];
GO
IF OBJECT_ID(N'[dbo].[SoupSalads]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SoupSalads];
GO
IF OBJECT_ID(N'[dbo].[Other]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Other];
GO
IF OBJECT_ID(N'[dbo].[Drinks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Drinks];
GO
IF OBJECT_ID(N'[dbo].[Desserts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Desserts];
GO
IF OBJECT_ID(N'[dbo].[Sides]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sides];
GO
IF OBJECT_ID(N'[dbo].[Breakfasts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Breakfasts];
GO
IF OBJECT_ID(N'[dbo].[Sauces]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sauces];
GO
IF OBJECT_ID(N'[dbo].[Specials]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Specials];
GO
IF OBJECT_ID(N'[dbo].[ProfileImages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProfileImages];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Sex] nvarchar(max)  NOT NULL,
    [Location] geography  NOT NULL
);
GO

-- Creating table 'Appetizers'
CREATE TABLE [dbo].[Appetizers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Restaurants'
CREATE TABLE [dbo].[Restaurants] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [StreetAddress] nvarchar(max)  NOT NULL,
    [LocuId] nvarchar(max)  NOT NULL,
    [WebsiteURL] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [lon] nvarchar(max)  NOT NULL,
    [lat] nvarchar(max)  NOT NULL,
    [region] nvarchar(max)  NOT NULL,
    [zip] nvarchar(max)  NOT NULL,
    [googleId] nvarchar(max)  NULL
);
GO

-- Creating table 'MenuSections'
CREATE TABLE [dbo].[MenuSections] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DessertId] int  NULL,
    [DrinkId] int  NULL,
    [SectionName] nvarchar(max)  NOT NULL,
    [SoupSaladId] int  NULL,
    [AppetizerId] int  NULL,
    [OtherId] int  NULL,
    [EntreeId] int  NULL,
    [Entity1Id] int  NOT NULL,
    [SpecialId] int  NULL,
    [BreakfastId] int  NULL,
    [SideId] int  NULL,
    [SauceId] int  NULL
);
GO

-- Creating table 'FoodItems'
CREATE TABLE [dbo].[FoodItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [MenuSectionId] int  NOT NULL,
    [Name] nvarchar(max)  NULL,
    [Price] nvarchar(max)  NULL,
    [Type] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Score] int  NOT NULL,
    [Review] nvarchar(max)  NULL,
    [FoodItemId] int  NOT NULL,
    [UserUserId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [RestaurantName] nvarchar(max)  NOT NULL,
    [RestaurantId] int  NOT NULL
);
GO

-- Creating table 'Photos'
CREATE TABLE [dbo].[Photos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [URI] nvarchar(max)  NOT NULL,
    [FoodItemId] int  NOT NULL,
    [Date] datetime  NOT NULL,
    [RestaurantName] nvarchar(max)  NOT NULL,
    [FoodName] nvarchar(max)  NOT NULL,
    [RestaurantId] int  NOT NULL,
    [User_UserId] int  NOT NULL
);
GO

-- Creating table 'Entrees'
CREATE TABLE [dbo].[Entrees] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'SoupSalads'
CREATE TABLE [dbo].[SoupSalads] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Other'
CREATE TABLE [dbo].[Other] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Drinks'
CREATE TABLE [dbo].[Drinks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Desserts'
CREATE TABLE [dbo].[Desserts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Sides'
CREATE TABLE [dbo].[Sides] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Breakfasts'
CREATE TABLE [dbo].[Breakfasts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Sauces'
CREATE TABLE [dbo].[Sauces] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'Specials'
CREATE TABLE [dbo].[Specials] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Restaurant_Id] int  NOT NULL
);
GO

-- Creating table 'ProfileImages'
CREATE TABLE [dbo].[ProfileImages] (
    [ProfileImageId] int IDENTITY(1,1) NOT NULL,
    [URI] nvarchar(max)  NOT NULL,
    [User_UserId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [Id] in table 'Appetizers'
ALTER TABLE [dbo].[Appetizers]
ADD CONSTRAINT [PK_Appetizers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Restaurants'
ALTER TABLE [dbo].[Restaurants]
ADD CONSTRAINT [PK_Restaurants]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [PK_MenuSections]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'FoodItems'
ALTER TABLE [dbo].[FoodItems]
ADD CONSTRAINT [PK_FoodItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [PK_Photos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entrees'
ALTER TABLE [dbo].[Entrees]
ADD CONSTRAINT [PK_Entrees]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SoupSalads'
ALTER TABLE [dbo].[SoupSalads]
ADD CONSTRAINT [PK_SoupSalads]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Other'
ALTER TABLE [dbo].[Other]
ADD CONSTRAINT [PK_Other]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Drinks'
ALTER TABLE [dbo].[Drinks]
ADD CONSTRAINT [PK_Drinks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Desserts'
ALTER TABLE [dbo].[Desserts]
ADD CONSTRAINT [PK_Desserts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sides'
ALTER TABLE [dbo].[Sides]
ADD CONSTRAINT [PK_Sides]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Breakfasts'
ALTER TABLE [dbo].[Breakfasts]
ADD CONSTRAINT [PK_Breakfasts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Sauces'
ALTER TABLE [dbo].[Sauces]
ADD CONSTRAINT [PK_Sauces]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Specials'
ALTER TABLE [dbo].[Specials]
ADD CONSTRAINT [PK_Specials]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ProfileImageId] in table 'ProfileImages'
ALTER TABLE [dbo].[ProfileImages]
ADD CONSTRAINT [PK_ProfileImages]
    PRIMARY KEY CLUSTERED ([ProfileImageId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MenuSectionId] in table 'FoodItems'
ALTER TABLE [dbo].[FoodItems]
ADD CONSTRAINT [FK_MenuSectionFoodItem]
    FOREIGN KEY ([MenuSectionId])
    REFERENCES [dbo].[MenuSections]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuSectionFoodItem'
CREATE INDEX [IX_FK_MenuSectionFoodItem]
ON [dbo].[FoodItems]
    ([MenuSectionId]);
GO

-- Creating foreign key on [FoodItemId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_FoodItemRating]
    FOREIGN KEY ([FoodItemId])
    REFERENCES [dbo].[FoodItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FoodItemRating'
CREATE INDEX [IX_FK_FoodItemRating]
ON [dbo].[Ratings]
    ([FoodItemId]);
GO

-- Creating foreign key on [UserUserId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_UserRating]
    FOREIGN KEY ([UserUserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_UserRating'
CREATE INDEX [IX_FK_UserRating]
ON [dbo].[Ratings]
    ([UserUserId]);
GO

-- Creating foreign key on [User_UserId] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [FK_PhotoUser]
    FOREIGN KEY ([User_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PhotoUser'
CREATE INDEX [IX_FK_PhotoUser]
ON [dbo].[Photos]
    ([User_UserId]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Desserts'
ALTER TABLE [dbo].[Desserts]
ADD CONSTRAINT [FK_RestaurantDessert]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantDessert'
CREATE INDEX [IX_FK_RestaurantDessert]
ON [dbo].[Desserts]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Other'
ALTER TABLE [dbo].[Other]
ADD CONSTRAINT [FK_RestaurantOther]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantOther'
CREATE INDEX [IX_FK_RestaurantOther]
ON [dbo].[Other]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'SoupSalads'
ALTER TABLE [dbo].[SoupSalads]
ADD CONSTRAINT [FK_RestaurantSoupSalad]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantSoupSalad'
CREATE INDEX [IX_FK_RestaurantSoupSalad]
ON [dbo].[SoupSalads]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Drinks'
ALTER TABLE [dbo].[Drinks]
ADD CONSTRAINT [FK_DrinkRestaurant]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DrinkRestaurant'
CREATE INDEX [IX_FK_DrinkRestaurant]
ON [dbo].[Drinks]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Entrees'
ALTER TABLE [dbo].[Entrees]
ADD CONSTRAINT [FK_EntreeRestaurant]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EntreeRestaurant'
CREATE INDEX [IX_FK_EntreeRestaurant]
ON [dbo].[Entrees]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [DessertId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_DessertMenuSection]
    FOREIGN KEY ([DessertId])
    REFERENCES [dbo].[Desserts]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DessertMenuSection'
CREATE INDEX [IX_FK_DessertMenuSection]
ON [dbo].[MenuSections]
    ([DessertId]);
GO

-- Creating foreign key on [DrinkId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_DrinkMenuSection]
    FOREIGN KEY ([DrinkId])
    REFERENCES [dbo].[Drinks]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_DrinkMenuSection'
CREATE INDEX [IX_FK_DrinkMenuSection]
ON [dbo].[MenuSections]
    ([DrinkId]);
GO

-- Creating foreign key on [SoupSaladId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_SoupSaladMenuSection]
    FOREIGN KEY ([SoupSaladId])
    REFERENCES [dbo].[SoupSalads]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_SoupSaladMenuSection'
CREATE INDEX [IX_FK_SoupSaladMenuSection]
ON [dbo].[MenuSections]
    ([SoupSaladId]);
GO

-- Creating foreign key on [AppetizerId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_AppetizerMenuSection]
    FOREIGN KEY ([AppetizerId])
    REFERENCES [dbo].[Appetizers]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AppetizerMenuSection'
CREATE INDEX [IX_FK_AppetizerMenuSection]
ON [dbo].[MenuSections]
    ([AppetizerId]);
GO

-- Creating foreign key on [OtherId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_OtherMenuSection]
    FOREIGN KEY ([OtherId])
    REFERENCES [dbo].[Other]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_OtherMenuSection'
CREATE INDEX [IX_FK_OtherMenuSection]
ON [dbo].[MenuSections]
    ([OtherId]);
GO

-- Creating foreign key on [FoodItemId] in table 'Photos'
ALTER TABLE [dbo].[Photos]
ADD CONSTRAINT [FK_FoodItemPhoto]
    FOREIGN KEY ([FoodItemId])
    REFERENCES [dbo].[FoodItems]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_FoodItemPhoto'
CREATE INDEX [IX_FK_FoodItemPhoto]
ON [dbo].[Photos]
    ([FoodItemId]);
GO

-- Creating foreign key on [EntreeId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_EntreeMenuSection]
    FOREIGN KEY ([EntreeId])
    REFERENCES [dbo].[Entrees]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_EntreeMenuSection'
CREATE INDEX [IX_FK_EntreeMenuSection]
ON [dbo].[MenuSections]
    ([EntreeId]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Appetizers'
ALTER TABLE [dbo].[Appetizers]
ADD CONSTRAINT [FK_AppetizerRestaurant]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AppetizerRestaurant'
CREATE INDEX [IX_FK_AppetizerRestaurant]
ON [dbo].[Appetizers]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [SpecialId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_MenuSectionSpecial]
    FOREIGN KEY ([SpecialId])
    REFERENCES [dbo].[Specials]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuSectionSpecial'
CREATE INDEX [IX_FK_MenuSectionSpecial]
ON [dbo].[MenuSections]
    ([SpecialId]);
GO

-- Creating foreign key on [BreakfastId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_MenuSectionBreakfast]
    FOREIGN KEY ([BreakfastId])
    REFERENCES [dbo].[Breakfasts]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuSectionBreakfast'
CREATE INDEX [IX_FK_MenuSectionBreakfast]
ON [dbo].[MenuSections]
    ([BreakfastId]);
GO

-- Creating foreign key on [SideId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_MenuSectionSide]
    FOREIGN KEY ([SideId])
    REFERENCES [dbo].[Sides]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuSectionSide'
CREATE INDEX [IX_FK_MenuSectionSide]
ON [dbo].[MenuSections]
    ([SideId]);
GO

-- Creating foreign key on [SauceId] in table 'MenuSections'
ALTER TABLE [dbo].[MenuSections]
ADD CONSTRAINT [FK_MenuSectionSauce]
    FOREIGN KEY ([SauceId])
    REFERENCES [dbo].[Sauces]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MenuSectionSauce'
CREATE INDEX [IX_FK_MenuSectionSauce]
ON [dbo].[MenuSections]
    ([SauceId]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Specials'
ALTER TABLE [dbo].[Specials]
ADD CONSTRAINT [FK_RestaurantSpecial]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantSpecial'
CREATE INDEX [IX_FK_RestaurantSpecial]
ON [dbo].[Specials]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Breakfasts'
ALTER TABLE [dbo].[Breakfasts]
ADD CONSTRAINT [FK_RestaurantBreakfast]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantBreakfast'
CREATE INDEX [IX_FK_RestaurantBreakfast]
ON [dbo].[Breakfasts]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Sides'
ALTER TABLE [dbo].[Sides]
ADD CONSTRAINT [FK_RestaurantSide]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantSide'
CREATE INDEX [IX_FK_RestaurantSide]
ON [dbo].[Sides]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [Restaurant_Id] in table 'Sauces'
ALTER TABLE [dbo].[Sauces]
ADD CONSTRAINT [FK_RestaurantSauce]
    FOREIGN KEY ([Restaurant_Id])
    REFERENCES [dbo].[Restaurants]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_RestaurantSauce'
CREATE INDEX [IX_FK_RestaurantSauce]
ON [dbo].[Sauces]
    ([Restaurant_Id]);
GO

-- Creating foreign key on [User_UserId] in table 'ProfileImages'
ALTER TABLE [dbo].[ProfileImages]
ADD CONSTRAINT [FK_ProfileImageUser]
    FOREIGN KEY ([User_UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_ProfileImageUser'
CREATE INDEX [IX_FK_ProfileImageUser]
ON [dbo].[ProfileImages]
    ([User_UserId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------