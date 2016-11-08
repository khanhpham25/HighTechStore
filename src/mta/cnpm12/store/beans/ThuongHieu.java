package mta.cnpm12.store.beans;

public class ThuongHieu {
	private int MaThuongHieu;
	private String TenThuongHieu;

	public ThuongHieu() {

	}

	public ThuongHieu(String tenThuongHieu) {
		TenThuongHieu = tenThuongHieu;
	}

	public int getMaThuongHieu() {
		return MaThuongHieu;
	}

	public void setMaThuongHieu(int maThuongHieu) {
		MaThuongHieu = maThuongHieu;
	}

	public String getTenThuongHieu() {
		return TenThuongHieu;
	}

	public void setTenThuongHieu(String tenThuongHieu) {
		TenThuongHieu = tenThuongHieu;
	}

}
