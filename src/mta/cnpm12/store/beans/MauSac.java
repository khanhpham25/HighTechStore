package mta.cnpm12.store.beans;

public class MauSac {
	private int MaMau;
	private String TenMau;

	public MauSac() {

	}

	public MauSac(String tenMau) {
		TenMau = tenMau;
	}

	public int getMaMau() {
		return MaMau;
	}

	public void setMaMau(int maMau) {
		MaMau = maMau;
	}

	public String getTenMau() {
		return TenMau;
	}

	public void setTenMau(String tenMau) {
		TenMau = tenMau;
	}

}
