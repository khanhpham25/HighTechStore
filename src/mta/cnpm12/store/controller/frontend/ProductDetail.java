package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.BinhLuanSanPham;
import mta.cnpm12.store.beans.DanhMucSanPham;
import mta.cnpm12.store.beans.HinhAnh;
import mta.cnpm12.store.beans.MauSac;
import mta.cnpm12.store.beans.SanPham;
import mta.cnpm12.store.beans.SanPhamMauSac;
import mta.cnpm12.store.dao.ColorDAO;
import mta.cnpm12.store.dao.ProductCategoryDAO;
import mta.cnpm12.store.dao.ProductCommentDAO;
import mta.cnpm12.store.dao.ProductDAO;

/**
 * Servlet implementation class ProductDetail
 */
@WebServlet("/ProductDetail")
public class ProductDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetail() {
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
		String id = "";
		if(request.getParameter("id")!= null){
			id = request.getParameter("id");
		}
		ServletContext servletContext = getServletContext(); 
	    int userCounter = 0; 
	    userCounter = Integer.parseInt((String)servletContext.getAttribute("userCounter"));
	    request.setAttribute("userCounter", userCounter);
		if(!id.equals("")){
			try {
				SanPham prod = ProductDAO.getById(Integer.parseInt(id));
				List<DanhMucSanPham> listCate = ProductCategoryDAO.listAll();
				List<HinhAnh> listImage = ProductDAO.listImage(Integer.parseInt(id));
				List<BinhLuanSanPham> listComment = ProductCommentDAO.getByProdId(Integer.parseInt(id));
				List<SanPhamMauSac> listProdColor = ProductDAO.listColor(Integer.parseInt(id));
				List<MauSac> listColor = ColorDAO.listAll();
				request.setAttribute("prod", prod);
				request.setAttribute("listImage", listImage);
				request.setAttribute("listCate", listCate);
				request.setAttribute("listComment", listComment);
				request.setAttribute("listProdColor", listProdColor);
				request.setAttribute("listColor", listColor);
				request.getRequestDispatcher("/frontend/product-detail.jsp").forward(request, response);
			} catch (NumberFormatException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
		String name = request.getParameter("name");
		Date date = new Date(System.currentTimeMillis());
		String comment = request.getParameter("comment");
		boolean status = true;
		int prodid = Integer.parseInt(request.getParameter("prodid"));
		BinhLuanSanPham e = new BinhLuanSanPham(0, name, date, comment, status, prodid);
		boolean bl = false;
		try {
			bl = ProductCommentDAO.create(e);
			if(bl){
				response.sendRedirect(request.getContextPath() + "/product?id="+ prodid);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
