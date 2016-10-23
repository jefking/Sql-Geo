CREATE TABLE [Geo].[City] (
    [GeoNameId] BIGINT            NOT NULL,
    [Name]      VARCHAR (200)     NOT NULL,
    [Position]  [sys].[geography] NOT NULL,
    PRIMARY KEY CLUSTERED ([GeoNameId] ASC)
);


GO
CREATE SPATIAL INDEX [SPATIAL_City_Position]
ON [Geo].[City] ([Position])
USING GEOGRAPHY_GRID
WITH  (
        GRIDS = (LEVEL_1 = MEDIUM, LEVEL_2 = MEDIUM, LEVEL_3 = MEDIUM, LEVEL_4 = MEDIUM)
        );