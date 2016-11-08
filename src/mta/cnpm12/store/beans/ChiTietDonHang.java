package mta.cnpm12.store.beans;

public class ChiTietDonHang {
	private int MaDonHang;
	private int MaSP;
	private int MaMau;
	private double DonGia;
	private int SoLuong;

	public ChiTietDonHang() {

	}

	public ChiTietDonHang(int maDonHang, int maSP, int maMau, double donGia, int soLuong) {
		MaDonHang = maDonHang;
		MaSP = maSP;
		MaMau = maMau;
		DonGia = donGia;
		SoLuong = soLuong;
	}

	public int getMaDonHang() {
		return MaDonHang;
	}

	public void setMaDonHang(int maDonHang) {
		MaDonHang = maDonHang;
	}

	public int getMaSP() {
		return MaSP;
	}

	public void setMaSP(int maSP) {
		MaSP = maSP;
	}

	public int getMaMau() {
		return MaMau;
	}

	public void setMaMau(int maMau) {
		MaMau = maMau;
	}

	public double getDonGia() {
		return DonGia;
	}

	public void setDonGia(double donGia) {
		DonGia = donGia;
	}

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

}
