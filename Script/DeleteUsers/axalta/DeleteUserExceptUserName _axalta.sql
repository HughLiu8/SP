
declare @Users table (UserId uniqueidentifier NOT NULL)
declare @UserId uniqueidentifier

insert @Users (UserId)
Select  UserId
from aspnet_Users
where  UserName like 'axalta_%' and (UserName not in 
('axalta_System', 'axalta_MosaicDemo', 'axalta_mosaic'))

DECLARE myCursor CURSOR LOCAL FAST_FORWARD FOR
    SELECT UserId
    FROM @Users
OPEN myCursor
FETCH NEXT FROM myCursor INTO @UserId
WHILE @@FETCH_STATUS = 0 BEGIN
    /*PRINT 'Delete user:' + @UserId*/

	DELETE FROM aspnet_Membership where UserId = @UserId
	DELETE FROM aspnet_Users where UserId = @UserId
	

    FETCH NEXT FROM myCursor INTO @UserId

END

CLOSE myCursor
DEALLOCATE myCursor