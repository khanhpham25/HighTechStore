package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.BaiViet;
import mta.cnpm12.store.beans.HinhAnh;
import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.beans.SanPham;
import mta.cnpm12.store.dao.ArticleDAO;
import mta.cnpm12.store.dao.CustomerDAO;
import mta.cnpm12.store.dao.ProductDAO;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
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
		String task = "";
		if(request.getParameter("task") != null){
			task = request.getParameter("task");
		}
		if(task.equals("logout")){
			if(request.getSession().getAttribute("clientLogin") == null){
				response.sendRedirect(request.getContextPath() + "/index");
			}
			else{
				request.getSession().removeAttribute("clientLogin");
				response.sendRedirect(request.getContextPath() + "/index");
			}
		}
		if(task.equals("")){
			try {
				List<SanPham> listProduct = ProductDAO.listHotProduct();
				List<BaiViet> listNews = ArticleDAO.listHotNews();
				List<HinhAnh> listImage = new ArrayList<>();
				for(int i = 0; i < listProduct.size(); i++){
					listImage.add(ProductDAO.getImageHotProduct(listProduct.get(i).getMaSP()));
				}
				request.setAttribute("listImage", listImage);
				request.setAttribute("listProduct", listProduct);
				request.setAttribute("listNews", listNews);
				request.getRequestDispatcher("/frontend/index.jsp").forward(request, response);
			} catch (SQLException e) {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			KhachHang e = CustomerDAO.checkLogin(username, password);
			if(e != null){
				request.getSession().setAttribute("clientLogin", e);
				response.sendRedirect(request.getContextPath() + "/index");
			}
			else{
				request.setAttribute("error", "Sai tên đăng nhập hoặc mật khẩu!");
				request.getRequestDispatcher("/frontend/index.jsp").forward(request, response);
			}
		} catch (NoSuchAlgorithmException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
