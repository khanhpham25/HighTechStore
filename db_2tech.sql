USE [master]
GO
if exists(select * from sys.databases where name='db_2tech')
drop database db_2tech
go
/****** Object:  Database [db_2tech]    Script Date: 12/28/2016 12:13:16 AM ******/
CREATE DATABASE [db_2tech]
GO
USE [db_2tech]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](200) NOT NULL,
	[MoTa] [nvarchar](500) NOT NULL,
	[HinhAnh] [nvarchar](100) NOT NULL,
	[NgayDang] [smalldatetime] NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaDanhMuc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuanBaiViet]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanBaiViet](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiBinhLuan] [nvarchar](100) NOT NULL,
	[NgayGio] [smalldatetime] NOT NULL,
	[NoiDung] [nvarchar](300) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaBaiViet] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuanSanPham]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuanSanPham](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[TenNguoiBinhLuan] [nvarchar](100) NOT NULL,
	[NgayGio] [smalldatetime] NOT NULL,
	[NoiDung] [nvarchar](300) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaSP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[MaMau] [int] NOT NULL,
	[DonGia] [float] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC,
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucBaiViet]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucBaiViet](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucSanPham]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSanPham](
	[MaDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [smalldatetime] NOT NULL,
	[TinhTrangGiaoHang] [bit] NOT NULL,
	[GhiChu] [nvarchar](200) NOT NULL,
	[MaKhachHang] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[MaHinhAnh] [int] IDENTITY(1,1) NOT NULL,
	[TenHinhAnh] [nvarchar](100) NOT NULL,
	[MaSP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHinhAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SoDienThoai] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[TenDangNhap] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[PhanLoai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhanHoi]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanHoi](
	[MaPhanHoi] [int] IDENTITY(1,1) NOT NULL,
	[NgayGio] [smalldatetime] NOT NULL,
	[NoiDung] [ntext] NOT NULL,
	[MaKhachHang] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhanHoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TenAdmin] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[TenDangNhap] [varchar](100) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
	[PhanQuyen] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[GiaSP] [float] NOT NULL,
	[GiaKhuyenMai] [float] NULL,
	[ThongSoKyThuat] [ntext] NOT NULL,
	[BaoHanh] [nvarchar](50) NOT NULL,
	[PhuKienDiKem] [nvarchar](100) NOT NULL,
	[NgayCapNhat] [date] NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[MaDanhMuc] [int] NOT NULL,
	[MaThuongHieu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham_MauSac]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_MauSac](
	[MaSP] [int] NOT NULL,
	[MaMau] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaThuongHieu] [int] IDENTITY(1,1) NOT NULL,
	[TenThuongHieu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThuongHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (1, N'Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn?', N'Phác họa chân dung hai chiếc smartphone đáng chú ý nhất trong năm 2017 dựa trên những tin đồn ở thời điểm hiện tại.', N'news1.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p>Sau sự cố với&nbsp;<a href="http://kenh14.vn/samsung.html" target="_blank">Samsung</a>&nbsp;Galaxy Note7, mọi sự cố gắng của Samsung đang đổ dồn về chiếc Samsung&nbsp;<a href="http://kenh14.vn/galaxy-s8.html" target="_blank">Galaxy S8</a>&nbsp;để lấy lại niềm tin từ ph&iacute;a người d&ugrave;ng. Si&ecirc;u phẩm n&agrave;y của &ocirc;ng lớn c&ocirc;ng nghệ H&agrave;n Quốc d&ugrave; vậy phải th&aacute;ng th&aacute;ng 2 năm sau mới tr&igrave;nh n&agrave;y. Trong khi đ&oacute;,&nbsp;<a href="http://kenh14.vn/apple.html" target="_blank">Apple</a>&nbsp;c&ograve;n gần một năm nữa mới cho ra iPhone mới (được cho l&agrave; sẽ mang t&ecirc;n gọi&nbsp;<a href="http://kenh14.vn/iphone-8.html" target="_blank">iPhone 8</a>). Năm 2017 l&agrave; một năm đặc biệt của Apple bởi n&oacute; l&agrave; năm đ&aacute;nh dấu h&agrave;nh tr&igrave;nh 10 năm iPhone.</p>

<p>R&otilde; r&agrave;ng, cả người d&ugrave;ng Apple v&agrave; Samsung đều c&oacute; l&yacute; do để k&igrave; vọng Samsung Galaxy S8 v&agrave; iPhone 8 sẽ l&agrave; những chiếc&nbsp;<a href="http://kenh14.vn/smartphone.html" target="_blank">smartphone</a>&nbsp;mang đến nhiều bất ngờ.</p>

<p><strong>1. Thiết kế</strong></p>

<p><a href="http://kenh14cdn.com/2016/photo-1-1478962740898.jpg" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 1." src="http://kenh14cdn.com/thumb_w/650/2016/photo-1-1478962740898.jpg" /></a></p>

<p>Samsung Galaxy S8 được dự đo&aacute;n sẽ kh&ocirc;ng c&oacute; thay đổi lớn về thiết kế so với chiếc Galaxy S7.</p>

<p>Trong v&agrave;i năm trở lại đ&acirc;y, Samsung đang tập trung ho&agrave;n thiện ng&ocirc;n ngữ thiết kế nh&ocirc;m - k&iacute;nh tr&ecirc;n d&ograve;ng sản phẩm cao cấp của m&igrave;nh thay v&igrave; thử nghiệm, thay đổi ngoại h&igrave;nh mới. V&igrave; thế, nhiều khả năng Samsung Galaxy S8 sẽ c&oacute; thiết kế tương tự thiết bị tiền nhiệm. Mặt lưng cấu th&agrave;nh từ k&iacute;nh cho ph&eacute;p Samsung t&iacute;ch hợp c&ocirc;ng nghệ sạc kh&ocirc;ng d&acirc;y dễ d&agrave;ng hơn trong khi đ&oacute; m&agrave;n h&igrave;nh cong tạo cmr gi&aacute;c độc đ&aacute;o v&agrave; sang trọng cần thiết tr&ecirc;n m&ocirc;t sản phảm cao cấp.</p>

<p>Một số nguồn tin cho biết, Samsung Galaxy S8 sẽ c&oacute; hai phi&ecirc;n bản với k&iacute;ch thước m&agrave;n h&igrave;nh 5,1 inch v&agrave; 5,5 inch. Cả hai đều c&oacute; m&agrave;n h&igrave;nh cong tr&agrave;n hai cạnh, điều n&agrave;y đồng nghĩa với việc t&ecirc;n gọi Galaxy S Edge c&oacute; thể sẽ bị khai tử. Ngo&agrave;i ra, kh&ocirc;ng loại trừ khả năng n&uacute;t Home vật l&yacute; tr&ecirc;n Samsung Galaxy S8 sẽ bị khai tử v&agrave; cảm biến v&acirc;n tay sẽ được t&iacute;ch hợp trực tiếp xuống dưới m&agrave;n h&igrave;nh.</p>

<p><a href="http://kenh14cdn.com/2016/photo-1-1478962827323.jpg" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 2." src="http://kenh14cdn.com/thumb_w/650/2016/photo-1-1478962827323.jpg" /></a></p>

<p>Thiết kế nh&ocirc;m - k&iacute;nh từng rất được y&ecirc;u th&iacute;ch tr&ecirc;n những model như iPhoe 4/ 4s.</p>

<p>Kh&aacute;c với Samsung Galaxy S8, iPhone 8 được k&igrave; vọng sẽ đ&oacute;n nhận những thay đổi đ&aacute;ng kể về thiết kế trong năm tới. Điều n&agrave;y cũng rất dễ hiểu bởi người d&ugrave;ng đ&atilde; qu&aacute; &quot;sốt ruột&quot; sau khi Apple kh&ocirc;ng cịu thay đổi thiết kế trong suốt ba năm qua. Nhiều b&aacute;o c&aacute;o khẳng định iPhone trong năm tới sẽ sử dụng thiết kế hai mặt k&iacute;nh c&ugrave;ng khung viền cấu th&agrave;nh từ hoặc th&eacute;p kh&ocirc;ng gỉ hoặc nh&ocirc;m. Tuy nhi&ecirc;n, cũng c&oacute; tin đồn cho rằng iPhone mới c&oacute; th&acirc;n m&aacute;y bằng gốm. chất liệu được cho l&agrave; bền hơn cả th&eacute;p kh&ocirc;ng gỉ v&agrave; đ&atilde; được Apple &quot;thử nghiệm&quot; tr&ecirc;n Apple Watch series 2.</p>

<p>Người d&ugrave;ng cũng c&oacute; thể k&igrave; vọng iPhone 8 sẽ c&oacute; viền m&agrave;n h&igrave;nh mỏng hơn v&agrave; kh&ocirc;ng loại trừ khả năng m&aacute;y cũng sẽ c&oacute; m&agrave;n h&igrave;nh cong tương tự những g&igrave; Samsung đang thực hiện tr&ecirc;n si&ecirc;u phẩm của m&igrave;nh. N&uacute;t Home tr&ecirc;n iPhone 8 cũng c&oacute; thể sẽ được loại bỏ để tiết kiệm kh&ocirc;ng gian mặt trước. Người d&ugrave;ng sẽ c&oacute; c&aacute;c phương thực mở kh&oacute;a mới trong khi đ&oacute; cảm biến v&acirc;n tay được t&iacute;ch hợp xuống dưới m&agrave;n h&igrave;nh.</p>

<p>Như vậy, c&oacute; thể thấy, theo xu hướng tin đồn hiện tại, iPhone năm tới sẽ c&oacute; nhiều thay đổi về thiết kế hơn so với Samsung Galaxy S thế hệ mới.</p>

<p><strong>2. M&agrave;n h&igrave;nh</strong></p>

<p><a href="http://kenh14cdn.com/2016/photo-1-1478962868497.jpg" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 3." src="http://kenh14cdn.com/2016/photo-1-1478962868497.jpg" /></a></p>

<p>Apple sẽ tăng k&iacute;ch thước m&agrave;n h&igrave;nh tr&ecirc;n iPhone mới?</p>

<p>Dẫn lời c&aacute;c đối t&aacute;c trong chuỗi cung ứng linh kiện của Apple, hai nh&agrave; ph&acirc;n t&iacute;ch Blayne Curtis v&agrave; Christopher Hemmelgarn mới đ&acirc;y cho biết iPhone mới c&oacute; thể c&oacute; k&iacute;ch thước m&agrave;n h&igrave;nh lớn hơn phi&ecirc;n bản hiện tại, cụ thể l&agrave; 5 inch v&agrave; 5,8 inch. Đ&aacute;ng ch&uacute; &yacute;, Apple nhiều khả năng sẽ chuyển sang sử dụng tấm nền m&agrave;n h&igrave;nh OLED với khả năng hiển thị m&agrave;u sắc được đ&aacute;nh gi&aacute; cao hơn v&agrave; m&agrave;u đen s&acirc;u hơn. Cũng theo ph&acirc;n t&iacute;ch mới nhất n&agrave;y, Samsung v&agrave; LG sẽ l&agrave; hai trong số những đối t&aacute;c cung cấp m&agrave;n h&igrave;nh OLED lớn nhất cho iPhone trong năm sau.</p>

<p><a href="http://kenh14cdn.com/2016/photo-1-1478962939391.jpg" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 4." src="http://kenh14cdn.com/thumb_w/650/2016/photo-1-1478962939391.jpg" /></a></p>

<p>Galaxy S8 tất cả c&aacute;c phi&ecirc;n bản đều sẽ c&oacute; thể c&oacute; m&agrave;n h&igrave;nh cong c&ugrave;ng độ ph&acirc;n giải được n&acirc;ng l&ecirc;n 4K.</p>

<p>C&ugrave;ng l&uacute;c, theo AndroidCentral, Samsung Galaxy S8 c&oacute; thể sẽ chứng kiến một n&acirc;ng cấp lớn về th&ocirc;ng số m&agrave;n h&igrave;nh. Dẫn lời b&aacute;o ch&iacute; H&agrave;n Quốc, trang n&agrave;y cho biết m&aacute;y c&oacute; thể được trang bị m&agrave;n h&igrave;nh l&ecirc;n tới 4K. Mặc d&ugrave; mắt con người kh&ocirc;ng thể nhận ra r&otilde; r&agrave;ng những kh&aacute;c biệt do m&agrave;n h&igrave;nh 4K mang lại, loại m&agrave;n h&igrave;nh n&agrave;y sẽ mang đến một trải nghiệm chưa từng c&oacute; cho c&ocirc;ng nghệ thực tế ảo (VR). Hi&ecirc;n nay, Sony Xperia Z5 Premium đang l&agrave; chiếc điện thoại thương mại phổ biến nhất c&oacute; m&agrave;n h&igrave;nh 4K. D&ugrave; vậy, t&iacute;nh năng 4K chỉ được k&iacute;ch hoạt khi người d&ugrave;ng xem ảnh hoặc xem phim định dạng Ultra HD. Ở c&aacute;c ứng dụng th&ocirc;ng thường, Sony chỉ k&iacute;ch hoạt chế độ hiển thị QHD để tiết kiệm pi.</p>

<p><strong>3. Camera</strong></p>

<p><a href="http://kenh14cdn.com/2016/photo-1-1478962987301.jpg" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 5." src="http://kenh14cdn.com/thumb_w/650/2016/photo-1-1478962987301.jpg" /></a></p>

<p>Cuộc đua về camera của hai &ocirc;ng lớn Samsung v&agrave; Apple cũng sẽ rất hấp dẫn.</p>

<p>Về camera, Samsung đang tập trung v&agrave;o cải thiện khả năng chụp h&igrave;nh thiếu s&aacute;ng tr&ecirc;n thiết bị của m&igrave;nh trong năm 2016 v&agrave; xu hướng n&agrave;y được k&igrave; vọng sẽ tiếp tục tr&ecirc;n chiếc Galaxy S tiếp theo. KnowYourMobile cho rằng Samsung Galaxy S8 sẽ c&oacute; camera trước 12 MP v&agrave; camera sau k&eacute;p th&ocirc;ng số 16 MP. Về camera tr&ecirc;n chiếc iPhone mới, rất tiếc chưa c&oacute; nhiều th&ocirc;ng tin xuất hiện. Một số trang c&ocirc;ng nghệ cho rằng về mặt th&ocirc;ng số camera tr&ecirc;n iPhone 8 sẽ kh&ocirc;ng c&oacute; n&acirc;ng cấp đ&aacute;ng kể. Apple thay v&agrave;o đ&oacute; cải thiện chất lượng h&igrave;nh ảnh th&ocirc;ng qua những tinh chỉnh về phần mềm v&agrave; c&aacute;c yếu tố kh&aacute;c trong cụm camera hơn l&agrave; th&ocirc;ng số.</p>

<p><strong>4. Một số t&iacute;nh năng kh&aacute;c</strong></p>

<p><a href="http://kenh14cdn.com/2016/du1-1478964290956-1478964361817.png" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 6." src="http://kenh14cdn.com/2016/du1-1478964290956-1478964361817.png" /></a></p>

<p>Cấu h&igrave;nh dự đo&aacute;n Samsung Galaxy S8.</p>

<p>Samsung Galaxy S8 được k&igrave; vọng sẽ c&oacute; cảm biến mống mắt. Điều n&agrave;y cũng kh&ocirc;ng kh&oacute; xảy ra bởi thực tế trước đ&oacute; Samsung đ&atilde; &aacute;p dụng c&ocirc;ng nghệ n&agrave;y tr&ecirc;n chiếc Samsung Galaxy Note7. Đ&aacute;ng ch&uacute; &yacute; nhất, Samsung Galaxy S8 c&oacute; thể sẽ c&oacute; sự xuất hiện của một trợ l&yacute; ảo mang tr&iacute; th&ocirc;ng minh nh&acirc;n tạo Đ&acirc;y l&agrave; kết quả của thương vụ th&acirc;u t&oacute;m c&ocirc;ng ty Viv của &ocirc;ng lớn c&ocirc;ng nghệ H&agrave;n Quốc.</p>

<p>Theo một nguồn tin, với Viv, Samsung c&oacute; thể mang đến nhiều trải nghiệm dịch vụ chưa từng c&oacute; cho người d&ugrave;ng, bao gồm việc đơn giản h&oacute;a giao diện người d&ugrave;ng, hiểu ngữ cảnh người d&ugrave;ng để mang đến những gợi &yacute;, trợ gi&uacute;p th&iacute;ch hợp v&agrave; tiện lợi nhất.</p>

<p><a href="http://kenh14cdn.com/2016/du2-1478964290958-1478964381830.png" target="_blank"><img alt="Samsung Galaxy S8 và iPhone 8: Smartphone nào hấp dẫn hơn? - Ảnh 7." src="http://kenh14cdn.com/2016/du2-1478964290958-1478964381830.png" /></a></p>

<p>Cấu h&igrave;nh dự đo&aacute;n iPhone 8.</p>

<p>Trong khi đ&oacute;, t&iacute;nh năng th&ecirc;m th&uacute; vị nhất c&oacute; thể sẽ xuất hiện tr&ecirc;n chiếc iPhone tiếp theo l&agrave; c&ocirc;ng nghệ sạc kh&ocirc;ng d&acirc;y. Cũng kh&ocirc;ng loại trừ Apple sẽ trang bị cảm biến sinh trắc mới, cụ thể l&agrave; cảm biến mống mắt tr&ecirc;n si&ecirc;u phẩm của m&igrave;nh.</p>
', 1, 1)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (2, N'Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn', N'Màn hình tràn viền xưa rồi, iPhone 8 edge sẽ có màn hình ôm luôn cả viền!', N'news2.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p>Nhiều fan T&aacute;o đang mong chờ phi&ecirc;n bản&nbsp;<a href="http://kenh14.vn/iphone.html" target="_blank">iPhone</a>&nbsp;tiếp theo sẽ thay đổi nhiều hơn về mặt thiết kế, trong đ&oacute; kh&ocirc;ng &iacute;t người hy vọng&nbsp;<a href="http://kenh14.vn/iphone-8.html" target="_blank">iPhone 8</a>&nbsp;sẽ c&oacute; ngoại h&igrave;nh l&agrave;m bằng k&iacute;nh cả ở mặt sau giống như Apple từng l&agrave;m tr&ecirc;n iPhone 4 v&agrave; iPhone 4s.</p>

<p>B&ecirc;n cạnh đ&oacute;, cũng c&oacute; tin đồn cho rằng iPhone 8 sẽ được trang bị m&agrave;n h&igrave;nh tr&agrave;n viền giống với chiếc Galaxy S7 edge của Samsung. Với những tin đồn n&agrave;y, k&ecirc;nh YouTube Techconfigurations đ&atilde; tổng hợp lại v&agrave; đưa ra một &yacute; tưởng iPhone 8 edge ho&agrave;n to&agrave;n mới, m&agrave;n h&igrave;nh giờ đ&acirc;y kh&ocirc;ng c&ograve;n l&agrave; tr&agrave;n viền nữa m&agrave;... &ocirc;m lu&ocirc;n cả viền!</p>

<p><a href="http://kenh14cdn.com/2016/giphy-2-1478933869689.gif" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 2." src="http://kenh14cdn.com/2016/giphy-2-1478933869689.gif.png" style="width:500px" /></a></p>

<p>M&agrave;n h&igrave;nh 5,5 inch &ocirc;m viền, ph&iacute;m Home cảm ứng, cảm biến v&acirc;n tay được đặt ch&igrave;m dưới m&agrave;n h&igrave;nh.</p>

<p>Tất nhi&ecirc;n phần hiển thị ở cạnh viền m&aacute;y kh&ocirc;ng phải chỉ để cho vui, n&oacute; sẽ được t&ugrave;y biến theo từng ứng dụng m&agrave; bạn đang d&ugrave;ng.&nbsp;Bạn cũng kh&ocirc;ng phải lo về vấn đề chạm nhầm v&agrave;o cạnh viền, bởi n&oacute; chỉ được k&iacute;ch hoạt t&ugrave;y theo ngữ cảnh sử dụng m&agrave; th&ocirc;i.</p>

<p><a href="http://kenh14cdn.com/2016/giphy-1478933582824.gif" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 3." src="http://kenh14cdn.com/2016/giphy-1478933582824.gif.png" style="width:500px" /></a></p>

<p>Hiển thị th&ocirc;ng tin ở cạnh viền.</p>

<p>Ngo&agrave;i ra, iPhone 8 edge n&agrave;y cũng được trang bị 4 loa ngo&agrave;i đem lại chất lượng &acirc;m thanh tốt hơn, t&iacute;ch hợp c&ocirc;ng nghệ &acirc;m thanh v&ograve;m 3D. Cảm biến mống mắt cũng được đưa v&agrave;o m&agrave;n h&igrave;nh trước, gi&uacute;p người d&ugrave;ng bảo mật thiết bị tốt hơn.</p>

<p><a href="http://kenh14cdn.com/2016/giphy-1-1478933601284.gif" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 4." src="http://kenh14cdn.com/2016/giphy-1-1478933601284.gif.png" style="width:500px" /></a></p>

<p>C&aacute;c phần điều chỉnh th&ocirc;ng số camera được đưa ra cạnh viền.</p>

<p>Cảm biến v&acirc;n tay được đặt ẩn dưới m&agrave;n h&igrave;nh, giống với những tin đồn trước đ&acirc;y. M&aacute;y được l&agrave;m bằng k&iacute;nh n&ecirc;n sẽ c&oacute; nguy cơ dễ vỡ, v&igrave; thế Techconfigurations cho biết mẫu thiết kế n&agrave;y sẽ được trang bị k&iacute;nh cường lực Gorilla Glass 5 để gi&uacute;p m&aacute;y bền chắc hơn.</p>

<p><a href="http://kenh14cdn.com/2016/iphone-8-edge-concept-all-glass-design-1-1478933808958.jpg" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 5." src="http://kenh14cdn.com/thumb_w/650/2016/iphone-8-edge-concept-all-glass-design-1-1478933808958.jpg" /></a></p>

<p>M&aacute;y được trang bị cụm camera k&eacute;p ở mặt sau.</p>

<p><a href="http://kenh14cdn.com/2016/iphone-8-edge-concept-all-glass-design-2-1478933808963.jpg" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 6." src="http://kenh14cdn.com/thumb_w/650/2016/iphone-8-edge-concept-all-glass-design-2-1478933808963.jpg" /></a></p>

<p><a href="http://kenh14cdn.com/2016/iphone-8-edge-concept-all-glass-design-3-1478933808966.jpg" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 7." src="http://kenh14cdn.com/thumb_w/650/2016/iphone-8-edge-concept-all-glass-design-3-1478933808966.jpg" /></a></p>

<p><a href="http://kenh14cdn.com/2016/iphone-8-edge-concept-all-glass-design-5-1478933808968.jpg" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 8." src="http://kenh14cdn.com/thumb_w/650/2016/iphone-8-edge-concept-all-glass-design-5-1478933808968.jpg" /></a></p>

<p><a href="http://kenh14cdn.com/2016/iphone-8-edge-concept-all-glass-design-7-1478933808972.jpg" target="_blank"><img alt="Nếu thích iPhone 8 thiết kế bằng kính, đây chính là mẫu ý tưởng hoàn hảo dành cho bạn - Ảnh 9." src="http://kenh14cdn.com/thumb_w/650/2016/iphone-8-edge-concept-all-glass-design-7-1478933808972.jpg" /></a></p>
', 1, 1)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (3, N'Cơn sốt Galaxy Note 7 – 6 lý do nên mua ngay ', N'Trong ngày đầu tiên mở bán 19/08 Samsung Galaxy Note 7 đã đạt mức doanh số cực kỳ ấn tượng. Tại sao sản phẩm lại được nhiều người săn lùng đến vậy?', N'news3.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p>Sau nhiều th&aacute;ng ảm đạm th&igrave; thị trường c&ocirc;ng nghệ đang bắt đầu s&ocirc;i động trở lại với sự xuất hiện của si&ecirc;u phẩm Note 7 đến từ thương hiệu t&ecirc;n tuổi Samsung. &nbsp;Trong ng&agrave;y mở b&aacute;n đầu ti&ecirc;n, Samsung Note 7 đ&atilde; mang đến&nbsp;doanh số v&ocirc; c&ugrave;ng ấn tượng so với sản phẩm tiền nhiệm Note 5. C&ugrave;ng điểm qua những thế mạnh v&agrave; ưu điểm nổi bật tạo n&ecirc;n sức h&uacute;t của sản phẩm kể tr&ecirc;n</p>

<p><img src="http://www.techone.vn/image/cache/upload/news/2016/8/20/4268/4268_img1.jpg" /></p>

<ol>
	<li>
	<p><strong>Cấu h&igrave;nh xứng danh Si&ecirc;u phẩm</strong></p>
	</li>
</ol>

<p>Samsung Note 7 với Cấu h&igrave;nh mạnh xứng tầm si&ecirc;u phẩm:</p>

<ul>
	<li>
	<p>M&agrave;n h&igrave;nh cong hai cạnh Super AMOLED 5,7 inch Quad HD (518ppi),</p>
	</li>
	<li>
	<p>Chip xử l&yacute; 8 nh&acirc;n cấu tr&uacute;c 64 bit,</p>
	</li>
	<li>
	<p>RAM 4 GB v&agrave; ROM 64GB</p>
	</li>
	<li>
	<p>Pin 3.500 mAh (hỗ trợ sạc nhanh cho cả phương thức sạc kh&ocirc;ng d&acirc;y v&agrave; sạc c&oacute; d&acirc;y).</p>
	</li>
</ul>

<p>Với cấu h&igrave;nh như tr&ecirc;n, Note 7 hiện kh&ocirc;ng thua k&eacute;m bất cứ 1 si&ecirc;u phẩm n&agrave;o kh&aacute;c tr&ecirc;n thị trường</p>

<ol>
	<li>
	<p><strong>Ti&ecirc;u chuẩn chống nước IP68</strong></p>
	</li>
</ol>

<p>Note 7 l&agrave; d&ograve;ng Note đầu ti&ecirc;n sở hữu khả năng chống nước đạt ti&ecirc;u chuẩn IP68 ở cả m&aacute;y v&agrave; S-Pen. Kh&ocirc;ng cần nắp che c&aacute;c cổng kết nối v&agrave; m&aacute;y c&oacute; thể ng&acirc;m nước ở độ s&acirc;u 1,5 m trong v&ograve;ng 30 ph&uacute;t li&ecirc;n tục. Ngo&agrave;i ra chiếc b&uacute;t S-Pen của Note 7 vẫn c&oacute; thể sử dụng b&igrave;nh thường khi ở dưới nước. Đ&acirc;y l&agrave; điều m&agrave; chiếc S-Pen tr&ecirc;n Note 5 kh&ocirc;ng thể l&agrave;m được</p>

<p><img src="http://www.techone.vn/image/cache/upload/news/2016/8/20/4268/4268_img2.jpg" /></p>

<ol>
	<li>
	<p><strong>C&ocirc;ng nghệ mở kh&oacute;a m&agrave;n h&igrave;nh si&ecirc;u bảo mật bằng mống mắt</strong></p>
	</li>
</ol>

<p>Ngo&agrave;i c&ocirc;ng nghệ sinh trắc học cảm biến v&acirc;n tay, người d&ugrave;ng c&oacute; thể mở kh&oacute;a bằng mắt với sự trợ gi&uacute;p của cảm biến qu&eacute;t mống mắt. C&ocirc;ng nghệ nhận dạng mống mắt (Iris Recognition) l&agrave; phương ph&aacute;p sử dụng thuật to&aacute;n h&igrave;nh ảnh để nhận dạng một người n&agrave;o đ&oacute; dựa v&agrave;o cấu tr&uacute;c phức tạp v&agrave; độc nhất của mống mắt, thậm ch&iacute; ngay cả khi họ đang đeo k&iacute;nh hoặc sử dụng &aacute;p tr&ograve;ng từ một khoảng c&aacute;ch nhất định.</p>

<p><img src="http://www.techone.vn/image/cache/upload/news/2016/8/20/4268/4268_img3.jpg" /></p>

<p>Mống mắt của con người được h&igrave;nh th&agrave;nh từ 10 th&aacute;ng tuổi, v&agrave; kh&ocirc;ng thay đổi trong suốt cuộc đời của mỗi người. V&igrave; vậy khả năng bảo mật được xem l&agrave; tuyệt đối. Qu&eacute;t mống mắt được c&ocirc;ng nhận l&agrave; qu&aacute; tr&igrave;nh x&aacute;c thực tốt nhất hiện nay, &nbsp;sẽ kh&ocirc;ng c&oacute; nhầm lẫn &ndash; x&aacute;c xuất hai mống mắt giống nhau ho&agrave;n to&agrave;n l&agrave; gần như kh&ocirc;ng thể</p>

<ol>
	<li>
	<p><strong>Camera hỗ trợ chụp thiếu s&aacute;ng cực tốt</strong></p>
	</li>
</ol>

<p>Camera với C&ocirc;ng nghệ Dual Pixel 12MP (F1.7), chống rung quang học OIS + 5MP (F1.7). hỗ trợ chụp thiếu s&aacute;ng cực tốt. Note 7 c&oacute; camera giống với S7 Edge v&igrave; vậy chất lượng h&igrave;nh ảnh cực kỳ tuyệt vời.</p>

<p><img src="http://www.techone.vn/image/cache/upload/news/2016/8/20/4268/4268_img4.jpg" /></p>

<ol>
	<li>
	<p><strong>Những điểm mới kh&aacute;c</strong></p>
	</li>
</ol>

<ul>
	<li>
	<p>Sở hữu 1 m&agrave;n h&igrave;nh uốn cong với k&iacute;nh cường lực Gorilla Glass 5 (rơi 1,5 m&eacute;t kh&ocirc;ng lo vỡ k&iacute;nh), nh&ocirc;m Series 7000, viền m&agrave;n h&igrave;nh si&ecirc;u mảnh 1.1mm</p>
	</li>
	<li>
	<p>Cổng kết nối USB &ndash; C - chuẩn USB mới nhất ( USB 3.1) thay thế cho 5 kết nối :HDMI, VGA, USB, DisplayPort v&agrave; cổng sạc.</p>
	</li>
</ul>

<ol>
	<li>
	<p><strong>Ưu đ&atilde;i Vip đặc quyền Samsung Elite cho chủ sở hữu Note 7</strong></p>
	</li>
</ol>

<ul>
	<li>
	<p>G&oacute;i bảo hiềm tai nạn bất ngờ: Hạn mức bồi thường tối đa cho một sản phẩm trong suốt thời hạn bảo hiểm li&ecirc;n quan đến: &nbsp;Sửa chữa hay Thay thế mới sản phẩm tối đa đến gi&aacute; trị mua ban đầu của m&aacute;y</p>
	</li>
	<li>
	<p>Đặc quyền hỗ trợ kĩ thuật tận nh&agrave;: Khi m&aacute;y c&oacute; trục trặc kh&aacute;ch h&agrave;ng chỉ cần gọi đến hotline 24/7 miễn ph&iacute; của chương tr&igrave;nh&nbsp;1800 588 889, sẽ c&oacute; kĩ thuật vi&ecirc;n đến tận nơi nhận Note 7 của kh&aacute;ch h&agrave;ng mang về sửa chữa giao m&aacute;y lại cho kh&aacute;ch h&agrave;ng sau khi ho&agrave;n tất.</p>
	</li>
</ul>

<p><img src="http://www.techone.vn/image/cache/upload/news/2016/8/20/4268/4268_img5.jpg" /></p>

<ul>
	<li>
	<p>Samsung Luxury care:. Mỗi kh&aacute;ch h&agrave;ng sẽ được sử dụng miễn ph&iacute; hai (02) lần dịch vụ Ph&ograve;ng chờ hạng thương gia tại s&acirc;n bay T&acirc;n Sơn Nhất v&agrave; Nội B&agrave;i</p>
	</li>
	<li>
	<p>Voucher trị gi&aacute; 70,000 đồng tại c&aacute;c cửa h&agrave;ng thuộc Hệ Thống The Coffee Bean &amp; Tea Leaf. Tối đa 01 M&atilde; ưu đ&atilde;i /ng&agrave;y, 01 M&atilde; ưu đ&atilde;i &nbsp;đổi được 01 Voucher ( kh&ocirc;ng giới hạn số lần sử d&ugrave;ng m&atilde;)</p>
	</li>
	<li>
	<p>Vé xem phim 2D tại cụm rạp chiếu phim CGV. Kh&aacute;ch h&agrave;ng lấy tối đa 01 M&atilde; ưu đ&atilde;i /ng&agrave;y, lấy được 1 M&atilde; ưu đ&atilde;i &nbsp;để đổi v&eacute; miễn ph&iacute; trị gi&aacute; 90.000 VND (kh&ocirc;ng giới hạn số lần sử d&ugrave;ng m&atilde;)</p>
	</li>
</ul>

<p>7<strong>. Tại sao bạn n&ecirc;n mua Samsung Galaxy Note 7 tại TechOne</strong></p>

<p>Do số lượng h&agrave;ng qu&aacute; nhiều hiện nay đợt h&agrave;ng đầu ti&ecirc;n của Note 7 đ&atilde; hết. Hệ thống sieu thị di động ch&iacute;nh h&atilde;ng TechOne &ndash; Đối t&aacute;c to&agrave;n diện của Samsung tiếp tục nhận đơn đặt h&agrave;ng của kh&aacute;ch h&agrave;ng với khuyến m&atilde;i lớn (Trả h&agrave;ng đợt 2 v&agrave;o ng&agrave;y 09/09). Bộ &nbsp;khuyến m&atilde;i hấp dẫn bao gồm</p>

<p><a href="http://www.techone.vn/samsung-galaxy-note-7-5451.html" target="_blank">Samsung Galaxy Note 7</a>: 18.99 triệu, Tặng bộ qu&agrave; gi&aacute; trị lớn</p>

<ul>
	<li>
	<p>Tai nghe Samsung Gear Circle trị gi&aacute; 1.8 triệu</p>
	</li>
	<li>
	<p>D&aacute;n cường lực Note 7 trị gi&aacute; 300,000 ngh&igrave;n</p>
	</li>
	<li>
	<p>Sim 3G &ndash; 7Gb dung lượng mỗi th&aacute;ng</p>
	</li>
	<li>
	<p>Trả g&oacute;p 0%- Ưu đ&atilde;i đặc quyền của sam sung Elite Hỗ Trợ Trả G&oacute;p 0% với chủ thẻ tin dụng Sacombank, HSBC, Vietinbank v&agrave; City Bank</p>
	</li>
</ul>
', 1, 2)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (4, N'Galaxy J5 2016 nâng cấp camera, thiết kế mới, giá tốt hơn', N'Một tin đáng phấn khởi, Galaxy J5 2016, một trong những điện thoại tầm trung của Samsung trong năm nay đã chính thức được bán ra trong cuối tháng 4.', N'news4.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p><strong>Phi&ecirc;n bản 2016 của J5 được cải tiến về thiết kế, n&acirc;ng cấp về camera v&agrave; đặc biệt l&agrave; gi&aacute; tốt hơn rất nhiều! Điều n&agrave;y cho thấy nếu bạn kh&ocirc;ng c&oacute; hầu bao rộng r&atilde;i th&igrave; khả năng sở hữu một chiếc điện thoại thời thượng đến từ Samsung vẫn trong tầm tay.</strong></p>

<p><strong>Thiết kế</strong></p>

<p>Tất nhi&ecirc;n, ch&uacute;ng ta kh&ocirc;ng thể so s&aacute;nh m&aacute;y với si&ecirc;u phẩm Galaxy S7 vừa ra mắt của h&atilde;ng, Galaxy J5 2016 &nbsp;nằm ở một ph&acirc;n kh&uacute;c ho&agrave;n to&agrave;n kh&aacute;c m&agrave; ở đ&oacute; hiệu suất v&agrave; độ bền của sản phẩm quan trọng hơn rất nhiều. Kh&ocirc;ng phải v&igrave; vậy m&agrave; Galaxy J5 2016 sẽ c&oacute; thiết kế khi&ecirc;m tốn, m&agrave; ngược lại m&aacute;y vẫn kế thừa được thần th&aacute;i sang trọng từ c&aacute;c người anh em Samsung của m&igrave;nh. Mặt lưng sẽ khiến ch&uacute;ng ta ngạc nhi&ecirc;n, thoạt nh&igrave;n ch&uacute;ng ta sẽ tưởng mặt lưng s&aacute;ng b&oacute;ng kia l&agrave; kim loại như c&aacute;c d&ograve;ng A series, nhưng kh&ocirc;ng, ch&uacute;ng thật ra l&agrave; nhựa cao cấp v&agrave; được kh&eacute;o l&eacute;o xử l&yacute; bằng c&aacute;ch trang tr&iacute; hoạ tiết v&acirc;n kim loại. Ch&uacute;ng ta cũng n&ecirc;n hiểu rằng đ&acirc;y l&agrave; một d&ograve;ng m&aacute;y gi&aacute; cả phải chăng, n&ecirc;n những chất liệu n&agrave;y sẽ gi&uacute;p giảm gi&aacute; th&agrave;nh rất nhiều.</p>

<p><strong><img alt="C:\Users\Dân\AppData\Local\Microsoft\Windows\INetCache\Content.Word\DSC01689.jpg" src="http://www.techone.vn/image/cache/upload/news/2016/4/27/3952/3952_img1.jpg" /></strong></p>

<p>Cạnh b&ecirc;n của m&aacute;y l&agrave; viền kim loại v&agrave; được gia c&ocirc;ng tương tự như Galaxy S6, những đường v&aacute;ch cạnh kim cương gi&uacute;p m&aacute;y c&oacute; được cảm gi&aacute;c sang trọng nhưng chắc chắn. Mặt lưng cũng được thiết kế hơn cong để c&oacute; thể &ocirc;m gọn trong l&ograve;ng b&agrave;n tay ch&iacute;nh v&igrave; thế m&agrave; cảm gi&aacute;c cầm của m&aacute;y rất chắc chắn.</p>

<p><strong>Hiển thị</strong></p>

<p>Khả năng hiển thị Samsung lu&ocirc;n được đ&aacute;nh gi&aacute; cao, v&agrave; hiện tại ngay cả chiếc smartphone rẻ nhất của Samsung cũng đ&atilde; được trang bị m&agrave;n h&igrave;nh Super AMOLED. Bất cứ đối thủ n&agrave;o trong c&ugrave;ng tầm gi&aacute; muốn đọ khả năng hiển thị với Samsung đều phải lắc đầu ngao ng&aacute;n. Với 100% khả năng hiển thị m&agrave;u theo bảng sRGB, m&agrave;u đen tuyệt đối 0.00cd/m2 v&agrave; độ tương phản cực cao, những h&igrave;nh ảnh hiển thị tr&ecirc;n Galaxy J5 2016 ho&agrave;n hảo đến từng chi tiết, bạn sẽ c&oacute; c&aacute;i nh&igrave;n kh&aacute;c hẳn về m&agrave;n h&igrave;nh điện thoại một khi bạn đ&atilde; sở hữu tr&ecirc;n tay một chiếc Galaxy.</p>

<p><strong><img alt="C:\Users\Dân\AppData\Local\Microsoft\Windows\INetCache\Content.Word\DSC01692.jpg" src="http://www.techone.vn/image/cache/upload/news/2016/4/27/3952/3952_img2.jpg" /></strong></p>

<p>Kh&ocirc;ng những thế khả năng hiển thị độ s&aacute;ng của m&aacute;y cũng kh&ocirc;ng phải dạng vừa, Galaxy J5 2016 c&oacute; thể đạt độ s&aacute;ng tối đa l&agrave; 357.72cd/m2, đủ để đ&aacute;p ứng mọi điều kiện &aacute;nh s&aacute;ng. Chỉ duy nhất khi đứng ngo&agrave;i trời nắng, bạn sẽ cần lượng s&aacute;ng tối đa từ m&agrave;n h&igrave;nh.</p>

<p>&nbsp;</p>

<p><strong>Hiệu suất</strong></p>

<p>Phải thừa nhận rằng, ở mức gi&aacute; n&agrave;y ch&uacute;ng ta kh&ocirc;ng thể mong chờ một sản phẩm c&oacute; cấu h&igrave;nh khủng m&agrave; b&ugrave; lại hiệu suất phải ổn định v&agrave; thời gian sử dụng cực ấn tượng, đ&oacute; l&agrave; những g&igrave; m&agrave; Galaxy dễ d&agrave;ng đạt được. Sở hữu chip xử l&iacute; l&otilde;i tứ 1.2 GHz Qualcomm Snapdragon 410 c&ugrave;ng bộ nhớ RAM vừa được n&acirc;ng cấp l&ecirc;n 2GB. Galaxy J5 2016 c&oacute; thể vi vu lướt &ecirc;m c&aacute;c t&aacute;c vụ h&agrave;ng ng&agrave;y của bạn từ chơi game cho đến l&agrave;m việc đa nhiệm. M&aacute;y c&ograve;n c&oacute; vi&ecirc;n pin dung lượng 3,100 mAh sẽ l&agrave; qu&aacute; sức để người d&ugrave;ng c&oacute; thể x&agrave;i hết trong 1 ng&agrave;y.</p>

<p><strong><img alt="C:\Users\Dân\AppData\Local\Microsoft\Windows\INetCache\Content.Word\DSC01695.jpg" src="http://www.techone.vn/image/cache/upload/news/2016/4/27/3952/3952_img3.jpg" /></strong></p>

<p>Hiển nhi&ecirc;n, việc n&acirc;ng cấp m&aacute;y l&ecirc;n Android 6.0.1 cũng mang đến cho Galaxy J5 2016 mọi trải nghiệm mượt m&agrave; hơn. Giao diện TouchWiz mới đ&atilde; gọn g&agrave;ng v&agrave; mượt m&agrave; hơn rất nhiều. Đặc biệt Samsung đ&atilde; ưu &aacute;i cho thị trường Việt Nam một v&agrave;i t&iacute;nh năng đặc biệt đ&oacute; l&agrave; c&ocirc;ng nghệ tăng cường bắt s&oacute;ng Wi-fi, khả năng tiết kiệm dung lượng 3G v&agrave; cuối c&ugrave;ng 1 t&iacute;nh năng v&ocirc; c&ugrave;ng th&uacute; vị S-Bike - C&ocirc;ng nghệ t&iacute;ch hợp gi&uacute;p việc sử dụng điện thoại khi chạy xe được tối đa h&oacute;a sự an to&agrave;n cho người d&ugrave;ng.</p>

<p><strong>Camera</strong></p>

<p>L&agrave; d&ograve;ng sản phẩm chuy&ecirc;n Selfie ch&iacute;nh v&igrave; thế m&agrave; bất chấp mức gi&aacute; hạt dẻ, Samsung vẫn mang đến cho thiết bị một bộ đ&ocirc;i camera khủng với th&ocirc;ng số trước/sau lần lượt l&agrave; 5MP/13MP. Với khẩu độ f/1.9 cho camera trước những h&igrave;nh ảnh thu được tr&ecirc;n Galaxy J5 2016 s&aacute;ng v&agrave; r&otilde; n&eacute;t, c&ocirc;ng th&ecirc;m với khả năng xử l&yacute; của phần mềm dư sức cho bạn những bức ảnh đẹp vi diệu. Camera trước của Samsung l&uacute;c n&agrave;o cũng được người d&ugrave;ng th&iacute;ch nhất v&igrave; khả năng l&agrave;m đẹp ng&agrave;y c&agrave;ng tự nhi&ecirc;n qua mỗi phi&ecirc;n bản n&acirc;ng cấp. C&oacute; thể n&oacute;i Samsung chưa bao giờ l&agrave;m người d&ugrave;ng thất vọng về camera của m&igrave;nh.</p>

<p><strong><img alt="C:\Users\Dân\AppData\Local\Microsoft\Windows\INetCache\Content.Word\DSC01697.jpg" src="http://www.techone.vn/image/cache/upload/news/2016/4/27/3952/3952_img4.jpg" /></strong></p>

<p>Th&ocirc;ng tin chi tiết cấu h&igrave;nh</p>

<p>Chip xử l&yacute;: Quad-core 1.2GHz Qualcomm Snapdragon 410</p>

<p>M&agrave;n h&igrave;n: 5.2 inch độ ph&acirc;n giải 1,280x720,</p>

<p>Camera sau: 13 megapixels (khẩu độ f/1.9)</p>

<p>Bộ nhớ: 16GB (trống 10.5GB),</p>

<p>Chuẩn kết nối kh&ocirc;ng d&acirc;y: 3G, 4G</p>

<p>K&iacute;ch thước: 145.8 x 72.3 x 8.1 mm</p>

<p>Nặng: 159g</p>

<p>Hệ điều h&agrave;nh: Android 6.0.1</p>

<p><strong>Với mức gi&aacute; tầm 5.490.000 đồng Galaxy J5 2016 l&agrave; một sự lựa chọn th&uacute; vị để bắt đầu những trải nghiệm tuyệt vời ở điện thoại th&ocirc;ng minh.</strong></p>
', 1, 3)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (5, N'iCloud là gì ? tại sao bạn cần tài khoản iCloud ?', N'iCloud: Dịch vụ không thể thiếu nếu bạn đang dùng iOS', N'news5.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p><strong><em>Apple nổi tiếng với dịch vụ bảo mật điện thoại v&agrave; c&aacute;c thiết bị di động. Để bảo vệ người d&ugrave;ng h&atilde;ng n&agrave;y lu&ocirc;n cố gắng tr&aacute;nh sử dụng dịch vụ của b&ecirc;n thứ 3 một c&aacute;ch tối đa. Trong đ&oacute; c&oacute; iCloud dịch vụ được sử dụng d&agrave;nh ri&ecirc;ng cho iOS. Vậy&nbsp;<a href="http://www.techone.vn/news/3094/icloud-la-gi-tai-sao-ban-can-tai-khoan-icloud.html">iCloud l&agrave; g&igrave;</a>&nbsp;?</em></strong></p>

<h3><strong>1. Định nghĩa iCloud</strong></h3>

<p><strong><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3094/3094_img1.jpg" /></strong></p>

<p>iCloud l&agrave; dịch vụ đặc biệt quan trọng đối với iOS 7</p>

<p>- iCloud được gọi l&agrave; dịch vụ đ&aacute;m m&acirc;y của Apple ph&aacute;t triển d&agrave;nh cho c&aacute;c thiết bị chạy iOS&nbsp; của h&atilde;ng như iPhone, iPad, iPod v&agrave; c&aacute;c m&aacute;y t&iacute;nh c&aacute; nh&acirc;n Macbook của h&atilde;ng n&agrave;y.</p>

<h3><strong>2. iCloud d&ugrave;ng để l&agrave;m g&igrave;</strong></h3>

<p>- iCloud l&agrave; dịch vụ m&agrave; người d&ugrave;ng iOS n&agrave;o cũng cần biết bởi n&oacute; gi&uacute;p người d&ugrave;ng thực hiện đồng bộ dữ liệu giữa c&aacute;c thiết bị một c&aacute;ch dễ d&agrave;ng. Bạn c&oacute; thể từ thiết bị n&agrave;y truy cập bằng t&agrave;i khoản iCloud để xem c&aacute;c t&agrave;i liệu từ một thiết bị Apple kh&aacute;c.</p>

<p>- iCloud c&ograve;n thực hiện nhiệm vụ bảo mật khi bảo vệ người d&ugrave;ng một c&aacute;ch tối ưu, bảo vệ dữ liệu chuy&ecirc;n nghiệp. Đặc biệt, nếu bạn đang sử dụng iCloud th&igrave; bạn ho&agrave;n to&agrave;n c&oacute; thể d&ugrave;ng chức năng T&igrave;m điện thoại nếu chẳng may thất lạc.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3094/3094_img2.jpg" /></p>

<p>iCloud c&oacute; vai tr&ograve; đặc biệt quan trọng để bảo mật cho thiết bị&nbsp;</p>

<p>- Nếu bạn muốn kh&ocirc;i phục lại điện thoại th&igrave; cần c&oacute; t&agrave;i khoản iCloud hay Apple ID để thực hiện c&aacute;c chức năng bảo mật th&igrave; mới c&oacute; thể thực hiện c&aacute;c t&aacute;c vụ được.</p>

<p>- Nếu người d&ugrave;ng lỡ qu&ecirc;n mật khẩu iCloud th&igrave; sẽ dẫn đến hiện tượng &ldquo;d&iacute;nh iCloud&rdquo; v&agrave; sẽ phải thực hiện quy tr&igrave;nh lấy lại mật khẩu để thiết bị c&oacute; thể tiếp tục hoạt động.</p>

<h3><strong>3. Tạo t&agrave;i khoản iCloud bằng c&aacute;ch n&agrave;o</strong></h3>

<p>- Người d&ugrave;ng c&oacute; thể dễ d&agrave;ng tự tạo t&agrave;i khoản iCloud cho m&igrave;nh một c&aacute;ch dễ d&agrave;ng với c&aacute;c bước cơ bản sau đ&acirc;y.</p>

<p>+ Bước 1: Truy cập v&agrave;o mục C&agrave;i đặt tr&ecirc;n m&aacute;y, chọn iCloud sau đ&oacute; tại mục Đăng nhập bằng Apple ID, nếu bạn chưa c&oacute; iCloud h&atilde;y nhấn chọn mục Tạo Apple ID miễn ph&iacute;.</p>

<p>+ Bước 2: Điền đầy đủ c&aacute;c th&ocirc;ng tin c&aacute; nh&acirc;n m&agrave; hệ thống y&ecirc;u cầu, đặc biệt l&agrave; email phải ch&iacute;nh x&aacute;c để x&aacute;c nhận th&ocirc;ng tin v&agrave; nếu bạn qu&ecirc;n t&agrave;i khoản hay mật khẩu th&igrave; c&oacute; thể dễ d&agrave;ng lấy lại bằng email.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3094/3094_img3.png" /></p>

<p>iCloud được tạo miễn ph&iacute; v&agrave; dễ d&agrave;ng tr&ecirc;n thiết bị iOS &nbsp;</p>

<p>+ Bước 3: Sau khi điền đầy đủ th&ocirc;ng tin c&aacute; nh&acirc;n, h&atilde;y chọn mục Nhận địa chỉ iCloud miễn ph&iacute;, điền t&agrave;i khoản bạn muốn tạo, x&aacute;c nhận mật khẩu v&agrave; ch&uacute; &yacute; ghi nhớ mật khẩu. Bạn cũng cần trả lời 3 c&acirc;u hỏi bảo mật để x&aacute;c nhận t&agrave;i khoản của m&igrave;nh.</p>

<p>+ Bước 4: Điền email giải cứu c&oacute; nghĩa l&agrave; nếu bạn bị lỡ qu&ecirc;n mất mật khẩu th&igrave; sử dụng email n&agrave;y để nhận lại th&ocirc;ng tin. Cuối c&ugrave;ng chọn Đồng &yacute; với những điều khoản của Apple l&agrave; xong.</p>

<p>T&agrave;i khoản iCloud l&agrave; cực k&igrave; quan trọng đối với người sử dụng c&aacute;c thiết bị của Apple nhất l&agrave; khi cần để k&iacute;ch hoạt m&aacute;y hay kh&ocirc;i phục lại phần mềm cho m&aacute;y.&nbsp;</p>
', 1, 4)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (6, N'Điểm mặt những phần mềm làm chậm máy Android', N'Ứng dụng làm chậm điện thoại Android của bạn', N'news6.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p><strong><em>Đừng vội đổ lỗi cho nh&agrave; sản xuất khi bạn vừa mua điện thoại về nhưng n&oacute; đ&atilde; chậm như r&ugrave;a v&agrave; khiến bạn kh&oacute; chịu. Đ&ocirc;i khi, việc bạn cần l&agrave;m l&agrave; xem lại những ứng dụng, phần mềm đang c&agrave;i đặt tr&ecirc;n m&aacute;y. H&atilde;y thử điểm mặt những ứng dụng l&agrave;m chậm m&aacute;y Android của bạn, để xem bạn đang gặp phải trường hợp n&agrave;o.</em></strong></p>

<h3><strong>1. S&aacute;t thủ số 1 &ndash; Facebook</strong></h3>

<p>- Facebook l&agrave; ứng dụng m&agrave; hầu hết mọi người đều sử dụng tr&ecirc;n smartphone. Sự phổ biến của ứng dụng n&agrave;y l&agrave; kh&ocirc;ng cần phải b&agrave;n c&atilde;i. Hầu hết người d&ugrave;ng Facebook đều c&oacute; th&ecirc;m c&agrave;i đặt ứng dụng n&agrave;y tr&ecirc;n smartphone của minfhd để kết nối li&ecirc;n lạc với mọi người mọi l&uacute;c mọi nơi.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3092/3092_img1.jpg" /></p>

<p>Facebook l&agrave; nguy&ecirc;n nh&acirc;n số 1 khiến m&aacute;y của bạn chậm chạp&nbsp;</p>

<p>- Facebook l&agrave; ứng dụng g&acirc;y hao pin nhanh ch&oacute;ng nhất nếu như bạn kh&ocirc;ng tắt đi sau mỗi lần sử dụng. Thậm ch&iacute;, ngay khi thiết bị khởi động, việc can thiệp của Facebook cũng khiến m&aacute;y điện thoại của bạn chậm như r&ugrave;a.</p>

<p>- Ngay cả khi bạn đ&atilde; tắt ứng dụng rồi th&igrave; Facebook vẫn tiếp tục l&agrave;m tốn năng lượng v&agrave; t&agrave;i nguy&ecirc;n của m&aacute;y bạn một c&aacute;ch &acirc;m thầm v&agrave; lặng lẽ khiến người d&ugrave;ng kh&ocirc;ng nghĩ đến.</p>

<h3><strong>2. Ứng dụng nghe nhạc Spotify</strong></h3>

<p>- Theo như nghi&ecirc;n cứu của AVG Technologies th&igrave; Spotify l&agrave; ứng dụng l&agrave;m giảm hiệu năng hoạt động của điện thoại Android nhanh v&agrave; nhiều nhất. Ứng dụng n&agrave;y được đ&aacute;nh gi&aacute; l&agrave; ứng dụng nghe nhạc tuyệt vời nhất, với h&agrave;ng triệu ca kh&uacute;c được cập nhật li&ecirc;n tục, đồng thời gi&uacute;p người d&ugrave;ng dễ d&agrave;ng chia sẻ ca kh&uacute;c, đồng bộ &acirc;m nhạc với bạn b&egrave;.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3092/3092_img2.jpg" /></p>

<p>Ứng dụng nghe nhạc Spotify l&agrave; nguy&ecirc;n nh&acirc;n chậm hiệu năng m&aacute;y&nbsp;</p>

<h3><strong>3. Beaming Services for Samsung</strong></h3>

<p>- H&atilde;ng điện tử H&agrave;n Quốc vẫn được biết đến với việc c&oacute; h&agrave;ng trăm c&aacute;c ứng dụng m&agrave; thậm ch&iacute; người d&ugrave;ng chẳng bao giờ d&ugrave;ng đến được c&agrave;i đặt tr&ecirc;n m&aacute;y của họ khi mua về. T&igrave;nh h&igrave;nh n&agrave;y c&oacute; vẻ được cải thiện hơn bởi Samsung c&oacute; vẻ đ&atilde; nghe thấy những lời k&ecirc;u than của người d&ugrave;ng. Người d&ugrave;ng thậm ch&iacute; c&ograve;n chẳng biết ứng dụng n&agrave;y được c&agrave;i đặt v&agrave;o m&aacute;y để l&agrave;m g&igrave;.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3092/3092_img3.jpg" /></p>

<p>Samsung c&oacute; nhiều ứng dụng thực sự &quot;v&ocirc; dụng&quot;</p>

<p>- Samsung kh&ocirc;ng chỉ g&oacute;p mặt một ứng dụng m&agrave; c&oacute; tới 3 ứng dụng được liệt v&agrave;o danh s&aacute;ch phần mềm l&agrave;m m&aacute;y chậm đ&oacute; l&agrave; Beaming Serivces, ứng dụng AllShare Cast, ChatON.</p>

<p>- Dưới đ&acirc;y l&agrave; danh s&aacute;ch những ứng dụng l&agrave;m chậm m&aacute;y Android m&agrave; bạn n&ecirc;n biết để tr&aacute;nh xa</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/6/19/3092/3092_img4.jpg" /></p>

<p>Ứng dụng nguy hiểm bạn n&ecirc;n tr&aacute;nh cho điện thoại Android</p>

<p>1. Facebook&nbsp;<br />
2. Path&nbsp;<br />
3. 9GAG Funny Pics &amp; Videos&nbsp;<br />
4. Instagram&nbsp;<br />
5. Spotify Music&nbsp;<br />
6. BBM (BlackBerry)&nbsp;<br />
7. QQ (Tencent Technology)&nbsp;<br />
8. textPlus Free Text &amp; Calls&nbsp;<br />
9. Wattpad Free Books &amp; Stories&nbsp;<br />
10. iFunny</p>

<p>Việc c&agrave;i đặt nhiều ứng dụng v&agrave;o điện thoại sẽ khiến smartphone của bạn bị chậm, trong qu&aacute; tr&igrave;nh sử dụng g&acirc;y ra nhiều phiền to&aacute;i. V&igrave; vậy, bạn n&ecirc;n c&acirc;n nhắc thật kĩ trước khi quyết định c&agrave;i đặt bất k&igrave; phần mềm n&agrave;o v&agrave;o thiết bị của m&igrave;nh.&nbsp;</p>
', 1, 4)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (7, N'Mẹo hay đổi font chữ độc đáo trên Facebook', N'Facebook hiện đang là ứng dụng mạng xã hội được nhiều người dùng nhất hiện nay. Tuy nhiên thì không phải ai cũng biết được hết những tính năng hay và độc đáo dành cho mạng xã hội này. ', N'news7.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p><strong><em>Facebook hiện đang l&agrave; ứng dụng mạng x&atilde; hội được nhiều người d&ugrave;ng nhất hiện nay. Tuy nhi&ecirc;n th&igrave; kh&ocirc;ng phải ai cũng biết được hết những t&iacute;nh năng hay v&agrave; độc đ&aacute;o d&agrave;nh cho mạng x&atilde; hội n&agrave;y. Trong qu&aacute; tr&igrave;nh sử dụng, bỗng nhi&ecirc;n một ng&agrave;y n&agrave;o đ&oacute; bạn thấy những d&ograve;ng status, b&agrave;i viết, b&igrave;nh luận của bạn b&egrave;, người th&acirc;n.. c&oacute; font chữ rất lạ? Chắc hẳn l&uacute;c đ&oacute;&nbsp;bạn sẽ&nbsp;đặt ra c&acirc;u hỏi l&agrave;m thế n&agrave;o để chuyển được font chữ như tr&ecirc;n? Kh&ocirc;ng để c&aacute;c bạn đợi l&acirc;u nữa, b&agrave;i viết b&ecirc;n dưới đ&acirc;y m&igrave;nh sẽ giới thiệu đến c&aacute;c bạn mẹo đổi font chữ độc đ&aacute;o tr&ecirc;n facebook để qua đ&acirc;y gi&uacute;p c&aacute;c bạn c&oacute; thể chọn lựa được font chữ&nbsp;mới lạ nhất thay cho những font chữ mặc định tr&ecirc;n facebook.&nbsp;</em></strong></p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/5/27/2964/2964_img1.jpg" /></p>

<p><em>Mẹo hay&nbsp;đổi font chữ độc đ&aacute;o tr&ecirc;n Facebook</em></p>

<p>Để thực hiện được qu&aacute; tr&igrave;nh đổi font chữ c&aacute;c bạn thao t&aacute;c theo những bước b&ecirc;n dưới đ&acirc;y</p>

<p>+) Bước 1: Tr&ecirc;n m&aacute;y t&iacute;nh hay tr&ecirc;n smartphone c&aacute;c bạn v&agrave;o tr&igrave;nh duyệt web của m&aacute;y sau đ&oacute; truy cập tới địa chỉ sau:&nbsp;</p>

<p>http://www.symbols-n-emoticons.com/</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/5/27/2964/2964_img2.jpg" /></p>

<p><em>Giao diện ch&iacute;nh của trang web n&agrave;y</em></p>

<p>+) Bước 2: Sau khi truy cập th&agrave;nh c&ocirc;ng, ở giao diện ch&iacute;nh của trang web c&aacute;c bạn để &yacute; tr&ecirc;n thanh ngang c&oacute; 7 mục kh&aacute;c nhau. C&aacute;c bạn chọn v&agrave;o mục thứ 6 c&oacute; t&ecirc;n l&agrave; Stylish Fonts. Sau đ&oacute; bạn sẽ được chuyển sang cửa số mới. Ở &ocirc; c&oacute; chứa h&igrave;nh chiếc b&uacute;t bạn viết v&agrave;o đ&oacute; d&ograve;ng status, b&igrave;nh luận m&agrave; bạn muốn chuyển đổi sang font chữ kh&aacute;c, viết xong bạn click chọn convert.&nbsp;</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/5/27/2964/2964_img3.jpg" /></p>

