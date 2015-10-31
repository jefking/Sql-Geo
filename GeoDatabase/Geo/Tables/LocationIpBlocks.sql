CREATE TABLE [Geo].[LocationIpBlocks] (
    [LocationId] INT    NOT NULL,
    [StartIp]    BIGINT NOT NULL,
    [EndIp]      BIGINT NOT NULL,
    CONSTRAINT [PK_LocationIpBlocks] PRIMARY KEY CLUSTERED ([LocationId] ASC, [EndIp] ASC, [StartIp] ASC),
    CONSTRAINT [FK_Geo_LocationIpBlocks_Geo_Location] FOREIGN KEY ([LocationId]) REFERENCES [Geo].[Location] ([LocationId])
);


GO
CREATE NONCLUSTERED INDEX [IX_Geo_LocationIpBlocks_EndIp]
    ON [Geo].[LocationIpBlocks]([EndIp] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Geo_LocationIpBlocks_StartIp]
    ON [Geo].[LocationIpBlocks]([StartIp] ASC);

