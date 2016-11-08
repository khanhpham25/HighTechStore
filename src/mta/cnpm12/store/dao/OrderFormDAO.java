package mta.cnpm12.store.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.ChiTietDonHang;
import mta.cnpm12.store.beans.DonHang;
import mta.cnpm12.store.utility.DbUtility;

public class OrderFormDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<DonHang> listAll() throws SQLException {
		String query = "select * from DonHang";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<DonHang> list = new ArrayList<DonHang>();
		while (rs.next()) {
			DonHang e = new DonHang();
			e.setMaDonHang(rs.getInt(1));
			e.setNgayDat(rs.getDate(2));
			e.setTinhTrangGiaoHang(rs.getBoolean(3));
			e.setGhiChu(rs.getString(4));
			e.setMaKhachHang(rs.getInt(5));
			list.add(e);
		}
		return list;
	}

	public static List<ChiTietDonHang> listAllDetail(int id) throws SQLException {
		String query = "select * from ChiTietDonHang where MaDonHang = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		List<ChiTietDonHang> list = new ArrayList<ChiTietDonHang>();
		while (rs.next()) {
			ChiTietDonHang e = new ChiTietDonHang();
			e.setMaDonHang(rs.getInt(1));
			e.setMaSP(rs.getInt(2));
			e.setMaMau(rs.getInt(3));
			e.setDonGia(rs.getDouble(4));
			e.setSoLuong(rs.getInt(5));
			list.add(e);
		}
		return list;
	}

	public static DonHang getById(int id) throws SQLException {
		String query = "select * from DonHang where MaDonHang = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			DonHang e = new DonHang();
			e.setMaDonHang(rs.getInt(1));
			e.setNgayDat(rs.getDate(2));
			e.setTinhTrangGiaoHang(rs.getBoolean(3));
			e.setGhiChu(rs.getString(4));
			e.setMaKhachHang(rs.getInt(5));
			return e;
		}
		return null;
	}

	public static boolean edit(DonHang e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("update DonHang set TinhTrangGiaoHang = ? where MaDonHang = ?");
		pstmt.setBoolean(1, e.isTinhTrangGiaoHang());
		pstmt.setInt(2, e.getMaDonHang());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("delete from DonHang where MaDonHang = ?");
		pstmt.setInt(1, id);
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}
}
