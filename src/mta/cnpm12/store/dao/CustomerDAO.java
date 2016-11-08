package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.utility.DbUtility;

public class CustomerDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<KhachHang> listAll() throws SQLException {
		String query = "select * from KhachHang";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<KhachHang> list = new ArrayList<KhachHang>();
		while (rs.next()) {
			KhachHang e = new KhachHang();
			e.setMaKhachHang(rs.getInt(1));
			e.setHoTen(rs.getString(2));
			e.setDiaChi(rs.getString(3));
			e.setSoDienThoai(rs.getString(4));
			e.setEmail(rs.getString(5));
			e.setGioiTinh(rs.getBoolean(6));
			e.setTenDangNhap(rs.getString(7));
			e.setMatKhau(rs.getString(8));
			e.setPhanLoai(rs.getBoolean(9));
			list.add(e);
		}
		return list;
	}

	public static KhachHang getById(int id) throws SQLException {
		String query = "select * from KhachHang where MaKhachHang = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			KhachHang e = new KhachHang();
			e.setMaKhachHang(rs.getInt(1));
			e.setHoTen(rs.getString(2));
			e.setDiaChi(rs.getString(3));
			e.setSoDienThoai(rs.getString(4));
			e.setEmail(rs.getString(5));
			e.setGioiTinh(rs.getBoolean(6));
			e.setTenDangNhap(rs.getString(7));
			e.setMatKhau(rs.getString(8));
			e.setPhanLoai(rs.getBoolean(9));
			return e;
		}
		return null;
	}

	public static boolean edit(KhachHang e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(
				"update KhachHang set HoTen = ?, DiaChi = ?, SoDienThoai = ?, Email = ?, GioiTinh = ?, MatKhau = ?, PhanLoai = ? where MaKhachHang = ?");
		pstmt.setString(1, e.getHoTen());
		pstmt.setString(2, e.getDiaChi());
		pstmt.setString(3, e.getSoDienThoai());
		pstmt.setString(4, e.getEmail());
		pstmt.setBoolean(5, e.isGioiTinh());
		pstmt.setString(6, e.getMatKhau());
		pstmt.setBoolean(7, e.isPhanLoai());
		pstmt.setInt(8, e.getMaKhachHang());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from KhachHang where MaKhachHang = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
}
