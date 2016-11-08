package mta.cnpm12.store.beans;

import java.util.Date;

public class BinhLuanBaiViet {
	private int MaBinhLuan;
	private String TenNguoiBinhLuan;
	private Date NgayGio;
	private String NoiDung;
	private boolean TrangThai;
	private int MaBaiViet;

	public BinhLuanBaiViet(int maBinhLuan, String tenNguoiBinhLuan, Date ngayGio, String noiDung, boolean trangThai,
			int maBaiViet) {
		MaBinhLuan = maBinhLuan;
		TenNguoiBinhLuan = tenNguoiBinhLuan;
		NgayGio = ngayGio;
		NoiDung = noiDung;
		TrangThai = trangThai;
		MaBaiViet = maBaiViet;
	}

	public BinhLuanBaiViet() {

	}

	public int getMaBinhLuan() {
		return MaBinhLuan;
	}

	public void setMaBinhLuan(int maBinhLuan) {
		MaBinhLuan = maBinhLuan;
	}

	public String getTenNguoiBinhLuan() {
		return TenNguoiBinhLuan;
	}

	public void setTenNguoiBinhLuan(String tenNguoiBinhLuan) {
		TenNguoiBinhLuan = tenNguoiBinhLuan;
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

	public boolean isTrangThai() {
		return TrangThai;
	}

	public void setTrangThai(boolean trangThai) {
		TrangThai = trangThai;
	}

	public int getMaBaiViet() {
		return MaBaiViet;
	}

	public void setMaBaiViet(int maBaiViet) {
		MaBaiViet = maBaiViet;
	}

}
