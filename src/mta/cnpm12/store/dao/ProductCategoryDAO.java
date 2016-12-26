package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.DanhMucSanPham;
import mta.cnpm12.store.utility.DbUtility;

public class ProductCategoryDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<DanhMucSanPham> listAll() throws SQLException {
		String query = "select * from DanhMucSanPham";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<DanhMucSanPham> list = new ArrayList<DanhMucSanPham>();
		while (rs.next()) {
			DanhMucSanPham e = new DanhMucSanPham();
			e.setMaDanhMuc(rs.getInt(1));
			e.setTenDanhMuc(rs.getString(2));
			list.add(e);
		}
		return list;
	}

	public static boolean checkName(String name) throws SQLException {
		String query = "select * from DanhMucSanPham";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			DanhMucSanPham e = new DanhMucSanPham();
			e.setMaDanhMuc(rs.getInt(1));
			e.setTenDanhMuc(rs.getString(2));
			if (e.getTenDanhMuc().equals(name)) {
				return true;
			}
		}
		return false;

	}

	public static boolean create(DanhMucSanPham e) throws SQLException {
		boolean bl = checkName(e.getTenDanhMuc());
		if (bl == false) {
			PreparedStatement pstmt;
			pstmt = con.prepareStatement("insert into DanhMucSanPham values (?)");
			pstmt.setString(1, e.getTenDanhMuc());
			int i = pstmt.executeUpdate();
			if (i > 0) {
				return true;
			}
		}
		return false;
	}

	public static DanhMucSanPham getById(int id) throws SQLException {
		String query = "select * from DanhMucSanPham where MaDanhMuc = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			DanhMucSanPham e = new DanhMucSanPham();
			e.setMaDanhMuc(rs.getInt(1));
			e.setTenDanhMuc(rs.getString(2));
			return e;
		}
		return null;
	}

	public static boolean edit(DanhMucSanPham e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("update DanhMucSanPham set TenDanhMuc = ? where MaDanhMuc = ?");
		pstmt.setString(1, e.getTenDanhMuc());
		pstmt.setInt(2, e.getMaDanhMuc());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from DanhMucSanPham where MaDanhMuc = ?");
		pstmt.setInt(1, id);
		int i = 0;
		try {
			i = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
		}		
		if (i > 0) {
			return true;
		}
		return false;
	}
}