<p><em>Tr&ecirc;n thanh ngang c&oacute; chứa 7 mục c&aacute;c bạn chọn mục Stylist Fonts</em></p>

<p>+) Bước 3: L&uacute;c n&agrave;y những font chữ độc đ&aacute;o sẽ hiện l&ecirc;n để cho c&aacute;c bạn c&oacute; thể lựa chọn. Sau khi đ&atilde; chọn xong được font chữ ưng &yacute; c&aacute;c bạn b&ocirc;i đen d&ograve;ng chữ đ&oacute; rồi Ctrl + C&nbsp;hoặc cũng c&oacute; thể ấn n&uacute;t Copy b&ecirc;n cạnh d&ograve;ng chữ đ&oacute; để Copy lại. Tiếp theo bạn quay trở lại trang Facebook v&agrave; v&agrave;o &ocirc; đăng status hay &ocirc; comment d&aacute;n d&ograve;ng chữ lại bằng c&aacute;ch thao t&aacute;c ấn Ctrl +V. &nbsp;D&ograve;ng chữ c&oacute; font chữ độc đ&aacute;o sẽ ngay l&acirc;p tức được hiện l&ecirc;n tại nơi bạn vừa đăng.&nbsp;</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/5/27/2964/2964_img4.png" /></p>

<p><em>Bạn điền d&ograve;ng chữ muốn chuyển đổi v&agrave;o &ocirc; như h&igrave;nh tr&ecirc;n sau đ&oacute; chọn Convert</em></p>

