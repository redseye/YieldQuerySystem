CREATE TABLE [dbo].[DailyYieldDetail] (
    [Guid]       VARCHAR (64)  NOT NULL,
    [DefectName] VARCHAR (100) NOT NULL,
    [DefectQty]  INT           NOT NULL,
    CONSTRAINT [PK_DailyYieldDetail] PRIMARY KEY CLUSTERED ([Guid] ASC, [DefectName] ASC)
);



