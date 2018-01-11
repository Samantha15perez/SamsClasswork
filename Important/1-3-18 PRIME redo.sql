DECLARE @TestValue INT = 64
declare @counter2 INT = 2
declare @counter INT = 1
WHILE @counter !> @Testvalue
	BEGIN
	IF @Counter IN (1, 3, 5, 7) 
		BEGIN
		PRINT @counter 
		SET @counter = @Counter + 1 
		END
ELSE		BEGIN 

			WHILE @counter2 !> sqrt(@testvalue)
				BEGIN
				if (@counter % @counter2) = 0
				set @counter2 = @Counter2 + 1
				END
			PRINT @counter2
			SET @counter2 = @Counter2 + 1
			END
	END