<p>&nbsp;</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/5/27/2964/2964_img5.png" /></p>

<p><em>Một loạt font chữ kh&aacute;c được hiện l&ecirc;n, c&aacute;c bạn chọn font chữ ưng &yacute; sau đ&oacute; ấn Ctrl +C hoặc ấn Copy ở b&ecirc;n cạnh</em></p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/5/27/2964/2964_img6.png" /></p>

<p><em>Sau đ&oacute; ở d&ograve;ng trạng th&aacute;i hoặc ở &ocirc; comment bạn thao t&aacute;c ấn Ctrl + V để Paste v&agrave;o l&agrave; được</em></p>

<p>Như vậy b&ecirc;n tr&ecirc;n m&igrave;nh đ&atilde; giới thiệu xong cho c&aacute;c bạn&nbsp;<strong>mẹo đổi font chữ độc đ&aacute;o tr&ecirc;n Facebook</strong>. Hi vọng b&agrave;i viết n&agrave;y sẽ gi&uacute;p &iacute;ch cho c&aacute;c bạn trong vệc chuyển đổi font chữ tr&ecirc;n Facebook. Ch&uacute;c c&aacute;c bạn thực hiện c&aacute;c bước tr&ecirc;n th&agrave;nh c&ocirc;ng.&nbsp;</p>
', 1, 4)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (8, N'Khắc phục các lỗi thông dụng trên Android 6', N'Các hãng sản xuất di động thường đưa ra các bản cập nhật cho Hệ điều hành trên các dòng sản phẩm của mình. Các bản cập nhật này giúp thiết bị chạy ổn định hơn, tăng cường khả năng bảo mật cũng như giúp sửa lỗi các ứng dụng Android 6 đi kèm. ', N'news8.jpg', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'<p><em><strong>C&aacute;c h&atilde;ng sản xuất di động thường đưa ra c&aacute;c bản cập nhật cho Hệ điều h&agrave;nh tr&ecirc;n c&aacute;c d&ograve;ng sản phẩm của m&igrave;nh. C&aacute;c bản cập nhật n&agrave;y gi&uacute;p thiết bị chạy ổn định hơn, tăng cường khả năng bảo mật cũng như gi&uacute;p&nbsp;<a href="http://www.techone.vn/news/3547/khac-phuc-cac-loi-thong-dung-tren-android-6.html">sửa lỗi c&aacute;c ứng dụng Android 6</a>&nbsp;đi k&egrave;m. Tuy nhi&ecirc;n, sau khi cập nhật Hệ điều h&agrave;nh mới, một số người d&ugrave;ng thường gặp phải t&igrave;nh trạng thiết bị của họ thực hiện c&aacute;c t&aacute;c vụ chậm hơn hoặc thời lượng pin ngắn lại so với trước.</strong></em></p>

<p>C&ocirc;ng bằng m&agrave; n&oacute;i, bản 6 của Hệ điều h&agrave;nh Android &ldquo;Kẹo Dẻo&rdquo; Marshmallow tiếp nối v&agrave; ph&aacute;t huy kh&aacute; tốt c&aacute;c ưu điểm cũng như khắc phục c&aacute;c nhược điểm của bản Android 5. Nhưng t&igrave;nh trạng gặp một số lỗi th&ocirc;ng dụng như kể tr&ecirc;n kh&ocirc;ng phải l&agrave; hiếm, khiến một số người d&ugrave;ng Android 6 gặp phiền phức kh&ocirc;ng &iacute;t.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/minh.bt/2015/12/1/3547/3547_uVqmZXOew1.jpg" /></p>

<p>Hệ điều h&agrave;nh Android 6&nbsp;Marshmallow ph&aacute;t huy tốt&nbsp;c&aacute;c t&iacute;nh năng từ bản 5 nhưng thỉnh thoảng&nbsp;vẫn gặp&nbsp;một số lỗi</p>

<p>H&atilde;y c&ugrave;ng điểm qua c&aacute;c lỗi thường gặp tr&ecirc;n thiết bị chạy Android 6 v&agrave; c&ugrave;ng t&igrave;m hiểu c&aacute;ch khắc phục để thiết bị của bạn lu&ocirc;n chạy mượt như ban đầu nh&eacute;.</p>

<p><strong>1. Thiết bị chạy chạy chậm hơn so với trước khi cập nhật HĐH</strong></p>

<p>- Sau khi n&acirc;ng cấp l&ecirc;n hệ điều h&agrave;nh mới, bạn nhận hiệu năng xử l&yacute; của thiết bị k&eacute;m hơn, xử l&yacute; t&aacute;c vụ l&acirc;u hơn so với trước. Điều đ&oacute; c&oacute; nghĩa l&agrave; kh&ocirc;ng gian bộ nhớ của thiết bị Android đang bị đầy l&ecirc;n.</p>

