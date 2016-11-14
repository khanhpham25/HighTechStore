package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.BaiViet;
import mta.cnpm12.store.utility.DbUtility;

public class ArticleDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<BaiViet> listAll() throws SQLException {
		String query = "select * from BaiViet";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<BaiViet> list = new ArrayList<BaiViet>();
		while (rs.next()) {
			BaiViet e = new BaiViet();
			e.setMaBaiViet(rs.getInt(1));
			e.setTieuDe(rs.getString(2));
			e.setMoTa(rs.getString(3));
			e.setHinhAnh(rs.getString(4));
			e.setNgayDang(rs.getDate(5));
			e.setNoiDung(rs.getString(6));
			e.setTrangThai(rs.getBoolean(7));
			e.setMaDanhMuc(rs.getInt(8));
			list.add(e);
		}
		return list;
	}

	public static boolean create(BaiViet e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("insert into BaiViet values (?,?,?,?,?,?,?)");
		pstmt.setString(1, e.getTieuDe());
		pstmt.setString(2, e.getMoTa());
		pstmt.setString(3, e.getHinhAnh());
		pstmt.setDate(4, (Date) e.getNgayDang());
		pstmt.setString(5, e.getNoiDung());
		pstmt.setBoolean(6, e.isTrangThai());
		pstmt.setInt(7, e.getMaDanhMuc());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static BaiViet getById(int id) throws SQLException {
		String query = "select * from BaiViet where MaBaiViet = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			BaiViet e = new BaiViet();
			e.setMaBaiViet(rs.getInt(1));
			e.setTieuDe(rs.getString(2));
			e.setMoTa(rs.getString(3));
			e.setHinhAnh(rs.getString(4));
			e.setNgayDang(rs.getDate(5));
			e.setNoiDung(rs.getString(6));
			e.setTrangThai(rs.getBoolean(7));
			e.setMaDanhMuc(rs.getInt(8));
			return e;
		}
		return null;
	}

	public static boolean edit(BaiViet e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(
				"update BaiViet set TieuDe = ?, MoTa = ?, NgayDang = ?, NoiDung = ?, TrangThai = ?, MaDanhMuc = ? where MaBaiViet = ?");
		pstmt.setString(1, e.getTieuDe());
		pstmt.setString(2, e.getMoTa());
		pstmt.setDate(3, (Date) e.getNgayDang());
		pstmt.setString(4, e.getNoiDung());
		pstmt.setBoolean(5, e.isTrangThai());
		pstmt.setInt(6, e.getMaDanhMuc());
		pstmt.setInt(7, e.getMaBaiViet());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from BaiViet where MaBaiViet = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
	
	public static List<BaiViet> listHotNews() throws SQLException {
		String query = "select top(2) * from BaiViet where TrangThai = 1 order by NgayDang desc";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<BaiViet> list = new ArrayList<BaiViet>();
		while (rs.next()) {
			BaiViet e = new BaiViet();
			e.setMaBaiViet(rs.getInt(1));
			e.setTieuDe(rs.getString(2));
			e.setMoTa(rs.getString(3));
			e.setHinhAnh(rs.getString(4));
			e.setNgayDang(rs.getDate(5));
			e.setNoiDung(rs.getString(6));
			e.setTrangThai(rs.getBoolean(7));
			e.setMaDanhMuc(rs.getInt(8));
			list.add(e);
		}
		return list;
	}
	
	public static List<BaiViet> listNews() throws SQLException {
		String query = "select * from BaiViet where TrangThai = 1";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<BaiViet> list = new ArrayList<BaiViet>();
		while (rs.next()) {
			BaiViet e = new BaiViet();
			e.setMaBaiViet(rs.getInt(1));
			e.setTieuDe(rs.getString(2));
			e.setMoTa(rs.getString(3));
			e.setHinhAnh(rs.getString(4));
			e.setNgayDang(rs.getDate(5));
			e.setNoiDung(rs.getString(6));
			e.setTrangThai(rs.getBoolean(7));
			e.setMaDanhMuc(rs.getInt(8));
			list.add(e);
		}
		return list;
	}
	
	public static List<BaiViet> listNewsByCategory(int id) throws SQLException {
		String query = "select * from BaiViet where TrangThai = 1 and MaDanhMuc = "+ id;
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<BaiViet> list = new ArrayList<BaiViet>();
		while (rs.next()) {
			BaiViet e = new BaiViet();
			e.setMaBaiViet(rs.getInt(1));
			e.setTieuDe(rs.getString(2));
			e.setMoTa(rs.getString(3));
			e.setHinhAnh(rs.getString(4));
			e.setNgayDang(rs.getDate(5));
			e.setNoiDung(rs.getString(6));
			e.setTrangThai(rs.getBoolean(7));
			e.setMaDanhMuc(rs.getInt(8));
			list.add(e);
		}
		return list;
	}
}
