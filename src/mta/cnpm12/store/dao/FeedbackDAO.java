package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.PhanHoi;
import mta.cnpm12.store.utility.DbUtility;

public class FeedbackDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<PhanHoi> listAll() throws SQLException {
		String query = "select * from PhanHoi";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<PhanHoi> list = new ArrayList<PhanHoi>();
		while (rs.next()) {
			PhanHoi e = new PhanHoi();
			e.setMaPhanHoi(rs.getInt(1));
			e.setNgayGio(rs.getDate(2));
			e.setNoiDung(rs.getString(3));
			e.setMaKhachHang(rs.getInt(4));
			list.add(e);
		}
		return list;
	}

	public static PhanHoi getById(int id) throws SQLException {
		String query = "select * from PhanHoi where MaPhanHoi = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			PhanHoi e = new PhanHoi();
			e.setMaPhanHoi(rs.getInt(1));
			e.setNgayGio(rs.getDate(2));
			e.setNoiDung(rs.getString(3));
			e.setMaKhachHang(rs.getInt(4));
			return e;
		}
		return null;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from PhanHoi where MaPhanHoi = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
}
