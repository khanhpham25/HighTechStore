package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.BinhLuanBaiViet;
import mta.cnpm12.store.utility.DbUtility;

public class ArticleCommentDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<BinhLuanBaiViet> listAll() throws SQLException {
		String query = "select * from BinhLuanBaiViet";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<BinhLuanBaiViet> list = new ArrayList<BinhLuanBaiViet>();
		while (rs.next()) {
			BinhLuanBaiViet e = new BinhLuanBaiViet();
			e.setMaBinhLuan(rs.getInt(1));
			e.setTenNguoiBinhLuan(rs.getString(2));
			e.setNgayGio(rs.getDate(3));
			e.setNoiDung(rs.getString(4));
			e.setTrangThai(rs.getBoolean(5));
			e.setMaBaiViet(rs.getInt(6));
			list.add(e);
		}
		return list;
	}

	public static BinhLuanBaiViet getById(int id) throws SQLException {
		String query = "select * from BinhLuanBaiViet where MaBinhLuan = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			BinhLuanBaiViet e = new BinhLuanBaiViet();
			e.setMaBinhLuan(rs.getInt(1));
			e.setTenNguoiBinhLuan(rs.getString(2));
			e.setNgayGio(rs.getDate(3));
			e.setNoiDung(rs.getString(4));
			e.setTrangThai(rs.getBoolean(5));
			e.setMaBaiViet(rs.getInt(6));
			return e;
		}
		return null;
	}

	public static boolean edit(BinhLuanBaiViet e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(
				"update BinhLuanBaiViet set TenNguoiBinhLuan = ?, NoiDung = ?, TrangThai = ?, MaBaiViet = ? where MaBinhLuan = ?");
		pstmt.setString(1, e.getTenNguoiBinhLuan());
		pstmt.setString(2, e.getNoiDung());
		pstmt.setBoolean(3, e.isTrangThai());
		pstmt.setInt(4, e.getMaBaiViet());
		pstmt.setInt(5, e.getMaBinhLuan());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from BinhLuanBaiViet where MaBinhLuan = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean create(BinhLuanBaiViet e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("insert into BinhLuanBaiViet values (?,?,?,?,?)");
		pstmt.setString(1, e.getTenNguoiBinhLuan());
		pstmt.setDate(2, (Date) e.getNgayGio());
		pstmt.setString(3, e.getNoiDung());
		pstmt.setBoolean(4, e.isTrangThai());
		pstmt.setInt(5, e.getMaBaiViet());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
	
	public static List<BinhLuanBaiViet> getByNewsId(int id) throws SQLException {
		String query = "select * from BinhLuanBaiViet where MaBaiViet = ? and TrangThai = 1";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		List<BinhLuanBaiViet> list = new ArrayList<BinhLuanBaiViet>();
		while (rs.next()) {
			BinhLuanBaiViet e = new BinhLuanBaiViet();
			e.setMaBinhLuan(rs.getInt(1));
			e.setTenNguoiBinhLuan(rs.getString(2));
			e.setNgayGio(rs.getDate(3));
			e.setNoiDung(rs.getString(4));
			e.setTrangThai(rs.getBoolean(5));
			e.setMaBaiViet(rs.getInt(6));
			list.add(e);
		}
		return list;
	}
	
	public static int countComment(int id) throws SQLException {
		String query = "select count(*) from BinhLuanBaiViet where MaBaiViet = ? and TrangThai = 1";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		while (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}
}
