package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.BinhLuanSanPham;
import mta.cnpm12.store.utility.DbUtility;

public class ProductCommentDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<BinhLuanSanPham> listAll() throws SQLException {
		String query = "select * from BinhLuanSanPham";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<BinhLuanSanPham> list = new ArrayList<BinhLuanSanPham>();
		while (rs.next()) {
			BinhLuanSanPham e = new BinhLuanSanPham();
			e.setMaBinhLuan(rs.getInt(1));
			e.setTenNguoiBinhLuan(rs.getString(2));
			e.setNgayGio(rs.getDate(3));
			e.setNoiDung(rs.getString(4));
			e.setTrangThai(rs.getBoolean(5));
			e.setMaSP(rs.getInt(6));
			list.add(e);
		}
		return list;
	}

	public static BinhLuanSanPham getById(int id) throws SQLException {
		String query = "select * from BinhLuanSanPham where MaBinhLuan = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			BinhLuanSanPham e = new BinhLuanSanPham();
			e.setMaBinhLuan(rs.getInt(1));
			e.setTenNguoiBinhLuan(rs.getString(2));
			e.setNgayGio(rs.getDate(3));
			e.setNoiDung(rs.getString(4));
			e.setTrangThai(rs.getBoolean(5));
			e.setMaSP(rs.getInt(6));
			return e;
		}
		return null;
	}

	public static boolean edit(BinhLuanSanPham e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(
				"update BinhLuanSanPham set TenNguoiBinhLuan = ?, NoiDung = ?, TrangThai = ?, MaSP = ? where MaBinhLuan = ?");
		pstmt.setString(1, e.getTenNguoiBinhLuan());
		pstmt.setString(2, e.getNoiDung());
		pstmt.setBoolean(3, e.isTrangThai());
		pstmt.setInt(4, e.getMaSP());
		pstmt.setInt(5, e.getMaBinhLuan());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from BinhLuanSanPham where MaBinhLuan = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
}
