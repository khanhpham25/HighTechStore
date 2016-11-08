package mta.cnpm12.store.controller.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import mta.cnpm12.store.beans.DanhMucSanPham;
import mta.cnpm12.store.beans.HinhAnh;
import mta.cnpm12.store.beans.MauSac;
import mta.cnpm12.store.beans.SanPham;
import mta.cnpm12.store.beans.SanPhamMauSac;
import mta.cnpm12.store.beans.ThuongHieu;
import mta.cnpm12.store.dao.BrandDAO;
import mta.cnpm12.store.dao.ColorDAO;
import mta.cnpm12.store.dao.ProductCategoryDAO;
import mta.cnpm12.store.dao.ProductDAO;

/**
 * Servlet implementation class Product
 */
@WebServlet("/Product")
public class Product extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Product() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		if(request.getSession().getAttribute("login") == null){
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}
		else{
			String task = "";
			if (request.getParameter("task") != null) {
				task = request.getParameter("task");
			}
			if (task.equals("")) {
				List<SanPham> list;
				try {
					list = ProductDAO.listAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("/backend/product-list.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return;
			}
			if (task.equals("create")) {
				List<DanhMucSanPham> ds1;
				List<ThuongHieu> ds2;
				List<MauSac> dsMauSac;
				try {
					ds1 = ProductCategoryDAO.listAll();
					request.setAttribute("ds1", ds1);
					ds2 = BrandDAO.listAll();
					request.setAttribute("ds2", ds2);
					dsMauSac = ColorDAO.listAll();
					request.setAttribute("dsMauSac", dsMauSac);
					request.getRequestDispatcher("/backend/add-product.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (task.equals("edit")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					SanPham e = ProductDAO.getById(id);
					List<DanhMucSanPham> cate = ProductCategoryDAO.listAll();
					List<ThuongHieu> brand = BrandDAO.listAll();
					request.setAttribute("e", e);
					request.setAttribute("cate", cate);
					request.setAttribute("brand", brand);
					request.getRequestDispatcher("/backend/edit-product.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (task.equals("updatenumber")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					SanPham e = ProductDAO.getById(id);
					List<SanPhamMauSac> pcl = ProductDAO.listColor(id);
					List<MauSac> cl = ColorDAO.listAll();
					request.setAttribute("e", e);
					request.setAttribute("pcl", pcl);
					request.setAttribute("cl", cl);
					request.getRequestDispatcher("/backend/update-number-product.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (task.equals("addcolor")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					SanPham e = ProductDAO.getById(id);
					List<SanPhamMauSac> pcl = ProductDAO.listColor(id);
					List<MauSac> cl = ColorDAO.listAll();
					request.setAttribute("e", e);
					request.setAttribute("pcl", pcl);
					request.setAttribute("cl", cl);
					request.getRequestDispatcher("/backend/add-product-color.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (task.equals("delete")) {
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					boolean bl = ProductDAO.delete(id);
					if (bl) {
						response.sendRedirect(request.getContextPath() + "/admin/product");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(task.equals("detail")){
				int id = Integer.parseInt(request.getParameter("id"));
				try {
					SanPham e = ProductDAO.getById(id);
					DanhMucSanPham cate = ProductCategoryDAO.getById(e.getMaDanhMuc());
					ThuongHieu brand = BrandDAO.getById(e.getMaThuongHieu());
					List<SanPhamMauSac> pcl = ProductDAO.listColor(id);
					List<MauSac> cl = ColorDAO.listAll();
					List<HinhAnh> img = ProductDAO.listImage(id);
					request.setAttribute("e", e);
					request.setAttribute("pcl", pcl);
					request.setAttribute("cl", cl);
					request.setAttribute("cate", cate);
					request.setAttribute("brand", brand);
					request.setAttribute("img", img);
					request.getRequestDispatcher("/backend/product-detail.jsp").forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		MultipartRequest multi=new MultipartRequest(request,".",10*1024*1024,"UTF-8");
		String task = "";
		ArrayList<MauSac> list = new ArrayList<>();
		if (multi.getParameter("task") != null) {
			task = multi.getParameter("task");
		}
		
		if (task.equals("create")) {
			String name = multi.getParameter("name");
			double price = Double.parseDouble(multi.getParameter("price"));
			if(price < 0)
				price = 0;
			double sale = 0;
			if(!multi.getParameter("saleprice").equals("") && !multi.getParameter("saleprice").equals("0")){
				sale = Double.parseDouble(multi.getParameter("saleprice"));
			}
			if(sale < 0)
				sale = 0;
			String info = multi.getParameter("info");
			String warranty = multi.getParameter("warranty");
			String spareparts = multi.getParameter("spare-parts");
			Date date = new Date(System.currentTimeMillis());
			boolean status = Boolean.parseBoolean(multi.getParameter("status"));
			int cate = Integer.parseInt(multi.getParameter("cate"));
			int brand = Integer.parseInt(multi.getParameter("brand"));
			SanPham e = new SanPham(name, price, sale, info, warranty, spareparts, date, status, cate, brand);
			boolean bl = false;
			try {
				bl = ProductDAO.create(e);
				if (bl) {
					int id = ProductDAO.maxId();
					if(multi.getParameterValues("color") != null){
						String[] listcolor = multi.getParameterValues("color");
						String[] quantity = multi.getParameterValues("colorquantity");
						for(String item : listcolor){
							list.add(ColorDAO.getById(Integer.parseInt(item)));
						}
						if(quantity.length == list.size()){
							for(int i=0; i<quantity.length; i++){
								int colorid = list.get(i).getMaMau();
								int qtt = Integer.parseInt(quantity[i]);
								if(qtt < 0)
									qtt = 0;
								SanPhamMauSac spcl = new SanPhamMauSac(id, colorid , qtt);
								ProductDAO.add_color(spcl);
							}
						}
					}
					int numberimg = Integer.parseInt(multi.getParameter("numberimg"));
					if(numberimg < 0)
						numberimg = 0;
					for(int i = 1; i <= numberimg; i++){
						File file=multi.getFile("img" + i);
				        //String savefolder= getServletContext().getRealPath("/upload");
						//String savefolder= "C:\\Users\\naq259\\workspace\\HighTechStore\\WebContent\\upload\\";
						String savefolder = getServletContext().getInitParameter("file-upload");
						//System.out.println(savefolder);
				        file.renameTo(new File(savefolder,file.getName()));
				        HinhAnh img = new HinhAnh(file.getName(), id);
						ProductDAO.add_image(img);
					}
					response.sendRedirect(request.getContextPath() + "/admin/product");
				} else {
					request.setAttribute("error", "Có lỗi xảy ra trong quá trình thêm sản phẩm");
					request.getRequestDispatcher("/backend/add-product.jsp").forward(request, response);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		if (task.equals("edit")) {
			String name = multi.getParameter("name");
			double price = Double.parseDouble(multi.getParameter("price"));
			if(price < 0)
				price = 0;
			double sale = 0;
			if(!multi.getParameter("saleprice").equals("") && !multi.getParameter("saleprice").equals("0")){
				sale = Double.parseDouble(multi.getParameter("saleprice"));
			}
			if(sale < 0)
				sale = 0;
			String info = multi.getParameter("info");
			String warranty = multi.getParameter("warranty");
			String spareparts = multi.getParameter("spare-parts");
			Date date = new Date(System.currentTimeMillis());
			boolean status = Boolean.parseBoolean(multi.getParameter("status"));
			int cate = Integer.parseInt(multi.getParameter("cate"));
			int brand = Integer.parseInt(multi.getParameter("brand"));
			int id = Integer.parseInt(multi.getParameter("id"));
			SanPham e = new SanPham(name, price, sale, info, warranty, spareparts, date, status, cate, brand);
			e.setMaSP(id);
			boolean bl = false;
			try {
				bl = ProductDAO.edit(e);
				if (bl) {
					response.sendRedirect(request.getContextPath() + "/admin/product");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		if(task.equals("updatenumber")){
			String[] color = multi.getParameterValues("color");
			String[] number = multi.getParameterValues("num");
			int id = Integer.parseInt(multi.getParameter("id"));
			if(color.length == number.length){
				boolean bl = false;
				for(int i = 0; i < color.length; i++){
					int colorid = Integer.parseInt(color[i]);
					int num = Integer.parseInt(number[i]);
					if(num < 0)
						num = 0;
					SanPhamMauSac e = new SanPhamMauSac(id, colorid, num);
					try {
						bl = ProductDAO.update_number_product(e);
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				if(bl){
					response.sendRedirect(request.getContextPath() + "/admin/product");
				}
			}
		}
		
		if (task.equals("addcolor")){
			int color = Integer.parseInt(multi.getParameter("color"));
			int num = Integer.parseInt(multi.getParameter("num"));
			int id = Integer.parseInt(multi.getParameter("id"));
			if(num < 0)
				num = 0;
			SanPhamMauSac e = new SanPhamMauSac(id, color, num);
			try {
				ProductDAO.add_color(e);
				response.sendRedirect(request.getContextPath() + "/admin/product");
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
		}
	}

}
