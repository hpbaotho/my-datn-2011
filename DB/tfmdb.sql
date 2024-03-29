USE [TFM_DB]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_type](
	[ticket_type_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[created_date] [int] NULL,
 CONSTRAINT [PK_ticket_type] PRIMARY KEY CLUSTERED 
(
	[ticket_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evidence](
	[evidenceid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image_uri] [nvarchar](50) NOT NULL,
	[note] [nvarchar](4000) NULL,
 CONSTRAINT [PK_evidence] PRIMARY KEY CLUSTERED 
(
	[evidenceid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_type](
	[typeid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[note] [nvarchar](500) NULL,
	[weight] [nvarchar](200) NULL,
	[seat] [nvarchar](200) NULL,
	[capacity] [nvarchar](200) NULL,
 CONSTRAINT [PK_car_type] PRIMARY KEY CLUSTERED 
(
	[typeid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car_groups](
	[groupid] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[min_weight] [nvarchar](200) NULL,
	[max_weight] [nvarchar](200) NULL,
	[min_seat] [nvarchar](200) NULL,
	[max_seat] [nvarchar](200) NULL,
	[min_capacity] [nvarchar](200) NULL,
	[max_capacity] [nvarchar](200) NULL,
 CONSTRAINT [PK_car_groups] PRIMARY KEY CLUSTERED 
(
	[groupid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[station](
	[stationid] [int] NOT NULL,
	[name] [nvarchar](200) NULL,
	[province] [nvarchar](200) NULL,
	[company] [nvarchar](200) NULL,
 CONSTRAINT [PK_station] PRIMARY KEY CLUSTERED 
(
	[stationid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permissions](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[permission] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fare](
	[fareid] [int] IDENTITY(1,1) NOT NULL,
	[car_group] [int] NOT NULL,
	[ticket_type] [int] NOT NULL,
	[station] [int] NOT NULL,
	[price] [nvarchar](200) NOT NULL,
	[apply_date] [int] NOT NULL,
	[created_date] [int] NULL,
	[is_active] [int] NOT NULL,
 CONSTRAINT [PK_fare] PRIMARY KEY CLUSTERED 
(
	[fareid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[car](
	[number_plate] [nvarchar](50) NOT NULL,
	[car_type] [int] NOT NULL,
	[brand] [nvarchar](200) NULL,
	[province] [nvarchar](50) NULL,
 CONSTRAINT [PK_car] PRIMARY KEY CLUSTERED 
(
	[number_plate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket_registration](
	[ticketid] [int] NOT NULL,
	[number_plate] [nvarchar](200) NOT NULL,
	[ticket_type] [int] NOT NULL,
	[start_date] [int] NOT NULL,
	[end_date] [int] NOT NULL,
	[station] [int] NOT NULL,
 CONSTRAINT [PK_ticket_registration] PRIMARY KEY CLUSTERED 
(
	[ticketid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_detail](
	[userid] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[company] [nvarchar](50) NULL,
	[title] [nvarchar](50) NULL,
	[cmnd] [nvarchar](50) NULL,
	[station] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_user_detail] PRIMARY KEY CLUSTERED 
(
	[userid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction](
	[transactionid] [int] NOT NULL,
	[station] [int] NULL,
	[time] [int] NULL,
	[userid] [int] NOT NULL,
	[price] [nvarchar](200) NULL,
	[car] [nvarchar](50) NOT NULL,
	[evidence] [int] NULL,
 CONSTRAINT [PK_transaction] PRIMARY KEY CLUSTERED 
(
	[transactionid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[car]  WITH CHECK ADD  CONSTRAINT [FK_car_car_type] FOREIGN KEY([car_type])
REFERENCES [dbo].[car_type] ([typeid])
GO
ALTER TABLE [dbo].[car] CHECK CONSTRAINT [FK_car_car_type]
GO
ALTER TABLE [dbo].[fare]  WITH CHECK ADD  CONSTRAINT [FK_fare_car_groups] FOREIGN KEY([car_group])
REFERENCES [dbo].[car_groups] ([groupid])
GO
ALTER TABLE [dbo].[fare] CHECK CONSTRAINT [FK_fare_car_groups]
GO
ALTER TABLE [dbo].[fare]  WITH CHECK ADD  CONSTRAINT [FK_fare_ticket_type] FOREIGN KEY([ticket_type])
REFERENCES [dbo].[ticket_type] ([ticket_type_id])
GO
ALTER TABLE [dbo].[fare] CHECK CONSTRAINT [FK_fare_ticket_type]
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD  CONSTRAINT [FK_role_permissions_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[role_permissions] CHECK CONSTRAINT [FK_role_permissions_roles]
GO
ALTER TABLE [dbo].[ticket_registration]  WITH CHECK ADD  CONSTRAINT [FK_ticket_registration_station] FOREIGN KEY([station])
REFERENCES [dbo].[station] ([stationid])
GO
ALTER TABLE [dbo].[ticket_registration] CHECK CONSTRAINT [FK_ticket_registration_station]
GO
ALTER TABLE [dbo].[ticket_registration]  WITH CHECK ADD  CONSTRAINT [FK_ticket_registration_ticket_type] FOREIGN KEY([ticket_type])
REFERENCES [dbo].[ticket_type] ([ticket_type_id])
GO
ALTER TABLE [dbo].[ticket_registration] CHECK CONSTRAINT [FK_ticket_registration_ticket_type]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_car] FOREIGN KEY([car])
REFERENCES [dbo].[car] ([number_plate])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_car]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_evidence] FOREIGN KEY([evidence])
REFERENCES [dbo].[evidence] ([evidenceid])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_evidence]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_station] FOREIGN KEY([station])
REFERENCES [dbo].[station] ([stationid])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_station]
GO
ALTER TABLE [dbo].[transaction]  WITH CHECK ADD  CONSTRAINT [FK_transaction_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[transaction] CHECK CONSTRAINT [FK_transaction_users]
GO
ALTER TABLE [dbo].[user_detail]  WITH CHECK ADD  CONSTRAINT [FK_user_detail_users] FOREIGN KEY([userid])
REFERENCES [dbo].[users] ([userid])
GO
ALTER TABLE [dbo].[user_detail] CHECK CONSTRAINT [FK_user_detail_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([roleid])
REFERENCES [dbo].[roles] ([roleid])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
