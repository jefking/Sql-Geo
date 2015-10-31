CREATE TABLE [Geo].[Location] (
    [LocationId] INT               NOT NULL,
    [Country]    CHAR (2)          NOT NULL,
    [Region]     CHAR (2)          NULL,
    [City]       NVARCHAR (50)     NULL,
    [PostalCode] NVARCHAR (10)     NULL,
    [MetroCode]  NVARCHAR (10)     NULL,
    [AreaCode]   NVARCHAR (5)      NULL,
    [GeoSpatial] [sys].[geography] NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([LocationId] ASC)
);

GO
CREATE SPATIAL INDEX [SPATIAL_Geo_Location_GeoSpatial]
ON [Geo].[Location] ([GeoSpatial])
USING GEOGRAPHY_GRID
WITH  (
        GRIDS = (LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM)
        );