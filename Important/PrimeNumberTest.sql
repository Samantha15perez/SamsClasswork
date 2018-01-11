declare @counter INT = 1
WHILE @counter !> 10000
BEGIN
IF @Counter IN (1, 3, 5, 7) 
BEGIN
PRINT @counter 
SET @counter = @Counter + 1 
END
ELSE BEGIN 
IF (@Counter % 2)= 0
Set @counter = @counter + 1 
ELSE BEGIN
	IF (@Counter % 3)= 0
	Set @counter = @counter + 1
	ELSE BEGIN
		IF (@Counter % 4)= 0
		Set @counter = @counter + 1
		ELSE BEGIN
			IF (@Counter % 5)= 0
			Set @counter = @counter + 1
			ELSE BEGIN
				IF (@Counter % 6)= 0
				Set @counter = @counter + 1
				ELSE BEGIN
					IF (@Counter % 7)= 0
					Set @counter = @counter + 1
					ELSE BEGIN
						IF (@Counter % 8)= 0
						Set @counter = @counter + 1
						ELSE BEGIN 
							IF (@Counter % 9)= 0
								Set @counter = @counter + 1
								ELSE PRINT @Counter
								SET @Counter = @counter + 1
								END
							END
						END
					END
				END
			END
		END
	END
END
	
