CREATE PROCEDURE [Geo].[LocationByIpRange]
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON;
BEGIN

	SELECT StartIp
		, EndIp
		, GeoSpatial.Lat AS [Latitude]
		, GeoSpatial.Long AS [Longitude]
		, City  + ', ' + Region + ', ' + COALESCE([country].[Name], [location].[Country]) AS [Location]
	FROM [Geo].[LocationIpBlocks] [block] WITH(NOLOCK)
		INNER JOIN [Geo].[Location] [location] WITH(NOLOCK)
			ON [block].[LocationId] = [location].[LocationId]
		LEFT OUTER JOIN [Geo].[Country] [country] WITH(NOLOCK)
			ON [location].[Country] = [country].[IsoCode]
	ORDER BY [StartIp], [EndIp]

END