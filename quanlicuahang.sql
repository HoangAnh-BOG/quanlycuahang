USE [master]
GO
/****** Object:  Database [QuanliCuaHang]    Script Date: 4/24/2018 5:00:53 PM ******/
CREATE DATABASE [QuanliCuaHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanliCuaHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanliCuaHang.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanliCuaHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanliCuaHang_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanliCuaHang] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanliCuaHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanliCuaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanliCuaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanliCuaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanliCuaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanliCuaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanliCuaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanliCuaHang] SET  MULTI_USER 
GO
ALTER DATABASE [QuanliCuaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanliCuaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanliCuaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanliCuaHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanliCuaHang]
GO
/****** Object:  StoredProcedure [dbo].[sp_BangChamCong_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BangChamCong_Delete]
	@MaNV NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_BangChamCong WHERE MaNV=@MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[sp_BangChamCong_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BangChamCong_Insert]
    @NgayLam DATE,
	@MaNV NVARCHAR(50),
	@GioLam INT
AS
BEGIN
	INSERT INTO dbo.tb_BangChamCong
	        ( NgayLam, MaNV, GioLam )
	VALUES  ( @NgayLam, -- NgayLam - datetime
	          @MaNV, -- MaNV - nvarchar(50)
	          @GioLam -- GioLam - int
	          )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_BangChamCong_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_BangChamCong_Update] 
	@NgayLam DATE,
	@MaNV NVARCHAR(50),
	@GioLam INT
AS
BEGIN
	UPDATE dbo.tb_BangChamCong
	SET
	GioLam=@GioLam
	WHERE NgayLam=@NgayLam AND
	MaNV=@MaNV
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChietKhauHang_Add]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChietKhauHang_Add]
@GiaTri INT,
@Thang INT
AS
BEGIN
	DECLARE @MAXValue VARCHAR(10),@NEWValue VARCHAR(10),@NEW_ID VARCHAR(10),@soluong INT;
	SET @soluong = (SELECT COUNT(MaChietKhau) FROM dbo.tb_ChieuKhauHang);
	IF(@soluong>0)
	BEGIN
	SET @MAXValue = (SELECT TOP 1 MaChietKhau FROM dbo.tb_ChieuKhauHang ORDER BY MaChietKhau DESC);
	SET @NEWValue= REPLACE(@MaxValue,'CK','')+1
	SET @NEW_ID = 'CK'+
    CASE
       WHEN LEN(@NEWValue)<2
          THEN REPLICATE('0',2-LEN(@newValue))
          ELSE ''
       END +@NEWValue
	END
	ELSE SET @NEW_ID='CK01'
	INSERT dbo.tb_ChieuKhauHang
	        ( MaChietKhau, GiaTri, Thang )
	VALUES  ( @NEW_ID, -- MaChietKhau - nvarchar(50)
	          @GiaTri, -- GiaTri - int
	          @Thang  -- Thang - int
	          )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChietKhauHang_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChietKhauHang_Delete]
	@MaChietkhau NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_ChieuKhauHang WHERE MaChietKhau=@MaChietKhau
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChietKhauHang_GetByTop]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ChietKhauHang_GetByTop]
@Top nvarchar(50),
@Where nvarchar(MAX),
@Order nvarchar(50)
as
begin
declare @Sql nvarchar(MAX)
set @Sql='select'
if (Len(@Top)>0)
begin
set @Sql=@Sql+' top '+@Top
end
set @Sql = @Sql + '* from [dbo].[tb_ChieuKhauHang]'
if (len(@Where)>0 )
begin
set @Sql=@Sql+' where '+@Where
end
if (len(@Order)>0 )
begin
set @Sql=@Sql+' Order by '+@Order
end

exec (@Sql)
End
GO
/****** Object:  StoredProcedure [dbo].[sp_ChietKhauHang_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChietKhauHang_Insert]
    @MaChietKhau NVARCHAR(50),
	@GiaTri INT,
	@Thang INT
AS
BEGIN
	INSERT INTO dbo.tb_ChieuKhauHang
	        ( MaChietKhau, GiaTri, Thang )
	VALUES  ( @MaChietKhau, -- MaChietKhau - nvarchar(50)
	          @GiaTri, -- GiaTri - int
	          @Thang -- Thang - int
	          )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChietKhauHang_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChietKhauHang_Update] 
	@MaChietKhau NVARCHAR(50),
	@GiaTri INT,
	@Thang INT
AS
BEGIN
	UPDATE dbo.tb_ChieuKhauHang
	SET GiaTri=@GiaTri,
	Thang=@Thang
	WHERE MaChietKhau=@MaChietKhau
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChucVu_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChucVu_Delete]
	@MaCV NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_ChucVu WHERE MaCV=@MaCV
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChucVu_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChucVu_Insert]
    @MaCV NVARCHAR(50),
	@TenCV NVARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.tb_ChucVu
	        ( MaCV, TenCV )
	VALUES  ( @MaCV, -- MaCV - nvarchar(50)
	           @TenCV -- TenCV - nvarchar(50)
	          )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ChucVu_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ChucVu_Update] 
	@MaCV NVARCHAR(50),
	@TenCV NVARCHAR(50)
AS
BEGIN
	UPDATE dbo.tb_ChucVu
	SET
	TenCV=@TenCV
	WHERE MaCV=@MaCV
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietBanHang_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietBanHang_Update] 
	@MaHDBanHang NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaBan INT,
	@TongChietKhau INT
AS
BEGIN
	UPDATE dbo.tb_CTietHDBanHang
	SET
	SoLuong=@SoLuong,
	GiaBan=@GiaBan,
	TongChietKhau=@TongChietKhau
	WHERE MaHDBanHang=@MaHDBanHang AND MaMH=@MaMH
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDBanHang_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDBanHang_Insert]
    @MaHDBanHang NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaBan INT,
	@TongChietKhau INT
AS
BEGIN
	INSERT INTO dbo.tb_CTietHDBanHang
	        ( MaHDBanHang ,
	          MaMH ,
	          SoLuong ,
	          GiaBan ,
	          TongChietKhau
	        )
	VALUES  ( @MaHDBanHang , -- MaHDBanHang - nvarchar(50)
	          @MaMH , -- MaMH - nvarchar(50)
	          @SoLuong , -- SoLuong - int
	          @GiaBan , -- GiaBan - int
	          @TongChietKhau  -- TongChietKhau - int
	        )
	        
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDBanHang_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDBanHang_Update] 
	@MaHDBanHang NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaBan INT,
	@TongChietKhau INT
AS
BEGIN
	UPDATE dbo.tb_CTietHDBanHang
	SET
	SoLuong=@SoLuong,
	GiaBan=@GiaBan,
	TongChietKhau=@TongChietKhau
	WHERE MaHDBanHang=@MaHDBanHang AND MaMH=@MaMH
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDNhap_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDNhap_Delete]
	@MaHDNhap NVARCHAR(50),
	@MaMH NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_CTietHDNhap WHERE @MaHDNhap=@MaHDNhap AND MaMH=@MaMH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDNhap_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDNhap_Insert]
    @MaHDNhap NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaNhap INT
AS
BEGIN
	INSERT INTO dbo.tb_CTietHDNhap
	        ( MaHDNhap, MaMH, SoLuong, GiaNhap )
	
	VALUES  ( @MaHDNhap , -- MaHDBanNhap - nvarchar(50)
	          @MaMH , -- MaMH - nvarchar(50)
	          @SoLuong , -- SoLuong - int
	          @GiaNhap  -- GiaNhap - int
	        )
			Update dbo.tb_TTMatHang Set SoLuongTon = SoLuongTon + @SoLuong
Where MaMH = @MaMH

	        
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDNhap_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDNhap_Update] 
	@MaHDNhap NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaNhap INT
AS
BEGIN
	UPDATE dbo.tb_CTietHDNhap
	SET
	SoLuong=@SoLuong,
	GiaNhap=@GiaNhap
	WHERE MaHDNhap=@MaHDNhap AND MaMH=@MaMH
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDXuat_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDXuat_Delete]
	@MaHDXuat NVARCHAR(50),
	@MaMH NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_CTietHDXuat WHERE @MaHDXuat=@MaHDXuat AND MaMH=@MaMH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDXuat_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDXuat_Insert]
    @MaHDXuat NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaXuat INT
AS
BEGIN
	INSERT INTO dbo.tb_CTietHDXuat
	        ( MaHDXuat, MaMH, SoLuong, GiaXuat )
	VALUES  ( @MaHDXuat, -- MaHDXuat - nvarchar(50)
	          @MaMH, -- MaMH - nvarchar(50)
	          @SoLuong, -- SoLuong - int
	          @GiaXuat  -- GiaXuat - int
	          )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_CTietHDXuat_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CTietHDXuat_Update] 
	@MaHDXuat NVARCHAR(50),
	@MaMH NVARCHAR(50),
	@SoLuong INT,
	@GiaXuat INT
AS
BEGIN
	UPDATE dbo.tb_CTietHDXuat
	SET
	SoLuong=@SoLuong,
	GiaXuat=@GiaXuat
	WHERE MaHDXuat=@MaHDXuat AND MaMH=@MaMH
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetByTop]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetByTop]
@Top nvarchar(50),
@Where nvarchar(MAX),
@Order nvarchar(50),
@Name NVARCHAR(50)
as
begin
declare @Sql nvarchar(MAX)
set @Sql='select'
if (Len(@Top)>0)
begin
set @Sql=@Sql+' top '+@Top
end
set @Sql = @Sql + '* from '+@Name
if (len(@Where)>0 )
begin
set @Sql=@Sql+' where '+@Where
end
if (len(@Order)>0 )
begin
set @Sql=@Sql+' Order by '+@Order
end

exec (@Sql)
End
SELECT* FROM dbo.tb_HDNhap
GO
/****** Object:  StoredProcedure [dbo].[sp_GiaLuong_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GiaLuong_Delete]
	@MaLuong NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_GiaLuong WHERE @MaLuong=MaLuong
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GiaLuong_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GiaLuong_Insert]
    @MaLuong NVARCHAR(50),
	@GiaLuong INT,
	@MaCV NVARCHAR(50),
	@Nam INT
AS
BEGIN
	INSERT INTO dbo.tb_GiaLuong
	        ( MaLuong, GiaLuong, MaCV, Nam )
	VALUES  ( @MaLuong, -- MaLuong - nvarchar(50)
	          @GiaLuong, -- GiaLuong - int
	          @MaCV, -- MaCV - nvarchar(50)
	          @Nam  -- Nam - int
	          )
	        
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GiaLuong_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GiaLuong_Update] 
	@MaLuong NVARCHAR(50),
	@GiaLuong INT,
	@MaCV NVARCHAR(50),
	@Nam INT
AS
BEGIN
	UPDATE dbo.tb_GiaLuong
	SET
	GiaLuong=@GiaLuong,
	MaCV=@MaCV,
	Nam=@Nam
	WHERE MaLuong=@MaLuong
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDBanHang_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDBanHang_Delete]
	@MaHDBanHang NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_HDBanHang WHERE @MaHDBanHang=MaHDBanHang
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDBanHang_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDBanHang_Insert]
    @MaHDBanHang NVARCHAR(50),
	@NgayBan DATETIME,
	@ThanhTien INT,
	@MaNV NVARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.tb_HDBanHang
	        ( MaHDBanHang ,
	          NgayBan ,
	          ThanhTien ,
	          MaNV
	        )
	VALUES  ( @MaHDBanHang , -- MaHDBanHang - nvarchar(50)
	          @NgayBan , -- NgayBan - datetime
	          @ThanhTien , -- ThanhTien - int
	          @MaNV  -- MaNV - nvarchar(50)
	        )
	        
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDBanHang_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDBanHang_Update] 
	@MaHDBanHang NVARCHAR(50),
	@NgayBan DATETIME,
	@ThanhTien INT,
	@MaNV NVARCHAR(50)
AS
BEGIN
	UPDATE dbo.tb_HDBanHang
	SET 
	NgayBan=@NgayBan,
	ThanhTien=@ThanhTien,
	MaNV=@MaNV
	WHERE MaHDBanHang=@MaHDBanHang
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDNhap_Add]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDNhap_Add]
@NgayNhap DATETIME
AS
BEGIN
	DECLARE @MAXValue VARCHAR(10),@NEWValue VARCHAR(10),@NEW_ID VARCHAR(10),@soluong INT;
	SET @soluong = (SELECT COUNT(MaHDNHap) FROM dbo.tb_HDNhap);
	IF(@soluong>0)
	BEGIN
	SET @MAXValue = (SELECT TOP 1 MaHDNhap FROM dbo.tb_HDNhap ORDER BY MaHDNhap DESC);
	SET @NEWValue= REPLACE(@MaxValue,'HDN','')+1
	SET @NEW_ID = 'HDN'+
    CASE
       WHEN LEN(@NEWValue)<2
          THEN REPLICATE('0',2-LEN(@newValue))
          ELSE ''
       END +@NEWValue
	END
	ELSE SET @NEW_ID='HDN01'
	INSERT dbo.tb_HDNhap
	        ( MaHDNhap, NgayNhap )
	VALUES  ( @NEW_ID, -- MaHDNhap - nvarchar(50)
	          @NgayNhap -- NgayNhap - datetime
	          )

END



GO
/****** Object:  StoredProcedure [dbo].[sp_HDNhap_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDNhap_Delete]
	@MaHDNhap NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_HDNhap WHERE MaHDNhap=@MaHDNhap
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDNhap_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDNhap_Insert]
   @NgayNhap DATETIME
AS
BEGIN
	DECLARE @MAXValue VARCHAR(10),@NEWValue VARCHAR(10),@NEW_ID VARCHAR(10),@soluong INT;
	SET @soluong = (SELECT COUNT(MaHDNHap) FROM dbo.tb_HDNhap);
	IF(@soluong>0)
	BEGIN
	SET @MAXValue = (SELECT TOP 1 MaHDNhap FROM dbo.tb_HDNhap ORDER BY MaHDNhap DESC);
	SET @NEWValue= REPLACE(@MaxValue,'HDN','')+1
	SET @NEW_ID = 'HDN'+
    CASE
       WHEN LEN(@NEWValue)<2
          THEN REPLICATE('0',2-LEN(@newValue))
          ELSE ''
       END +@NEWValue
	END
	ELSE SET @NEW_ID='HDN01'
	INSERT dbo.tb_HDNhap
	        ( MaHDNhap, NgayNhap )
	VALUES  ( @NEW_ID, -- MaHDNhap - nvarchar(50)
	          @NgayNhap -- NgayNhap - datetime
	          )

END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDNhap_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDNhap_Update] 
	@MaHDNhap NVARCHAR(50),
	@NgayNhap DATETIME
AS
BEGIN
	UPDATE dbo.tb_HDNhap
	SET 
	NgayNhap=@NgayNhap
	WHERE MaHDNhap=@MaHDNhap
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDXuat_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDXuat_Delete]
	@MaHDXuat NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_HDXuat WHERE MaHDXuat=@MaHDXuat
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDXuat_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDXuat_Insert]
    @MaHDXuat NVARCHAR(50),
	@NgayXuat DATETIME
AS
BEGIN
	INSERT INTO dbo.tb_HDXuat
	        ( MaHDXuat, NgayXuat )
	VALUES  ( @MaHDXuat, -- MaHDXuat - nvarchar(50)
	          @NgayXuat  -- NgayXuat - datetime
	          )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_HDXuat_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_HDXuat_Update] 
	@MaHDXuat NVARCHAR(50),
	@NgayXuat DATETIME
AS
BEGIN
	UPDATE dbo.tb_HDXuat
	SET 
	NgayXuat=@NgayXuat
	WHERE MaHDXuat=@MaHDXuat
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TongLuong_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TongLuong_Delete]
	@MaTL NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_TongLuong WHERE MaTL=@MaTL
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TongLuong_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TongLuong_Insert]
    @MaTL NVARCHAR(50),
	@TongGioLam INT,
	@MaLuong NVARCHAR(50),
	@MaNV NVARCHAR(50),
	@Thang INT,
	@Nam INT,
	@TongLuong INT
AS
BEGIN
	INSERT INTO dbo.tb_TongLuong
	        ( MaTL ,
	          TongGioLam ,
	          MaLuong ,
	          MaNV ,
	          Thang ,
	          Nam ,
	          TongLuong
	        )
	VALUES  ( @MaTL , -- MaTL - nvarchar(50)
	          @TongGioLam , -- TongGioLam - int
	          @MaLuong , -- MaLuong - nvarchar(50)
	          @MaNV , -- MaNV - nvarchar(50)
	          @Thang , -- Thang - int
	          @Nam , -- Nam - int
	          @TongLuong  -- TongLuong - int
	        )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TongLuong_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TongLuong_Update] 
	@MaTL NVARCHAR(50),
	@TongGioLam INT,
	@MaLuong NVARCHAR(50),
	@MaNV NVARCHAR(50),
	@Thang INT,
	@Nam INT,
	@TongLuong INT
AS
BEGIN
	UPDATE dbo.tb_TongLuong
	SET 
	TongGioLam=@TongGioLam,
	MaLuong=@MaLuong,
	MaNV=@MaNV,
	Thang=@Thang,
	Nam=@Nam,
	TongLuong=@TongLuong
	WHERE MaTL=@MaTL
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTHang_Add]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTHang_Add]
@TenHang NVARCHAR(50),
@GiaBan INT,
@Mota NVARCHAR(MAX),
@MaChietKhau NVARCHAR(50),
@HinhAnh NVARCHAR(MAX)
AS
BEGIN
	DECLARE @MAXValue VARCHAR(10),@NEWValue VARCHAR(10),@NEW_ID VARCHAR(10),@soluong INT;
	SET @soluong = (SELECT COUNT(MaHang) FROM dbo.tb_TTHang);
	IF(@soluong>0)
	BEGIN
	SET @MAXValue = (SELECT TOP 1 MaHang FROM dbo.tb_TTHang ORDER BY MaHang DESC);
	SET @NEWValue= REPLACE(@MaxValue,'H','')+1
	SET @NEW_ID = 'H'+
    CASE
       WHEN LEN(@NEWValue)<2
          THEN REPLICATE('0',2-LEN(@newValue))
          ELSE ''
       END +@NEWValue
	END
	ELSE SET @NEW_ID='H01'
	INSERT dbo.tb_TTHang
	        ( MaHang ,
	          TenHang ,
	          GiaBan ,
	          Mota ,
	          MaChietKhau ,
	          HinhAnh
	        )
	VALUES  ( @NEW_ID , -- MaHang - nvarchar(50)
	          @TenHang , -- TenHang - nvarchar(50)
	          @GiaBan , -- GiaBan - int
	          @Mota , -- Mota - nvarchar(max)
	          @MaChietKhau , -- MaChietKhau - nvarchar(50)
	          @HinhAnh  -- HinhAnh - nvarchar(max)
	        )
			END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTHang_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTHang_Update] 
	@MaHang NVARCHAR(50),
	@TenHang NVARCHAR(50),
	@GiaBan INT,
	@MoTa NVARCHAR(MAX),
	@MaChietKhau NVARCHAR(50),
	@HinhAnh NVARCHAR(MAX)
AS
BEGIN
	UPDATE dbo.tb_TTHang
	SET 
	TenHang=@TenHang,
	GiaBan=@GiaBan,
	Mota=@MoTa,
	MaChietKhau=@MaChietKhau,
	HinhAnh=@HinhAnh
	WHERE MaHang=@MaHang
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTMatHang_Add]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTMatHang_Add]
@TenMH NVARCHAR(MAX),
@Size INT,
@SoLuongTon INT,
@MaHang NVARCHAR(50)
AS
BEGIN
	DECLARE @MAXValue VARCHAR(10),@NEWValue VARCHAR(10),@NEW_ID VARCHAR(10),@soluong INT;
	SET @soluong = (SELECT COUNT(MaMH) FROM dbo.tb_TTMatHang);
	IF(@soluong>0)
	BEGIN
	SET @MAXValue = (SELECT TOP 1 MaMH FROM dbo.tb_TTMatHang ORDER BY MaMH DESC);
	SET @NEWValue= REPLACE(@MaxValue,'MH','')+1
	SET @NEW_ID = 'MH'+
    CASE
       WHEN LEN(@NEWValue)<2
          THEN REPLICATE('0',2-LEN(@newValue))
          ELSE ''
       END +@NEWValue
	END
	ELSE SET @NEW_ID='MH01'
	INSERT dbo.tb_TTMatHang
	        ( MaMH, TenMH, Size, SoLuongTon, MaHang )
	VALUES  ( @NEW_ID, -- MaMH - nvarchar(50)
	          @TenMH, -- TenMH - nvarchar(max)
	          @Size, -- Size - int
	          @SoLuongTon, -- SoLuongTon - int
	          @MaHang  -- MaHang - nvarchar(50)
	          )
			END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTMatHang_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTMatHang_Update] 
	@MaMH NVARCHAR(50),
	@TenMH NVARCHAR(50),
	@Size INT,
	@SoLuongTong INT,
	@MaHang NVARCHAR(50)
AS
BEGIN
	UPDATE dbo.tb_TTMatHang
	SET 
	TenMH=@TenMH,
	Size=@Size,
	SoLuongTon=@SoLuongTong,
	MaHang=@MaHang
	WHERE MaMH=@MaMH
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTNhanVien_Delete]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTNhanVien_Delete]
	@MaNV NVARCHAR(50)
AS
BEGIN
	DELETE FROM dbo.tb_TTNhanVien WHERE MaNV=@MaNV
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTNhanVien_Insert]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTNhanVien_Insert]
    @MaNV NVARCHAR(50),
	@TenNV NVARCHAR(50),
	@NgaySinh DATE,
	@QueQuan NVARCHAR(50),
	@CMTND NVARCHAR(50),
	@SDT NVARCHAR(50),
	@MaCV NVARCHAR(50),
	@TaiKhoan NVARCHAR(50),
	@MatKhau NVARCHAR(50)
AS
BEGIN
	INSERT INTO dbo.tb_TTNhanVien
	        ( MaNV ,
	          TenNV ,
	          NgaySinh ,
	          QueQuan ,
	          CMTND ,
	          SDT ,
	          MaCV ,
	          TaiKhoan ,
	          MatKhau
	        )
	VALUES  ( @MaNV , -- MaNV - nvarchar(50)
	          @TenNV , -- TenNV - nvarchar(50)
	          @NgaySinh , -- NgaySinh - date
	          @QueQuan , -- QueQuan - nvarchar(50)
	          @CMTND , -- CMTND - nvarchar(50)
	          @SDT , -- SDT - nvarchar(50)
	          @MaCV , -- MaCV - nvarchar(50)
	          @TaiKhoan , -- TaiKhoan - nvarchar(50)
	          @MatKhau  -- MatKhau - nvarchar(50)
	        )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_TTNhanVien_Update]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_TTNhanVien_Update] 
	@MaNV NVARCHAR(50),
	@TenNV NVARCHAR(50),
	@NgaySinh DATE,
	@QueQuan NVARCHAR(50),
	@CMTND NVARCHAR(50),
	@SDT NVARCHAR(50),
	@MaCV NVARCHAR(50),
	@TaiKhoan NVARCHAR(50),
	@MatKhau NVARCHAR(50)
AS
BEGIN
	UPDATE dbo.tb_TTNhanVien
	SET 
	TenNV=@TenNV,
	NgaySinh=@NgaySinh,
	QueQuan=@QueQuan,
	CMTND=@CMTND,
	SDT=@SDT,
	MaCV=@MaCV,
	TaiKhoan=@TaiKhoan,
	MatKhau=@MatKhau
	WHERE MaNV=@MaNV
	
END
GO
/****** Object:  Table [dbo].[tb_BangChamCong]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_BangChamCong](
	[NgayLam] [date] NOT NULL,
	[MaNV] [nvarchar](50) NOT NULL,
	[GioLam] [int] NOT NULL,
 CONSTRAINT [PK_tb_BangChamCong] PRIMARY KEY CLUSTERED 
(
	[NgayLam] ASC,
	[MaNV] ASC,
	[GioLam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ChieuKhauHang]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ChieuKhauHang](
	[MaChietKhau] [nvarchar](50) NOT NULL,
	[GiaTri] [int] NULL,
	[Thang] [int] NULL,
 CONSTRAINT [PK_tb_ChieuKhauHang] PRIMARY KEY CLUSTERED 
(
	[MaChietKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_ChucVu]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ChucVu](
	[MaCV] [nvarchar](50) NOT NULL,
	[TenCV] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_ChucVu] PRIMARY KEY CLUSTERED 
(
	[MaCV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_CTietHDBanHang]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CTietHDBanHang](
	[MaHDBanHang] [nvarchar](50) NOT NULL,
	[MaMH] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[TongChietKhau] [int] NULL,
 CONSTRAINT [PK_tb_CTietHDBanHang] PRIMARY KEY CLUSTERED 
(
	[MaHDBanHang] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_CTietHDNhap]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CTietHDNhap](
	[MaHDNhap] [nvarchar](50) NOT NULL,
	[MaMH] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaNhap] [int] NULL,
 CONSTRAINT [PK_tb_CTietHDNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDNhap] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_CTietHDXuat]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_CTietHDXuat](
	[MaHDXuat] [nvarchar](50) NOT NULL,
	[MaMH] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaXuat] [int] NULL,
 CONSTRAINT [PK_tb_CTietHDXuat] PRIMARY KEY CLUSTERED 
(
	[MaHDXuat] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_GiaLuong]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_GiaLuong](
	[MaLuong] [nvarchar](50) NOT NULL,
	[GiaLuong] [int] NULL,
	[MaCV] [nvarchar](50) NULL,
	[Nam] [int] NULL,
 CONSTRAINT [PK_tb_GiaLuong] PRIMARY KEY CLUSTERED 
(
	[MaLuong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_HDBanHang]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_HDBanHang](
	[MaHDBanHang] [nvarchar](50) NOT NULL,
	[NgayBan] [datetime] NULL,
	[ThanhTien] [int] NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_HDBanHang] PRIMARY KEY CLUSTERED 
(
	[MaHDBanHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_HDNhap]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_HDNhap](
	[MaHDNhap] [nvarchar](50) NOT NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_tb_HDNhap] PRIMARY KEY CLUSTERED 
(
	[MaHDNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_HDXuat]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_HDXuat](
	[MaHDXuat] [nvarchar](50) NOT NULL,
	[NgayXuat] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_HDXuat_1] PRIMARY KEY CLUSTERED 
(
	[MaHDXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TongLuong]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TongLuong](
	[MaTL] [nvarchar](50) NOT NULL,
	[TongGioLam] [int] NULL,
	[MaLuong] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
	[Thang] [int] NULL,
	[Nam] [int] NULL,
	[TongLuong] [int] NULL,
 CONSTRAINT [PK_tb_TongLuong] PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TTHang]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TTHang](
	[MaHang] [nvarchar](50) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
	[GiaBan] [nchar](10) NULL,
	[Mota] [nvarchar](max) NULL,
	[MaChietKhau] [nvarchar](50) NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_tb_TTHang] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TTMatHang]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TTMatHang](
	[MaMH] [nvarchar](50) NOT NULL,
	[TenMH] [nvarchar](max) NULL,
	[Size] [int] NULL,
	[SoLuongTon] [int] NULL,
	[MaHang] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_TTMatHang] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_TTNhanVien]    Script Date: 4/24/2018 5:00:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TTNhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[CMTND] [nvarchar](50) NULL,
	[SDT] [nvarchar](50) NULL,
	[MaCV] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tb_TTNhanVien_1] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tb_ChieuKhauHang] ([MaChietKhau], [GiaTri], [Thang]) VALUES (N'CK01', 2000, 1)
INSERT [dbo].[tb_ChieuKhauHang] ([MaChietKhau], [GiaTri], [Thang]) VALUES (N'CK02', 1000, 7)
INSERT [dbo].[tb_ChieuKhauHang] ([MaChietKhau], [GiaTri], [Thang]) VALUES (N'CK03', 1200, 2)
INSERT [dbo].[tb_ChieuKhauHang] ([MaChietKhau], [GiaTri], [Thang]) VALUES (N'CK04', 5000, 4)
INSERT [dbo].[tb_ChieuKhauHang] ([MaChietKhau], [GiaTri], [Thang]) VALUES (N'CK05', 12000, 11)
INSERT [dbo].[tb_ChieuKhauHang] ([MaChietKhau], [GiaTri], [Thang]) VALUES (N'CK06', 1200, 6)
INSERT [dbo].[tb_CTietHDNhap] ([MaHDNhap], [MaMH], [SoLuong], [GiaNhap]) VALUES (N'HDN01', N'MH01', 10, 10000)
INSERT [dbo].[tb_CTietHDNhap] ([MaHDNhap], [MaMH], [SoLuong], [GiaNhap]) VALUES (N'HDN01', N'MH02', 10, 10000)
INSERT [dbo].[tb_CTietHDNhap] ([MaHDNhap], [MaMH], [SoLuong], [GiaNhap]) VALUES (N'HDN02', N'MH01', 2, 12345)
INSERT [dbo].[tb_HDBanHang] ([MaHDBanHang], [NgayBan], [ThanhTien], [MaNV]) VALUES (N'1234', CAST(N'2017-05-12 00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[tb_HDNhap] ([MaHDNhap], [NgayNhap]) VALUES (N'HDN01', CAST(N'2018-03-18 02:05:36.000' AS DateTime))
INSERT [dbo].[tb_HDNhap] ([MaHDNhap], [NgayNhap]) VALUES (N'HDN02', CAST(N'2018-03-18 02:07:46.000' AS DateTime))
INSERT [dbo].[tb_TTHang] ([MaHang], [TenHang], [GiaBan], [Mota], [MaChietKhau], [HinhAnh]) VALUES (N'H01', N'Áo cộc tay bé trai', N'120000    ', N'Áo cộc tay bé trai', N'CK01', N'C:\Users\hanap\Downloads\Images\Ảnh\t-shirt.png')
INSERT [dbo].[tb_TTHang] ([MaHang], [TenHang], [GiaBan], [Mota], [MaChietKhau], [HinhAnh]) VALUES (N'H02', N'Váy bé gái', N'200000    ', N'Váy bé gái', N'CK01', N'C:\Users\hanap\Downloads\Images\Ảnh\dress.png')
INSERT [dbo].[tb_TTHang] ([MaHang], [TenHang], [GiaBan], [Mota], [MaChietKhau], [HinhAnh]) VALUES (N'H03', N'Áo trẻ sơ sinh', N'150000    ', N'Áo trẻ sơ sinh', N'CK03', N'C:\Users\hanap\Downloads\Images\Ảnh\body.png')
INSERT [dbo].[tb_TTMatHang] ([MaMH], [TenMH], [Size], [SoLuongTon], [MaHang]) VALUES (N'MH01', N'Áo bé trai hình người nhện', 6, 22, N'H01')
INSERT [dbo].[tb_TTMatHang] ([MaMH], [TenMH], [Size], [SoLuongTon], [MaHang]) VALUES (N'MH02', N'Áo bé trai hình superman', 5, 20, N'H01')
ALTER TABLE [dbo].[tb_BangChamCong]  WITH CHECK ADD  CONSTRAINT [FK_tb_BangChamCong_tb_TTNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tb_TTNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tb_BangChamCong] CHECK CONSTRAINT [FK_tb_BangChamCong_tb_TTNhanVien]
GO
ALTER TABLE [dbo].[tb_CTietHDBanHang]  WITH CHECK ADD  CONSTRAINT [FK_tb_CTietHDBanHang_tb_HDBanHang] FOREIGN KEY([MaHDBanHang])
REFERENCES [dbo].[tb_HDBanHang] ([MaHDBanHang])
GO
ALTER TABLE [dbo].[tb_CTietHDBanHang] CHECK CONSTRAINT [FK_tb_CTietHDBanHang_tb_HDBanHang]
GO
ALTER TABLE [dbo].[tb_CTietHDBanHang]  WITH CHECK ADD  CONSTRAINT [FK_tb_CTietHDBanHang_tb_TTMatHang] FOREIGN KEY([MaMH])
REFERENCES [dbo].[tb_TTMatHang] ([MaMH])
GO
ALTER TABLE [dbo].[tb_CTietHDBanHang] CHECK CONSTRAINT [FK_tb_CTietHDBanHang_tb_TTMatHang]
GO
ALTER TABLE [dbo].[tb_CTietHDNhap]  WITH CHECK ADD  CONSTRAINT [FK_tb_CTietHDNhap_tb_HDNhap] FOREIGN KEY([MaHDNhap])
REFERENCES [dbo].[tb_HDNhap] ([MaHDNhap])
GO
ALTER TABLE [dbo].[tb_CTietHDNhap] CHECK CONSTRAINT [FK_tb_CTietHDNhap_tb_HDNhap]
GO
ALTER TABLE [dbo].[tb_CTietHDNhap]  WITH CHECK ADD  CONSTRAINT [FK_tb_CTietHDNhap_tb_TTMatHang] FOREIGN KEY([MaMH])
REFERENCES [dbo].[tb_TTMatHang] ([MaMH])
GO
ALTER TABLE [dbo].[tb_CTietHDNhap] CHECK CONSTRAINT [FK_tb_CTietHDNhap_tb_TTMatHang]
GO
ALTER TABLE [dbo].[tb_CTietHDXuat]  WITH CHECK ADD  CONSTRAINT [FK_tb_CTietHDXuat_tb_HDXuat] FOREIGN KEY([MaHDXuat])
REFERENCES [dbo].[tb_HDXuat] ([MaHDXuat])
GO
ALTER TABLE [dbo].[tb_CTietHDXuat] CHECK CONSTRAINT [FK_tb_CTietHDXuat_tb_HDXuat]
GO
ALTER TABLE [dbo].[tb_CTietHDXuat]  WITH CHECK ADD  CONSTRAINT [FK_tb_CTietHDXuat_tb_TTMatHang] FOREIGN KEY([MaMH])
REFERENCES [dbo].[tb_TTMatHang] ([MaMH])
GO
ALTER TABLE [dbo].[tb_CTietHDXuat] CHECK CONSTRAINT [FK_tb_CTietHDXuat_tb_TTMatHang]
GO
ALTER TABLE [dbo].[tb_GiaLuong]  WITH CHECK ADD  CONSTRAINT [FK_tb_GiaLuong_tb_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[tb_ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[tb_GiaLuong] CHECK CONSTRAINT [FK_tb_GiaLuong_tb_ChucVu]
GO
ALTER TABLE [dbo].[tb_HDBanHang]  WITH CHECK ADD  CONSTRAINT [FK_tb_HDBanHang_tb_TTNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tb_TTNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tb_HDBanHang] CHECK CONSTRAINT [FK_tb_HDBanHang_tb_TTNhanVien]
GO
ALTER TABLE [dbo].[tb_TongLuong]  WITH CHECK ADD  CONSTRAINT [FK_tb_TongLuong_tb_GiaLuong] FOREIGN KEY([MaLuong])
REFERENCES [dbo].[tb_GiaLuong] ([MaLuong])
GO
ALTER TABLE [dbo].[tb_TongLuong] CHECK CONSTRAINT [FK_tb_TongLuong_tb_GiaLuong]
GO
ALTER TABLE [dbo].[tb_TongLuong]  WITH CHECK ADD  CONSTRAINT [FK_tb_TongLuong_tb_TTNhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[tb_TTNhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[tb_TongLuong] CHECK CONSTRAINT [FK_tb_TongLuong_tb_TTNhanVien]
GO
ALTER TABLE [dbo].[tb_TTHang]  WITH CHECK ADD  CONSTRAINT [FK_tb_TTHang_tb_ChieuKhauHang] FOREIGN KEY([MaChietKhau])
REFERENCES [dbo].[tb_ChieuKhauHang] ([MaChietKhau])
GO
ALTER TABLE [dbo].[tb_TTHang] CHECK CONSTRAINT [FK_tb_TTHang_tb_ChieuKhauHang]
GO
ALTER TABLE [dbo].[tb_TTMatHang]  WITH CHECK ADD  CONSTRAINT [FK_tb_TTMatHang_tb_TTHang1] FOREIGN KEY([MaHang])
REFERENCES [dbo].[tb_TTHang] ([MaHang])
GO
ALTER TABLE [dbo].[tb_TTMatHang] CHECK CONSTRAINT [FK_tb_TTMatHang_tb_TTHang1]
GO
ALTER TABLE [dbo].[tb_TTNhanVien]  WITH CHECK ADD  CONSTRAINT [FK_tb_TTNhanVien_tb_ChucVu] FOREIGN KEY([MaCV])
REFERENCES [dbo].[tb_ChucVu] ([MaCV])
GO
ALTER TABLE [dbo].[tb_TTNhanVien] CHECK CONSTRAINT [FK_tb_TTNhanVien_tb_ChucVu]
GO
USE [master]
GO
ALTER DATABASE [QuanliCuaHang] SET  READ_WRITE 
GO
