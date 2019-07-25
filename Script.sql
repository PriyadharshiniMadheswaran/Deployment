DROP TABLE [dbo].[tblQtyDetails]
GO
/****** Object:  Table [dbo].[tblWarrantySubmission]    Script Date: 7/25/2019 10:16:48 AM ******/
DROP TABLE [dbo].[tblWarrantySubmission]
GO

/****** Object:  Table [dbo].[tblWarrantySubmission]    Script Date: 7/25/2019 10:16:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblWarrantySubmission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[JobSite] [varchar](250) NULL,
	[Name] [varchar](250) NULL,
	[UnitSerial] [varchar](250) NULL,
	[Cyclecount] [varchar](250) NULL,
	[Runhours] [varchar](250) NULL,
	[Setpoint] [varchar](250) NULL,
	[blower] [varchar](250) NULL,
	[serial#] [varchar](250) NULL,
	[OriginSalesorder] [numeric](18,0) NULL,
	[RepOrganization] [varchar](250) NULL,
	[Requestedby] [varchar](250) NULL,
	[PurchaseOrder] [varchar](250) NULL,
	[ContactCompany] [varchar](250) NULL,
	[AddressLine1] [varchar](250) NULL,
	[AddressLine2] [varchar](250) NULL,
	[City] [varchar](250) NULL,
	[State] [varchar](250) NULL,
	[zip] [varchar](250) NULL,
	[Phone] [varchar](250) NULL,
	[Email] [varchar](250) NULL,
	[ExplanationofProblem] [varchar](250) NULL,
	[Technicalservicesassistwithtroubleshooting] [varchar](250) NULL,
	[Referenceticketnumber] [varchar](250) NULL,
	[shippingOptionsValue] [varchar](250) NULL,
	[ShippingOptionsText] [varchar](250) NULL,
	[RequestedShipDate] [datetime] NULL,
	[SubmittedDate] [datetime] NULL
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


CREATE TABLE [dbo].[tblQtyDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Qty] [numeric](18, 0) NULL,
	[Part] [varchar](250) NULL,
	[Description] [varchar](250) NULL,
	[ListPrice] [numeric](18, 0) NULL,
	[SubmissionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblQtyDetails]  WITH CHECK ADD FOREIGN KEY([SubmissionId])
REFERENCES [dbo].[tblWarrantySubmission] ([Id])
GO


/****** Object:  StoredProcedure [dbo].[sp_InsertWarrantFormDetails]    Script Date: 7/25/2019 10:20:51 AM ******/
DROP PROCEDURE [dbo].[sp_InsertWarrantFormDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertWarrantFormDetails]    Script Date: 7/25/2019 10:20:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[sp_InsertWarrantFormDetails]
(
@Date datetime,@JobSite varchar(250),@Name varchar(250),@UnitSerial varchar(250),@Cyclecount varchar(250),@Runhours varchar(250),
@Setpoint varchar(250),@blower varchar(250),@serial# varchar(250),@OriginSalesorder int,@RepOrganization varchar(250),@Requestedby varchar(250),
@PurchaseOrder varchar(250),@ContactCompany varchar(250),@AddressLine1 varchar(250),@AddressLine2 varchar(250),@City varchar(250),
@State varchar(250),@zip varchar(250),@Phone varchar(250),@Email varchar(250),@ExplanationofProblem varchar(250),
@Technicalservicesassistwithtroubleshooting varchar(250),@Referenceticketnumber varchar(250),@shippingOptionsValue varchar(250),
@ShippingOptionsText varchar(250),@RequestedShipDate datetime,@SubmittedDate datetime
)
as
begin
insert into tblWarrantySubmission([Date],JobSite ,Name ,UnitSerial ,Cyclecount ,Runhours ,
Setpoint ,blower ,serial# ,OriginSalesorder ,RepOrganization ,Requestedby ,
PurchaseOrder ,ContactCompany ,AddressLine1 ,AddressLine2 ,City ,
[State] ,zip ,Phone ,Email ,ExplanationofProblem ,
Technicalservicesassistwithtroubleshooting ,Referenceticketnumber ,shippingOptionsValue ,
ShippingOptionsText ,RequestedShipDate ,SubmittedDate)
values
(@Date,@JobSite ,@Name ,@UnitSerial ,@Cyclecount ,@Runhours ,@Setpoint ,@blower ,@serial# ,@OriginSalesorder ,@RepOrganization ,@Requestedby ,
@PurchaseOrder ,@ContactCompany ,@AddressLine1 ,@AddressLine2 ,@City ,
@State ,@zip ,@Phone ,@Email ,@ExplanationofProblem ,@Technicalservicesassistwithtroubleshooting ,@Referenceticketnumber ,
@shippingOptionsValue ,@ShippingOptionsText ,@RequestedShipDate ,@SubmittedDate)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertQtyDetails]    Script Date: 7/25/2019 10:21:33 AM ******/
DROP PROCEDURE [dbo].[sp_InsertQtyDetails]
GO

/****** Object:  StoredProcedure [dbo].[sp_InsertQtyDetails]    Script Date: 7/25/2019 10:21:33 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertQtyDetails]
      @tblQtyPartDesCritionDetails tblQtyPartDesCritionDetails READONLY
AS
BEGIN
      SET NOCOUNT ON;
     
      INSERT INTO tblQtyDetails(Qty, Part, [Description],ListPrice,SubmissionId)
      SELECT Qty,Part,[Description], ListPrice, SubmissionId FROM @tblQtyPartDesCritionDetails


END

GO
