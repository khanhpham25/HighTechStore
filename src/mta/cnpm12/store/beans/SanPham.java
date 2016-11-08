package mta.cnpm12.store.beans;

import java.util.Date;

public class SanPham {
	private int MaSP;
	private String TenSP;
	private double GiaSP;
	private double GiaKhuyenMai;
	private String ThongSoKyThuat;
	private String BaoHanh;
	private String PhuKienDiKem;
	private Date NgayCapNhat;
	private boolean TrangThai;
	private int MaDanhMuc;
	private int MaThuongHieu;

	public SanPham() {

	}

	public SanPham(String tenSP, double giaSP, double giaKhuyenMai, String thongSoKyThuat, String baoHanh,
			String phuKienDiKem, Date ngayCapNhat, boolean trangThai, int maDanhMuc, int maThuongHieu) {
		TenSP = tenSP;
		GiaSP = giaSP;
		GiaKhuyenMai = giaKhuyenMai;
		ThongSoKyThuat = thongSoKyThuat;
		BaoHanh = baoHanh;
		PhuKienDiKem = phuKienDiKem;
		NgayCapNhat = ngayCapNhat;
		TrangThai = trangThai;
		MaDanhMuc = maDanhMuc;
		MaThuongHieu = maThuongHieu;
	}

	public int getMaSP() {
		return MaSP;
	}

	public void setMaSP(int maSP) {
		MaSP = maSP;
	}

	public String getTenSP() {
		return TenSP;
	}

	public void setTenSP(String tenSP) {
		TenSP = tenSP;
	}

	public double getGiaSP() {
		return GiaSP;
	}

	public void setGiaSP(double giaSP) {
		GiaSP = giaSP;
	}

	public double getGiaKhuyenMai() {
		return GiaKhuyenMai;
	}

	public void setGiaKhuyenMai(double giaKhuyenMai) {
		GiaKhuyenMai = giaKhuyenMai;
	}

	public String getThongSoKyThuat() {
		return ThongSoKyThuat;
	}

	public void setThongSoKyThuat(String thongSoKyThuat) {
		ThongSoKyThuat = thongSoKyThuat;
	}

	public String getBaoHanh() {
		return BaoHanh;
	}

	public void setBaoHanh(String baoHanh) {
		BaoHanh = baoHanh;
	}

	public String getPhuKienDiKem() {
		return PhuKienDiKem;
	}

	public void setPhuKienDiKem(String phuKienDiKem) {
		PhuKienDiKem = phuKienDiKem;
	}

	public Date getNgayCapNhat() {
		return NgayCapNhat;
	}

	public void setNgayCapNhat(Date ngayCapNhat) {
		NgayCapNhat = ngayCapNhat;
	}

	public boolean isTrangThai() {
		return TrangThai;
	}

	public void setTrangThai(boolean trangThai) {
		TrangThai = trangThai;
	}

	public int getMaDanhMuc() {
		return MaDanhMuc;
	}

	public void setMaDanhMuc(int maDanhMuc) {
		MaDanhMuc = maDanhMuc;
	}

	public int getMaThuongHieu() {
		return MaThuongHieu;
	}

	public void setMaThuongHieu(int maThuongHieu) {
		MaThuongHieu = maThuongHieu;
	}

}
