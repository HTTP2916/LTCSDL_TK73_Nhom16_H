USE [DBMusic]
GO
/****** Object:  Table [dbo].[ALBUM]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALBUM](
	[MaAB] [nvarchar](20) NOT NULL,
	[TenAB] [nvarchar](20) NOT NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALBUMBAIHAT]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALBUMBAIHAT](
	[ma] [nvarchar](20) NOT NULL,
	[MaAB] [nvarchar](20) NULL,
	[MaBH] [nvarchar](20) NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BAIHAT]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BAIHAT](
	[MaBaiHat] [nvarchar](20) NOT NULL,
	[MaCaSi] [nvarchar](20) NULL,
	[MaTheLoai] [nvarchar](20) NULL,
	[TenBaiHat] [nvarchar](50) NOT NULL,
	[QuocGia] [nvarchar](50) NOT NULL,
	[FileLoiBaiHat] [nvarchar](50) NOT NULL,
	[LinkNhac] [nvarchar](50) NOT NULL,
	[NgayTao] [nvarchar](50) NOT NULL,
	[NguoiTao] [nvarchar](20) NULL,
	[NgayChinhSua] [nvarchar](50) NOT NULL,
	[NguoiChinhSua] [nvarchar](20) NOT NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaiHat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CASI]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASI](
	[MaCaSi] [nvarchar](20) NOT NULL,
	[TenCaSi] [nvarchar](20) NOT NULL,
	[GioiTinh] [nvarchar](20) NOT NULL,
	[QuocTich] [nvarchar](50) NOT NULL,
	[HinhAnh] [nvarchar](50) NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaCaSi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NGUOIDUNG]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NGUOIDUNG](
	[MaUser] [nvarchar](20) NOT NULL,
	[TenUser] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[NgaySinh] [nvarchar](20) NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLAYLIST]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAYLIST](
	[MaPlayList] [nvarchar](50) NOT NULL,
	[TenPlaylist] [nvarchar](50) NOT NULL,
	[MaBaiHat] [nvarchar](20) NULL,
	[MaUser] [nvarchar](20) NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPlayList] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUANTRIVIEN]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUANTRIVIEN](
	[MaQuanTri] [nvarchar](20) NOT NULL,
	[TenQTV] [nvarchar](20) NOT NULL,
	[NgaySinh] [nvarchar](20) NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuanTri] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THELOAI]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THELOAI](
	[MaTheLoai] [nvarchar](20) NOT NULL,
	[TenTheLoai] [nvarchar](20) NOT NULL,
	[GhiChu] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTheLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB1', N'Album', N'')
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB101', N'Nhạc Nhật', N'')
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB2', N'Closer', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB21', N'Divide', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB22', N'Album thứ hai', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB24', N'Voicenotes', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB25', N'Album 21', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB3', N'Red Planet', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB4', N'EXODUS', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB6', N'You Never Walk Alone', NULL)
GO
INSERT [dbo].[ALBUM] ([MaAB], [TenAB], [GhiChu]) VALUES (N'AB7', N'YES OR YES', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'111', N'AB1', N'KR2', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'112', N'AB2', N'KR3', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'113', N'AB3', N'KR4', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'114', N'AB4', N'KR6', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'115', N'AB5', N'KR8', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'116', N'AB6', N'KR9', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'117', N'AB7', N'KR10', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'211', N'AB21', N'UK23', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'212', N'AB22', N'US23', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'213', N'AB23', N'US24', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'214', N'AB24', N'US25', NULL)
GO
INSERT [dbo].[ALBUMBAIHAT] ([ma], [MaAB], [MaBH], [GhiChu]) VALUES (N'215', N'AB25', N'UK25', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH101', N'101', N'TL101', N'Ai Wo Komete Umi', N'Nhật Bản', N'/AiWoKometeUmi-AoiTeshima.txt', N'/AiWoKometeUmi-AoiTeshima.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH102', N'102', N'TL101', N'AnataNiDaetteYokatta', N'Nhật Bản', N'/AnataNiDaetteYokatta-Sakura.txt', N'/AnataNiDaetteYokatta-Sakura.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH103', N'103', N'TL101', N'Arrietty’s Song', N'Nhật Bản', N'/Arrietty39sSongJapaneseversion.txt', N'/Arrietty39sSongJapaneseversion.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH104', N'000', N'TL101', N'A Town Where You Can See The Ocean', N'Nhật Bản', N'/ATownWhereYouCanSeeTheOcean-Dang_3e353.txt', N'/ATownWhereYouCanSeeTheOcean-Dang_3e353.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH105', N'104', N'TL101', N'Kaze Ni Naru The Cat Returns', N'Nhật Bản', N'/KazeNiNaruTheCatReturns-AyanoTsu_375mz_hq.txt', N'/KazeNiNaruTheCatReturns-AyanoTsu_375mz_hq.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH106', N'105', N'TL101', N'Lemon', N'Nhật Bản', N'/Lemon-KenshiYonezu-5411306.txt', N'/Lemon-KenshiYonezu-5411306.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH107', N'106', N'TL101', N'Planet', N'Nhật Bản', N'/PLANET-Lambsey.txt', N'/PLANET-Lambsey.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH108', N'101', N'TL101', N'Teru No Uta', N'Nhật Bản', N'/TeruNoUta-AoiTeshima-2698171.txt', N'/TeruNoUta-AoiTeshima-2698171.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH109', N'107', N'TL101', N'Yuki No Hana', N'Nhật Bản', N'/YukiNoHana-Acoustic-Nakashima-Mika.txt', N'/YukiNoHana-Acoustic-Nakashima-Mika.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH110', N'108', N'TL101', N'Yume To Hazakura', N'Nhật Bản', N'/YumeToHazakura-HatsuneMiku.txt', N'/YumeToHazakura-HatsuneMiku.mp3', N'2020-05-28 07:00:00.00', N'TP01', N'2020-05-28 07:00:00.00', N'TP01', N'')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'BH99', N'101', N'TL101', N'BanhMi', N'Mỹ', N'null', N'null', N'7', N'TP01', N'7', N'TP01', N'null')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR1', N'K1', N'C1', N'Any Song', N'Hàn Quốc', N'/AnySong_Zico.txt', N'/AnySongAmuNolae-ZicoBlockB-6203038.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR10', N'K10', N'C1', N'Yes Or Yes', N'Hàn Quốc', N'/YesOrYes_TWICE.txt', N'/YesOrYes-TWICE-5732279.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR2', N'K2', N'C1', N'Beautiful', N'Hàn Quốc', N'/Beautiful_WANNAONE.txt', N'/Beautiful-WANNAONE-5272926.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR3', N'K3', N'C1', N'Closer', N'Hàn Quốc', N'/Closer_OhMyGirl.txt', N'/Closer-OhMyGirl-4139487.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR4', N'K4', N'C1', N'Galaxy', N'Hàn Quốc', N'/Galaxy_BolBBagan4.txt', N'/Galaxy-BolBBalgan4-4599248.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR5', N'K5', N'C1', N'I’ll Show You', N'Hàn Quốc', N'/IWillShowYou_Ailee.txt', N'/IllShowYou-Ailee_4bxch.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR6', N'K6', N'C1', N'Love Me Right', N'Hàn Quốc', N'/ LoveMeRight_EXO.txt', N'/LoveMeRight-EXO-3990476.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR7', N'K7', N'C1', N'On Rainy Day', N'Hàn Quốc', N'/OnRainyDay_BEAST.txt', N'/ OnRainyDay-BEAST_382zy.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR8', N'K8', N'C1', N'Psycho', N'Hàn Quốc', N'/Psycho_RedVelvet.txt', N'/Psycho-RedVelvet-6181261.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'KR9', N'K9', N'C1', N'Spring Day', N'Hàn Quốc', N'/SpringDay_BTS.txt', N'/SpringDay-BTSBangtanBoys-4770072.mp3', N'01/05/2020', N'GH', N'10:00PM 01/05/2020', N'GH', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'TH67', N'107', N'USUK', N'Baby', N'Mỹ', N'Null', N'NUll', N'6', N'TP01', N'6', N'TP01', N'Null')
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'UK21', N'02COM', N'USUK', N'ThatGirl', N'Anh', N'/ThatGirl.txt', N'/ThatGirl. mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'UK22', N'02CSTW', N'USUK', N'Breathless', N'Anh', N'/Breathless .txt', N'/Breathless . mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'UK23', N'02CES', N'USUK', N'Perfect', N'Anh', N'/Perfect .txt', N'/Perfect .mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'UK24', N'02CAW', N'USUK', N'Faced', N'Anh', N'/ Faced.txt', N'/ Faced. mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'UK25', N'02CALD', N'USUK', N'Rolling In The Deep', N'Anh', N'/ RollingInTheDeep.txt', N'/ RollingInTheDeep. mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'US21', N'02CCB', N'USUK', N'Symphony', N'Mỹ', N'/ Symphony.txt', N'Symphony.mp3', N'01/05/2020', N'H02', N'10:00PM 01052020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'US22', N'02CCC', N'USUK', N'Havana', N'Mỹ', N'/Havana.txt', N'/Havana. mp3,', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'US23', N'02CH5', N'USUK', N'Work from home', N'Mỹ', N'/WorkFrom Home.txt', N'/WorkFrom Home. mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'US24', N'02CCP', N'USUK', N'Something Just Like This', N'Mỹ', N'/SomethingJustLikeThis.txt', N'/SomethingJustLikeThis. mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[BAIHAT] ([MaBaiHat], [MaCaSi], [MaTheLoai], [TenBaiHat], [QuocGia], [FileLoiBaiHat], [LinkNhac], [NgayTao], [NguoiTao], [NgayChinhSua], [NguoiChinhSua], [GhiChu]) VALUES (N'US25', N'02CCHP', N'USUK', N'How Long', N'Mỹ', N'/HowLong.txt', N'/HowLong. mp3', N'01/05/2020', N'H02', N'10:00PM 01/05/2020', N'H02', NULL)
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'000', N'Nhạc không lời', N' ', N' ', N' ', N' ')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CALD', N'Adele', N'Nữ', N'Mỹ', N'/Adele.JPG', N'Adele đã nhận được giải Nghệ sĩ mới xuất sắc nhất và trình diễn giọng Pop nữ xuất sắc nhất')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CAW', N'Alan Walker', N'Nam', N'Anh', N'AlanWalker.JPG', N'Ed Sheeran giành giải Nam nghệ sĩ Anh xuất sắc và Nghệ sĩ đột phá tại Brit Awards.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CCB', N'Clean Bandit', N'Nhóm nh?c', N'Anh', N'/CleanBandit.JPG', N'Là một nhóm nhạc điện tử được thành lập tại Cambridge, Anh Quốc vào năm 2009.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CCC', N'Camila Cabello', N'Nữ', N'Mỹ', N'/CamilaCabello.PNJ', N'là một ca sĩ người Mỹ gốc Cuba và từng là thành viên của nhóm nhạc nữ Fifth Harmony')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CCHP', N'Charlie Puth', N'Nam', N'Mỹ', N'/CharliePuth.JPG', N'Là ca sĩ, nhạc sĩ, nhà sản xuất thu âm')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CCP', N'Coldplay', N'Nhóm nh?c nam', N'Anh', N'/Coldplay.JPG', N'Là một ban nhạc rock người Anh thành lập năm 1996')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CES', N'Ed Sheeran', N'Nam', N'Anh', N'/EdSheeran.JPG', N'Là một nam ca sĩ-nhạc sĩ người Anh sinh ra tại Hebden Bridge, Yorkshire')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CH5', N'Fifth Harmony', N'Nhóm nhạc nữ', N'Miami Florida', N'’/FifthHarmony .JPG’', N'Nhóm bao gồm bốn thành viên Lauren Jauregui, Ally Brooke Hernandez, Normani Kordei và Dinah Jane Hansen ')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02COM', N'Onlly Murs', N'Nam', N'Anh', N'/OnllyMurs .JPG', N'Là một ca sĩ, người viết lời bài hát, người dẫn chương trình truyền hình.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'02CSTW', N'Shayne Ward', N'Nam', N'Anh', N'/ShayneWard.JPG', N'Là một ca sĩ nhạc pop người Anh, được biết đến nhiều hơn nhờ chiến thắng của mình tại cuộc thi The X Factor ')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'101', N'Aoi Teshima', N'Nữ', N'Nhật Bản', N'/AoiTeshima-Japan.jpg', N'Teshima Aoi là một nữ ca sĩ, diễn viên lồng tiếng người Nhật Bản')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'102', N'RSP', N'Nữ', N'Nhật Bản', N'/RSP-Japan.jpg', N'Nhóm nhạc RSP viết tắt của Real Street Performance, là nhóm nhạc nổi tiếng của Nhật Bản bao gồm 2 ca sĩ nữ là Ai và Saki')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'103', N'Cécile Corbel', N'Nữ', N'Pháp', N'/CecileCorbel-Phap.jpg', N'Cécile Corbel là một nhạc sĩ, ca sĩ, nghệ sĩ hạc cầm người Pháp.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'104', N'Ayano Tsuji', N'Nữ', N'Nhật Bản', N'/AyanoTsuji-Japan.jpg', N'Ayano Tsuji sinh sống tại Nhật Bản. Cô đã trở nên nổi tiếng sau khi thực hiện ca khúc chủ đề cho bộ phim Studio Ghibli The Cat Returns năm 2002.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'105', N'Yonezu Kenshi', N'Nam', N'Nhật Bản', N'/KenshiYonezu-Japan.jpg', N'Yonezu Kenshi là một ca sĩ- nhạc sĩ sáng tác nhạc pop người Nhật, nhà sản xuất âm nhạc và họa sĩ minh họa đã bắt đầu phát hành nhạc Vocaloid dưới nghệ danh Hachi ')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'106', N'Lambsey', N'Nam', N'Nhật Bản', N'/Lambsey-Japan.jpg', N' ')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'107', N'Nakashima Mika', N'Nữ', N'Nhật Bản', N'/NakashimaMika-Japan.jpg', N'Nakashima Mika là nữ ca sĩ kiêm diễn viên Nhật Bản')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'108', N'Hatsune Miku', N'Nữ', N'Nhật Bản', N'/HatsuneMiku-Japan.png', N'Hatsune Miku là Vocaloid thứ 2 được phát hành cho hệ thống Vocaloid 2 và là Vocaloid đầu tiên sử dụng phiên bản tiếng Nhật của hệ thống này.Giọng cô được tạo bởi một diễn viên lồng tiếng của Nhật tên là Saki Fujita và được chỉnh sửa.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K1', N'Zico', N'Nam', N'Hàn Quốc', N'/Zico.JPG', N'Zico là rapper, nhạc sĩ, nhà sản xuất, đồng thời là trưởng nhóm của ban nhạc nam Hàn Quốc Block B.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K10', N'TWICE', N'Nữ', N'Hàn Quốc', N'/TWICE.JPG', N'TWICE gồm 9 thành viên, là một nhóm nhạc nữ Hàn Quốc được thành lập và quản lý bởi công ty JYP Entertainment.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K2', N'WANNA ONE', N'Nam', N'Hàn Quốc', N'/WANNAONE.JPG', N'Wanna One gồm 11 thành viên, là nhóm nhạc nam Hàn Quốc được thành lập vào tháng 6 năm 2017 bởi công ty CJ E&M thông qua chương trình thực tế sống còn PRODUCE 101 mùa 2 và được quản lý bởi công ty YMC Entertainment.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K3', N'Oh My Girl', N'Nữ', N'Hàn Quốc', N'/OhMyGirl.PNJ', N'Oh My Girl là một nhóm nhạc nữ Hàn Quốc được thành lập và quản lý bởi công ty WM Entertainment. Nhóm gồm 7 thành viên: Hyojung, Mimi, YooA, Seunghee, Jiho, Binnie và Arin.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K4', N'BolBBagan4', N'Nữ', N'Hàn Quốc', N'/ BolBBagan4 .JPG', N'BolBBagan4 là một nhóm nhạc nữ Hàn Quốc do công ty Shofar Music thành lập vào năm 2016, gồm hai thành viên Ahn Ji-young và Woo Ji-yoon.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K5', N'Ailee', N'Nữ', N'Hàn Quốc', N'/Ailee.JPG', N'Ailee là một ca sĩ người Mỹ gốc Hàn Quốc trực thuộc Rocket3 Entertainment ở Hàn Quốc và Warner Music ở Nhật Bản.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K6', N'EXO', N'Nam', N'Hàn Quốc', N'/EXO.JPG', N'EXO là một nhóm nhạc nam Hàn-Trung do công ty SM Entertainment quản lý.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K7', N'BEAST', N'Nam', N'Hàn Quốc', N'/BEAST.JPG', N'Nhóm có tên mới là Hightlight')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K8', N'Red Velvet', N'Nữ', N'Hàn Quốc', N'/RedVelvet.JPG', N'Red Velvet là một nhóm nhạc nữ Hàn Quốc được thành lập và quản lý bởi công ty SM Entertainment.')
GO
INSERT [dbo].[CASI] ([MaCaSi], [TenCaSi], [GioiTinh], [QuocTich], [HinhAnh], [GhiChu]) VALUES (N'K9', N'BTS', N'Nam', N'Hàn Quốc', N'/BTS.JPG', N'BTS gồm 7 thành viên, là một nhóm nhạc nam Hàn Quốc được thành lập và quản lý bởi công ty Big Hit Entertainment.')
GO
INSERT [dbo].[NGUOIDUNG] ([MaUser], [TenUser], [MatKhau], [NgaySinh], [GioiTinh], [GhiChu]) VALUES (N'U02', N'Thu Hiền', N'1754052019', N'30/08/1999', N'Nữ', NULL)
GO
INSERT [dbo].[NGUOIDUNG] ([MaUser], [TenUser], [MatKhau], [NgaySinh], [GioiTinh], [GhiChu]) VALUES (N'U1', N'Gia Hân', N'123456789', N'06/08/1999', N'Nữ', NULL)
GO
INSERT [dbo].[PLAYLIST] ([MaPlayList], [TenPlaylist], [MaBaiHat], [MaUser], [GhiChu]) VALUES (N'PL1', N'My favorite songs', N'KR9', N'U1', NULL)
GO
INSERT [dbo].[PLAYLIST] ([MaPlayList], [TenPlaylist], [MaBaiHat], [MaUser], [GhiChu]) VALUES (N'PL2', N'My favorite songs', N'UK23', N'U02', NULL)
GO
INSERT [dbo].[QUANTRIVIEN] ([MaQuanTri], [TenQTV], [NgaySinh], [GhiChu]) VALUES (N'GH', N'Gia Hân', N'06/08/1999', NULL)
GO
INSERT [dbo].[QUANTRIVIEN] ([MaQuanTri], [TenQTV], [NgaySinh], [GhiChu]) VALUES (N'H02', N'Thu Hiền', N'30/08/1999', NULL)
GO
INSERT [dbo].[QUANTRIVIEN] ([MaQuanTri], [TenQTV], [NgaySinh], [GhiChu]) VALUES (N'QTV2', N'Trang', N'29/5/99', N'')
GO
INSERT [dbo].[QUANTRIVIEN] ([MaQuanTri], [TenQTV], [NgaySinh], [GhiChu]) VALUES (N'TP01', N'Thanh Phụng', N'29/06/1999', N'')
GO
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [GhiChu]) VALUES (N'C1', N'Nhạc Hàn Quốc', N'Kpop là một thể loại âm nhạc có nguồn gốc từ Hàn Quốc đặc trưng bởi rất nhiều các yếu tố nghe nhìn trực quan. Nhiều nghệ sĩ và nhóm nhạc đã xuất phát từ Hàn Quốc và đã trở nên phổ biến ở nhiều nước trên thế giới.')
GO
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [GhiChu]) VALUES (N'TL101', N'Nhạc Nhật', N'Âm nhạc Nhật Bản bao gồm nhiều thể loại với nhiều cách thể hiện khác nhau trong cả âm nhạc hiện đại lẫn truyền thống. Âm nhạc trong tiếng Nhật gọi là 音楽, là sự kết hợp của 2 từ kanji 音 "On" với kanji 楽 "gaku"')
GO
INSERT [dbo].[THELOAI] ([MaTheLoai], [TenTheLoai], [GhiChu]) VALUES (N'USUK', N'Nhạc Âu Mỹ', N'là âm nhạc đại chúng của đa số các quốc gia nói tiếng Anh là Hoa Kỳ (Mỹ) và Vương quốc Liên hiệp Anh và Bắc Ireland (Anh Quốc) cũng như một số quốc gia châu Âu và Mỹ Latinh khác.')
GO
ALTER TABLE [dbo].[ALBUMBAIHAT]  WITH NOCHECK ADD FOREIGN KEY([MaAB])
REFERENCES [dbo].[ALBUM] ([MaAB])
GO
ALTER TABLE [dbo].[ALBUMBAIHAT]  WITH NOCHECK ADD FOREIGN KEY([MaBH])
REFERENCES [dbo].[BAIHAT] ([MaBaiHat])
GO
ALTER TABLE [dbo].[BAIHAT]  WITH NOCHECK ADD FOREIGN KEY([MaCaSi])
REFERENCES [dbo].[CASI] ([MaCaSi])
GO
ALTER TABLE [dbo].[BAIHAT]  WITH NOCHECK ADD FOREIGN KEY([MaTheLoai])
REFERENCES [dbo].[THELOAI] ([MaTheLoai])
GO
ALTER TABLE [dbo].[BAIHAT]  WITH NOCHECK ADD FOREIGN KEY([NguoiTao])
REFERENCES [dbo].[QUANTRIVIEN] ([MaQuanTri])
GO
ALTER TABLE [dbo].[PLAYLIST]  WITH NOCHECK ADD FOREIGN KEY([MaBaiHat])
REFERENCES [dbo].[BAIHAT] ([MaBaiHat])
GO
ALTER TABLE [dbo].[PLAYLIST]  WITH NOCHECK ADD FOREIGN KEY([MaUser])
REFERENCES [dbo].[NGUOIDUNG] ([MaUser])
GO
/****** Object:  StoredProcedure [dbo].[SelSearchBaiHat]    Script Date: 6/22/2020 11:50:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Ho Thi Thanh Phung
-- Create date: 20/6/20
-- Description:	Xuat bang bai hat
-- Run: exec SelSearchBaiHat teru,1,1
-- =============================================
CREATE PROCEDURE [dbo].[SelSearchBaiHat] 
	-- Add the parameters for the stored procedure here
	@Ten nvarchar(20) = null,
	@page int = null,
	@size int = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @start int= (@page-1)*@size +1;
	declare @end int = @page*@size;

	with s as(
	Select ROW_NUMBER() over (order by TenBaiHat desc) AS STT,
	a.TenBaiHat AS 'Tên Bài Hát', a.QuocGia AS 'Quốc Gia', b.TenCaSi AS 'Ca Sĩ', c.TenTheLoai AS 'Thể Loại', a.GhiChu AS 'Ghi Chú'
	From ((BAIHAT a inner join CASI b on a.MaCaSi = b.MaCaSi) 
		inner join THELOAI c on a.MaTheLoai = c.MaTheLoai)
	where TenBaiHat LIKE '%'+@Ten+'%'
	
	)
	select * 
	from s 
	where STT between @start and @end
END
GO
