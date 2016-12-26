package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.ThuongHieu;
import mta.cnpm12.store.utility.DbUtility;

public class BrandDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<ThuongHieu> listAll() throws SQLException {
		String query = "select * from ThuongHieu";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<ThuongHieu> list = new ArrayList<ThuongHieu>();
		while (rs.next()) {
			ThuongHieu e = new ThuongHieu();
			e.setMaThuongHieu(rs.getInt(1));
			e.setTenThuongHieu(rs.getString(2));
			list.add(e);
		}
		return list;
	}

	public static boolean checkName(String name) throws SQLException {
		String query = "select * from ThuongHieu";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ThuongHieu e = new ThuongHieu();
			e.setMaThuongHieu(rs.getInt(1));
			e.setTenThuongHieu(rs.getString(2));
			if (e.getTenThuongHieu().equals(name)) {
				return true;
			}
		}
		return false;

	}

	public static boolean create(ThuongHieu e) throws SQLException {
		boolean bl = checkName(e.getTenThuongHieu());
		if (bl == false) {
			PreparedStatement pstmt;
			pstmt = con.prepareStatement("insert into ThuongHieu values (?)");
			pstmt.setString(1, e.getTenThuongHieu());
			int i = pstmt.executeUpdate();
			if (i > 0) {
				return true;
			}
		}
		return false;
	}

	public static ThuongHieu getById(int id) throws SQLException {
		String query = "select * from ThuongHieu where MaThuongHieu = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ThuongHieu e = new ThuongHieu();
			e.setMaThuongHieu(rs.getInt(1));
			e.setTenThuongHieu(rs.getString(2));
			return e;
		}
		return null;
	}

	public static boolean edit(ThuongHieu e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("update ThuongHieu set TenThuongHieu = ? where MaThuongHieu = ?");
		pstmt.setString(1, e.getTenThuongHieu());
		pstmt.setInt(2, e.getMaThuongHieu());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from ThuongHieu where MaThuongHieu = ?");
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
