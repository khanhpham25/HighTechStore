package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.MauSac;
import mta.cnpm12.store.utility.DbUtility;

public class ColorDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<MauSac> listAll() throws SQLException {
		String query = "select * from MauSac";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<MauSac> list = new ArrayList<MauSac>();
		while (rs.next()) {
			MauSac e = new MauSac();
			e.setMaMau(rs.getInt(1));
			e.setTenMau(rs.getString(2));
			list.add(e);
		}
		return list;
	}

	public static boolean checkName(String name) throws SQLException {
		String query = "select * from MauSac";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			MauSac e = new MauSac();
			e.setMaMau(rs.getInt(1));
			e.setTenMau(rs.getString(2));
			if (e.getTenMau().equals(name)) {
				return true;
			}
		}
		return false;
	}

	public static boolean create(MauSac e) throws SQLException {
		boolean bl = checkName(e.getTenMau());
		if (bl == false) {
			PreparedStatement pstmt;
			pstmt = con.prepareStatement("insert into MauSac values (?)");
			pstmt.setString(1, e.getTenMau());
			int i = pstmt.executeUpdate();
			if (i > 0) {
				return true;
			}
		}
		return false;
	}

	public static MauSac getById(int id) throws SQLException {
		String query = "select * from MauSac where MaMau = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			MauSac e = new MauSac();
			e.setMaMau(rs.getInt(1));
			e.setTenMau(rs.getString(2));
			return e;
		}
		return null;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from MauSac where MaMau = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
}