<p>- C&aacute;ch khắc phục: Mở rộng kh&ocirc;ng gian bộ nhớ cache cho thiết bị (Wipe cache):&nbsp;T&ugrave;y v&agrave;o từng thiết bị, bạn tiến h&agrave;nh chạy thiết bị trong chế độ phục hồi Recovery Mode: sử dụng c&aacute;c ph&iacute;m tăng giảm &acirc;m lượng v&agrave; n&uacute;t Nguồn để chọn Wipe cache Partition -&gt; sau khi qu&aacute; tr&igrave;nh ho&agrave;n tất, h&atilde;y khởi động lại thiết bị.</p>

<p><strong>2. Hiện tượng tự khởi động lại</strong></p>

<p>- T&igrave;nh trạng&nbsp;tự khởi động lại c&oacute; thể xảy ra với c&aacute;c ứng dụng kh&ocirc;ng được cập nhật bởi c&aacute;c API Marshmallow mới. Do đ&oacute;, ch&uacute;ng kh&ocirc;ng ph&ugrave; hợp với phi&ecirc;n bản Android&nbsp;6. Để giải quyết t&igrave;nh trạng&nbsp;n&agrave;y, h&atilde;y thử cập nhật tất cả c&aacute;c phần mềm l&ecirc;n phi&ecirc;n bản mới nhất, đồng thời&nbsp;x&oacute;a bộ nhớ cache. Bạn l&agrave;m như sau: V&agrave;o Settings -&gt;&nbsp;chọn Applications -&gt;&nbsp;chọn một chương tr&igrave;nh v&agrave; sau đ&oacute; bấm Store -&gt;&nbsp;chọn x&oacute;a sạch bộ nhớ cache.</p>

<p>-&nbsp;Nếu hiện tượng tr&ecirc;n vẫn xảy ra, bạn n&ecirc;n c&agrave;i đặt lại c&aacute;c ứng dụng hoặc c&oacute; khi bạn&nbsp;phải trả lại&nbsp;c&aacute;c thiết lập mặc định cho thiết bị.&nbsp;Nhưng tr&ecirc;n hết, đừng qu&ecirc;n&nbsp;sao lưu dữ liệu trước khi tiến h&agrave;nh kh&ocirc;i phục mặc định.</p>

<p><strong>3. Lỗi về thời lượng sử dụng v&agrave; thời gian sạc pin</strong></p>

<p>-&nbsp; Sau khi cập nhật Android 6, một số người d&ugrave;ng sẽ thấy thời lượng pin tăng l&ecirc;n. Nhưng cũng c&oacute; trường hợp pin sử dụng nhanh hết m&agrave; khi sạc lại l&acirc;u hơn thường lệ. Nếu thiết bị của bạn đang gặp phải vấn đề n&agrave;y, bạn c&oacute; thể hiệu chuẩn pin để tăng tuổi thọ pin cho cho thiết bị.</p>

<p>- C&aacute;ch hiệu chuẩn pin cho Android: Mỗi khi sạc điện thoại, bạn h&atilde;y sạc đến khi pin đầy 100% v&agrave; sử dụng đến khi thiết bị b&aacute;o pin yếu th&igrave; n&ecirc;n sạc (kh&ocirc;ng n&ecirc;n để pin cạn dưới 5%). Lưu &yacute;: để tăng tuổi thọ pin, bạn kh&ocirc;ng n&ecirc;n l&agrave;m gi&aacute;n đoạn qu&aacute; tr&igrave;nh sạc điện thoại.</p>

<p><img alt="pin android 6" src="http://www.techone.vn/image/cache/upload/minh.bt/2015/12/1/3547/3547_qN5m0uYC69.jpg" /></p>

<p>Kh&ocirc;ng n&ecirc;n d&ugrave;ng cạn pin rồi mới sạc</p>

<p>- Ngo&agrave;i ra, bạn n&ecirc;n sử dụng sạc v&agrave; c&aacute;p nguy&ecirc;n gốc từ nh&agrave; sản xuất.</p>

<p><strong>4. Lỗi Wifi v&agrave; Bluetooth</strong></p>

<p>Lỗi&nbsp;n&agrave;y thường chỉ xảy ra ở c&aacute;c&nbsp;m&aacute;y&nbsp;Nexus 5. Khi gặp lỗi kết nối Wifi v&agrave; Bluetooth,&nbsp;bạn n&ecirc;n&nbsp;chọn &#39;<em>qu&ecirc;n mạng</em>&#39; v&agrave; thiết lập lại kết nối hoặc khởi động lại router. Một số người cho rằng với&nbsp; tần số ph&aacute;t 2,4 GHz,&nbsp;smartphone sẽ&nbsp;hoạt động m&agrave; kh&ocirc;ng c&oacute; bất kỳ vấn đề g&igrave;, trong khi ở tần số 5 GHz c&oacute; thể xảy ra&nbsp;một số vấn đề với Wifi.</p>

<p><strong>5. Lỗi truy cập Internet</strong></p>

<p>Khi gặp lỗi trong vấn đề&nbsp;kết nối Internet, bạn&nbsp;h&atilde;y thử khởi động lại thiết bị v&agrave; thử bật/tắt Chế độ M&aacute;y bay (Airplane). Ngo&agrave;i ra h&atilde;y chắc chắn rằng c&aacute;c thiết lập cho ph&eacute;p việc truyền tải dữ liệu qua mạng di động đ&atilde; được c&agrave;i đặt.</p>

<p>D&ugrave; c&oacute; xảy ra một v&agrave;i lỗi th&ocirc;ng dụng như kể tr&ecirc;n&nbsp;nhưng Android 6 vẫn l&agrave; hệ điều h&agrave;nh được nhiều người tin d&ugrave;ng. Hi vọng qua&nbsp;b&agrave;i viết, c&aacute;c bạn c&oacute; thể khắc phục nhanh được c&aacute;c sự cố nhỏ n&agrave;y&nbsp;v&agrave; tận hưởng những g&igrave;&nbsp;Marshmallow&nbsp;mang lại.</p>
', 1, 5)
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [MoTa], [HinhAnh], [NgayDang], [NoiDung], [TrangThai], [MaDanhMuc]) VALUES (9, N'Một số điều nên biết về CPU của Samsung Galaxy Note 5', N'Cấu hình và vi xử lý của Samsung Galaxy Note 5 ra sao?', N'news9.jpg', CAST(N'2016-11-14 00:00:00' AS SmallDateTime), N'<p><em>Samsung Galaxy note 5 l&agrave; một trong hai si&ecirc;u phẩm mới nhất của Samsung mới được ra mắt. N&oacute; c&oacute; thể coi l&agrave; một trong những thiết bị mạnh nhất của Samsung hiện nay. Người d&ugrave;ng quan t&acirc;m đến hiệu năng của sản phẩm chắc hẳn muốn biết&nbsp;<strong>CPU của Samsung Galaxy Note 5</strong>&nbsp;ra sao v&agrave; n&oacute; c&oacute; hiệu suất như thế n&agrave;o đ&uacute;ng kh&ocirc;ng?</em></p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/9/16/3417/3417_img1.jpg" /></p>

<p>Galaxy Note 5 l&agrave; thế hệ Note với S-pen mới nhất của Samsung</p>

<h3><strong>1. Con chip Exynos 7420 được sử dụng cho Note 5</strong></h3>

<p>Nếu tr&ecirc;n Note 4, hai phi&ecirc;n bản được sử dụng hai loại nh&acirc;n CPU kh&aacute;c nhau với nh&acirc;n GPU kh&aacute;c nhau tương ứng th&igrave; c&oacute; thể thấy đ&oacute; như l&agrave; b&agrave;i test chất lượng hoat đ&ocirc;ng của từng con chip. V&agrave; c&acirc;u trả lời đ&atilde; ngi&ecirc;ng về Exynos của Samsung rồi, h&atilde;y c&ugrave;ng xem thể hiện của con chip n&agrave;y ra sao nh&eacute;.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/9/16/3417/3417_img2.png" /></p>

<p>So s&aacute;nh hiệu suất của Exynos tr&ecirc;n Galaxy S6 v&agrave; chip A8 tr&ecirc;n iPhone 6 Plus.</p>

<p>C&aacute;c kết quả thử nghiệm ri&ecirc;ng biệt v&agrave; tr&ecirc;n từng sản phẩm cụ thể cho thất chip Exynos được trang bị cho Galaxy Note 5 l&agrave; con chip mạnh hơn cả chip A8 của Apple.</p>

<p>Con chip n&agrave;y c&oacute; 8 nh&acirc;n bao gồm 2 l&otilde;i: một l&otilde;i 4 tốc độ l&agrave; 1.5Ghz theo cấu tr&uacute;c Cortex A53, c&ograve;n bộ tứ kia l&agrave; Cortex A57 với tốc độ l&agrave; 2.1Ghz, cho ra tốc độ trung b&igrave;nh l&agrave; 1.8Ghz. Th&ecirc;m nữa con chip Exynos c&oacute; c&aacute;c cấu tr&uacute;c quen thuộc gia c&ocirc;ng theo tiến tr&igrave;nh 14nm, c&ocirc;ng nghệ gia c&ocirc;ng hiện đại nhất hiện ay cho c&aacute;c d&ograve;ng vi xử l&yacute; chắc chắn hiệu năng sẽ rất cao rồi.</p>

<p><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/9/16/3417/3417_img3.jpg" /></p>

<p>Hai sản phẩm d&ugrave;ng chip Exynos của Samsung c&oacute; hiệu suất tốt nhất qu&yacute; 1 năm nay.</p>

<p>Từ bảng so sanh tr&ecirc;n c&oacute; thể thấy hiệu năng n&oacute; cung cao hơn c&aacute;c sản phẩm sử dụng chip Qualcomm S810</p>

<h3><strong>2. Đồ họa v&agrave; bộ nhớ của Samsung Galaxy Note 5</strong></h3>

<p>GPU tương ứng cho con chip l&agrave; nh&acirc;n đồ họa Mali T760MP8, khi đem so s&aacute;nh hiệu quả hoạt động&nbsp; c&oacute; thể thấy n&oacute; vượt xa c&aacute;c loai chip c&ugrave;ng loại kh&aacute;c.</p>

<p><a href="http://www.techone.vn/image/cache/upload/news/2015/9/16/3417/3417_img4.jpg"><img alt="" src="http://www.techone.vn/image/cache/upload/news/2015/9/16/3417/3417_img4.jpg" /></a></p>

<p>So s&aacute;nh hiệu năng của chip đồ họa tr&ecirc;n Galaxy Note 5</p>

<p>Với dung lượng RAM l&agrave; 4Gb c&ugrave;ng hai phi&ecirc;n bản bộ nhớ trong, Galaxy Note 5 sẽ cho trải nghiệm đa nghiệm rất tốt, hoạt động nhanh v&agrave; mượt hơn. M&aacute;y được c&agrave;i Android Lollipop ver 5.1.1 mới nhất hứa hẹn c&aacute;c trải nghiệm th&uacute; vị c&ugrave;ng với giao diện độc quyền TouchWiz UI từ Samsung.</p>

<p><strong>CPU của Samsung Galaxy Note 5</strong>&nbsp;v&agrave; c&aacute;c cấu h&igrave;nh phần cứng phần mềm đều l&agrave; bậc nhất hiện nay. Với cấu h&igrave;nh mạnh như vậy, kh&ocirc;ng một nhiệm vụ n&agrave;o d&agrave;nh cho Smartphone hiện tại c&oacute; thể g&acirc;y kh&oacute; dễ cho Galaxy Note 5 được. Nhanh tay sở hữu cho m&igrave;nh một sản phẩm nếu bạn muốn, kh&ocirc;ng đủ kinh ph&iacute;, đừng lo mua trả g&oacute;p cũng l&agrave; một lựa chọn kh&ocirc;ng tồi đ&acirc;u.</p>
', 1, 3)
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
SET IDENTITY_INSERT [dbo].[BinhLuanBaiViet] ON 

INSERT [dbo].[BinhLuanBaiViet] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaBaiViet]) VALUES (1, N'Quân', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'Nội dung bổ ích', 1, 1)
INSERT [dbo].[BinhLuanBaiViet] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaBaiViet]) VALUES (2, N'John', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'Bài viết rất bổ ích', 1, 7)
INSERT [dbo].[BinhLuanBaiViet] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaBaiViet]) VALUES (3, N'Smith', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'Good idea!', 1, 7)
INSERT [dbo].[BinhLuanBaiViet] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaBaiViet]) VALUES (4, N'Maria', CAST(N'2016-11-13 00:00:00' AS SmallDateTime), N'iCloud is really necessary for iPhone security', 1, 5)
SET IDENTITY_INSERT [dbo].[BinhLuanBaiViet] OFF
SET IDENTITY_INSERT [dbo].[BinhLuanSanPham] ON 

