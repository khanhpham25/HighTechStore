package mta.cnpm12.store.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mta.cnpm12.store.beans.HinhAnh;
import mta.cnpm12.store.beans.SanPham;
import mta.cnpm12.store.beans.SanPhamMauSac;
import mta.cnpm12.store.utility.DbUtility;

public class ProductDAO {
	private static Connection con = DbUtility.getConnection();

	public static List<SanPham> listAll() throws SQLException {
		String query = "select * from SanPham";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<SanPham> list = new ArrayList<SanPham>();
		while (rs.next()) {
			SanPham e = new SanPham();
			e.setMaSP(rs.getInt(1));
			e.setTenSP(rs.getString(2));
			e.setGiaSP(rs.getDouble(3));
			e.setGiaKhuyenMai(rs.getDouble(4));
			e.setThongSoKyThuat(rs.getString(5));
			e.setBaoHanh(rs.getString(6));
			e.setPhuKienDiKem(rs.getString(7));
			e.setNgayCapNhat(rs.getDate(8));
			e.setTrangThai(rs.getBoolean(9));
			e.setMaDanhMuc(rs.getInt(10));
			e.setMaThuongHieu(rs.getInt(11));
			list.add(e);
		}
		return list;
	}

	public static SanPham getById(int id) throws SQLException {
		String query = "select * from SanPham where MaSP = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			SanPham e = new SanPham();
			e.setMaSP(rs.getInt(1));
			e.setTenSP(rs.getString(2));
			e.setGiaSP(rs.getDouble(3));
			e.setGiaKhuyenMai(rs.getDouble(4));
			e.setThongSoKyThuat(rs.getString(5));
			e.setBaoHanh(rs.getString(6));
			e.setPhuKienDiKem(rs.getString(7));
			e.setNgayCapNhat(rs.getDate(8));
			e.setTrangThai(rs.getBoolean(9));
			e.setMaDanhMuc(rs.getInt(10));
			e.setMaThuongHieu(rs.getInt(11));
			return e;
		}
		return null;
	}

	public static boolean create(SanPham e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("insert into SanPham values (?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, e.getTenSP());
		pstmt.setDouble(2, e.getGiaSP());
		pstmt.setDouble(3, e.getGiaKhuyenMai());
		pstmt.setString(4, e.getThongSoKyThuat());
		pstmt.setString(5, e.getBaoHanh());
		pstmt.setString(6, e.getPhuKienDiKem());
		pstmt.setDate(7, (Date) e.getNgayCapNhat());
		pstmt.setBoolean(8, e.isTrangThai());
		pstmt.setInt(9, e.getMaDanhMuc());
		pstmt.setInt(10, e.getMaThuongHieu());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean edit(SanPham e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(
				"update SanPham set TenSP = ?, GiaSP = ?, GiaKhuyenMai = ?, ThongSoKyThuat = ?, BaoHanh = ?, PhuKienDiKem = ?, TrangThai = ?, MaDanhMuc = ?, MaThuongHieu = ? where MaSP = ?");
		pstmt.setString(1, e.getTenSP());
		pstmt.setDouble(2, e.getGiaSP());
		pstmt.setDouble(3, e.getGiaKhuyenMai());
		pstmt.setString(4, e.getThongSoKyThuat());
		pstmt.setString(5, e.getBaoHanh());
		pstmt.setString(6, e.getPhuKienDiKem());
		pstmt.setBoolean(7, e.isTrangThai());
		pstmt.setInt(8, e.getMaDanhMuc());
		pstmt.setInt(9, e.getMaThuongHieu());
		pstmt.setInt(10, e.getMaSP());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static int maxId() throws SQLException {
		String query = "select max(MaSP) from SanPham";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			return rs.getInt(1);
		}
		return 0;
	}

	public static void add_color(SanPhamMauSac e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("insert into SanPham_MauSac values (?,?,?)");
		pstmt.setInt(1, e.getMaSP());
		pstmt.setInt(2, e.getMaMau());
		pstmt.setInt(3, e.getSoLuong());
		pstmt.executeUpdate();
	}

	public static boolean add_image(HinhAnh e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("insert into HinhAnh values (?,?)");
		pstmt.setString(1, e.getTenHinhAnh());
		pstmt.setInt(2, e.getMaSP());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static List<SanPhamMauSac> listColor(int id) throws SQLException {
		String query = "select * from SanPham_MauSac where MaSP = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		List<SanPhamMauSac> list = new ArrayList<SanPhamMauSac>();
		while (rs.next()) {
			SanPhamMauSac e = new SanPhamMauSac();
			e.setMaSP(rs.getInt(1));
			e.setMaMau(rs.getInt(2));
			e.setSoLuong(rs.getInt(3));
			list.add(e);
		}
		return list;
	}

	public static List<HinhAnh> listImage(int id) throws SQLException {
		String query = "select * from HinhAnh where MaSP = ?";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		List<HinhAnh> list = new ArrayList<HinhAnh>();
		while (rs.next()) {
			HinhAnh e = new HinhAnh();
			e.setMaHinhAnh(rs.getInt(1));
			e.setTenHinhAnh(rs.getString(2));
			e.setMaSP(rs.getInt(3));
			list.add(e);
		}
		return list;
	}

	public static boolean update_number_product(SanPhamMauSac e) throws SQLException {
		PreparedStatement pstmt;
		pstmt = con.prepareStatement("update SanPham_MauSac set SoLuong = ? where MaSP = ? and MaMau = ?");
		pstmt.setInt(1, e.getSoLuong());
		pstmt.setInt(2, e.getMaSP());
		pstmt.setInt(3, e.getMaMau());
		int i = pstmt.executeUpdate();
		if (i > 0) {
			return true;
		}
		return false;
	}

	public static boolean delete(int id) throws SQLException {
		CallableStatement cstmt;
		cstmt = con.prepareCall("{call delete_product (?)}");
		cstmt.setInt(1, id);
		int i = cstmt.executeUpdate();
		if (i >= 0) {
			cstmt.close();
			return true;
		}
		return false;
	}

	public static List<SanPham> listHotProduct() throws SQLException {
		String query = "select top(4) * from SanPham where TrangThai = 1 order by NgayCapNhat desc";
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<SanPham> list = new ArrayList<SanPham>();
		while (rs.next()) {
			SanPham e = new SanPham();
			e.setMaSP(rs.getInt(1));
			e.setTenSP(rs.getString(2));
			e.setGiaSP(rs.getDouble(3));
			e.setGiaKhuyenMai(rs.getDouble(4));
			e.setThongSoKyThuat(rs.getString(5));
			e.setBaoHanh(rs.getString(6));
			e.setPhuKienDiKem(rs.getString(7));
			e.setNgayCapNhat(rs.getDate(8));
			e.setTrangThai(rs.getBoolean(9));
			e.setMaDanhMuc(rs.getInt(10));
			e.setMaThuongHieu(rs.getInt(11));
			list.add(e);
		}
		return list;
	}

	public static List<SanPham> listProductByCategory(int id, int firstResult, int maxResult) throws SQLException {
		String query = "select * from SanPham where MaDanhMuc = " + id;
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<SanPham> list = new ArrayList<SanPham>();
		while (rs.next()) {
			SanPham e = new SanPham();
			e.setMaSP(rs.getInt(1));
			e.setTenSP(rs.getString(2));
			e.setGiaSP(rs.getDouble(3));
			e.setGiaKhuyenMai(rs.getDouble(4));
			e.setThongSoKyThuat(rs.getString(5));
			e.setBaoHanh(rs.getString(6));
			e.setPhuKienDiKem(rs.getString(7));
			e.setNgayCapNhat(rs.getDate(8));
			e.setTrangThai(rs.getBoolean(9));
			e.setMaDanhMuc(rs.getInt(10));
			e.setMaThuongHieu(rs.getInt(11));
			list.add(e);
		}
		if (maxResult == list.size()) {
			return list;
		} else {
			List<SanPham> listResult = new ArrayList<SanPham>();
			if (firstResult + maxResult - 1 < list.size()) {
				for (int i = firstResult; i <= firstResult + maxResult - 1; i++) {
					listResult.add(list.get(i));
				}
			} else {
				for (int i = firstResult; i < list.size(); i++) {
					listResult.add(list.get(i));
				}
			}
			return listResult;
		}
	}

	public static int countProductByCategory(int id) throws SQLException {
		String query = "select count(MaSP) from SanPham where MaDanhMuc = " + id;
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		while (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	public static HinhAnh getImageByProductId(int id) throws SQLException {
		String query = "select top(1) * from HinhAnh where MaSP = " + id;
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			HinhAnh e = new HinhAnh();
			e.setMaHinhAnh(rs.getInt(1));
			e.setTenHinhAnh(rs.getString(2));
			e.setMaSP(rs.getInt(3));
			return e;
		}
		return null;
	}

	public static List<SanPham> listProductByCateBrand(int cateid, int brandid, int firstResult, int maxResult)
			throws SQLException {
		String query = "select * from SanPham where MaDanhMuc = " + cateid + " and MaThuongHieu = " + brandid;
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		List<SanPham> list = new ArrayList<SanPham>();
		while (rs.next()) {
			SanPham e = new SanPham();
			e.setMaSP(rs.getInt(1));
			e.setTenSP(rs.getString(2));
			e.setGiaSP(rs.getDouble(3));
			e.setGiaKhuyenMai(rs.getDouble(4));
			e.setThongSoKyThuat(rs.getString(5));
			e.setBaoHanh(rs.getString(6));
			e.setPhuKienDiKem(rs.getString(7));
			e.setNgayCapNhat(rs.getDate(8));
			e.setTrangThai(rs.getBoolean(9));
			e.setMaDanhMuc(rs.getInt(10));
			e.setMaThuongHieu(rs.getInt(11));
			list.add(e);
		}
		if (maxResult == list.size()) {
			return list;
		} else {
			List<SanPham> listResult = new ArrayList<SanPham>();
			if (firstResult + maxResult - 1 < list.size()) {
				for (int i = firstResult; i <= firstResult + maxResult - 1; i++) {
					listResult.add(list.get(i));
				}
			} else {
				for (int i = firstResult; i < list.size(); i++) {
					listResult.add(list.get(i));
				}
			}
			return listResult;
		}
	}

	public static int countProductByCateBrand(int cateid, int brandid) throws SQLException {
		String query = "select count(MaSP) from SanPham where MaDanhMuc = " + cateid + " and MaThuongHieu = " + brandid;
		PreparedStatement pstmt = con.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		int count = 0;
		while (rs.next()) {
			count = rs.getInt(1);
		}
		return count;
	}

	public static List<SanPham> searchProduct(String keyword, int firstResult, int maxResult) throws SQLException {
		if (keyword.replaceAll(" ", "").length() > 0) {
			String query = "select * from SanPham where TrangThai = 1 and TenSP like '%" + keyword + "%'";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			List<SanPham> list = new ArrayList<SanPham>();
			while (rs.next()) {
				SanPham e = new SanPham();
				e.setMaSP(rs.getInt(1));
				e.setTenSP(rs.getString(2));
				e.setGiaSP(rs.getDouble(3));
				e.setGiaKhuyenMai(rs.getDouble(4));
				e.setThongSoKyThuat(rs.getString(5));
				e.setBaoHanh(rs.getString(6));
				e.setPhuKienDiKem(rs.getString(7));
				e.setNgayCapNhat(rs.getDate(8));
				e.setTrangThai(rs.getBoolean(9));
				e.setMaDanhMuc(rs.getInt(10));
				e.setMaThuongHieu(rs.getInt(11));
				list.add(e);
			}
			if (maxResult == list.size()) {
				return list;
			} else {
				List<SanPham> listResult = new ArrayList<SanPham>();
				if (firstResult + maxResult - 1 < list.size()) {
					for (int i = firstResult; i <= firstResult + maxResult - 1; i++) {
						listResult.add(list.get(i));
					}
				} else {
					for (int i = firstResult; i < list.size(); i++) {
						listResult.add(list.get(i));
					}
				}
				return listResult;
			}
		}
		return null;
	}

	public static int countSearchProduct(String keyword) throws SQLException {
		if (keyword.replaceAll(" ", "").length() > 0) {
			String query = "select count(MaSP) from SanPham where TrangThai = 1 and TenSP like '%" + keyword + "%'";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			int count = 0;
			while (rs.next()) {
				count = rs.getInt(1);
			}
			return count;
		}
		return 0;
	}
}
