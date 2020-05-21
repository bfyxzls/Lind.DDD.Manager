-- WebDataSettings���WebDepartmentsId�ֶ�����Ϊ����Ϊ��
-- WebManageRoles_WebManageMenus_Authority_R���Authority���͸�Ϊbigint
DECLARE @CurrentMigration [nvarchar](max)

IF object_id('[dbo].[__MigrationHistory]') IS NOT NULL
    SELECT @CurrentMigration =
        (SELECT TOP (1) 
        [Project1].[MigrationId] AS [MigrationId]
        FROM ( SELECT 
        [Extent1].[MigrationId] AS [MigrationId]
        FROM [dbo].[__MigrationHistory] AS [Extent1]
        WHERE [Extent1].[ContextKey] = N'Lind.DDD.Manager.Migrations.Configuration'
        )  AS [Project1]
        ORDER BY [Project1].[MigrationId] DESC)

IF @CurrentMigration IS NULL
    SET @CurrentMigration = '0'

IF @CurrentMigration < '201608060823056_managerNew'
BEGIN







 
/****** Object:  Table [dbo].[WebAuthorityCommands]    Script Date: 09/07/2016 14:15:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[WebAuthorityCommands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Flag] [bigint] NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[ActionName] [varchar](50) NOT NULL,
	[ClassName] [varchar](128) NULL,
	[Feature] [int] NOT NULL,
	[DataCreateDateTime] [datetime] NOT NULL,
	[DataUpdateDateTime] [datetime] NOT NULL,
	[DataStatus] [int] NOT NULL,
 CONSTRAINT [PK_WebAuthorityCommands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ť����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebAuthorityCommands', @level2type=N'COLUMN',@level2name=N'Name'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ӦAction����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebAuthorityCommands', @level2type=N'COLUMN',@level2name=N'ActionName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'css����' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebAuthorityCommands', @level2type=N'COLUMN',@level2name=N'ClassName'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:��,1:����ǰ��ʾ����,2:��ҳ��ʹ�õ���ʽ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebAuthorityCommands', @level2type=N'COLUMN',@level2name=N'Feature'
GO

ALTER TABLE [dbo].[WebAuthorityCommands] ADD  CONSTRAINT [DF_WebAuthorityCommands_Flag]  DEFAULT ((0)) FOR [Flag]
GO

ALTER TABLE [dbo].[WebAuthorityCommands] ADD  CONSTRAINT [DF_WebAuthorityCommands_Feature]  DEFAULT ((0)) FOR [Feature]
GO

ALTER TABLE [dbo].[WebAuthorityCommands] ADD  CONSTRAINT [DF_WebAuthorityCommands_DataCreateDateTime]  DEFAULT (getdate()) FOR [DataCreateDateTime]
GO

ALTER TABLE [dbo].[WebAuthorityCommands] ADD  CONSTRAINT [DF_WebAuthorityCommands_DataUpdateDateTime]  DEFAULT (getdate()) FOR [DataUpdateDateTime]
GO

ALTER TABLE [dbo].[WebAuthorityCommands] ADD  CONSTRAINT [DF_WebAuthorityCommands_DataStatus]  DEFAULT ((1)) FOR [DataStatus]
GO

/* Ϊ�˷�ֹ�κο��ܳ��ֵ����ݶ�ʧ���⣬��Ӧ������ϸ���˽ű���Ȼ���������ݿ��������������֮�����д˽ű���*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
DROP INDEX IX_WebAuthorityCommands ON dbo.WebAuthorityCommands
GO
CREATE UNIQUE NONCLUSTERED INDEX IX_WebAuthorityCommands ON dbo.WebAuthorityCommands
	(
	Flag
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE dbo.WebAuthorityCommands SET (LOCK_ESCALATION = TABLE)
GO
COMMIT











    ALTER TABLE [WebManageUsers] ADD [ThridUserId] [nvarchar](max)
    ALTER TABLE [WebDataSettings] ADD [WebManageRolesId] [int]
   
    ALTER TABLE WebDataSettings DROP CONSTRAINT [FK_dbo.WebDataSettings_dbo.WebDepartments_WebDepartmentsId]
    DROP INDEX IX_WebDepartmentsId ON WebDataSettings
    ALTER TABLE [WebDataSettings] DROP COLUMN [WebDepartmentsId]
	ALTER TABLE [WebDataSettings] ADD [WebDepartmentsId] [int]
   
    ALTER TABLE [WebDataSettings] ADD [ObjectNameArr] [nvarchar](max)


	  CREATE TABLE [dbo].[WebCommonAreas] (
        [ID] [int] NOT NULL,
         [Name] [nvarchar](max),
        [ParentId] [int]  NULL,
        [CommonAreaGroupID] [int] NULL,
        [CommonAreaGroupName] [nvarchar](max)  NULL,
		[Code] [nvarchar](max),
		[PinYin] [nvarchar](max),
        [DataCreateDateTime] [datetime] NULL default(getdate()),
        [DataUpdateDateTime] [datetime] NULL default(getdate()),
        [DataStatus] [int] NULL default(1),
        CONSTRAINT [PK_dbo.WebCommonAreas] PRIMARY KEY ([ID])
    )


	INSERT  INTO dbo.WebCommonAreas
        ( ID ,
          Name ,
          ParentId ,
          CommonAreaGroupID ,
          CommonAreaGroupName ,
          Code ,
          PinYin ,
          DataCreateDateTime ,
          DataUpdateDateTime ,
          DataStatus
        )
VALUES  ( 0 , -- ID - int
          N'ȫ��' , -- Name - nvarchar(max)
          NULL , -- ParentId - int
          0 , -- CommonAreaGroupID - int
          N'' , -- CommonAreaGroupName - nvarchar(max)
          N'0' , -- Code - nvarchar(max)
          N'quanguo' , -- PinYin - nvarchar(max)
          GETDATE() , -- DataCreateDateTime - datetime
          GETDATE() ,
          1
        )
INSERT  INTO dbo.WebCommonAreas
        ( ID ,
          Name ,
          ParentId ,
          CommonAreaGroupID ,
          CommonAreaGroupName ,
          Code ,
          PinYin ,
          DataCreateDateTime ,
          DataUpdateDateTime ,
          DataStatus
         
        )
        SELECT  ID ,
                Name ,
                ParentId ,
                CommonAreaGroupID ,
                CommonAreaGroupName ,
                Code ,
                PinYin ,
                GETDATE() ,
                GETDATE() ,
                1
        FROM    dbo.Common_Area



    CREATE TABLE [dbo].[WebConfirmRecords] (
        [ID] [int] NOT NULL IDENTITY,
        [UserId] [int] NOT NULL,
        [UserName] [nvarchar](max),
        [AuditStatus] [int] NOT NULL,
        [Description] [nvarchar](max),
        [ToUserId] [int] NOT NULL,
        [DataCreateDateTime] [datetime] NOT NULL,
        [DataUpdateDateTime] [datetime] NOT NULL,
        [DataStatus] [int] NOT NULL,
        CONSTRAINT [PK_dbo.WebConfirmRecords] PRIMARY KEY ([ID])
    )
    CREATE TABLE [dbo].[WebManageRoles_WebManageMenus_Authority_R] (
        [ID] [int] NOT NULL IDENTITY,
        [RoleId] [int] NOT NULL,
        [MenuId] [int] NOT NULL,
        [Authority] [bigint] NOT NULL,
        [DataCreateDateTime] [datetime] NOT NULL,
        [DataUpdateDateTime] [datetime] NOT NULL,
        [DataStatus] [int] NOT NULL,
        CONSTRAINT [PK_dbo.WebManageRoles_WebManageMenus_Authority_R] PRIMARY KEY ([ID])
    )
    CREATE INDEX [IX_RoleId] ON [dbo].[WebManageRoles_WebManageMenus_Authority_R]([RoleId])
    CREATE INDEX [IX_MenuId] ON [dbo].[WebManageRoles_WebManageMenus_Authority_R]([MenuId])
    CREATE TABLE [dbo].[WebLoggers] (
        [ID] [int] NOT NULL IDENTITY,
        [UserId] [int] NOT NULL,
        [UserName] [nvarchar](max),
        [ControllerName] [nvarchar](max),
        [ActionName] [nvarchar](max),
        [Authority] [nvarchar](max),
        [RequestParams] [nvarchar](max),
        [Description] [nvarchar](max),
        [DataCreateDateTime] [datetime] NOT NULL,
        [DataUpdateDateTime] [datetime] NOT NULL,
        [DataStatus] [int] NOT NULL,
        CONSTRAINT [PK_dbo.WebLoggers] PRIMARY KEY ([ID])
    )
    ALTER TABLE [dbo].[WebManageRoles_WebManageMenus_Authority_R] ADD CONSTRAINT [FK_dbo.WebManageRoles_WebManageMenus_Authority_R_dbo.WebManageMenus_MenuId] FOREIGN KEY ([MenuId]) REFERENCES [dbo].[WebManageMenus] ([ID])
    ALTER TABLE [dbo].[WebManageRoles_WebManageMenus_Authority_R] ADD CONSTRAINT [FK_dbo.WebManageRoles_WebManageMenus_Authority_R_dbo.WebManageRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[WebManageRoles] ([ID])
    CREATE TABLE [dbo].[__MigrationHistory] (
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
        CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY ([MigrationId], [ContextKey])
    )
    INSERT [dbo].[__MigrationHistory]([MigrationId], [ContextKey], [Model], [ProductVersion])
    VALUES (N'201608060823056_managerNew', N'Lind.DDD.Manager.Migrations.Configuration',  0x1F8B0800000000000400ED1DCB72E3B8F19EAAFC834AA724352BD93339ECBAE4DDF25AE3C495F178CAF2ECE636458BB0CC2C452A2435B193CA97E5904FCA2F04E0136F36489094BC2C5F2C0268008D7EA1D140FFEF3FFF5DFCF0BCF5275F51147B61703E3D9D9D4C27285887AE176CCEA7FBE4F19B6FA73F7CFFDBDF2CDEBBDBE7C94F45BD77A41E6E19C4E7D3A724D99DCDE7F1FA096D9D78B6F5D65118878FC96C1D6EE78E1BCEDF9E9C7C373F3D9D230C628A614D268BBB7D90785B94FEC03F2FC3608D76C9DEF16F4217F971FE1D97AC52A8938FCE16C53B678DCEA71FBCC09D2D97CBD98D13381B144D2717BEE7E071AC90FF389D384110264E824779F63946AB240A83CD6A873F38FEFDCB0EE17A8F8E1FA37CF4675575E8444EDE9289CCAB8605A8F53E4EC2AD21C0D3773966E67CF346F89D9698C3B87B8F719CBC9059A7F83B9FFE8C1E30A61FBD687B87D661E44E277CA767977E441A88689E652B33E361BC99F035DF946482A989FCBD995CEEFD641FA1F300ED93C8F1DF4C3EED1F7C6FFD17F4721FFE8282F360EFFBF4D0F1E07119F3017FFA14853B14252F77E8319FD0359EC29C6D37E71B96CDA836D914AF83E4DDDBE9E423EEDC79F0514919143A564918A13FA100454E82DC4F4E92A0282030508A5BA177AE2F4C81517D7FF530C87F05144CD29837A7931BE7F9030A36C9D3F914FF3B9D5C79CFC82DBEE4903F071E6665DC2889F6B51D5DEC5D2F59E189EFE376235EA2781D79BB8C883B1EF47D6803C74B27712E2384D718FF87EEBD0ADBD5EF06203FEF5CDB20D9F521226F567CD2425BCC2B69502723526C2491DF503C14CD47C950477118499638BB09BDE3DE49BFC3F57EE521DF1DAEFB8B9D3740E73DCAC6D72FD530B48FCE576F93B224073797442B9424297AEF909F568B9FBC5DDE0725ACBEF0D5AFA2707B17FAAC44E46A7D5985FB684D5010D656BD77A20D4ADA09E572708DE5720E6114CD9ABEA8456C6B576050197E0979C46DA1DD3EFC0DAD936BF7228A06929ABF76619259455D4892423C00244921740CC64E11A16AF85415FD0CD4156593D0D496CDC3442232936A24112908A344D4F44530348CA17AF110EE93CE0DA55518251FF7DB0714B514D03B82E0D08674AEB322774E946CF1EA5D2FC79D6FD736A20DD128B1140182D4641E254928453C55E50B2F3F5925A5AC28D553EADAED545505ED0605FBF8CBC53E790A232CAFBEDC01970A0A4CB78A3018800506026AB0F61928E20883AA77A645FDECD38AE02966B55B6F7868826EB6E1A9208CEA5DD3D7A8DA0F48B57F405F91DF6EAC9F9C4866198C86805A885E39C91321917AC5B9C2851A75498AEB94645AC7543566FDDA199FCC6DA59A8365771B6B2B68F6C9CA8A75A36F6F4A0176CB364CA9FA79C80C2FBB6681B4439959A0AE089E871DB38019628B5D7F0A61340B749A28DC78C130B6C127278EFF910628F4DDF31D72063A93BB091F3CBFFB53FEF75BC7F37B7050F477CCD59B698665C7EA254ED0D6D0B4BA7F8A3C970D5318CFFC3AF3E734F483182A3DA81F8455919DBAEC1BEDE9EB5DF675F368E8B2D7FA63DA7AF335C047955FE3E86F7B4A4930DE1646B95EA373BB9530A478402F44323669E7313584A1163DA6807A94AEBDB892A132B91162CCC5754E3E2D64720A6114BC07E782B5E06BC46BFACBE7A8FB0DC5E82D96D368BCF4E29DEFBC1016BB8F5049443F86583838C1E83B1EDA774CCB66896F962FAED38AD67DC7A6E3531E024AE6D0F3B1EF10464C0D3ADA1DFB9AE8EA0FE126BD0CD5484D678D470DADE9EBA8AEF25C86411285BEDFD7CDA135C1704F9794B89D61673DDDA1BFEF519C6085E86CE3CE7B1BEF05F473DB69BFA5C46601EB3ABEF29D4D753514204397B8DC0BF2D15482931598A7B3EF8002132FA08B22FF052F382D605804DD206299163B8630DA3AB8E14F8EBFC73F4F057432B5FFECB958CE95B5458B8EA9BD443EC232B2ACFE4E5FFD0ADB9DFF4465ED3F8A6B91619DFE7811C7E1DA4BB1AB3402E8D361B6FBF7813B318ABAABE887DFFCDFE0E5F176784130B9C8D008EDAAB4DB98AE98036EB6AB3F085D61658888F5ED393E16E031A6162F4844CDE9056B6FE7F82608E08000153059BBB23BBE6489762820BAD3043B9071B080E4A32A3BE70C863A0C2EE614DDD592A31056A1A10C758C054B0FF4E9044B0F27B3590DF5A9E34CA07DD8A339D57CFBA134152620BD573BDC43A02BB8988344C474436B96255D2B64D1B21B3E7C69D80D1459669892064B43D54F37FC294740FF9C2AC70E641CEC7D8703E15BFABCD5943EB8C8A9E6F21BDA958E14F323638B4C2B38956A6D2A99874932D4FC2CC2549AA9BD6CD03E6C5B6BE27CFBB4D1444C1C87E66CE6E703124603A71F947A0CC8B3C131A14ABB687D9F7D90B73146FBE701637443865884400CCB26A647D7F07DAF0536B1B0FB7E056CD210A3836CE7EDB349116D74506C526BCF01C2E35AD8FBD0AEFAB5E7546F1BE86CD1BA275384DD63F6B882D9DEABEE3585FE9D7135F3EE69D7A5C70BD00D47BF82D2038F662E7B7274855B94CEE5FC24927C46CF89C4378FA93D77CFC7F9F1074F30042CC6403531EE11C4EAACA0A215AE8A408402CC8A8265E0AA5218A4924C55C0CA0AF5F018F92383C754008C8FDE9F4AC74757808E2F175AEAF1E5158CE6AB55ED35A8D0B6858E22DF0DA8BBCA2BD4C32BCEF765A08A320E0AC5673A0431E444B5013D80C08B05D3939972A622A90A22C7F4288685ADE39A398B2A181AC55B9752E4E94F11C0E708DC64D42C063E3500436C8F1E109541DDE20D1CE35690373C95F11C0241A3D261DEC0656E0B8D321F395810584463AE52E068946C0E1AB87BEDA291DD0FC8D028D79C8DD028460B6A1486CAFF0BF600CB26235598607F2F18627BF4185813B5386CE8C4B1EBEDB4B21AE67E1BA5603031D05AACA6F10D108809656F359B3AE56C195EC7BD9A3A0D00750F357010D9457EAF1A40F9CCA55C8B421C47A6AE23D1E2926DAD4D7D4536ECB822EEB0746294658B7996C922FFB0982B525E2C6E9CDD0E774AA5C0C8BF4C5659FE8BCB6F56E6A921B6198CF99AA15DDEE552F6948411A61AAE948415BBE8CA8BE28460E7C121A19297EE56A8C6B96C145BDBA2338557465CCB62DF5B3424FF979790D8C8F63A681556AFF044894195CE19B13450036242B29338BE1349A2D22F437FBF0DF2DF92035375EB22CE9C86507C338392C563F370B2AF70484C56081A18530087C7043AD3F0980238BC2A01040DACFA6A3032495834334049B919743E429A87CE979B41972D12FD5D84B698735C20387905AEE32421CFCD505E2F85765B3657018271B8BA7537CC5DF427B2265B620E9160490E312B31879867679081CC8BCC61A629176410D382E184C8C8FAFDB2BEDA0C34E77E052CB8005002E8460650628707C41519C1A4760612B05C291C3293738006CA148C9C76889CA677FD9A719A06168CD3B400BAE134D299A869ABAF064670F6FA0063FE669FE030E8B7056840F47703BE2C5F186098B2FC6AA24BE9D86A5699EAA2AE3510471EEF4F9B52A707ADB5A91A16509BEA0074C3E3227F8FBC2D3CF04283C93FC1615451DF3418752CB81AD22817FAD6FD2A6F7513DD2F8565A2FB1500BA910BD4E3B50CF5579F4D38A0788D96E580E2AB814552BE2ECB5824E55738A4E2B5581A4EF10D0E257F0C9606927F1A6E2F6E4FFAFD4CBFD7CA6D88AA02035723FD8E2BE36DA40B467978B8F2B0C1816BE36D924137C63B2823D8DD6DAE7808AA807E3594E2A60C23C614B767D450A84761D8138AF2F3C89487CB94590C891DCE93C232612F058043DDBCD830F0CB271C1928C5C7712395AEABF8CE22B3EC62F1B8C17ADDB22B8FB96F2BB6E46060124BD5F6D71198C0BF7147C3E3CB0C8418F5941D23C9A8EFC31826DC7B74EC0692291ACF515F8F006243CD74EE5F21200FECEC155A9A1D9492303BC91967EDAD0C119720A9C5C1965F4EA486D476B4CA3B938D65AC76785874B95E7AFBF63A266F1C968F121AE1808F51B4405B4C24A9116D312DF5C706F571B6B56B2789B76DB8761870D2097949C2761B0E51A580D543B44119BA50EA06FE11356550D59B50467D247643B4AB5F2E30A58CFA80EE03A20C21BC99AF526AC3FC4BF9BB0C6FCE438B9998E7744A2482399D4A9C8739F3B1C65995E9048FFDABE79238E3CC873B231566ABBFFB97BE8719ACAA8071E93D62B3287B6675FAF6E4E4DBE9E4C2F79C388B4FCFA3A8CFF81BE5A0B0EAD37724AC1AB9DB39DFDC3C389B40896397894294BEF1AD0948063EB22D6823C023DB652E008F60B7F619ED066F6257EF6AA75DB47C553BF8EA44EB2727FADDD679FE3D0D0DF6BE3415D5DC7C4C92E79C5B0DAB8A676E3126E5B3CFC4644EEC3EFBDC0AA429FE8DD28A4B437E8F967DD8B8E11A4A338298C50DDB8498870DDB0499C60D5B016899614766D3EE1A8F96DFB8105DAA27E1619AEBC045CFE7D37FA52DCF26D77FFDC2347E33B98DB09572363999FCBBC930B8905EE39130ED5B0D860905B6C6DDAF9279E404C56DE5CD898A01A05A4B516C354CDDF94A58B90A04B641B34C82B256AA434C42D684AEAA532E1BDA8C890436A34FBA6D2B31F37AA582914A55C5D81E2D1F8E3C081A1293ACB1C968F8D47E50062EDAC1F5CAC8BB3A1D2A7B61F45879978AA7B5C1C0554CAD0D68555CAD0D684574AD0556CE636CAD2866BBDB56AB128B09B395F213C8F54507D78E3B73ABA2C8F04DF0639552C5718D99DECB5AB532598B5056B38EB356AD3A16D2248E0EE3769C22890B3D5A76B0A7135BDBA45CFAF0764737AFD9FA5726FA7EF0C69DC0F1091559E8E6D1CA93033BC295273F6E275A8404C72D0F9939EDDC0A9A3451F141ED2A469E370873838901656C9A58551E09542F358A2E8CDDBD494BE355224F001D67AD0C3A6EB85D6ABF76CAE8317B6B37D88E67E0B5EB26ADB4BD14564280F670A9A261A968A4E1CBA6A968D44F74893DD63F5675E0E99FBB4AC39B852C826177924AB62F9AE1660DE975F8E494ADD33ADBA59C8125CD0054632E69EA2F920C985958166B618174E04916874E5CDD13DD98EAC4434F462DBDDB608772F8B9DE064BE4A3044DB20D32DE7B3BF1DA71452B915C3A808D47769F443A3ABEE2EB2148F07D28B39DE1F08429BBD122933ED2A5D72CF6AF93304D096368C254DF48EA3F79B84152FAAE12D1CBEC790DEC4E3274F7AA61AB591F873DDF286D917DA26A92145B92424769CA0D9D25BE7F2BCFEC652E7130AA07AA5E437AF78EB3B51F0961F6E920B34898EA6BC943275407EC499A126157A69FDAE5AF1E5DBFA6DF4054DAC0F43B60C23CBE3DC9E113669F7B92768439F49EA4B80E68E2302EF3DD895EDDECFB519D48C9EF6377462E4D9CC49A942C1DD009F7C4C6A4086AE153EFF16B2A648C675F8B90268EE7AA644F6C9C4FDD8710D34276F8CAD70225ABAF6851D66B55AAE8B0A800EEABA4525577D5D356EA1EF33AA04E198B44D6295341D12953073051DA332B9D285D4135514D9A77E53C73A5A19E67F1828F6E9EF21CA47ADC6AB7003568D7B6AD5F11937CB4CA49E41B7AF548F30ADAE1C8F3534BFACC830AA5DD15658A9EB2625332841088A67A3D89F2C69A01EAA5664F0DC918D1B3D49A1407084C47CC0829483AE29A07F914FBAA125D7502486B26B0509822DE946D9462980FBC50E416D6C667688FBCB809A865A2064AE6BF05436A8F0A10954083103A42CF4054C2D33204359A3D7417A869C6861651C36620876348F75E5EC72C2617DFF5CF46768DC42265B82912E52FFA69BC0D323A914EF15091289CB9E9749BEA684E7B8E224391D462AA3D8A03436A8F0A0353B3165F7058BD21156ABB1B6636B1B80CA687272093CCDE32B4B5D68E7419002ACAF088A173F44224B6B462C748D4AA28437778372AEA5090A872C12AB43BC461AB76D98A3671F6BD67B35A78C8B72C5BCCB34D6FFE01FF141EEC5DCCEFF601B96195FD5AA2D8DB5420C803E6015A335ECDB2CE75F018163E566E444515E1067DE2B8788E1751E23D3AEB0417AF511CA7D3FDC9F1F788BCA6F180DCEBE0769FECF6099E32DA3EF84C6605E2A4D5F5BF980B635EDCA6B7DF621B53C0C3F4C8A5B4DBE0C7BD471EC0CCC77D25B9D6A20041BCBFF9854DB29609B9B8B97929217D0C0320A01C7DA5D3FA1E6D773E0616DF062BE72B6A3236CC8A1FD0C659BF7CCADF5D5603A95F0816ED8BA5E76CC8ADC61C46D51EFFC434EC6E9FBFFF3F9352C3B5C4EA0000 , N'6.1.3-40302')





DECLARE @roleId INT 
DECLARE @menuId INT
DECLARE cursor2 CURSOR
FOR
    SELECT  menuid ,
            roleid
    FROM    WebManageRoles_WebManageMenus_R
        
OPEN cursor2
  
FETCH NEXT FROM cursor2 INTO @menuId, @roleId

WHILE @@fetch_status = 0 
    BEGIN
        INSERT  INTO dbo.WebManageRoles_WebManageMenus_Authority_R
                ( roleid ,
                  menuid ,
                  authority ,
                  DataCreateDateTime ,
                  DataUpdateDateTime ,
                  DataStatus
                )
        VALUES  ( @roleid ,
                  @menuId ,
                  63 ,
                  GETDATE() ,
                  GETDATE() ,
                  1
                )
        FETCH NEXT FROM cursor2 INTO @menuId, @roleId
    END
CLOSE cursor2
DEALLOCATE cursor2
END