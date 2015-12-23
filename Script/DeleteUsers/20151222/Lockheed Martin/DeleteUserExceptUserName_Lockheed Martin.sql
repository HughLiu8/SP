
declare @Users table (UserId uniqueidentifier NOT NULL)
declare @UserId uniqueidentifier

insert @Users (UserId)
Select  UserId
from aspnet_Users
where  UserName like 'LockheedMartin_%' and (UserName not in 
('LockheedMartin_LDS', 'LockheedMartin_Mosaic', 'LockheedMartin_System', 'LockheedMartin_atolentino', 'LockheedMartin_cgarcia', 'LockheedMartin_dallen', 'LockheedMartin_dflood', 'LockheedMartin_dparrish', 'LockheedMartin_GMK6', 'LockheedMartin_jgarces', 'LockheedMartin_jgriffin', 'LockheedMartin_Jguajardo', 'LockheedMartin_joanf', 'LockheedMartin_julieg', 'LockheedMartin_Katherinep', 'LockheedMartin_kchase', 'LockheedMartin_Kristen Hrasok', 'LockheedMartin_kyung', 'LockheedMartin_lgreen', 'LockheedMartin_lizgreen', 'LockheedMartin_lynnc', 'LockheedMartin_maxsh', 'LockheedMartin_mcabreros', 'LockheedMartin_ocontreras', 'LockheedMartin_smauro', 'LockheedMartin_sossmann', 'LockheedMartin_tcastaneda', 'LockheedMartin_wdk8'))

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