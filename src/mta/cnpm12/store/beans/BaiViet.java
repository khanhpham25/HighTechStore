package mta.cnpm12.store.beans;

import java.util.Date;

public class BaiViet {
	private int MaBaiViet;
	private String TieuDe;
	private String MoTa;
	private Date NgayDang;
	private String NoiDung;
	private boolean TrangThai;
	private int MaDanhMuc;

	public BaiViet() {

	}

	public BaiViet(int maBaiViet, String tieuDe, String moTa, Date ngayDang, String noiDung, boolean trangThai,
			int maDanhMuc) {
		MaBaiViet = maBaiViet;
		TieuDe = tieuDe;
		MoTa = moTa;
		NgayDang = ngayDang;
		NoiDung = noiDung;
		TrangThai = trangThai;
		MaDanhMuc = maDanhMuc;
	}

	public int getMaBaiViet() {
		return MaBaiViet;
	}

	public void setMaBaiViet(int maBaiViet) {
		MaBaiViet = maBaiViet;
	}

	public String getTieuDe() {
		return TieuDe;
	}

	public void setTieuDe(String tieuDe) {
		TieuDe = tieuDe;
	}

	public String getMoTa() {
		return MoTa;
	}

	public void setMoTa(String moTa) {
		MoTa = moTa;
	}

	public Date getNgayDang() {
		return NgayDang;
	}

	public void setNgayDang(Date ngayDang) {
		NgayDang = ngayDang;
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

	public int getMaDanhMuc() {
		return MaDanhMuc;
	}

	public void setMaDanhMuc(int maDanhMuc) {
		MaDanhMuc = maDanhMuc;
	}

}
