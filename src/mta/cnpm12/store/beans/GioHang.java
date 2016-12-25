package mta.cnpm12.store.beans;

public class GioHang {
	private int MaGioHang;
	private SanPham SanPham;
	private MauSac MauSac;
	private int SoLuong;
	
	public GioHang() {
		
	}
	
	public GioHang(int maGioHang, SanPham sanPham, MauSac mauSac, int soLuong) {
		super();
		MaGioHang = maGioHang;
		SanPham = sanPham;
		MauSac = mauSac;
		SoLuong = soLuong;
	}
	
	public int getMaGioHang() {
		return MaGioHang;
	}
	public void setMaGioHang(int maGioHang) {
		MaGioHang = maGioHang;
	}
	public SanPham getSanPham() {
		return SanPham;
	}
	public void setSanPham(SanPham sanPham) {
		SanPham = sanPham;
	}
	public MauSac getMauSac() {
		return MauSac;
	}
	public void setMauSac(MauSac mauSac) {
		MauSac = mauSac;
	}
	public int getSoLuong() {
		return SoLuong;
	}
	public void setSoLuong(int soLuong) {
		SoLuong = soLuong;
	}
	
	
}
