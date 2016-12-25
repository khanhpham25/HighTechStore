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
import mta.cnpm12.store.dao.ProductDAO;

/**
 * Servlet implementation class Search
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search() {
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
		try {
			String keyword = request.getParameter("keyword");
			int page = 0, firstResult = 0, maxResult = 0, totalRecord = 0;
			int pageSize = 3;
			int totalPage = 0;
			if(request.getParameter("page") != null){
				page = Integer.parseInt(request.getParameter("page"));
			}
			totalRecord = ProductDAO.countSearchProduct(keyword);
			if(totalRecord <= pageSize){
				firstResult = 1;
				maxResult = totalRecord;
			}
			else{
				firstResult = (page - 1) * pageSize;
				maxResult = pageSize;
			}
			totalPage = (int) Math.ceil((double)totalRecord/pageSize);
			List<SanPham> listProduct = ProductDAO.searchProduct(keyword, firstResult, maxResult);
			request.setAttribute("listProduct", listProduct);
			request.setAttribute("keyword", keyword);
			request.setAttribute("totalRecord", totalRecord);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("totalPage", totalPage);
			request.getRequestDispatcher("/frontend/search-result.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String keyword = request.getParameter("keyword");
		response.sendRedirect(request.getContextPath() + "/search?keyword=" + keyword + "&page=1");
	}

}
