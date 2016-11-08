package mta.cnpm12.store.beans;

import java.util.Date;

public class PhanHoi {
	private int MaPhanHoi;
	private Date NgayGio;
	private String NoiDung;
	private int MaKhachHang;

	public PhanHoi() {

	}

	public PhanHoi(int maPhanHoi, Date ngayGio, String noiDung, int maKhachHang) {
		MaPhanHoi = maPhanHoi;
		NgayGio = ngayGio;
		NoiDung = noiDung;
		MaKhachHang = maKhachHang;
	}

	public int getMaPhanHoi() {
		return MaPhanHoi;
	}

	public void setMaPhanHoi(int maPhanHoi) {
		MaPhanHoi = maPhanHoi;
	}

	public Date getNgayGio() {
		return NgayGio;
	}

	public void setNgayGio(Date ngayGio) {
		NgayGio = ngayGio;
	}

	public String getNoiDung() {
		return NoiDung;
	}

	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}

	public int getMaKhachHang() {
		return MaKhachHang;
	}

	public void setMaKhachHang(int maKhachHang) {
		MaKhachHang = maKhachHang;
	}

}
