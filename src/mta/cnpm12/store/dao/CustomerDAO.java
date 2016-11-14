package mta.cnpm12.store.dao;

import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.utility.DbUtility;
import mta.cnpm12.store.utility.Encryptor;

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
	
	public static String check(String keyword) throws SQLException {
		String query = "select * from KhachHang";
		PreparedStatement pstmt = con.prepareStatement(query);
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
			if (e.getTenDangNhap().equals(keyword)) {
				return "Tên đăng nhập đã tồn tại";
			}
			if (e.getEmail().equals(keyword)) {
				return "Email này đã được sử dụng";
			}
		}
		return null;
	}
	
	public static boolean create(KhachHang e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("insert into KhachHang values (?,?,?,?,?,?,?,?)");
		pstmt.setString(1, e.getHoTen());
		pstmt.setString(2, e.getDiaChi());
		pstmt.setString(3, e.getSoDienThoai());
		pstmt.setString(4, e.getEmail());
		pstmt.setBoolean(5, e.isGioiTinh());
		pstmt.setString(6, e.getTenDangNhap());
		pstmt.setString(7, e.getMatKhau());
		pstmt.setBoolean(8, e.isPhanLoai());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
	
	public static KhachHang checkLogin(String username, String password) throws SQLException, NoSuchAlgorithmException{
		String query = "select * from KhachHang where TenDangNhap = ? and MatKhau = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1, username);
		pstmt.setString(2, Encryptor.encryptMD5(password));
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
}
