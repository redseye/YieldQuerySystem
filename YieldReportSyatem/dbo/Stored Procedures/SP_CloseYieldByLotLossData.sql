-- =============================================
-- Author:		<George Lin>
-- Create date: <2022/12/07>
-- Description:	<SP_CloseYieldByLotLossData>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CloseYieldByLotLossData]
	-- Add the parameters for the stored procedure here
	(
	@Plant varchar(5),
	@Cust2Code varchar(2),
	@PKGCode varchar(4),
	@StageCode varchar(4),
	@DeviceName varchar(50),
	@StartTime datetime,
	@EndTime datetime,
	@StartYearCode varchar(2) ='',
	@EndYearCode varchar(2) =''
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

select *
into #temp
from
		(
		select cy.fac,cy.cust,cy.Pkg,cy.Device,cy.LotNo,cy.YearCode,cy.QtyIssue,QtyOut,OverAllYield,(QtyIssue-QtyOut) as LossQTY,
		Convert(datetime,substring(cy.CloseDT,0,5)+'-'+substring(cy.CloseDT,5,2)+'-'+substring(cy.CloseDT,7,2)+' '+substring(cy.CloseDT,10,2)+':'+substring(cy.CloseDT,12,2)+':'+substring(cy.CloseDT,14,2)) as CloseDT
		from dbo.CloseYield as cy
		) as subcy
where ( ( (@StartYearCode != '' or @EndYearCode != '') and (subcy.YearCode= @StartYearCode or subcy.YearCode=@EndYearCode ) ) or CloseDT between @StartTime and DATEADD(DAY, 1, @EndTime) )
	and (subcy.Fac = @Plant or @Plant is null)
	and (subcy.Cust = @Cust2Code or @Cust2Code  is null)
	and (subcy.Pkg = @PKGCode or @PKGCode is null)
	--and (dy.StageCode = @StageCode or @StageCode is null)
	and (subcy.Device = @DeviceName or @DeviceName is null)
order by subcy.CloseDT 


select #temp.LotNo,#temp.YearCode,#temp.LossQTY as LossQty,cyd.StageCode,cyd.LossCode,lc.LossDesc,cyd.LossQty as UniLossQty
from #temp
left join dbo.CloseYieldDetail as cyd on #temp.LotNo=cyd.LotNo and #temp.YearCode=cyd.YearCode
left join dbo.LossCode as lc on cyd.LossCode = lc.LossCode

drop table #temp

END