package mta.cnpm12.store.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.QuanTriVien;
import mta.cnpm12.store.utility.DbUtility;
import mta.cnpm12.store.utility.Encryptor;

public class AdminDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<QuanTriVien> listAll() throws SQLException {
		String query = "select * from QuanTriVien";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<QuanTriVien> list = new ArrayList<QuanTriVien>();
		while (rs.next()) {
			QuanTriVien e = new QuanTriVien();
			e.setMaAdmin(rs.getInt(1));
			e.setTenAdmin(rs.getString(2));
			e.setEmail(rs.getString(3));
			e.setTenDangNhap(rs.getString(4));
			e.setMatKhau(rs.getString(5));
			e.setPhanQuyen(rs.getBoolean(6));
			list.add(e);
		}
		return list;
	}

	public static boolean checkUserName(String username) throws SQLException {
		String query = "select * from QuanTriVien";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			QuanTriVien e = new QuanTriVien();
			e.setMaAdmin(rs.getInt(1));
			e.setTenAdmin(rs.getString(2));
			e.setEmail(rs.getString(3));
			e.setTenDangNhap(rs.getString(4));
			e.setMatKhau(rs.getString(5));
			e.setPhanQuyen(rs.getBoolean(6));
			if (e.getTenDangNhap().equals(username)) {
				return true;
			}
		}
		return false;

	}

	public static boolean create(QuanTriVien e) throws SQLException {
		boolean bl = checkUserName(e.getTenDangNhap());
		if (bl == false) {
			PreparedStatement pstmt;
			pstmt = con.prepareStatement("insert into QuanTriVien values (?,?,?,?,?)");
			pstmt.setString(1, e.getTenAdmin());
			pstmt.setString(2, e.getEmail());
			pstmt.setString(3, e.getTenDangNhap());
			pstmt.setString(4, e.getMatKhau());
			pstmt.setBoolean(5, e.isPhanQuyen());
			int i = pstmt.executeUpdate();
			if (i > 0) {
				return true;
			}
		}
		return false;
	}

	public static QuanTriVien getById(int id) throws SQLException {
		String query = "select * from QuanTriVien where MaAdmin = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			QuanTriVien e = new QuanTriVien();
			e.setMaAdmin(rs.getInt(1));
			e.setTenAdmin(rs.getString(2));
			e.setEmail(rs.getString(3));
			e.setTenDangNhap(rs.getString(4));
			e.setMatKhau(rs.getString(5));
			e.setPhanQuyen(rs.getBoolean(6));
			return e;
		}
		return null;
	}

	public static boolean edit(QuanTriVien e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(
				"update QuanTriVien set TenAdmin = ?, Email = ?, MatKhau = ?, PhanQuyen = ? where MaAdmin = ?");
		pstmt.setString(1, e.getTenAdmin());
		pstmt.setString(2, e.getEmail());
		pstmt.setString(3, e.getMatKhau());
		pstmt.setBoolean(4, e.isPhanQuyen());
		pstmt.setInt(5, e.getMaAdmin());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from QuanTriVien where MaAdmin = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
	
	public static QuanTriVien checkLogin(String username, String password) throws SQLException, NoSuchAlgorithmException{
		String query = "select * from QuanTriVien where TenDangNhap = ? and MatKhau = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, username);
		pstmt.setString(2, Encryptor.encryptMD5(password));
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			QuanTriVien e = new QuanTriVien();
			e.setMaAdmin(rs.getInt(1));
			e.setTenAdmin(rs.getString(2));
			e.setEmail(rs.getString(3));
			e.setTenDangNhap(rs.getString(4));
			e.setMatKhau(rs.getString(5));
			e.setPhanQuyen(rs.getBoolean(6));
			return e;
		}
		return null;
	}
	
	public static boolean change_password(QuanTriVien e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("update QuanTriVien set MatKhau = ? where MaAdmin = ?");
		pstmt.setString(1, e.getMatKhau());
		pstmt.setInt(2, e.getMaAdmin());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
}
