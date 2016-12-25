package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.SanPham;
import mta.cnpm12.store.beans.ThuongHieu;
import mta.cnpm12.store.dao.BrandDAO;
import mta.cnpm12.store.dao.ProductDAO;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/ProductList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductList() {
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
		String cateid = "";
		String brandid = "";
		if(request.getParameter("cateid") != null){
			cateid = request.getParameter("cateid");
		}
		if(request.getParameter("brandid") != null){
			brandid = request.getParameter("brandid");
		}
		if(!cateid.equals("")){
			if(brandid.equals("")){
				try {
					int page = 0, firstResult = 0, maxResult = 0, totalRecord = 0;
					int pageSize = 3;
					int totalPage = 0;
					if(request.getParameter("page") != null){
						page = Integer.parseInt(request.getParameter("page"));
					}
					totalRecord = ProductDAO.countProductByCategory(Integer.parseInt(cateid));
					if(totalRecord <= pageSize){
						firstResult = 1;
						maxResult = totalRecord;
					}
					else{
						firstResult = (page - 1) * pageSize;
						maxResult = pageSize;
					}
					totalPage = (int) Math.ceil((double)totalRecord/pageSize);
					List<SanPham> listProduct = ProductDAO.listProductByCategory(Integer.parseInt(cateid), firstResult, maxResult);
					List<ThuongHieu> listBrand = BrandDAO.listAll();
					request.setAttribute("listProduct", listProduct);
					request.setAttribute("listBrand", listBrand);
					request.setAttribute("cateid", cateid);
					request.setAttribute("totalRecord", totalRecord);
					request.setAttribute("pageSize", pageSize);
					request.setAttribute("totalPage", totalPage);
					request.getRequestDispatcher("/frontend/product-list.jsp").forward(request, response);
				} catch (NumberFormatException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				try {
					int page = 0, firstResult = 0, maxResult = 0, totalRecord = 0;
					int pageSize = 3;
					int totalPage = 0;
					if(request.getParameter("page") != null){
						page = Integer.parseInt(request.getParameter("page"));
					}
					totalRecord = ProductDAO.countProductByCateBrand(Integer.parseInt(cateid), Integer.parseInt(brandid));
					if(totalRecord <= pageSize){
						firstResult = 1;
						maxResult = totalRecord;
					}
					else{
						firstResult = (page - 1) * pageSize;
						maxResult = pageSize;
					}
					totalPage = (int) Math.ceil((double)totalRecord/pageSize);
					List<SanPham> listProduct = ProductDAO.listProductByCateBrand(Integer.parseInt(cateid), Integer.parseInt(brandid), firstResult, maxResult);
					List<ThuongHieu> listBrand = BrandDAO.listAll();
					request.setAttribute("listProduct", listProduct);
					request.setAttribute("listBrand", listBrand);
					request.setAttribute("cateid", cateid);
					request.setAttribute("totalRecord", totalRecord);
					request.setAttribute("pageSize", pageSize);
					request.setAttribute("totalPage", totalPage);
					request.getRequestDispatcher("/frontend/product-list.jsp").forward(request, response);
				} catch (NumberFormatException | SQLException e) {
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
		doGet(request, response);
	}

}
