package mta.cnpm12.store.beans;

import java.util.Date;

public class DonHang {
	private int MaDonHang;
	private Date NgayDat;
	private boolean TinhTrangGiaoHang;
	private String GhiChu;
	private int MaKhachHang;

	public DonHang() {

	}

	public DonHang(int maDonHang, Date ngayDat, boolean tinhTrangGiaoHang, String ghiChu, int maKhachHang) {
		MaDonHang = maDonHang;
		NgayDat = ngayDat;
		TinhTrangGiaoHang = tinhTrangGiaoHang;
		GhiChu = ghiChu;
		MaKhachHang = maKhachHang;
	}

	public int getMaDonHang() {
		return MaDonHang;
	}

	public void setMaDonHang(int maDonHang) {
		MaDonHang = maDonHang;
	}

	public Date getNgayDat() {
		return NgayDat;
	}

	public void setNgayDat(Date ngayDat) {
		NgayDat = ngayDat;
	}

	public boolean isTinhTrangGiaoHang() {
		return TinhTrangGiaoHang;
	}

	public void setTinhTrangGiaoHang(boolean tinhTrangGiaoHang) {
		TinhTrangGiaoHang = tinhTrangGiaoHang;
	}

	public String getGhiChu() {
		return GhiChu;
	}

	public void setGhiChu(String ghiChu) {
		GhiChu = ghiChu;
	}

	public int getMaKhachHang() {
		return MaKhachHang;
	}

	public void setMaKhachHang(int maKhachHang) {
		MaKhachHang = maKhachHang;
	}

}
