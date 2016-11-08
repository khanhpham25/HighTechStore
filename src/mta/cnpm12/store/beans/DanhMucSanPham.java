package mta.cnpm12.store.beans;

public class DanhMucSanPham {
	private int MaDanhMuc;
	private String TenDanhMuc;

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

	public DanhMucSanPham() {

	}

	public DanhMucSanPham(String tenDanhMuc) {
		TenDanhMuc = tenDanhMuc;
	}

}
