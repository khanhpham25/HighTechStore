package mta.cnpm12.store.beans;

public class DanhMucBaiViet {
	private int MaDanhMuc;
	private String TenDanhMuc;

	public DanhMucBaiViet() {

	}

	public DanhMucBaiViet(String tenDanhMuc) {
		TenDanhMuc = tenDanhMuc;
	}

	public int getMaDanhMuc() {
		return MaDanhMuc;
	}

	public void setMaDanhMuc(int maDanhMuc) {
		MaDanhMuc = maDanhMuc;
	}

	public String getTenDanhMuc() {
		return TenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		TenDanhMuc = tenDanhMuc;
	}

}
