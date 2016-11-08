package mta.cnpm12.store.beans;

public class QuanTriVien {
	private int MaAdmin;
	private String TenAdmin;
	private String Email;
	private String TenDangNhap;
	private String MatKhau;
	private boolean PhanQuyen;

	public QuanTriVien() {

	}

	public QuanTriVien(int maAdmin, String tenAdmin, String email, String tenDangNhap, String matKhau,
			boolean phanQuyen) {
		MaAdmin = maAdmin;
		TenAdmin = tenAdmin;
		Email = email;
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		PhanQuyen = phanQuyen;
	}

	public int getMaAdmin() {
		return MaAdmin;
	}

	public void setMaAdmin(int maAdmin) {
		MaAdmin = maAdmin;
	}

	public String getTenAdmin() {
		return TenAdmin;
	}

	public void setTenAdmin(String tenAdmin) {
		TenAdmin = tenAdmin;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getTenDangNhap() {
		return TenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		TenDangNhap = tenDangNhap;
	}

	public String getMatKhau() {
		return MatKhau;
	}

	public void setMatKhau(String matKhau) {
		MatKhau = matKhau;
	}

	public boolean isPhanQuyen() {
		return PhanQuyen;
	}

	public void setPhanQuyen(boolean phanQuyen) {
		PhanQuyen = phanQuyen;
	}

}
