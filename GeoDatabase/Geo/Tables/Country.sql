CREATE TABLE [Geo].[Country] (
    [IsoCode]     CHAR (2)          NOT NULL,
    [Name]        VARCHAR (200)     NOT NULL,
    [Position]    [sys].[geography] NOT NULL,
    PRIMARY KEY CLUSTERED ([IsoCode] ASC)
);


GO
CREATE SPATIAL INDEX [SPATIAL_Country_Position]
ON [Geo].[Country] ([Position])
USING GEOGRAPHY_GRID
WITH  (
        GRIDS = (LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM)
        );