package mta.cnpm12.store.beans;

public class KhachHang {
	private int MaKhachHang;
	private String HoTen;
	private String DiaChi;
	private String SoDienThoai;
	private String Email;
	private boolean GioiTinh;
	private String TenDangNhap;
	private String MatKhau;
	private boolean PhanLoai;

	public KhachHang() {

	}

	public KhachHang(int maKhachHang, String hoTen, String diaChi, String soDienThoai, String email, boolean gioiTinh,
			String tenDangNhap, String matKhau, boolean phanLoai) {
		MaKhachHang = maKhachHang;
		HoTen = hoTen;
		DiaChi = diaChi;
		SoDienThoai = soDienThoai;
		Email = email;
		GioiTinh = gioiTinh;
		TenDangNhap = tenDangNhap;
		MatKhau = matKhau;
		PhanLoai = phanLoai;
	}

	public int getMaKhachHang() {
		return MaKhachHang;
	}

	public void setMaKhachHang(int maKhachHang) {
		MaKhachHang = maKhachHang;
	}

	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	public String getDiaChi() {
		return DiaChi;
	}

	public void setDiaChi(String diaChi) {
		DiaChi = diaChi;
	}

	public String getSoDienThoai() {
		return SoDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		SoDienThoai = soDienThoai;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public boolean isGioiTinh() {
		return GioiTinh;
	}

	public void setGioiTinh(boolean gioiTinh) {
		GioiTinh = gioiTinh;
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

	public boolean isPhanLoai() {
		return PhanLoai;
	}

	public void setPhanLoai(boolean phanLoai) {
		PhanLoai = phanLoai;
	}

}
