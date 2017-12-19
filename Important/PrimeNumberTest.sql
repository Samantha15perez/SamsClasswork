declare @counter INT = 1
WHILE @counter !> 87
BEGIN
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
								END
							END
						END
					END
				END
			END
		END
		SET @Counter = @counter + 1
	END