INSERT [dbo].[BinhLuanSanPham] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (1, N'Nelly', CAST(N'2016-12-26 00:00:00' AS SmallDateTime), N'Chiếc này đẹp quá! Lại rẻ nữa', 1, 2)
INSERT [dbo].[BinhLuanSanPham] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (2, N'Steve', CAST(N'2016-12-27 00:00:00' AS SmallDateTime), N'Thật là bắt mắt !!', 1, 8)
INSERT [dbo].[BinhLuanSanPham] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (3, N'Jacky', CAST(N'2016-12-27 00:00:00' AS SmallDateTime), N'Công nhận là đẹp ...', 1, 8)
INSERT [dbo].[BinhLuanSanPham] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (4, N'Nam', CAST(N'2016-12-27 00:00:00' AS SmallDateTime), N'Rẻ nhỉ?', 1, 9)
INSERT [dbo].[BinhLuanSanPham] ([MaBinhLuan], [TenNguoiBinhLuan], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (5, N'Linh', CAST(N'2016-12-27 00:00:00' AS SmallDateTime), N'Đang giảm giá nè :v Mua thôi', 1, 10)
SET IDENTITY_INSERT [dbo].[BinhLuanSanPham] OFF
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (1, 2, 4, 2266000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (1, 11, 3, 5090000, 2)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (2, 2, 7, 2266000, 3)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (2, 11, 3, 5090000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (3, 2, 4, 2266000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (3, 11, 7, 5090000, 4)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (4, 2, 7, 2266000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (4, 11, 7, 5090000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (5, 8, 4, 9990000, 2)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (6, 26, 3, 3490000, 3)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (7, 13, 3, 6490000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [DonGia], [SoLuong]) VALUES (7, 23, 1, 56999000, 1)
SET IDENTITY_INSERT [dbo].[DanhMucBaiViet] ON 

INSERT [dbo].[DanhMucBaiViet] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Tin công nghệ')
INSERT [dbo].[DanhMucBaiViet] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Sản phẩm mới')
INSERT [dbo].[DanhMucBaiViet] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Đánh giá sản phẩm')
INSERT [dbo].[DanhMucBaiViet] ([MaDanhMuc], [TenDanhMuc]) VALUES (4, N'Kiến thức điện tử')
INSERT [dbo].[DanhMucBaiViet] ([MaDanhMuc], [TenDanhMuc]) VALUES (5, N'Thủ thuật Smartphone')
SET IDENTITY_INSERT [dbo].[DanhMucBaiViet] OFF
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] ON 

INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (1, N'Điện thoại')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (2, N'Laptop')
INSERT [dbo].[DanhMucSanPham] ([MaDanhMuc], [TenDanhMuc]) VALUES (3, N'Máy tính bảng')
SET IDENTITY_INSERT [dbo].[DanhMucSanPham] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (1, CAST(N'2016-12-27 00:00:00' AS SmallDateTime), 0, N'Giao hàng buổi chiều', 1)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (2, CAST(N'2016-12-27 00:00:00' AS SmallDateTime), 0, N'Giao hàng buổi chiều', 2)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (3, CAST(N'2016-12-27 00:00:00' AS SmallDateTime), 0, N'', 3)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (4, CAST(N'2016-12-28 00:00:00' AS SmallDateTime), 0, N'Giao hàng buổi chiều', 1)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (5, CAST(N'2016-12-28 00:00:00' AS SmallDateTime), 0, N'', 1)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (6, CAST(N'2016-12-28 00:00:00' AS SmallDateTime), 0, N'', 2)
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [TinhTrangGiaoHang], [GhiChu], [MaKhachHang]) VALUES (7, CAST(N'2016-12-28 00:00:00' AS SmallDateTime), 0, N'Giao hàng sau 20h', 3)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[HinhAnh] ON 

INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (1, N'1.png', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (2, N'2.png', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (3, N'3.png', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (4, N'4.png', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (5, N'5.jpg', 2)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (6, N'6.png', 3)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (7, N'7.jpg', 4)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (8, N'8.jpg', 5)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (9, N'9.jpg', 6)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (10, N'10.jpg', 6)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (11, N'11.jpg', 6)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (12, N'12.jpg', 7)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (13, N'13.jpg', 7)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (14, N'14.jpg', 8)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (15, N'15.jpg', 8)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (16, N'16.jpg', 8)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (17, N'17.jpg', 8)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (18, N'18.jpg', 9)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (19, N'19.jpg', 10)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (20, N'20.png', 11)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (21, N'21.jpg', 12)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (22, N'22.jpg', 13)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (23, N'23.png', 14)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (24, N'24.jpg', 15)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (25, N'25.jpg', 16)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (26, N'26.jpg', 17)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (27, N'27.png', 18)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (28, N'28.jpg', 19)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (29, N'29.gif', 20)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (30, N'30.png', 21)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (31, N'31.png', 22)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (32, N'32.png', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (33, N'33.png', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (34, N'34.png', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (35, N'35.png', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (36, N'36.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (37, N'37.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (38, N'38.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (39, N'39.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (40, N'40.jpg', 25)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (41, N'41.jpg', 25)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (42, N'42.jpg', 25)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (43, N'43.gif', 26)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (44, N'44.jpg', 27)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (45, N'45.jpg', 27)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (46, N'46.jpg', 27)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (47, N'47.jpg', 28)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (48, N'48.jpg', 28)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (49, N'49.jpg', 28)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (50, N'50.jpg', 28)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (51, N'51.jpg', 29)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (52, N'52.jpg', 29)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (53, N'53.jpg', 29)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (54, N'54.jpg', 30)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (55, N'55.jpg', 30)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (56, N'56.jpg', 30)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (57, N'57.jpg', 31)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (58, N'58.jpg', 32)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (59, N'59.jpg', 32)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (60, N'60.jpg', 32)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (61, N'61.jpg', 33)
SET IDENTITY_INSERT [dbo].[HinhAnh] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [GioiTinh], [TenDangNhap], [MatKhau], [PhanLoai]) VALUES (1, N'Nguyễn Anh Quân', N'Hà Nội', N'0924814124', N'naq259@gmail.com', 1, N'naq259', N'e10adc3949ba59abbe56e057f20f883e', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [GioiTinh], [TenDangNhap], [MatKhau], [PhanLoai]) VALUES (2, N'Tôn Ngộ Không', N'Trung Quốc', N'0921482141', N'tonngokhong@gmail.com', 0, N'tonngokhong', N'72eb33929360860eebccecb08d3cff70', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [DiaChi], [SoDienThoai], [Email], [GioiTinh], [TenDangNhap], [MatKhau], [PhanLoai]) VALUES (3, N'Chư Bát Giới', N'Đài Loan', N'0921481241', N'chubatgioi@gmail.com', 1, N'chubatgioi', N'bafed8494b37d0631ce111fafec31c36', 1)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[MauSac] ON 

INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (1, N'Trắng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (2, N'Ghi')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (3, N'Đen')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (4, N'Vàng hồng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (5, N'Vàng Gold')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (6, N'Trắng bạc')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (7, N'Be')
SET IDENTITY_INSERT [dbo].[MauSac] OFF
SET IDENTITY_INSERT [dbo].[PhanHoi] ON 

INSERT [dbo].[PhanHoi] ([MaPhanHoi], [NgayGio], [NoiDung], [MaKhachHang]) VALUES (1, CAST(N'2016-12-28 00:00:00' AS SmallDateTime), N'Hệ thống nên mở thêm nhiều chi nhánh', 3)
INSERT [dbo].[PhanHoi] ([MaPhanHoi], [NgayGio], [NoiDung], [MaKhachHang]) VALUES (2, CAST(N'2016-12-28 00:00:00' AS SmallDateTime), N'Nhân viên có thái độ phục vụ rất tốt', 1)
SET IDENTITY_INSERT [dbo].[PhanHoi] OFF
SET IDENTITY_INSERT [dbo].[QuanTriVien] ON 

INSERT [dbo].[QuanTriVien] ([MaAdmin], [TenAdmin], [Email], [TenDangNhap], [MatKhau], [PhanQuyen]) VALUES (1, N'Admin', N'admin@gmail.com', N'admin', N'81dc9bdb52d04dc20036dbd8313ed055', 1)
INSERT [dbo].[QuanTriVien] ([MaAdmin], [TenAdmin], [Email], [TenDangNhap], [MatKhau], [PhanQuyen]) VALUES (2, N'Quân', N'naq259@gmail.com', N'naq259', N'81dc9bdb52d04dc20036dbd8313ed055', 0)
SET IDENTITY_INSERT [dbo].[QuanTriVien] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (1, N'Điện thoại iPhone 7 Plus 256GB', 27990000, 0, N'<ul>
	<li>
	<ul>
		<li>M&agrave;n h&igrave;nh</li>
		<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh
		<p><a href="https://www.thegioididong.com/hoi-dap/man-hinh-led-backlit-ips-lcd-la-gi-905757" target="_blank">LED-backlit IPS LCD</a></p>
		</li>
		<li>Độ ph&acirc;n giải
		<p>1080 x 1920 pixels</p>
		</li>
		<li>M&agrave;n h&igrave;nh rộng
		<p>5.5&quot;</p>
		</li>
		<li>Cảm ứng
		<p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-cong-nghe-man-hinh-cam-ung-596543#diendungdadiem" target="_blank">Cảm ứng điện dung đa điểm</a></p>
		</li>
		<li>
		<p>Mặt k&iacute;nh cảm ứng</p>

		<p><a href="https://www.thegioididong.com/tin-tuc/kinh-cuong-luc-la-gi--596319#shatterproofglass" target="_blank">K&iacute;nh oleophobic (ion cường lực)</a></p>
		</li>
		<li>Camera sau</li>
		<li>Độ ph&acirc;n giải
		<p>Hai camera 12 MP</p>
		</li>
		<li>Quay phim
		<p><a href="https://www.thegioididong.com/tin-tuc/chuan-quay-phim-tren-dien-thoai-596472#4k" target="_blank">Quay phim 4K 2160p@30fps</a></p>
		</li>
		<li>Đ&egrave;n Flash
		<p><a href="https://www.thegioididong.com/hoi-dap/4-den-flash-chup-hinh-voi-2-tong-mau-tren-dien-t-898390" target="_blank">4 đ&egrave;n LED (2 t&ocirc;ng m&agrave;u)</a></p>
		</li>
		<li>Chụp ảnh n&acirc;ng cao
		<p><a href="https://www.thegioididong.com/hoi-dap/chuc-nang-geotagging-gan-the-dia-ly-tren-smartphon-906427" target="_blank">Gắn thẻ địa lý</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408" target="_blank">Tự động lấy n&eacute;t</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-touch-focus-khi-chup-anh-tren-smartphone-906412" target="_blank">Chạm lấy n&eacute;t</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/nhan-dien-khuon-mat-la-gi-907903" target="_blank">Nhận diện khu&ocirc;n mặt</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-hdr-tren-smartphone-la-gi-906400" target="_blank">HDR</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/chup-anh-panorama-toan-canh-tren-camera-cua-smar-906425" target="_blank">Panorama</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-chong-rung-quang-hoc-ois-chup-anh-tren-sm-906416" target="_blank">Chống rung quang học (OIS)</a></p>
		</li>
		<li>Camera trước</li>
		<li>Độ ph&acirc;n giải
		<p>7 MP</p>
		</li>
		<li>Quay phim
		<p>C&oacute;</p>
		</li>
		<li>Videocall
		<p>Hỗ trợ VideoCall th&ocirc;ng qua ứng dụng OTT</p>
		</li>
		<li>Th&ocirc;ng tin kh&aacute;c
		<p><a href="https://www.thegioididong.com/tin-tuc/cac-tinh-nang-chup-anh-camera-truoc-769270#hdr" target="_blank">Selfie ngược s&aacute;ng HDR</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408" target="_blank">Tự động lấy n&eacute;t</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/chuan-quay-phim-tren-dien-thoai-596472#fullhd" target="_blank">Quay video Full HD</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/chuc-nang-nhan-dien-khuon-mat-la-gi-907903" target="_blank">Nhận diện khu&ocirc;n mặt</a></p>
		</li>
		<li>Hệ điều h&agrave;nh - CPU</li>
		<li>Hệ điều h&agrave;nh
		<p><a href="https://www.thegioididong.com/tin-tuc/ios-10-chinh-thuc-ra-mat-voi-hang-loat-tinh-nang-moi-841598" target="_blank">iOS 10</a></p>
		</li>
		<li>Chipset (h&atilde;ng SX CPU)
		<p><a href="https://www.thegioididong.com/hoi-dap/tong-quan-ve-chip-a10-fusion-cua-apple-885052" target="_blank">Apple A10 Fusion 4 nh&acirc;n 64-bit</a></p>
		</li>
		<li>Tốc độ CPU
		<p>2.3 GHz</p>
		</li>
		<li>Chip đồ họa (GPU)
		<p>Chip đồ họa 6 nh&acirc;n</p>
		</li>
		<li>Bộ nhớ &amp; Lưu trữ</li>
		<li>RAM
		<p>3 GB</p>
		</li>
		<li>Bộ nhớ trong (ROM)
		<p>256 GB</p>
		</li>
		<li>Bộ nhớ c&ograve;n lại (khả dụng)
		<p>Khoảng 247.52 GB</p>
		</li>
		<li>Thẻ nhớ ngo&agrave;i
		<p>Kh&ocirc;ng</p>
		</li>
		<li>Hỗ trợ thẻ tối đa
		<p>Kh&ocirc;ng</p>
		</li>
		<li>Kết nối</li>
		<li>Băng tần 2G
		<p><a href="https://www.thegioididong.com/tin-tuc/cac-loai-mang-di-dong-2g-3g-va-4g-590194#2g" target="_blank">GSM 850/900/1800/1900</a></p>
		</li>
		<li>Băng tần 3G
		<p><a href="https://www.thegioididong.com/tin-tuc/cac-loai-mang-di-dong-2g-3g-va-4g-590194#3g" target="_blank">HSDPA</a></p>
		</li>
		<li>
		<p>H&ocirc;̃ trợ 4G</p>

		<p><a href="https://www.thegioididong.com/hoi-dap/4g-la-gi-731757" target="_blank">4G LTE Cat 9</a></p>
		</li>
		<li>Số khe sim
		<p>1 SIM</p>
		</li>
		<li>Loại Sim
		<p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-loai-sim-thong-dung-sim-thuong-micro--590216#nanosim" target="_blank">Nano SIM</a></p>
		</li>
		<li>Wifi
		<p><a href="https://www.thegioididong.com/tin-tuc/wifi-la-gi-cai-dat-wifi-hotspot-nhu-the-nao--590309#80211ac" target="_blank">Wi-Fi 802.11 a/b/g/n/ac</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/wifi-dual-band-la-gi-736489" target="_blank">Dual-band</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/wifi-la-gi-cai-dat-wifi-hotspot-nhu-the-nao--590309#wifihotspot" target="_blank">Wi-Fi hotspot</a></p>
		</li>
		<li>GPS
		<p><a href="https://www.thegioididong.com/tin-tuc/he-thong-dinh-vi-toan-cau-gps-la-gi--590552#agps" target="_blank">A-GPS</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/he-thong-dinh-vi-gps-va-glonass-la-gi-729876#glonass" target="_blank">GLONASS</a></p>
		</li>
		<li>Bluetooth
		<p><a href="https://www.thegioididong.com/hoi-dap/bluetooth-42-la-gi-895615" target="_blank">v4.2</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-a2dp-la-gi-723725" target="_blank">A2DP</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-743602#le" target="_blank">LE</a></p>
		</li>
		<li>NFC
		<p>C&oacute;</p>
		</li>
		<li>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc
		<p><a href="https://www.thegioididong.com/hoi-dap/cong-lightning-la-gi-868282" target="_blank">Lightning</a></p>
		</li>
		<li>Jack tai nghe
		<p>Kh&ocirc;ng</p>
		</li>
		<li>Kết nối kh&aacute;c
		<p><a href="https://www.thegioididong.com/hoi-dap/ket-noi-airplay-la-gi-907867" target="_blank">Air Play</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/ket-noi-otg-la-gi-va-cach-su-dung-tren-smartphone-nhu-the-nao-834314" target="_blank">OTG</a>,&nbsp;<a href="http://www.thegioididong.com/tin-tuc/hdmi-la-gi--590061" target="_blank">HDMI</a></p>
		</li>
		<li>Thiết kế &amp; Trọng lượng</li>
		<li>Thiết kế
		<p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-kieu-thiet-ke-tren-di-dong-va-may-tin-597153#nguyenkhoi" target="_blank">Nguy&ecirc;n khối</a></p>
		</li>
		<li>Chất liệu
		<p>Hợp kim Nh&ocirc;m + Magie</p>
		</li>
		<li>K&iacute;ch thước
		<p>D&agrave;i 158.2 mm - Ngang 77.9 mm - D&agrave;y 7.3 mm</p>
		</li>
		<li>Trọng lượng
		<p>188 g</p>
		</li>
		<li>Th&ocirc;ng tin pin</li>
		<li>Dung lượng pin
		<p>2900 mAh</p>
		</li>
		<li>Loại pin
		<p><a href="https://www.thegioididong.com/tin-tuc/pin-smartphone-va-phuong-thuc-su-dung-pin-595433#pinlion" target="_blank">Pin chuẩn Li-Ion</a></p>
		</li>
		<li>Giải tr&iacute; &amp; Ứng dụng</li>
		<li>Xem phim
		<p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-pho-bien-hien-nay-740243#h265" target="_blank">H.265</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#3gp" target="_blank">3GP</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#mp4" target="_blank">MP4</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#avi" target="_blank">AVI</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wmv" target="_blank">WMV</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#h264" target="_blank">H.264(MPEG4-AVC)</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-pho-bien-hien-nay-740243#divx" target="_blank">DivX</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wmv" target="_blank">WMV9</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-pho-bien-hien-nay-740243#xvid" target="_blank">Xvid</a></p>
		</li>
		<li>Nghe nhạc
		<p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#midi" target="_blank">Midi</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#lossless" target="_blank">Lossless</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#mp3" target="_blank">MP3</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wav" target="_blank">WAV</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wma" target="_blank">WMA</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#eaac" target="_blank">eAAC+</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#ogg" target="_blank">OGG</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#ac3" target="_blank">AC3</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#flac" target="_blank">FLAC</a></p>
		</li>
		<li>Ghi &acirc;m
		<p><a href="https://www.thegioididong.com/hoi-dap/microphone-chong-on-la-gi-894183" target="_blank">C&oacute;, microphone chuy&ecirc;n dụng chống ồn</a></p>
		</li>
		<li>Radio
		<p>Kh&ocirc;ng</p>
		</li>
		<li>Chức năng kh&aacute;c
		<p><a href="https://www.thegioididong.com/tin-tuc/touch-id-la-gi--590286" target="_blank">Mở khóa nhanh bằng v&acirc;n tay</a><br />
		<a href="https://www.thegioididong.com/hoi-dap/huong-dan-su-dung-3d-touch-738113" target="_blank">3D Touch</a><br />
		<a href="https://www.thegioididong.com/hoi-dap/chong-nuoc-va-chong-bui-tren-smart-phone-771130" target="_blank">Chống nước, chống bụi</a></p>
		</li>
	</ul>

	<p>&nbsp;</p>
	</li>
</ul>
', N'2 năm', N'Hộp, Sạc, Tai nghe, Sách hướng dẫn, Jack chuyển tai nghe 3.5mm, Cáp, Cây lấy sim', CAST(N'2016-12-26' AS Date), 1, 1, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (2, N'Samsung Galaxy J3(LTE) 2016', 3290000, 2266000, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :5.0 inch (1280 x 720 pixels)</li>
	<li>Camera :Ch&iacute;nh: 8.0 MP, Phụ: 5.0 MP</li>
	<li>Bộ nhớ trong :8 GB</li>
	<li>Hệ điều h&agrave;nh :Android 5.1</li>
	<li>CPU :Quad-core 1.5 GHz</li>
	<li>K&iacute;ch thước :142.3 x 71 x 7.9 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Super AMOLED</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 Triệu m&agrave;u</li>
	<li>Chuẩn m&agrave;n h&igrave;nh :HD</li>
	<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh :1280 x 720 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :5.0 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Đa điểm</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :8.0 MP</li>
	<li>Camera trước :5.0 MP</li>
	<li>Đ&egrave;n Flash :C&oacute;</li>
	<li>T&iacute;nh năng camera :Gắn thẻ địa lý, Tự động lấy n&eacute;t, Nhận diện khu&ocirc;n mặt</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Video Call :C&oacute;</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Tốc độ CPU :1.5 GHz</li>
	<li>Số nh&acirc;n :4 Nh&acirc;n</li>
	<li>RAM :1.5 GB</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Danh bạ lưu trữ :Kh&ocirc;ng giới hạn</li>
	<li>Bộ nhớ trong :8 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :MicroSD (T-Flash)</li>
	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Kiểu d&aacute;ng :Thanh (thẳng) + Cảm ứng</li>
	<li>K&iacute;ch thước :142.3 x 71 x 7.9 mm</li>
	<li>Trọng lượng :138g</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Loại pin :Li-ion</li>
	<li>Dung lượng pin :2600 mAh</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>
	<li>Băng tần 3G :HSDPA 850/ 900/ 1900/ 2100 GHz</li>
	<li>Băng tần 4G :C&oacute;</li>
	<li>Hỗ trợ SIM :Micro SIM</li>
	<li>Khe cắm sim :2 SIM 2 s&oacute;ng</li>
	<li>Wifi :Wi-Fi 802.11 b/g/n, Wi-Fi Direct, Wi-Fi hotspot</li>
	<li>GPS :A-GPS, GLONASS</li>
	<li>Bluetooth :v4.1</li>
	<li>NFC :Kh&ocirc;ng</li>
	<li>Kết nối USB :C&oacute;, micro USB</li>
	<li>Cổng kết nối kh&aacute;c :Kh&ocirc;ng</li>
	<li>Cổng sạc :Micro USB</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MP4, H.264(MPEG4-AVC)</li>
	<li>Nghe nhạc :MP3, WAV, eAAC+, FLAC</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>FM radio :C&oacute;</li>
</ul>
', N'1 năm', N'Tặng Phiếu mua hàng phụ kiện 150.000đ', CAST(N'2016-12-26' AS Date), 1, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (3, N'Điện thoại Sony Xperia XZ', 14990000, 0, N'<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh
	<p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-man-hinh-triluminos-la-gi-901357" target="_blank">TRILUMINOS&trade;</a></p>
	</li>
	<li>Độ ph&acirc;n giải
	<p>1080 x 1920 pixels</p>
	</li>
	<li>M&agrave;n h&igrave;nh rộng
	<p>5.2&quot;</p>
	</li>
	<li>Cảm ứng
	<p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-cong-nghe-man-hinh-cam-ung-596543#diendungdadiem" target="_blank">Cảm ứng điện dung đa điểm</a></p>
	</li>
	<li>
	<p>Mặt k&iacute;nh cảm ứng</p>

	<p><a href="https://www.thegioididong.com/tin-tuc/kinh-cuong-luc-la-gi--596319#gorillaglass1" target="_blank">K&iacute;nh cường lực Gorilla Glass</a></p>
	</li>
	<li>Camera sau</li>
	<li>Độ ph&acirc;n giải
	<p>23 MP</p>
	</li>
	<li>Quay phim
	<p><a href="https://www.thegioididong.com/tin-tuc/chuan-quay-phim-tren-dien-thoai-596472#4k" target="_blank">Quay phim 4K 2160p@30fps</a></p>
	</li>
	<li>Đ&egrave;n Flash
	<p>C&oacute;</p>
	</li>
	<li>Chụp ảnh n&acirc;ng cao
	<p><a href="https://www.thegioididong.com/hoi-dap/lay-net-laser-756447" target="_blank">L&acirc;́y nét bằng laser</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/chuc-nang-geotagging-gan-the-dia-ly-tren-smartphon-906427" target="_blank">Gắn thẻ địa lý</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-autofocus-trong-chup-anh-tren-smartphone-906408" target="_blank">Tự động lấy n&eacute;t</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-touch-focus-khi-chup-anh-tren-smartphone-906412" target="_blank">Chạm lấy n&eacute;t</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/nhan-dien-khuon-mat-la-gi-907903" target="_blank">Nhận diện khu&ocirc;n mặt</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-chup-anh-hdr-tren-smartphone-la-gi-906400" target="_blank">HDR</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/chup-anh-panorama-toan-canh-tren-camera-cua-smar-906425" target="_blank">Panorama</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/che-do-chong-rung-quang-hoc-ois-chup-anh-tren-sm-906416" target="_blank">Chống rung quang học (OIS)</a></p>
	</li>
	<li>Camera trước</li>
	<li>Độ ph&acirc;n giải
	<p>13 MP</p>
	</li>
	<li>Quay phim
	<p>C&oacute;</p>
	</li>
	<li>Videocall
	<p>Hỗ trợ VideoCall th&ocirc;ng qua ứng dụng OTT</p>
	</li>
	<li>Th&ocirc;ng tin kh&aacute;c
	<p><a href="https://www.thegioididong.com/tin-tuc/cac-tinh-nang-chup-anh-camera-truoc-769270#hdr" target="_blank">Selfie ngược s&aacute;ng HDR</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/cac-tinh-nang-chup-anh-camera-truoc-769270#selfiegocrong" target="_blank">Camera g&oacute;c rộng</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/chuan-quay-phim-tren-dien-thoai-596472#fullhd" target="_blank">Quay video Full HD</a></p>
	</li>
	<li>Hệ điều h&agrave;nh - CPU</li>
	<li>Hệ điều h&agrave;nh
	<p><a href="https://www.thegioididong.com/hoi-dap/android-6-marshmallow-co-gi-hot-726146" target="_blank">Android 6.0 (Marshmallow)</a></p>
	</li>
	<li>Chipset (h&atilde;ng SX CPU)
	<p><a href="https://www.thegioididong.com/hoi-dap/qualcomm-snapdragon-820-763732" target="_blank">Snapdragon 820 4 nh&acirc;n 64-bit</a></p>
	</li>
	<li>Tốc độ CPU
	<p>2 nh&acirc;n 2.15 GHz Kryo &amp; 2 nh&acirc;n 1.6 GHz Kryo</p>
	</li>
	<li>Chip đồ họa (GPU)
	<p><a href="https://www.thegioididong.com/hoi-dap/tim-hieu-gpu-adreno-530-trong-snapdragon-820-900994" target="_blank">Adreno 530</a></p>
	</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>RAM
	<p>3 GB</p>
	</li>
	<li>Bộ nhớ trong (ROM)
	<p>64 GB</p>
	</li>
	<li>Bộ nhớ c&ograve;n lại (khả dụng)
	<p>Khoảng 50.2 GB</p>
	</li>
	<li>Thẻ nhớ ngo&agrave;i
	<p><a href="https://www.thegioididong.com/the-nho-dien-thoai" target="_blank">MicroSD</a></p>
	</li>
	<li>Hỗ trợ thẻ tối đa
	<p>256 GB</p>
	</li>
	<li>Kết nối</li>
	<li>Băng tần 2G
	<p><a href="https://www.thegioididong.com/tin-tuc/cac-loai-mang-di-dong-2g-3g-va-4g-590194#2g" target="_blank">GSM 850/900/1800/1900</a></p>
	</li>
	<li>Băng tần 3G
	<p><a href="https://www.thegioididong.com/tin-tuc/cac-loai-mang-di-dong-2g-3g-va-4g-590194#3g" target="_blank">HSDPA</a></p>
	</li>
	<li>
	<p>H&ocirc;̃ trợ 4G</p>

	<p><a href="https://www.thegioididong.com/hoi-dap/4g-la-gi-731757" target="_blank">4G LTE Cat 9</a></p>
	</li>
	<li>Số khe sim
	<p><a href="https://www.thegioididong.com/hoi-dap/2-sim-sim-2-dung-chung-the-nho-791792" target="_blank">2 SIM, SIM 2 chung khe thẻ nhớ</a></p>
	</li>
	<li>Loại Sim
	<p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-loai-sim-thong-dung-sim-thuong-micro--590216#nanosim" target="_blank">Nano SIM</a></p>
	</li>
	<li>Wifi
	<p><a href="https://www.thegioididong.com/tin-tuc/wifi-la-gi-cai-dat-wifi-hotspot-nhu-the-nao--590309#80211ac" target="_blank">Wi-Fi 802.11 a/b/g/n/ac</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/wifi-dual-band-la-gi-736489" target="_blank">Dual-band</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/cac-chuan-ket-noi-khong-day-giua-smartphone-voi-tv-590540#dlna" target="_blank">DLNA</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/wi-fi-direct-la-gi--590298" target="_blank">Wi-Fi Direct</a>,&nbsp;<a href="https://www.thegioididong.com/tin-tuc/wifi-la-gi-cai-dat-wifi-hotspot-nhu-the-nao--590309#wifihotspot" target="_blank">Wi-Fi hotspot</a></p>
	</li>
	<li>GPS
	<p><a href="https://www.thegioididong.com/tin-tuc/he-thong-dinh-vi-toan-cau-gps-la-gi--590552#agps" target="_blank">A-GPS</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/he-thong-dinh-vi-gps-va-glonass-la-gi-729876#glonass" target="_blank">GLONASS</a></p>
	</li>
	<li>Bluetooth
	<p><a href="https://www.thegioididong.com/hoi-dap/bluetooth-42-la-gi-895615" target="_blank">v4.2</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-743602#aptx" target="_blank">apt-X</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-a2dp-la-gi-723725" target="_blank">A2DP</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-743602#le" target="_blank">LE</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-bluetooth-743602#edr" target="_blank">EDR</a></p>
	</li>
	<li>NFC
	<p>C&oacute;</p>
	</li>
	<li>C&ocirc;̉ng k&ecirc;́t n&ocirc;́i/sạc
	<p><a href="https://www.thegioididong.com/hoi-dap/usb-type-c-chua-n-mu-c-co-ng-ke-t-no-i-mo-i-723760" target="_blank">USB Type-C</a></p>
	</li>
	<li>Jack tai nghe
	<p>3.5 mm</p>
	</li>
	<li>Kết nối kh&aacute;c
	<p><a href="https://www.thegioididong.com/tin-tuc/ket-noi-otg-la-gi-va-cach-su-dung-tren-smartphone-nhu-the-nao-834314" target="_blank">OTG</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/ket-noi-miracast-la-gi-thiet-bi-co-ket-noi-miracas-907857" target="_blank">Miracast</a></p>
	</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Thiết kế
	<p><a href="https://www.thegioididong.com/tin-tuc/tim-hieu-cac-kieu-thiet-ke-tren-di-dong-va-may-tin-597153#nguyenkhoi" target="_blank">Nguy&ecirc;n khối</a></p>
	</li>
	<li>Chất liệu
	<p>Hợp kim nh&ocirc;m</p>
	</li>
	<li>K&iacute;ch thước
	<p>D&agrave;i 146 mm - Ngang 72 mm - D&agrave;y 8,1 mm</p>
	</li>
	<li>Trọng lượng
	<p>161 g</p>
	</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Dung lượng pin
	<p>2900 mAh</p>
	</li>
	<li>Loại pin
	<p><a href="https://www.thegioididong.com/tin-tuc/pin-smartphone-va-phuong-thuc-su-dung-pin-595433#pinlion" target="_blank">Pin chuẩn Li-Ion</a></p>
	</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim
	<p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-pho-bien-hien-nay-740243#h265" target="_blank">H.265</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#3gp" target="_blank">3GP</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#mp4" target="_blank">MP4</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wmv" target="_blank">WMV</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#h264" target="_blank">H.264(MPEG4-AVC)</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-pho-bien-hien-nay-740243#divx" target="_blank">DivX</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wmv" target="_blank">WMV9</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-pho-bien-hien-nay-740243#xvid" target="_blank">Xvid</a></p>
	</li>
	<li>Nghe nhạc
	<p><a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#midi" target="_blank">Midi</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#lossless" target="_blank">Lossless</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#mp3" target="_blank">MP3</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wav" target="_blank">WAV</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#wma" target="_blank">WMA</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#aac" target="_blank">AAC+</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#aac" target="_blank">AAC++</a>,&nbsp;<a href="https://www.thegioididong.com/hoi-dap/cac-dinh-dang-video-va-am-thanh-740243#flac" target="_blank">FLAC</a></p>
	</li>
	<li>Ghi &acirc;m
	<p><a href="https://www.thegioididong.com/hoi-dap/microphone-chong-on-la-gi-894183" target="_blank">C&oacute;, microphone chuy&ecirc;n dụng chống ồn</a></p>
	</li>
	<li>Radio
	<p>Kh&ocirc;ng</p>
	</li>
	<li>Chức năng kh&aacute;c
	<p><a href="https://www.thegioididong.com/hoi-dap/cong-nghe-am-thanh-hi-res-audio-901349" target="_blank">C&ocirc;ng nghệ &acirc;m thanh Hi-Res Audio</a><br />
	<a href="https://www.thegioididong.com/hoi-dap/man-hinh-cong-25d-chuan-muc-moi-cho-smartphone-837574" target="_blank">Mặt k&iacute;nh 2.5D</a><br />
	<a href="https://www.thegioididong.com/tin-tuc/touch-id-la-gi--590286" target="_blank">Mở khóa nhanh bằng v&acirc;n tay</a><br />
	<a href="https://www.thegioididong.com/hoi-dap/chong-nuoc-va-chong-bui-tren-smart-phone-771130" target="_blank">Chống nước, chống bụi</a><br />
	<a href="https://www.thegioididong.com/hoi-dap/cong-nghe-sac-nhanh-tren-smartphone-755549" target="_blank">Sạc pin nhanh</a></p>
	</li>
</ul>
', N'6 tháng', N'Hộp, Sạc, Tai nghe, Sách hướng dẫn, Cáp', CAST(N'2016-12-26' AS Date), 1, 1, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (4, N'iPhone 6s 16GB', 13990000, 9590000, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :4.7 inch (1334 x 750 pixels)</li>
	<li>Camera :Ch&iacute;nh: 12.0MP, Phụ: 5.0 MP</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Hệ điều h&agrave;nh :iOS 9</li>
	<li>Chipset :Apple A9</li>
	<li>K&iacute;ch thước :138.3 x 67.1 x 7.1 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Retina</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 Triệu m&agrave;u</li>
	<li>Chuẩn m&agrave;n h&igrave;nh :HD</li>
	<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh :1334 x 750 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :4.7 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :3D Touch</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :12.0 MP</li>
	<li>Camera trước :5.0 MP</li>
	<li>Đ&egrave;n Flash :C&oacute;</li>
	<li>T&iacute;nh năng camera :Live Photos, Autofocus with Focus Pixels, Panorama (up to 63 megapixels), Auto HDR for photos, Exposure control, Burst mode , Timer mode</li>
	<li>Quay Phim :4K video recording (3840 by 2160) at 30 fps</li>
	<li>Video Call :720p HD</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Chipset :A9</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Danh bạ lưu trữ :Kh&ocirc;ng giới hạn</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Kh&ocirc;ng</li>
	<li>Hỗ trợ thẻ nhớ tối đa :Kh&ocirc;ng</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Kiểu d&aacute;ng :Thanh (thẳng) + Cảm ứng</li>
	<li>K&iacute;ch thước :138.3 x 67.1 x 7.1 mm</li>
	<li>Trọng lượng :143 g</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Loại pin :lithium-ion battery</li>
	<li>Dung lượng pin :1715mAh</li>
	<li>Pin c&oacute; thể th&aacute;o rời :Kh&ocirc;ng</li>
	<li>Thời gian chờ :10 ng&agrave;y</li>
	<li>Thời gian đ&agrave;m thoại :l&ecirc;n đến 14 giờ (3G)</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 2G :GSM / EDGE (850, 900, 1800, 1900 MHz)</li>
	<li>Băng tần 3G :UMTS / HSPA + / DC-HSDPA (850, 900, 1700/2100, 1900, 2100 MHz)</li>
	<li>Băng tần 4G :TD-LTE (Bands 38, 39, 40, 41)</li>
	<li>Hỗ trợ SIM :Nano Sim</li>
	<li>Khe cắm sim :1 Sim</li>
	<li>Wifi :802.11a/b/g/n/ac Wi‑Fi with MIMO</li>
	<li>GPS :C&oacute;</li>
	<li>Bluetooth :Bluetooth 4.2 wireless technology</li>
	<li>NFC :C&oacute;</li>
	<li>Cổng sạc :Lightning to USB Cable</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MP4/H.263/H.264</li>
	<li>Nghe nhạc :MP3 / eAAC + / WAV / WMA</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>FM radio :C&oacute;</li>
	<li>Chức năng kh&aacute;c :- Siri natural language commands and dictation - iCloud cloud service - Twitter and Facebook integration - Maps - Audio/video player/editor - Image viewer/editor - Voice memo - TV-out - Document viewer - Predictive text input</li>
</ul>
', N'1 năm', N'Tai nghe, sạc', CAST(N'2016-12-26' AS Date), 1, 1, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (5, N'Asus Zenfone 3 ZE520KL', 7990000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :5.2 inch (1080 x 1920 pixels )</li>
	<li>Camera :Ch&iacute;nh: 16.0 MP, Phụ: 8.0 MP</li>
	<li>Bộ nhớ trong :64 GB</li>
	<li>Hệ điều h&agrave;nh :Android 6.0 (Marshmallow)</li>
	<li>Chipset :Qualcomm Snapdragon 625</li>
	<li>CPU :Octa-core 2.0 GHz</li>
	<li>GPU :Adreno 506</li>
	<li>K&iacute;ch thước :146.9 x 74 x 7.7 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Super IPS</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 Triệu m&agrave;u</li>
	<li>Chuẩn m&agrave;n h&igrave;nh :Full HD</li>
	<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh :1080 x 1920 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :5.2 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Đa điểm</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :16.0 MP</li>
	<li>Camera trước :8.0 MP</li>
	<li>Đ&egrave;n Flash :C&oacute;</li>
	<li>T&iacute;nh năng camera :nhận diện khu&ocirc;n mặt, chụp to&agrave;n cảnh, HDR</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Video Call :C&oacute;</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Tốc độ CPU :2.0 GHz</li>
	<li>Số nh&acirc;n :8 Nh&acirc;n</li>
	<li>Chipset :Qualcomm Snapdragon 625</li>
	<li>RAM :4 GB</li>
	<li>Chip đồ họa (GPU) :Adreno 506</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Danh bạ lưu trữ :Kh&ocirc;ng giới hạn</li>
	<li>Bộ nhớ trong :64 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước :146,9 x 74 x 7,7 mm</li>
	<li>Trọng lượng :144g</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Loại pin :Polymer</li>
	<li>Dung lượng pin :2650mAh</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Khe cắm sim :2 SIM 2 s&oacute;ng</li>
	<li>Wifi :Wi-Fi 802.11 ac</li>
	<li>GPS :C&oacute;</li>
	<li>Bluetooth :v4.2</li>
	<li>Kết nối USB :USB Type-C</li>
	<li>Cổng kết nối kh&aacute;c :Kh&ocirc;ng</li>
	<li>Cổng sạc :USB Type-C</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :C&oacute;</li>
	<li>Nghe nhạc :C&oacute;</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>FM radio :C&oacute;</li>
	<li>Chức năng kh&aacute;c :kh&ocirc;ng</li>
</ul>
', N'1 năm', N'Sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 1, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (6, N'Samsung Galaxy Note 5', 12490000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :5.7 inch (1440 x 2560 pixels)</li>
	<li>Camera :Ch&iacute;nh: 16.0, Phụ: 5.0 MP</li>
	<li>Bộ nhớ trong :32 GB</li>
	<li>Hệ điều h&agrave;nh :Android 5.1.1 (Lollipop)</li>
	<li>Chipset :Exynos 7420</li>
	<li>CPU :Octa-core (2.1 GHz + 1.5 GHz)</li>
	<li>GPU :Mali-T760MP8</li>
	<li>K&iacute;ch thước :153.2 x 76.1 x 7.6 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Super AMOLED</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 Triệu m&agrave;u</li>
	<li>Chuẩn m&agrave;n h&igrave;nh :Ultra HD</li>
	<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh :1440 x 2560 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :5.7 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Điện dung đa điểm</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :16.0 MP</li>
	<li>Camera trước :5.0 MP</li>
	<li>Đ&egrave;n Flash :C&oacute;</li>
	<li>T&iacute;nh năng camera :Dual Shot, Simultaneous HD video and image recording, geo-tagging, touch focus, face/smile detection, panorama, HDR</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Video Call :C&oacute;</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Tốc độ CPU :Octa-core (2.1 GHz + 1.5 GHz)</li>
	<li>Số nh&acirc;n :8 Nh&acirc;n</li>
	<li>Chipset :Exynos 7420</li>
	<li>RAM :4 GB</li>
	<li>Chip đồ họa (GPU) :Mali-T760MP8</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Danh bạ lưu trữ :Kh&ocirc;ng giới hạn</li>
	<li>Bộ nhớ trong :32 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Kh&ocirc;ng</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Kiểu d&aacute;ng :Thanh (thẳng) + Cảm ứng</li>
	<li>K&iacute;ch thước :153.2 x 76.1 x 7.6 mm</li>
	<li>Trọng lượng :171g</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Loại pin :Li-Po</li>
	<li>Dung lượng pin :3000 mAh</li>
	<li>Pin c&oacute; thể th&aacute;o rời :Kh&ocirc;ng</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>
	<li>Băng tần 3G :HSDPA 850/ 900/ 1900/ 2100 GHz</li>
	<li>Băng tần 4G :LTE</li>
	<li>Hỗ trợ SIM :Nano SIM</li>
	<li>Khe cắm sim :1 Sim</li>
	<li>Wifi :Wi-Fi 802.11 a/b/g/n/ac, dual-band, Wi-Fi Direct, hotspot</li>
	<li>GPS :A-GPS, GLONASS</li>
	<li>Bluetooth :v4.1, A2DP, EDR, LE</li>
	<li>GPRS/EDGE :C&oacute;</li>
	<li>NFC :C&oacute;</li>
	<li>Kết nối USB :MicroUSB</li>
	<li>Cổng kết nối kh&aacute;c :Kh&ocirc;ng</li>
	<li>Cổng sạc :MicroUSB</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MP4/DivX/XviD/WMV/H.264/H.263</li>
	<li>Nghe nhạc :MP3/WAV/eAAC+/AC3/FLAC</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>FM radio :C&oacute;</li>
</ul>
', N'18 tháng', N'Sạc ổ cắm, sạc dự phòng, pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (7, N'Sony Xperia XA Ultra', 7490000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :6.0 inch (1080 x 1920 pixels)</li>
	<li>Camera :Ch&iacute;nh: 21.5 MP, Phụ: 16.0 MP</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Hệ điều h&agrave;nh :Android 6.0 (Marshmallow)</li>
	<li>Chipset :Mediatek MT6755 Helio P10</li>
	<li>CPU :Octa-core 2.0 GHz</li>
	<li>GPU :Mali-T860MP2</li>
	<li>K&iacute;ch thước :164.2 x 79.4 x 8.4 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :IPS LCD, Mobile Bravia Engine 2</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 Triệu m&agrave;u</li>
	<li>Chuẩn m&agrave;n h&igrave;nh :Full HD</li>
	<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh :1080 x 1920 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :6.0 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Điện dung đa điểm</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :21.5 MP</li>
	<li>Camera trước :16.0 MP</li>
	<li>Đ&egrave;n Flash :C&oacute;</li>
	<li>Quay Phim :1080p@30fps</li>
	<li>Video Call :C&oacute;</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Tốc độ CPU :2.0 GHz</li>
	<li>Số nh&acirc;n :8 Nh&acirc;n</li>
	<li>Chipset :Mediatek MT6755 Helio P10</li>
	<li>RAM :3 GB</li>
	<li>Chip đồ họa (GPU) :Mali-T860MP2</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Danh bạ lưu trữ :Kh&ocirc;ng giới hạn</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :MicroSD (T-Flash)</li>
	<li>Hỗ trợ thẻ nhớ tối đa :200 GB</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Kiểu d&aacute;ng :Thanh (thẳng) + Cảm ứng</li>
	<li>K&iacute;ch thước :164.2 x 79.4 x 8.4 mm</li>
	<li>Trọng lượng :190g</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Loại pin :Li-ion</li>
	<li>Dung lượng pin :2700 mAh</li>
	<li>Pin c&oacute; thể th&aacute;o rời :Kh&ocirc;ng</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>
	<li>Băng tần 3G :HSDPA 850/ 900/ 1900/ 2100 MHz</li>
	<li>Băng tần 4G :LTE</li>
	<li>Hỗ trợ SIM :Nano SIM</li>
	<li>Khe cắm sim :2 SIM</li>
	<li>Wifi :Wi-Fi 802.11 a/b/g/n, Wi-Fi Direct, DLNA, hotspot</li>
	<li>GPS :A-GPS, GLONASS</li>
	<li>Bluetooth :v4.1, A2DP, LE, aptX</li>
	<li>GPRS/EDGE :C&oacute;</li>
	<li>NFC :C&oacute;</li>
	<li>Kết nối USB :MicroUSB</li>
	<li>Cổng kết nối kh&aacute;c :Kh&ocirc;ng</li>
	<li>Cổng sạc :MicroUSB</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :XviD/ MP4/ H.264</li>
	<li>Nghe nhạc :MP3/ eAAC+/ WAV/ Flac</li>
	<li>Ghi &acirc;m :C&oacute;</li>
</ul>
', N'1 năm', N'Sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 1, 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (8, N'OPPO F1 Plus', 9990000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :5.5 inch (1920 x 1080 pixels)</li>
	<li>Camera :Ch&iacute;nh: 13.0 MP, Phụ: 16.0 MP</li>
	<li>Bộ nhớ trong :64 GB</li>
	<li>Hệ điều h&agrave;nh :Android 5.1 Lollipop</li>
	<li>Chipset :MediaTek MT6755</li>
	<li>CPU :Octa-core 2.0 GHz</li>
	<li>GPU :Mali T860</li>
	<li>K&iacute;ch thước :151.8 x 74.3 x 6.6 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :AMOLED</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 Triệu m&agrave;u</li>
	<li>Chuẩn m&agrave;n h&igrave;nh :Full HD</li>
	<li>Độ ph&acirc;n giải m&agrave;n h&igrave;nh :1080 x 1920 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :5.5 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Điện dung đa điểm</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :13.0 MP</li>
	<li>Camera trước :16.0 MP</li>
	<li>Đ&egrave;n Flash :C&oacute;</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Video Call :C&oacute;</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Tốc độ CPU :Octa-core 2.0 GHz</li>
	<li>Số nh&acirc;n :8 Nh&acirc;n</li>
	<li>Chipset :MediaTek MT6755</li>
	<li>RAM :4 GB</li>
	<li>Chip đồ họa (GPU) :Mali T860</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Danh bạ lưu trữ :Kh&ocirc;ng giới hạn</li>
	<li>Bộ nhớ trong :64 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :MicroSD (T-Flash)</li>
	<li>Hỗ trợ thẻ nhớ tối đa :128 GB</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Kiểu d&aacute;ng :Thanh (thẳng) + Cảm ứng</li>
	<li>K&iacute;ch thước :151.8 x 74.3 x 6.6 mm</li>
	<li>Trọng lượng :145g</li>
	<li>Th&ocirc;ng tin pin</li>
	<li>Loại pin :Li-ion</li>
	<li>Dung lượng pin :2850 mAh</li>
	<li>Pin c&oacute; thể th&aacute;o rời :Kh&ocirc;ng</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 2G :GSM 850/ 900/ 1800/ 1900 MHz</li>
	<li>Băng tần 3G :WCDMA 850/ 900/ 1900/ 2100 MHz</li>
	<li>Băng tần 4G :FDD-LTE 1/3/5/7/8, TD-LTE 38/40/41</li>
	<li>Hỗ trợ SIM :Nano SIM</li>
	<li>Khe cắm sim :2 SIM</li>
	<li>Wifi :C&oacute;</li>
	<li>Bluetooth :C&oacute;</li>
	<li>GPRS/EDGE :C&oacute;</li>
	<li>NFC :Kh&ocirc;ng</li>
	<li>Kết nối USB :MicroUSB</li>
	<li>Cổng kết nối kh&aacute;c :Kh&ocirc;ng</li>
	<li>Cổng sạc :MicroUSB</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :C&oacute;</li>
	<li>Nghe nhạc :C&oacute;</li>
	<li>Ghi &acirc;m :C&oacute;</li>
</ul>
', N'1 năm', N'dây cáp, sạc, tai nghe', CAST(N'2016-12-27' AS Date), 1, 1, 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (9, N'Lenovo Ideapad 100s-11IBY', 3990000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel Atom Z3735F 1.33 GHz (2M Cache, up to 1.83 GHz)</li>
	<li>Bộ nhớ RAM :2 GB (DDR3L Bus 1333 MHz)</li>
	<li>Đồ họa :Intel&reg; HD Graphics</li>
	<li>Ổ đĩa cứng :32 GB (eMMC)</li>
	<li>M&agrave;n h&igrave;nh :11.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Windows 10</li>
	<li>Kết nối :Wi-Fi, USB 2.0, HDMI, Bluetooth 4.0</li>
	<li>Pin :2 Cell (7 giờ sử dụng)</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :11.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Atom</li>
	<li>Loại CPU :Z3735F</li>
	<li>Tốc độ :1.33GHz</li>
	<li>Bộ nhớ đệm :2 MB Cache</li>
	<li>Tốc độ tối đa :1.83 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :2 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :2 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1333 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :eMMC</li>
	<li>Dung lượng ổ đĩa :32 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition (HD) Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :2 x USB 2.0, HDMI, Micro SD</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :Kh&ocirc;ng</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth v4.0</li>
	<li>Pin/Battery</li>
	<li>Loại pin :2 cell</li>
	<li>Thời gian hoạt động :7 giờ</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :292 mm</li>
	<li>Rộng :202 mm</li>
	<li>Cao :17.5 mm</li>
	<li>Trọng lượng :1.0 kg</li>
</ul>
', N'1 năm', N'Củ sạc, dây sạc', CAST(N'2016-12-27' AS Date), 1, 2, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (10, N'Asus E200HA-FD0006TS', 6000000, 4890000, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Atom&trade; x5-Z8300 Processor (2M Cache, up to 1.84 GHz)</li>
	<li>Bộ nhớ RAM :2 GB (DDR3L Bus 1600 MHz)</li>
	<li>Đồ họa :Intel HD Graphics</li>
	<li>Ổ đĩa cứng :32 GB (eMMC)</li>
	<li>M&agrave;n h&igrave;nh :11.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Windows 10 + Office 365</li>
	<li>Kết nối :USB 2.0, USB 3.0</li>
	<li>Pin :2 Cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :11.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Atom</li>
	<li>Loại CPU :Z8300</li>
	<li>Tốc độ :1.44 GHz</li>
	<li>Bộ nhớ đệm :2 MB Cache</li>
	<li>Tốc độ tối đa :1.84 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :Kh&ocirc;ng</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :2 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :eMMC</li>
	<li>Dung lượng ổ đĩa :32 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :SonicMaster</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :Kh&ocirc;ng</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Pin/Battery</li>
	<li>Loại pin :2 cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>Trọng lượng :0.98 Kg</li>
</ul>
', N'18 tháng', N'Pin rời, dây sạc', CAST(N'2016-12-27' AS Date), 1, 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (11, N'Asus E402SA-WX043D/Celeron N3050/RAM 2G/HDD 500GB/14.0HD/Intel HD ', 5090000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>Bộ nhớ RAM :2 GB (DDR3L Bus 1600 MHz)</li>
	<li>Đồ họa :Intel HD Graphics</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :14 inch (HD LED, 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Free DOS</li>
	<li>Kết nối :LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :2 Cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :14 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Celeron</li>
	<li>Loại CPU :N3050</li>
	<li>Tốc độ :1.60 GHz</li>
	<li>Bộ nhớ đệm :2 MB Cache</li>
	<li>Tốc độ tối đa :2.16 Ghz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :Kh&ocirc;ng</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :2 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphic</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :Sonic Master</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :USB 2.0, USB 3.0, HDMI, LAN</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100Mbps</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Pin/Battery</li>
	<li>Loại pin :2 Cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Free DOS</li>
</ul>
', N'2 năm', N'Sạc pin, tặng kèm tai nghe', CAST(N'2016-12-27' AS Date), 1, 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (12, N'Dell Ins 3552', 5990000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Celeron&reg; Processor N3050 (2M Cache, up to 2.16 GHz)</li>
	<li>Bộ nhớ RAM :2 GB (DDR3L Bus 1600 MHz)</li>
	<li>Đồ họa :Intel HD Graphic</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Windows 10</li>
	<li>Kết nối :Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :4 cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Celeron</li>
	<li>Loại CPU :N3050</li>
	<li>Tốc độ :1.60 GHz</li>
	<li>Bộ nhớ đệm :2 MB Cache</li>
	<li>Tốc độ tối đa :2.16 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :8 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :2 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition (HD) Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :USB 2.0, USB 3.0, HDMI</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :Kh&ocirc;ng</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Kh&ocirc;ng</li>
	<li>Pin/Battery</li>
	<li>Loại pin :4 cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
</ul>
', N'18 tháng', N'sạc pin', CAST(N'2016-12-27' AS Date), 1, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (13, N'Dell Inspiron 3552', 6490000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Celeron&reg; Processor N3060 (2M Cache, up to 2.48 GHz)</li>
	<li>Bộ nhớ RAM :4 GB (DDR3L bus 1600 MHz)</li>
	<li>Đồ họa :Intel HD Graphics</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Windows 10</li>
	<li>Kết nối :2 x USB 2.0, HDMI, USB 3.0</li>
	<li>Pin :4 cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Celeron</li>
	<li>Loại CPU :N3060</li>
	<li>Tốc độ :1.60 GHz</li>
	<li>Bộ nhớ đệm :2 MB Cache</li>
	<li>Tốc độ tối đa :2.48 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :8 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition (HD) Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :C&oacute;</li>
	<li>Loại đĩa quang :DVD RW</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :2 x USB 2.0, HDMI, USB 3.0</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :Kh&ocirc;ng</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth v4.0</li>
	<li>Pin/Battery</li>
	<li>Loại pin :4 cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :380 mm</li>
	<li>Rộng :260 mm</li>
	<li>Cao :21.7 mm</li>
	<li>Trọng lượng :2.0 Kg</li>
</ul>
', N'18 tháng', N'Sạc pin', CAST(N'2016-12-27' AS Date), 1, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (14, N'Acer E5-573-35X5/Core i3 5005U/RAM 4GB/HDD 500GB/DVDRW/15.6FHD ', 8990000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i3-5005U Processor (3M Cache, 2.00 GHz)</li>
	<li>Bộ nhớ RAM :4 GB(DDR3L bus 1600MHz)</li>
	<li>Đồ họa :Intel HD Graphics</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch (Full HD 1920 x 1080 pixels)</li>
	<li>Hệ điều h&agrave;nh :Free DOS</li>
	<li>Kết nối :LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :4 cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1920 x 1080 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :Full HD</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i3</li>
	<li>Loại CPU :5005U</li>
	<li>Tốc độ :2.0 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Tốc độ tối đa :Kh&ocirc;ng</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :8 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :C&oacute;</li>
	<li>Loại đĩa quang :DVD RW</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :LAN, USB 2.0, USB 3.0, HDMI</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100/1000 Mbps</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Pin/Battery</li>
	<li>Loại pin :4 cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Free DOS</li>
</ul>
', N'2 năm', N'Sạc pin, tặng kèm tai nghe', CAST(N'2016-12-27' AS Date), 1, 2, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (15, N'HP 15-ay073TU', 8990000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i3-5005U Processor (3M Cache, 2.00 GHz)</li>
	<li>Bộ nhớ RAM :4 GB(DDR3L bus 1600MHz)</li>
	<li>Đồ họa :Intel HD Graphics</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Free DOS</li>
	<li>Kết nối :LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :4 cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i3</li>
	<li>Loại CPU :5005U</li>
	<li>Tốc độ :2.0 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Tốc độ tối đa :Kh&ocirc;ng</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition (HD) Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :C&oacute;</li>
	<li>Loại đĩa quang :DVDSM</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100/1000 Mbps</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Pin/Battery</li>
	<li>Loại pin :4 cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Free DOS</li>
</ul>
', N'18 tháng', N'Sạc pin', CAST(N'2016-12-27' AS Date), 1, 2, 12)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (16, N'Lenovo Yoga 500-14 inch', 10990000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i3-5020U Processor (3M Cache, 2.20 GHz)</li>
	<li>Bộ nhớ RAM :4 GB(DDR3 1600MHz)</li>
	<li>Đồ họa :Intel HD Graphics</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :14 inch(IPS LCD Full HD 1920 x 1080 pixels)</li>
	<li>Hệ điều h&agrave;nh :Windows 10</li>
	<li>Kết nối :Wi-Fi, LAN, 2*USB 3.0, 1*USB 2.0 HDMI</li>
	<li>Pin :3 Cell Lithium</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :14 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1920 x 1080 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :Full HD IPS</li>
	<li>Cảm ứng :C&oacute;</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i3</li>
	<li>Loại CPU :5020U</li>
	<li>Tốc độ :2.2 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :16 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphic</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :Stereo Speakers With Dolby&reg; Home Theater&reg;</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :2*USB 3.0, 1*USB 2.0 HDMI</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100Mbps</li>
	<li>Chuẩn Wifi :IEEE 802.11ac</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth v4.0</li>
	<li>Pin/Battery</li>
	<li>Loại pin :3 Cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>Trọng lượng :1.8 Kg</li>
</ul>
', N'2 năm', N'sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 2, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (17, N'Asus A556UF-XX062D', 12990000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i5-6200U Processor (3M Cache, up to 2.80 GHz)</li>
	<li>Bộ nhớ RAM :4 GB(DDR3L bus 1600MHz)</li>
	<li>Đồ họa :NVIDIA Geforce 930M (2G)</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Free DOS</li>
	<li>Kết nối :HDMI, Card Reader, USB 2.0, USB 3.0, USB 3.1 Type C</li>
	<li>Pin :2 Cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i5</li>
	<li>Loại CPU :6200U</li>
	<li>Tốc độ :2.30 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Tốc độ tối đa :2.80 GHz</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Nvidia Geforce 930M</li>
	<li>Bộ nhớ đồ họa :2 GB</li>
	<li>Kiểu thiết kế đồ họa :Card rời</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :SonicMaster</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :C&oacute;</li>
	<li>Loại đĩa quang :DVD RW</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100/1000 Mbps</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth</li>
	<li>Pin/Battery</li>
	<li>Loại pin :2 Cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Free DOS</li>
</ul>
', N'18 tháng', N'sạc pin, tặng kèm tai nghe', CAST(N'2016-12-27' AS Date), 1, 2, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (18, N'Dell Ins N3558/i5-5200U', 13690000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i5-5200U Processor (3M Cache, 2.20 GHz up to 2.70 GHz)</li>
	<li>Bộ nhớ RAM :4 GB (DDR3 Bus 1600 MHz)</li>
	<li>Đồ họa :Nvidia GeForce GT820M (2GB)</li>
	<li>Ổ đĩa cứng :500 GB (HDD)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch(1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Windows 10</li>
	<li>Kết nối :LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :4 cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i5</li>
	<li>Loại CPU :5200U</li>
	<li>Tốc độ :2.2 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Tốc độ tối đa :2.7 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :16 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR3L</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :NVIDIA GeForce 820M</li>
	<li>Bộ nhớ đồ họa :2 GB</li>
	<li>Kiểu thiết kế đồ họa :Card rời</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :C&oacute;</li>
	<li>Loại đĩa quang :DVD-ROM</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :2 x USB 2.0, HDMI, USB 3.0</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100Mbps</li>
	<li>Chuẩn Wifi :802.11b/g/n</li>
	<li>Pin/Battery</li>
	<li>Loại pin :4 cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :381.4 mm</li>
	<li>Rộng :267.6 mm</li>
	<li>Cao :25.6 mm</li>
	<li>Trọng lượng :2.4 Kg</li>
</ul>
', N'2 năm', N'sạc pin', CAST(N'2016-12-27' AS Date), 1, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (19, N'Dell Vostro V5568/i5-7200U/Win10', 16490000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i5-7200U Processor (3M Cache, up to 3.10 GHz)</li>
	<li>Bộ nhớ RAM :4 GB (DDR4 bus 2133MHz)</li>
	<li>Đồ họa :Intel&reg; HD Graphics 620</li>
	<li>Ổ đĩa cứng :500 GB(HDD 5400rpm)</li>
	<li>M&agrave;n h&igrave;nh :15.6 inch (HD LED 1366 x 768 pixels)</li>
	<li>Hệ điều h&agrave;nh :Window 10</li>
	<li>Kết nối :LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :3 Cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.6 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1366 x 768 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :HD LED</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i5</li>
	<li>Loại CPU :7200U</li>
	<li>Tốc độ :2.50 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Tốc độ tối đa :3.10 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :16 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR4</li>
	<li>Tốc độ BUS RAM :2133 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD</li>
	<li>Dung lượng ổ đĩa :500 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel&reg; HD Graphics 620</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition (HD) Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :LAN, USB 2.0, USB 3.0, HDMI</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100/1000 Mbps</li>
	<li>Chuẩn Wifi :802.11ac</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth v4.2</li>
	<li>Pin/Battery</li>
	<li>Loại pin :3 Cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :380 mm</li>
	<li>Rộng :252.5 mm</li>
	<li>Cao :19.2 mm</li>
	<li>Trọng lượng :1.98Kg</li>
</ul>
', N'1 năm', N'sạc pin', CAST(N'2016-12-27' AS Date), 1, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (20, N'Dell Ins 7460/i5-7200U', 20000000, 19490000, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel&reg; Core&trade; i5-7200U Processor (3M Cache, up to 3.10 GHz)</li>
	<li>Bộ nhớ RAM :4 GB (DDR4 bus 2133MHz)</li>
	<li>Đồ họa :NVIDIA Geforce GT940M(2 GB)</li>
	<li>Ổ đĩa cứng :500 GB + 128 GB (HDD + SSD)</li>
	<li>M&agrave;n h&igrave;nh :14 inch (Full HD, 1920 x 1080 pixels)</li>
	<li>Hệ điều h&agrave;nh :Window 10</li>
	<li>Kết nối :LAN, Wi-Fi, USB 2.0, USB 3.0, HDMI</li>
	<li>Pin :3 Cell</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :14 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1920 x 1080 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :Full HD</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i5</li>
	<li>Loại CPU :7200U</li>
	<li>Tốc độ :2.50 GHz</li>
	<li>Bộ nhớ đệm :3 MB Cache</li>
	<li>Tốc độ tối đa :3.10 GHz</li>
	<li>Bo mạch</li>
	<li>Hỗ trợ RAM tối đa :16 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :4 GB</li>
	<li>Loại RAM :DDR4</li>
	<li>Tốc độ BUS RAM :2133 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :HDD + SSD</li>
	<li>Dung lượng ổ đĩa :500 GB +128 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :NVIDIA Geforce 940M</li>
	<li>Bộ nhớ đồ họa :2 GB</li>
	<li>Kiểu thiết kế đồ họa :Card rời</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :2.0</li>
	<li>C&ocirc;ng nghệ :High Definition (HD) Audio</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :10/100/1000 Mbps</li>
	<li>Chuẩn Wifi :IEEE 802.11b/g/n</li>
	<li>Pin/Battery</li>
	<li>Loại pin :3 Cell</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Windows 10</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :323 mm</li>
	<li>Rộng :227 mm</li>
	<li>Cao :18.95mm</li>
	<li>Trọng lượng :1.83 kg</li>
</ul>
', N'2 năm', N'sạc pin, tai nghe, loa', CAST(N'2016-12-27' AS Date), 1, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (21, N'Macbook Air 13 MMGF2ZP/A', 23990000, 0, N'<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :13.3 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :1440 x 900 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :LED-backlit</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
</ul>

<ul>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i5</li>
	<li>Loại CPU :Dual-Core</li>
	<li>Tốc độ :1.60 GHz</li>
	<li>Bộ nhớ đệm :3 MB (L3 Cache)</li>
	<li>Tốc độ tối đa :2.7 GHz</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :8 GB</li>
	<li>Loại RAM :LPDDR3</li>
	<li>Tốc độ BUS RAM :1600 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :SSD</li>
	<li>Dung lượng ổ đĩa :128 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics 6000</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :T&iacute;ch hợp</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :Stereo speakers</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>Loại đĩa quang :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :2xUSB 3.0, 1xThunderbolt 2, 1xSDXC Card, 1xMagSafe 2, 1xHeadphone, 2xMic</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :Kh&ocirc;ng</li>
	<li>Chuẩn Wifi :IEEE 802.11 a/b/g/n</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth v4.0</li>
	<li>Pin/Battery</li>
	<li>Loại pin :Lithium-polymer</li>
	<li>Thời gian hoạt động :12 tiếng lướt web</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Mac OS X</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :325 mm</li>
	<li>Rộng :227 mm</li>
	<li>Cao :3 - 17 mm</li>
	<li>Trọng lượng :1.35 Kg</li>
</ul>
', N'1 năm', N'sạc pin, tai nghe, dây cáp', CAST(N'2016-12-27' AS Date), 1, 2, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (22, N'Macbook Retina 12 Rose Gold MMGL2SA/A', 31499000, 0, N'<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :12 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :2304 x 1440 Pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :LED-backlit, Retina Display</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
</ul>

<ul>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :intel</li>
	<li>C&ocirc;ng nghệ CPU :Core M3</li>
	<li>Loại CPU :Dual - Core</li>
	<li>Tốc độ :1.1 GHz</li>
	<li>Bộ nhớ đệm :4MB L3 cache</li>
	<li>Tốc độ tối đa :2.2 GHz</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :8 GB</li>
	<li>Loại RAM :LPDDR3</li>
	<li>Tốc độ BUS RAM :1866 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :SSD</li>
	<li>Dung lượng ổ đĩa :256 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Intel HD Graphics 515</li>
	<li>Bộ nhớ đồ họa :Share</li>
	<li>Kiểu thiết kế đồ họa :kh&ocirc;ng</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :Stereo speakers</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :1xUSB Type-C, 2xMic, 1x 3.5mm headphone jack</li>
	<li>Giao tiếp mạng</li>
	<li>Chuẩn Wifi :IEEE 802.11a/b/g/n</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth v4.0</li>
	<li>Pin/Battery</li>
	<li>Loại pin :Lithium-polymer</li>
	<li>Thời gian hoạt động :10 giờ lướt web</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :Mac OS X</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :28.05 cm</li>
	<li>Rộng :19.65 cm</li>
	<li>Cao :0.35 - 1.31 cm</li>
	<li>Trọng lượng :0.92 kg</li>
</ul>
', N'18 tháng', N'sạc pin, tai nghe, dây cáp', CAST(N'2016-12-27' AS Date), 1, 2, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (23, N'MacBook Pro 15 Touch Bar 256GB (2017)', 56999000, 0, N'<ul>
	<li>Cấu h&igrave;nh nổi bật</li>
	<li>Bộ vi xử l&yacute; :Intel Core i7 Quad-core (6MB shared L3 cache, 2.6 GHz)</li>
	<li>Bộ nhớ RAM :16GB 2133MHz LPDDR3</li>
	<li>Đồ họa :Radeon Pro 450 with 2GB of GDDR5 memory and automatic graphics switching Intel HD Graphics 530</li>
	<li>Ổ đĩa cứng :256GB SSD</li>
	<li>M&agrave;n h&igrave;nh :15.4 inch LED-backlit display (2880 x 1800 pixel, 220 ppi)</li>
	<li>Hệ điều h&agrave;nh :macOS Sierra</li>
	<li>Kết nối :Type C, W-Fi, Bluetooth</li>
	<li>Kết nối :Wifi, Bluetooth</li>
	<li>Pin :Lithium-polymer</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :15.4 inch</li>
	<li>Độ ph&acirc;n giải (W x H) :2880 x 1800 pixels</li>
	<li>C&ocirc;ng nghệ m&agrave;n h&igrave;nh :LED-backlit</li>
	<li>Cảm ứng :Kh&ocirc;ng</li>
	<li>Bộ xử l&yacute;</li>
	<li>H&atilde;ng CPU :Intel</li>
	<li>C&ocirc;ng nghệ CPU :Core i7</li>
	<li>Loại CPU :Quad - core</li>
	<li>Tốc độ :2.6 GHz</li>
	<li>Bộ nhớ đệm :6 MB Cache</li>
	<li>Tốc độ tối đa :3.5 GHz</li>
	<li>Bo mạch</li>
	<li>Chipset :Intel chipset</li>
	<li>Tốc độ Bus :2133 MHz</li>
	<li>Hỗ trợ RAM tối đa :16 GB</li>
	<li>Bộ nhớ</li>
	<li>Dung lượng RAM :16 GB</li>
	<li>Loại RAM :LPDDR3</li>
	<li>Tốc độ BUS RAM :2133 MHz</li>
	<li>Đĩa cứng</li>
	<li>Loại ổ đĩa :SSD</li>
	<li>Dung lượng ổ đĩa :256 GB</li>
	<li>Đồ họa</li>
	<li>Chipset đồ họa :Radeon Pro 450 and automatic graphics switching Intel HD Graphics 530</li>
	<li>Bộ nhớ đồ họa :2GB DDR5</li>
	<li>&Acirc;m thanh</li>
	<li>K&ecirc;nh &acirc;m thanh :Stereo speakers</li>
	<li>C&ocirc;ng nghệ :High dynamic range</li>
	<li>Đĩa quang</li>
	<li>T&iacute;ch hợp :Kh&ocirc;ng</li>
	<li>T&iacute;nh năng mở rộng &amp; cổng giao tiếp</li>
	<li>Cổng giao tiếp :4xThunderbolt 3(USB-C), 1xHeadphone, 3xMicrophone</li>
	<li>Giao tiếp mạng</li>
	<li>Lan :Kh&ocirc;ng</li>
	<li>Chuẩn Wifi :802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible</li>
	<li>Kết nối kh&ocirc;ng d&acirc;y kh&aacute;c :Bluetooth 4.2</li>
	<li>Pin/Battery</li>
	<li>Loại pin :Lithium-polymer</li>
	<li>Thời gian hoạt động :10 giờ lướt web</li>
	<li>Hệ điều h&agrave;nh</li>
	<li>Hệ điều h&agrave;nh k&egrave;m theo m&aacute;y :macOS Sierra</li>
	<li>K&iacute;ch thước &amp; trọng lượng</li>
	<li>D&agrave;i :34.93 cm</li>
	<li>Rộng :24.07 cm</li>
	<li>Cao :1.55 cm</li>
	<li>Trọng lượng :1.83 kg</li>
</ul>
', N'2 năm', N'sạc pin, tai nghe, dây cáp, loa rời', CAST(N'2016-12-27' AS Date), 1, 2, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (24, N'Lenovo Tab 3 7 Essential', 2099000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :7 inch IPS, 1024 x 600 Pixels</li>
	<li>Vi xử l&yacute; CPU :MediaTek 1.3 GHz Quad-Core Processor</li>
	<li>RAM :1 GB</li>
	<li>Bộ nhớ trong :8 GB</li>
	<li>Camera :Ch&iacute;nh : 2.0 MP, Phụ : 0.3 MP</li>
	<li>Kết nối :3G, Bluetooth, Wi-Fi</li>
	<li>Thời gian sử dụng :10 giờ</li>
	<li>K&iacute;ch thước :113 x 190 x 9.9 mm</li>
	<li>Hệ điều h&agrave;nh :Android 5.0</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :IPS</li>
	<li>Độ ph&acirc;n giải :1024 x 600 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :7.0 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Số nh&acirc;n :4 Nh&acirc;n</li>
	<li>Tốc độ CPU :1.3 GHz</li>
	<li>RAM :1 GB</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :8 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Hỗ trợ thẻ nhớ tối đa :64GB</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :2.0 MP</li>
	<li>Camera trước :0.3 MP</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :C&oacute;</li>
	<li>Băng tần 4G :Kh&ocirc;ng</li>
	<li>Wifi :WiFi b/g/n</li>
	<li>Hỗ trợ SIM :C&oacute;</li>
	<li>Đ&agrave;m thoại :C&oacute;</li>
	<li>GPS :C&oacute;</li>
	<li>Bluetooth :Bluetooth&reg; 4.0</li>
	<li>Cổng USB :Micro USB</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :C&oacute;</li>
	<li>Nghe nhạc :C&oacute;</li>
	<li>Ứng dụng kh&aacute;c :Facebook, Game, Lịch, Đồng hồ, B&aacute;o thức, Bản đồ, Mail, Sổ tay</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :113 x 190 x 9.9 mm</li>
	<li>Trọng lượng :300g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Dung lượng pin :3450 mAh</li>
	<li>Thời gian sử dụng :10 giờ</li>
</ul>
', N'1 năm', N'sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (25, N'Samsung Galaxy Tab 3V T116', 2990000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :TFT, 7 inch (1024 x 600 pixels)</li>
	<li>Vi xử l&yacute; CPU :Quad-core, 1.3 GHz</li>
	<li>Chip đồ họa (GPU) :Mali-400MP</li>
	<li>RAM :1 GB</li>
	<li>Bộ nhớ trong :8 GB</li>
	<li>Camera :ch&iacute;nh: 2.0 MP, phụ: 2.0 MP</li>
	<li>Kết nối :3G, Wifi , Bluetooth</li>
	<li>K&iacute;ch thước :193.3 x 116.5 x 9.7 mm</li>
	<li>Hệ điều h&agrave;nh :Android 4.4</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :TFT</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :1024 x 600 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :7 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Số nh&acirc;n :Quad-core</li>
	<li>Tốc độ CPU :1.3 GHz</li>
	<li>RAM :1 GB</li>
	<li>Chip đồ hoạ (GPU) :Mali-400MP</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :8 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Hỗ trợ thẻ nhớ tối đa :32GB</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :2.0 MP</li>
	<li>Camera trước :2.0 MP</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :C&oacute;</li>
	<li>Băng tần 4G :Kh&ocirc;ng</li>
	<li>Wifi :Wi-Fi Chuẩn 802.11 b/g/n</li>
	<li>Hỗ trợ SIM :C&oacute;</li>
	<li>Đ&agrave;m thoại :C&oacute;</li>
	<li>GPS :C&oacute;</li>
	<li>Bluetooth :4.0</li>
	<li>Cổng USB :Micro USB</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MPEG-4, DAT, MPG, FLV, WAV, 3GP, GIF, WMV7, MP4, AVI</li>
	<li>Nghe nhạc :WAV, MP3, WMA, MIDI</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Hỗ trợ Word, Excel, PPT,PDF, MSN</li>
	<li>Ứng dụng kh&aacute;c :Game, Lịch, Đồng hồ, B&aacute;o thức, Bản đồ, Mail, Sổ tay</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :193.3 x 116.5 x 9.7 mm</li>
	<li>Trọng lượng :322g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Lithium - Ion</li>
	<li>Dung lượng pin :3600mAh</li>
</ul>
', N'18 tháng', N'sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (26, N'Acer Iconia Talk S A1-734', 3490000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :IPS 7.0 inch, 1280 x 720 pixels</li>
	<li>Vi xử l&yacute; CPU :MediaTek MT 8735, Quad-core 1.3 GHz</li>
	<li>Chip đồ họa (GPU) :Mali-T720 MP2</li>
	<li>RAM :2 GB</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Camera :Ch&iacute;nh: 13.0MP, Phụ: 2.0MP</li>
	<li>Kết nối :3G, Thoại, Wifi, Bluetooth</li>
	<li>Hệ điều h&agrave;nh :Android 6.0 (Marshmallow)</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :IPS LCD</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :1280 X 720 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :7.0 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :MediaTek MT 8735</li>
	<li>Số nh&acirc;n :4 Nh&acirc;n</li>
	<li>Tốc độ CPU :1.3 GHz</li>
	<li>RAM :2GB</li>
	<li>Chip đồ hoạ (GPU) :Mali-T720 MP2</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Hỗ trợ thẻ nhớ tối đa :64GB</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :13.0 MP</li>
	<li>Camera trước :2.0 MP</li>
	<li>T&iacute;nh năng camera :Tự đ&ocirc;̣ng l&acirc;́y nét, Chạm l&acirc;́y nét, Nh&acirc;̣n di&ecirc;̣n khu&ocirc;n mặt, HDR</li>
	<li>Quay Phim :Full HD 1080p@30fps</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :C&oacute;</li>
	<li>Băng tần 4G :LTE</li>
	<li>Wifi :Wi-Fi 802.11 b/g/n, Wi-Fi hotspot</li>
	<li>Hỗ trợ SIM :1 Sim Micro, 1 Sim Nano</li>
	<li>Đ&agrave;m thoại :C&oacute;</li>
	<li>GPS :A-GPS, GPS</li>
	<li>Bluetooth :4.0, A2DP</li>
	<li>Cổng USB :Micro USB</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :3GP, MP4, WMV</li>
	<li>Nghe nhạc :WAV, MP3, AAC, MIDI</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Hỗ trợ Word, Excel, PPT,PDF, MSN</li>
	<li>Ứng dụng kh&aacute;c :Facebook, Game, Lịch, Đồng hồ, B&aacute;o thức, Bản đồ, Sổ tay</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>Trọng lượng :280g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Lithium - Polymer</li>
	<li>Dung lượng pin :3780 mAh</li>
</ul>
', N'18 tháng', N'sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 3, 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (27, N'iPad Mini 2 Wi-Fi 32GB', 6999000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :Retina c&ocirc;ng nghệ IPS, 7.9 inch</li>
	<li>Vi xử l&yacute; CPU :Dual-core 1.3 GHz</li>
	<li>Chip đồ họa (GPU) :PowerVR G6430</li>
	<li>RAM :1 GB</li>
	<li>Bộ nhớ trong :32 GB</li>
	<li>Camera :Ch&iacute;nh : 5 MP, Phụ : 1.2 MP</li>
	<li>Kết nối :Wi-Fi 802.11 a / b / g / n, dual-band</li>
	<li>Thời gian sử dụng :10 giờ</li>
	<li>K&iacute;ch thước :200 x 134,7 x 7,5 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Rentina</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :1536 x 2048 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :7.9 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng điện dung 10 điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :Apple A7</li>
	<li>Số nh&acirc;n :Dual-core</li>
	<li>Tốc độ CPU :1.3 GHz</li>
	<li>RAM :1 GB</li>
	<li>Chip đồ hoạ (GPU) :PowerVR G6430</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Kh&ocirc;ng</li>
	<li>Hỗ trợ thẻ nhớ tối đa :Kh&ocirc;ng</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :5 MP, 2592 x 1944 pixel, tự động lấy n&eacute;t</li>
	<li>Camera trước :C&oacute;, 1.2 MP, 720p @ 30fps, nhận diện khu&ocirc;n mặt, FaceTime qua Wi-Fi hoặc di động</li>
	<li>T&iacute;nh năng camera :Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt, HDR</li>
	<li>Quay Phim :Quay phim full HD 1080p@30fps, chống rung</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :Kh&ocirc;ng</li>
	<li>Băng tần 4G :Kh&ocirc;ng</li>
	<li>Wifi :Wi-Fi 802.11 a/b/g/n, dual-band</li>
	<li>Hỗ trợ SIM :Kh&ocirc;ng</li>
	<li>GPS :C&oacute;, hỗ trợ A-GPS v&agrave; GLONASS</li>
	<li>Bluetooth :C&oacute;, V2.1 với A2DP, EDR</li>
	<li>Cổng USB :Lighting</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MPEG-4, H.264, FLV, AAC, 3GP, JPEG, GIF, Divx, WMV, AMR, WMA, MP4, AVI</li>
	<li>Nghe nhạc :WAVE, WAV, MP3, AAC+, WMA, AAC, MIDI</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Xem t&agrave;i liệu / bi&ecirc;n tập vi&ecirc;n (Word, Excel, PowerPoint)</li>
	<li>Ứng dụng kh&aacute;c :Facebook, Game, Lịch, Đồng hồ, B&aacute;o thức, Bản đồ, Mail, Sổ tay</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :200 x 134,7 x 7,5 mm</li>
	<li>Trọng lượng :341 g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Li-Ion</li>
	<li>Dung lượng pin :23.8 Wh</li>
	<li>Thời gian sử dụng :10 giờ</li>
</ul>
', N'1 năm', N'sạc pin, tai nghe, dây cáp', CAST(N'2016-12-27' AS Date), 1, 3, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (28, N'Lenovo Phab 2 Pro', 11999000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :6.4 inch, QHD</li>
	<li>Vi xử l&yacute; CPU :Qualcomm Snapdragon 652 processor</li>
	<li>RAM :4 GB</li>
	<li>Bộ nhớ trong :64 GB</li>
	<li>Camera :Ch&iacute;nh : 16 MP, Phụ : 8 MP</li>
	<li>Kết nối :2G, 3G, 4G, Wifi, Bluetooth</li>
	<li>K&iacute;ch thước :179.8 x 88.6 x 10.7 mm</li>
	<li>Hệ điều h&agrave;nh :Android M</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :IPS LCD</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :QHD</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :6.4 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :Qualcomm</li>
	<li>Số nh&acirc;n :4 Nh&acirc;n</li>
	<li>Tốc độ CPU :1.8 GHz</li>
	<li>RAM :4 GB</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :64 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Hỗ trợ thẻ nhớ tối đa :256GB</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :16.0 MP</li>
	<li>Camera trước :8.0 MP</li>
	<li>T&iacute;nh năng camera :Geo-tagging, Touch focus, face detection, HDR, Panorama</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Wifi :802.11 a/b/g/n/ac</li>
	<li>Hỗ trợ SIM :C&oacute;</li>
	<li>GPS :A-GPS, GLONASS</li>
	<li>Bluetooth :Bluetooth 4.0</li>
	<li>Cổng USB :microUSB v2.0</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MP4/H.264 player</li>
	<li>Nghe nhạc :MP3/WAV/eAAC+/FLAC player</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Document viewer</li>
	<li>Ứng dụng kh&aacute;c :Photo/video editor</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :179.8 x 88.6 x 10.7 mm</li>
	<li>Trọng lượng :259 g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Li-Ion</li>
	<li>Dung lượng pin :4050 mAh</li>
</ul>
', N'1 năm', N'sạc pin, tai nghe', CAST(N'2016-12-27' AS Date), 1, 3, 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (29, N'iPad Air 2 Wi-Fi 4G 32GB', 13999000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :Retina c&ocirc;ng nghệ IPS, 9.7 inch</li>
	<li>Vi xử l&yacute; CPU :3 nh&acirc;n, 1.5 GHz</li>
	<li>Chip đồ họa (GPU) :PowerVR GX6650</li>
	<li>RAM :2GB</li>
	<li>Bộ nhớ trong :32 GB</li>
	<li>Camera :Camera sau: 8MP Camera trước: 1.2MP</li>
	<li>Kết nối :C&oacute; 3G (tốc độ Download 42 Mbps; Upload 5.76 Mbps), Wi‑Fi (802.11a/​b/​g/​n/​ac); dual channel (2.4GHz and 5GHz); HT80 with MIMO</li>
	<li>Thời gian sử dụng :10 giờ</li>
	<li>K&iacute;ch thước :240 x 169,5 x 6,1mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Retina c&ocirc;ng nghệ IPS</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :2048 x 1536 pixel</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :9.7 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng điện dung 10 điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :Apple A8X</li>
	<li>Số nh&acirc;n :3 Nh&acirc;n</li>
	<li>Tốc độ CPU :1.5 GHz</li>
	<li>RAM :2 GB</li>
	<li>Chip đồ hoạ (GPU) :PowerVR GX6650</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Kh&ocirc;ng</li>
	<li>Hỗ trợ thẻ nhớ tối đa :Kh&ocirc;ng</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :8.0 MP</li>
	<li>Camera trước :1.2 MP</li>
	<li>T&iacute;nh năng camera :iSight, FaceTime, Auto HDR, f/2.2</li>
	<li>Quay Phim :Full HD 1080p(1920x1080 pixels)</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :C&oacute; 3G (tốc độ Download 42 Mbps; Upload 5.76 Mbps)</li>
	<li>Băng tần 4G :C&oacute;</li>
	<li>Wifi :Wi‑Fi (802.11a/​b/​g/​n/​ac); dual channel (2.4GHz and 5GHz); HT80 with MIMO</li>
	<li>Hỗ trợ SIM :Nano-SIM/ Apple SIM (US &amp; UK)</li>
	<li>GPS :A-GPS support; GLONASS</li>
	<li>Bluetooth :4.0</li>
	<li>Cổng USB :lighting</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MPEG-4, FLV, 3GP, JPEG, GIF, MP4, AVI</li>
	<li>Nghe nhạc :WAVE, AC3, MP3, WMA, AAC, MIDI</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Hỗ trợ Word, Excel, PPT,PDF, MSN</li>
	<li>Ứng dụng kh&aacute;c :Game, Lịch, Đồng hồ, B&aacute;o thức, Bản đồ, Mail, Sổ tay</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :240 x 169,5 x 6,1mm</li>
	<li>Trọng lượng :444 g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Lithium - Polymer</li>
	<li>Dung lượng pin :27.3Wh (7340mAh)</li>
	<li>Thời gian sử dụng :10 giờ</li>
</ul>
', N'2 năm', N'sạc pin, tai nghe, dây cáp', CAST(N'2016-12-27' AS Date), 1, 3, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (30, N'iPad Pro 9.7 Wi-Fi 4G 256GB', 25999000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :9.7 inch (2048 x 1536 pixel)</li>
	<li>Vi xử l&yacute; CPU :A9X</li>
	<li>Chip đồ họa (GPU) :PowerVR Series 7</li>
	<li>RAM :2 GB</li>
	<li>Bộ nhớ trong :256 GB</li>
	<li>Camera :Ch&iacute;nh: 12.0MP; Phụ: 5.0MP</li>
	<li>Kết nối :3G, 4G, Wi-Fi, Bluetooth</li>
	<li>K&iacute;ch thước :240 x 169,5 x 6,1mm</li>
	<li>Hệ điều h&agrave;nh :IOS</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :Rentina</li>
	<li>Độ ph&acirc;n giải :2048 x 1536 pixel</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :9.7 inch</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :Apple A9X</li>
	<li>Số nh&acirc;n :2 Nh&acirc;n</li>
	<li>Tốc độ CPU :2.16 Ghz</li>
	<li>RAM :2 GB</li>
	<li>Chip đồ hoạ (GPU) :PowerVR Series 7</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :256 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Kh&ocirc;ng</li>
	<li>Hỗ trợ thẻ nhớ tối đa :Kh&ocirc;ng</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :12.0MP</li>
	<li>Camera trước :5.0 MP</li>
	<li>T&iacute;nh năng camera :Live Photos, Autofocus, True Tone flash, Panorama, HDR,</li>
	<li>Quay Phim :4K 3840 x 2160 at 30 fps</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :UMTS/HSPA/HSPA+/DC-HSDPA (850, 900, 1700/2100, 1900, 2100</li>
	<li>Băng tần 4G :LTE Advanced (Bands 1, 2, 3, 4, 5, 7, 8, 12, 13, 17, 18, 19, 20, 25, 26, 27, 28, 29, 30, 38, 39, 40, 41)4</li>
	<li>Wifi :Wi‑Fi (802.11a/​b/​g/​n/​ac)</li>
	<li>Hỗ trợ SIM :Nano Sim</li>
	<li>Đ&agrave;m thoại :Kh&ocirc;ng</li>
	<li>GPS :Assisted GPS and GLONASS</li>
	<li>Cổng USB :cổng Lightning</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :240 x 169,5 x 6,1mm</li>
	<li>Trọng lượng :444 g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Lithium - Ion</li>
</ul>
', N'2 năm', N'sạc pin, tai nghe, dây cáp', CAST(N'2016-12-27' AS Date), 1, 3, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (31, N'Asus ZenPad Z370CG', 3990000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :IPS LCD, 7.0 inch</li>
	<li>Vi xử l&yacute; CPU :Quad-Core, 1.2 GHz</li>
	<li>Chip đồ họa (GPU) :Mali-450 MP4</li>
	<li>RAM :2 GB</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Camera :Ch&iacute;nh: 8.0 MP, Phụ: 2.0MP</li>
	<li>Kết nối :3G, Wifi , Bluetooth</li>
	<li>Thời gian sử dụng :8 giờ</li>
	<li>K&iacute;ch thước :189 x 110.9 x 8.7 mm</li>
	<li>Hệ điều h&agrave;nh :Android 5.0 (Lollipop)</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :IPS</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :1280 x 800 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :7.0 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :Intel&reg; Atom&trade; x3-C3230</li>
	<li>Số nh&acirc;n :Quad-core</li>
	<li>Tốc độ CPU :1.2 GHz</li>
	<li>RAM :2 GB</li>
	<li>Chip đồ hoạ (GPU) :Mali-450 MP4</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Hỗ trợ thẻ nhớ tối đa :64GB</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :8.0 MP</li>
	<li>Camera trước :2.0 MP</li>
	<li>T&iacute;nh năng camera :Tự động lấy n&eacute;t, nhận diện khu&ocirc;n mặt</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :850/900/1900/2100 MHz</li>
	<li>Băng tần 4G :Kh&ocirc;ng</li>
	<li>Wifi :802.11 b/g/n</li>
	<li>Hỗ trợ SIM :Micro sim</li>
	<li>Đ&agrave;m thoại :C&oacute;</li>
	<li>GPS :GPS, GLONASS &amp; AGPS</li>
	<li>Bluetooth :Bluetooth v4.0</li>
	<li>Cổng USB :Micro USB</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :MPEG-4, MPG, WMV7, MP4, WMV9, WMV8</li>
	<li>Nghe nhạc :WAVE, MP3, MIDI, DTS HD Premium Sound</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Hỗ trợ Word, Excel, PPT,PDF, MSN</li>
	<li>Ứng dụng kh&aacute;c :Game, Lịch, Đồng hồ, B&aacute;o thức, Bản đồ, Mail, Sổ tay</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :189 x 110.9 x 8.7 mm</li>
	<li>Trọng lượng :272g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Li-polymer</li>
	<li>Dung lượng pin :13 Wh</li>
	<li>Thời gian sử dụng :8 giờ</li>
</ul>
', N'1 năm', N'sạc pin', CAST(N'2016-12-27' AS Date), 1, 3, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (32, N'Asus Memo Pad 8 ME581CL', 5990000, 0, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :8 inch, LED Backlight WUXGA 1920 x 1200 Pixels</li>
	<li>Vi xử l&yacute; CPU :Intel Moorefield 1.8 GHz quad core</li>
	<li>Chip đồ họa (GPU) :IMG PowerVR Series 6 - G6430</li>
	<li>RAM :2 GB</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Camera :Ch&iacute;nh: 5.0 MP, Phụ: 1.2 MP</li>
	<li>Kết nối :3G, Wi-Fi, Bluetooth</li>
	<li>Thời gian sử dụng :9 giờ</li>
	<li>K&iacute;ch thước :213 x 123 x 7.45 mm</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :IPS</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :1920 x 1200 pixels</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :8.0 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :Intel&reg; Atom&trade; Z3560</li>
	<li>Số nh&acirc;n :Quad-core</li>
	<li>Tốc độ CPU :1.8 GHz</li>
	<li>RAM :2 GB</li>
	<li>Chip đồ hoạ (GPU) :IMG PowerVR Series 6 - G6430</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :16 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :5.0 MP</li>
	<li>Camera trước :1.2 MP</li>
	<li>T&iacute;nh năng camera :Geo-tagging, chạm lấy n&eacute;t, nhận diện khu&ocirc;n mặt</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Băng tần 3G :WCDMA : 850/ 900/ 1900/ 2100</li>
	<li>Băng tần 4G :FDD-LTE: 800/ 1800/ 2100/ 2600</li>
	<li>Wifi :WLAN802.11a/b/g/n/ac</li>
	<li>Hỗ trợ SIM :C&oacute;</li>
	<li>Đ&agrave;m thoại :Kh&ocirc;ng</li>
	<li>GPS :C&oacute;</li>
	<li>Bluetooth :Bluetooth v4.0</li>
	<li>Cổng USB :Micro USB</li>
	<li>HDMI :Kh&ocirc;ng</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :WMA, MP4, FLV, JPEG, WMV, H.264, MPEG-4</li>
	<li>Nghe nhạc :MP3/ WAV/ WMA/ AAC player</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Hỗ trợ Word, Excel, PPT,PDF, MSN</li>
	<li>Ứng dụng kh&aacute;c :Facebook, Game, Lịch, Đồng hồ, B&aacute;o thức, Youtube, Bản đồ</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :299g</li>
	<li>Trọng lượng :213 x 123 x 7.45 mm</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Loại pin :Li-polymer</li>
	<li>Dung lượng pin :4000 mAh</li>
	<li>Thời gian sử dụng :9 giờ</li>
</ul>
', N'18 tháng', N'sạc pin', CAST(N'2016-12-27' AS Date), 1, 3, 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [ThongSoKyThuat], [BaoHanh], [PhuKienDiKem], [NgayCapNhat], [TrangThai], [MaDanhMuc], [MaThuongHieu]) VALUES (33, N'Lenovo Ideapad Miix 310 2 in 1', 7200000, 5990000, N'<ul>
	<li>Th&ocirc;ng số cơ bản</li>
	<li>M&agrave;n h&igrave;nh :10.1 inch LED (1280 x800)</li>
	<li>Vi xử l&yacute; CPU :Intel Atom X5 Z8550 Processor</li>
	<li>RAM :2 GB</li>
	<li>Bộ nhớ trong :32 GB</li>
	<li>Camera :Ch&iacute;nh: 5 MP, Phụ: 2 MP</li>
	<li>Kết nối :wifi, Bluetooth, HDMI, Headphone, USB</li>
	<li>Thời gian sử dụng :10 giờ</li>
	<li>K&iacute;ch thước :246 x 173 x 9.2 mm</li>
	<li>Hệ điều h&agrave;nh :Windows 10</li>
</ul>

<ul>
	<li>M&agrave;n h&igrave;nh</li>
	<li>Loại m&agrave;n h&igrave;nh :LED</li>
	<li>M&agrave;u m&agrave;n h&igrave;nh :16 triệu m&agrave;u</li>
	<li>Độ ph&acirc;n giải :1280 x 800</li>
	<li>K&iacute;ch thước m&agrave;n h&igrave;nh :10 inch</li>
	<li>C&ocirc;ng nghệ cảm ứng :Cảm ứng đa điểm</li>
	<li>Cấu h&igrave;nh phần cứng</li>
	<li>Loại CPU (Chipset) :intel</li>
	<li>Số nh&acirc;n :4 Nh&acirc;n</li>
	<li>Tốc độ CPU :1.44 Ghz</li>
	<li>RAM :2 GB</li>
	<li>Bộ nhớ &amp; Lưu trữ</li>
	<li>Bộ nhớ trong :32 GB</li>
	<li>Thẻ nhớ ngo&agrave;i :Micro SD</li>
	<li>Chụp h&igrave;nh &amp; Quay phim</li>
	<li>Camera sau :5 MP with Microphone</li>
	<li>Camera trước :2 MP</li>
	<li>Quay Phim :C&oacute;</li>
	<li>Kết nối &amp; Cổng giao tiếp</li>
	<li>Wifi :WiFi 802.11 b/g/n</li>
	<li>Hỗ trợ SIM :Kh&ocirc;ng</li>
	<li>Bluetooth :Bluetooth 4.0</li>
	<li>Cổng USB :Micro USB</li>
	<li>HDMI :Micro HDMI</li>
	<li>Jack (Input &amp; Output) :3.5 mm</li>
	<li>Giải tr&iacute; &amp; Ứng dụng</li>
	<li>Xem phim :3GP, MP4, WMV</li>
	<li>Nghe nhạc :AC3, MP3, AAC+, WMA, AAC, FLAC</li>
	<li>Ghi &acirc;m :C&oacute;</li>
	<li>C&ocirc;ng vụ văn ph&ograve;ng :Document viewer</li>
	<li>Thiết kế &amp; Trọng lượng</li>
	<li>K&iacute;ch thước (DxRxC) :246 x 173 x 9.2 mm</li>
	<li>Trọng lượng :580 g</li>
	<li>Pin &amp; Dung lượng</li>
	<li>Dung lượng pin :8500 mAh</li>
	<li>Thời gian sử dụng :10 giờ</li>
</ul>
', N'1 năm', N'sạc pin', CAST(N'2016-12-27' AS Date), 1, 3, 9)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (1, 1, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (1, 3, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (1, 4, 8)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (1, 5, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (2, 4, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (2, 7, 16)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (3, 3, 25)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (4, 1, 13)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (4, 3, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (4, 5, 28)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (5, 1, 16)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (5, 3, 23)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (6, 1, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (6, 3, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (6, 7, 30)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (7, 2, 35)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (7, 3, 24)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (8, 1, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (8, 3, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (8, 4, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (8, 5, 30)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (9, 2, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (9, 3, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (10, 3, 24)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (10, 6, 36)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (11, 3, 35)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (11, 7, 14)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (12, 2, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (12, 3, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (13, 3, 26)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (13, 6, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (14, 2, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (14, 3, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (14, 6, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (15, 3, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (15, 5, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (16, 3, 27)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (17, 1, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (17, 2, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (17, 3, 18)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (18, 2, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (18, 3, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (19, 3, 25)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (20, 3, 17)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (20, 7, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (21, 1, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (21, 3, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (22, 1, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (22, 2, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (22, 4, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (22, 5, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (23, 1, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (23, 2, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (23, 4, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (24, 3, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (24, 6, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (25, 1, 23)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (25, 3, 16)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (26, 3, 25)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (27, 1, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (27, 3, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (28, 1, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (28, 2, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (28, 3, 16)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (29, 1, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (29, 4, 15)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (30, 1, 28)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (30, 4, 18)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (31, 2, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (31, 3, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (32, 1, 20)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (32, 4, 25)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (33, 1, 13)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (33, 3, 14)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau], [SoLuong]) VALUES (33, 6, 15)
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (1, N'Dell')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (2, N'Samsung')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (3, N'Apple')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (4, N'Asus')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (5, N'Oppo')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (6, N'Nokia')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (7, N'LG')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (8, N'Sony')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (9, N'Lenovo')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (10, N'Acer')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (11, N'Blackberry')
INSERT [dbo].[ThuongHieu] ([MaThuongHieu], [TenThuongHieu]) VALUES (12, N'HP')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucBaiViet] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[BinhLuanBaiViet]  WITH CHECK ADD FOREIGN KEY([MaBaiViet])
REFERENCES [dbo].[BaiViet] ([MaBaiViet])
GO
ALTER TABLE [dbo].[BinhLuanSanPham]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[PhanHoi]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMucSanPham] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaThuongHieu])
REFERENCES [dbo].[ThuongHieu] ([MaThuongHieu])
GO
ALTER TABLE [dbo].[SanPham_MauSac]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[SanPham_MauSac]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
/****** Object:  StoredProcedure [dbo].[delete_product]    Script Date: 12/28/2016 12:13:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[delete_product]
@id int
as
delete from BinhLuanSanPham where MaSP = @id
delete from ChiTietDonHang where MaSP = @id
delete from HinhAnh where MaSP = @id
delete from SanPham_MauSac where MaSP = @id
delete from SanPham where MaSP = @id


GO
USE [master]
GO
ALTER DATABASE [db_2tech] SET  READ_WRITE 
GO
