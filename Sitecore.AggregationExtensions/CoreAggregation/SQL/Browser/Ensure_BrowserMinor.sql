/****** Object:  StoredProcedure [dbo].[Ensure_SiteName]    Script Date: 8/28/2014 10:38:39 AM ******/
DROP PROCEDURE [dbo].[Ensure_BrowserMinor]
GO

/****** Object:  StoredProcedure [dbo].[Ensure_SiteName]    Script Date: 8/28/2014 10:38:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[Ensure_BrowserMinor]
  @BrowserMajorId INTEGER,
  @BrowserMinorId INTEGER,
  @BrowserMajorName NVARCHAR(50)
AS
BEGIN

  SET NOCOUNT ON;

  BEGIN TRY

    INSERT INTO [BrowserMinor]
    (
      [BrowserMajorId],
	  [BrowserMinorId],
      [BrowserMinorName]
    )
    VALUES
    (
      @BrowserMajorId,
      @BrowserMinorId,
      @BrowserMajorName
    );

  END TRY
  BEGIN CATCH

    IF( @@ERROR != 2627 )
    BEGIN

      DECLARE @error_number INTEGER = ERROR_NUMBER();
      DECLARE @error_severity INTEGER = ERROR_SEVERITY();
      DECLARE @error_state INTEGER = ERROR_STATE();
      DECLARE @error_message NVARCHAR(4000) = ERROR_MESSAGE();
      DECLARE @error_procedure SYSNAME = ERROR_PROCEDURE();
      DECLARE @error_line INTEGER = ERROR_LINE();

      RAISERROR( N'T-SQL ERROR %d, SEVERITY %d, STATE %d, PROCEDURE %s, LINE %d, MESSAGE: %s', @error_severity, 1, @error_number, @error_severity, @error_state, @error_procedure, @error_line, @error_message ) WITH NOWAIT;

    END

  END CATCH

END;
GO


