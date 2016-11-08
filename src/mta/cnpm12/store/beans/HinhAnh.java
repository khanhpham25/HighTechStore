package mta.cnpm12.store.beans;

public class HinhAnh {
	private int MaHinhAnh;
	private String TenHinhAnh;
	private int MaSP;

	public HinhAnh() {

	}

	public HinhAnh(String tenHinhAnh, int maSP) {
		TenHinhAnh = tenHinhAnh;
		MaSP = maSP;
	}

	public int getMaHinhAnh() {
		return MaHinhAnh;
	}

	public void setMaHinhAnh(int maHinhAnh) {
		MaHinhAnh = maHinhAnh;
	}

	public String getTenHinhAnh() {
		return TenHinhAnh;
	}

	public void setTenHinhAnh(String tenHinhAnh) {
		TenHinhAnh = tenHinhAnh;
	}

	public int getMaSP() {
		return MaSP;
	}

	public void setMaSP(int maSP) {
		MaSP = maSP;
	}

}
