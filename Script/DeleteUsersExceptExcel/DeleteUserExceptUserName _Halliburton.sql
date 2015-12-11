
declare @Users table (UserId uniqueidentifier NOT NULL)
declare @UserId uniqueidentifier
declare @Prefix varchar(100)

set @Prefix = 'Halliburton_';

declare @UsersEx table (UserName varchar(100) NOT NULL)

INSERT @UsersEx (UserName) VALUES (N'MosaicDemo')

INSERT @UsersEx (UserName) VALUES (N'Mosaic')

INSERT @UsersEx (UserName) VALUES (N'System')

INSERT @UsersEx (UserName) VALUES (N'abrier')

INSERT @UsersEx (UserName) VALUES (N'afermin')

INSERT @UsersEx (UserName) VALUES (N'amyvo')

INSERT @UsersEx (UserName) VALUES (N'besters')

INSERT @UsersEx (UserName) VALUES (N'bettyf')

INSERT @UsersEx (UserName) VALUES (N'bettyfnew')

INSERT @UsersEx (UserName) VALUES (N'bevans')

INSERT @UsersEx (UserName) VALUES (N'bguidry')

INSERT @UsersEx (UserName) VALUES (N'bskurdal')

INSERT @UsersEx (UserName) VALUES (N'bwagner')

INSERT @UsersEx (UserName) VALUES (N'cameronl')

INSERT @UsersEx (UserName) VALUES (N'cfuzetti')

INSERT @UsersEx (UserName) VALUES (N'clewis')

INSERT @UsersEx (UserName) VALUES (N'dbeagles')

INSERT @UsersEx (UserName) VALUES (N'dclark')

INSERT @UsersEx (UserName) VALUES (N'dford')

INSERT @UsersEx (UserName) VALUES (N'dkopelmanfih')

INSERT @UsersEx (UserName) VALUES (N'dpham')

INSERT @UsersEx (UserName) VALUES (N'dyanez')

INSERT @UsersEx (UserName) VALUES (N'esalazar')

INSERT @UsersEx (UserName) VALUES (N'GDW8')

INSERT @UsersEx (UserName) VALUES (N'jabrown')

INSERT @UsersEx (UserName) VALUES (N'jdenton')

INSERT @UsersEx (UserName) VALUES (N'jdomec')

INSERT @UsersEx (UserName) VALUES (N'jeffi')

INSERT @UsersEx (UserName) VALUES (N'jfitts')

INSERT @UsersEx (UserName) VALUES (N'jldianfih')

INSERT @UsersEx (UserName) VALUES (N'jhoffman')

INSERT @UsersEx (UserName) VALUES (N'jiblings')

INSERT @UsersEx (UserName) VALUES (N'jmcphail')

INSERT @UsersEx (UserName) VALUES (N'jmoore')

INSERT @UsersEx (UserName) VALUES (N'JoeSmith')

INSERT @UsersEx (UserName) VALUES (N'josieb')

INSERT @UsersEx (UserName) VALUES (N'jritcheske')

INSERT @UsersEx (UserName) VALUES (N'jrogers')

INSERT @UsersEx (UserName) VALUES (N'jscheibelhut')

INSERT @UsersEx (UserName) VALUES (N'judym')

INSERT @UsersEx (UserName) VALUES (N'jvandermaaten')

INSERT @UsersEx (UserName) VALUES (N'jworkman')

INSERT @UsersEx (UserName) VALUES (N'jwright')

INSERT @UsersEx (UserName) VALUES (N'kcarlile')

INSERT @UsersEx (UserName) VALUES (N'kkahanek')

INSERT @UsersEx (UserName) VALUES (N'klytlefih')

INSERT @UsersEx (UserName) VALUES (N'kobie')

INSERT @UsersEx (UserName) VALUES (N'kwitt')

INSERT @UsersEx (UserName) VALUES (N'lbeckett')

INSERT @UsersEx (UserName) VALUES (N'leckardt')

INSERT @UsersEx (UserName) VALUES (N'marilynm')

INSERT @UsersEx (UserName) VALUES (N'marmor')

INSERT @UsersEx (UserName) VALUES (N'mcarr')

INSERT @UsersEx (UserName) VALUES (N'mdaugherty')

INSERT @UsersEx (UserName) VALUES (N'meghanw')

INSERT @UsersEx (UserName) VALUES (N'michaelw')

INSERT @UsersEx (UserName) VALUES (N'midkiff')

INSERT @UsersEx (UserName) VALUES (N'mmojica')

INSERT @UsersEx (UserName) VALUES (N'mroytan')

INSERT @UsersEx (UserName) VALUES (N'msavoie')

INSERT @UsersEx (UserName) VALUES (N'NRG7')

INSERT @UsersEx (UserName) VALUES (N'nrh4')

INSERT @UsersEx (UserName) VALUES (N'paulw')

INSERT @UsersEx (UserName) VALUES (N'Prestonbfih')

INSERT @UsersEx (UserName) VALUES (N'prestonbfmgh')

INSERT @UsersEx (UserName) VALUES (N'psmith')

INSERT @UsersEx (UserName) VALUES (N'pwoods')

INSERT @UsersEx (UserName) VALUES (N'rchadwell')

INSERT @UsersEx (UserName) VALUES (N'Rebecca Greer')

INSERT @UsersEx (UserName) VALUES (N'renfro')

INSERT @UsersEx (UserName) VALUES (N'rfussner')

INSERT @UsersEx (UserName) VALUES (N'rgreer')

INSERT @UsersEx (UserName) VALUES (N'rhoward')

INSERT @UsersEx (UserName) VALUES (N'rhuntman')

INSERT @UsersEx (UserName) VALUES (N'RMA1')

INSERT @UsersEx (UserName) VALUES (N'rmetcalfe')

INSERT @UsersEx (UserName) VALUES (N'rmk4')

INSERT @UsersEx (UserName) VALUES (N'robertrogers')

INSERT @UsersEx (UserName) VALUES (N'sarahfmg')

INSERT @UsersEx (UserName) VALUES (N'saubrey')

INSERT @UsersEx (UserName) VALUES (N'schristensen')

INSERT @UsersEx (UserName) VALUES (N'smcbride')

INSERT @UsersEx (UserName) VALUES (N'sreedy')

INSERT @UsersEx (UserName) VALUES (N'Srhen')

INSERT @UsersEx (UserName) VALUES (N'supriyo')

INSERT @UsersEx (UserName) VALUES (N'swilson')

INSERT @UsersEx (UserName) VALUES (N'swright')

INSERT @UsersEx (UserName) VALUES (N'thoffmann')

INSERT @UsersEx (UserName) VALUES (N'tloftis')

INSERT @UsersEx (UserName) VALUES (N'WALE')

INSERT @UsersEx (UserName) VALUES (N'wbrokkshire')

INSERT @UsersEx (UserName) VALUES (N'wcrowe')

INSERT @UsersEx (UserName) VALUES (N'WJMQ')

INSERT @UsersEx (UserName) VALUES (N'wpabst')

INSERT @UsersEx (UserName) VALUES (N'YRR3')


UPDATE @UsersEx set UserName = @Prefix + UserName


insert @Users (UserId)
Select  UserId
from aspnet_Users
where  UserName like @Prefix + '%' and (UserName not in 
(select UserName from @UsersEx))


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