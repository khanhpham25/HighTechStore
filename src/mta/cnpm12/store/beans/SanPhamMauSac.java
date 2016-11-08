package mta.cnpm12.store.beans;

public class SanPhamMauSac {
	private int MaSP;
	private int MaMau;
	private int SoLuong;

	public SanPhamMauSac() {

	}

	public SanPhamMauSac(int maSP, int maMau, int soLuong) {
		MaSP = maSP;
		MaMau = maMau;
		SoLuong = soLuong;
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

	public int getSoLuong() {
		return SoLuong;
	}

	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}

}
