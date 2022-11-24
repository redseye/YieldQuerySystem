-- =============================================
-- Author:		<Ivy>
-- Create date: <2022/07/21>
-- Description:	<Daily Yield by Stage Data>
-- =============================================
CREATE PROCEDURE [dbo].[SP_DailyYieldByStage]
	-- Add the parameters for the stored procedure here
	(
	@Plant varchar(5),
	@Cust2Code varchar(2),
	@Cust3Code varchar(3),
	@PKGCode varchar(4),
	@StageCode varchar(4),
	@DeviceName varchar(50),
	@StartTime datetime,
	@EndTime datetime
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;




	SELECT StageCode,sum(TrackInQty) as InQty, sum(TrackOutQty) as OutQty,sum(TrackInQty)-sum(TrackOutQty) as DefectQty,Convert(varchar,CONVERT(decimal(18,4),sum(TrackOutQty)*1.0/sum(TrackInQty)*100))+ '%' as Yield,CONVERT(varchar(100),TrackOutTime,111) as OutTime  
FROM DailyYield as dy
where TrackOutTime between @StartTime and DATEADD(DAY, 1, @EndTime)
	and (dy.Plant = @Plant or @Plant is null)
	and (dy.Cust2Code = @Cust2Code or @Cust2Code  is null)
	and (dy.Cust3Code = @Cust3Code or @Cust3Code is null)
	and (dy.PKGCode = @PKGCode or @PKGCode is null)
	and (dy.StageCode = @StageCode or @StageCode is null)
	and (dy.Device = @DeviceName or @DeviceName is null)

group by StageCode,CONVERT(varchar(100),TrackOutTime,111)
order by OutTime

END