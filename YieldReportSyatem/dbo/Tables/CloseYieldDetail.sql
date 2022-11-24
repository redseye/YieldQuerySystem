CREATE TABLE [dbo].[CloseYieldDetail] (
    [Seq]       INT          IDENTITY (1, 1) NOT NULL,
    [LotNo]     VARCHAR (6)  NOT NULL,
    [YearCode]  VARCHAR (2)  NOT NULL,
    [SubLotNo]  VARCHAR (10) NOT NULL,
    [StageCode] VARCHAR (5)  NOT NULL,
    [LossCode]  VARCHAR (3)  NOT NULL,
    [LossQty]   INT          NOT NULL,
    [TranDT]    VARCHAR (15) NOT NULL,
    [OP]        VARCHAR (10) NOT NULL,
    [MachID]    VARCHAR (10) NOT NULL,
    [Cust]      VARCHAR (2)  NOT NULL,
    [Pkg]       VARCHAR (4)  NOT NULL,
    [LC]        INT          NOT NULL,
    [Device]    VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_CloseYieldDetail] PRIMARY KEY CLUSTERED ([YearCode] ASC, [SubLotNo] ASC, [StageCode] ASC, [LossCode] ASC)
);

