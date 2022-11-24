CREATE TABLE [dbo].[CloseYield] (
    [Seq]            INT          IDENTITY (1, 1) NOT NULL,
    [Fac]            VARCHAR (6)  NOT NULL,
    [Cust]           VARCHAR (2)  NOT NULL,
    [Pkg]            VARCHAR (4)  NOT NULL,
    [LC]             INT          NOT NULL,
    [Device]         VARCHAR (50) NOT NULL,
    [LotNo]          VARCHAR (6)  NOT NULL,
    [YearCode]       VARCHAR (2)  NOT NULL,
    [QtyIssue]       INT          NOT NULL,
    [QtyAssyLoss]    INT          NOT NULL,
    [QtyAssyIn]      INT          NOT NULL,
    [QtyNonAssyLoss] INT          NOT NULL,
    [DieDiscrepency] INT          NOT NULL,
    [QtyOut]         INT          NOT NULL,
    [OverAllYield]   VARCHAR (8)  NOT NULL,
    [AssyYield]      VARCHAR (8)  NOT NULL,
    [CloseDT]        VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_CloseYield] PRIMARY KEY CLUSTERED ([LotNo] ASC, [YearCode] ASC)
);

