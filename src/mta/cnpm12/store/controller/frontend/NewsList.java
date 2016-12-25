package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.BaiViet;
import mta.cnpm12.store.beans.DanhMucBaiViet;
import mta.cnpm12.store.dao.ArticleCategoryDAO;
import mta.cnpm12.store.dao.ArticleDAO;

/**
 * Servlet implementation class News
 */
@WebServlet("/NewsList")
public class NewsList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsList() {
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
		if(request.getParameter("cateid") != null){
			cateid = request.getParameter("cateid");
		}
		if(cateid.equals("")){
			try {
				int page = 0, firstResult = 0, maxResult = 0, totalRecord = 0;
				int pageSize = 3;
				int totalPage = 0;
				if(request.getParameter("page") != null){
					page = Integer.parseInt(request.getParameter("page"));
				}
				totalRecord = ArticleDAO.countNews();
				if(totalRecord <= pageSize){
					firstResult = 1;
					maxResult = totalRecord;
				}
				else{
					firstResult = (page - 1) * pageSize;
					maxResult = pageSize;
				}
				totalPage = (int) Math.ceil((double)totalRecord/pageSize);
				List<BaiViet> e = ArticleDAO.listNews(firstResult, maxResult);
				List<DanhMucBaiViet> listCate = ArticleCategoryDAO.listAll();
				request.setAttribute("listNews", e);
				request.setAttribute("listCate", listCate);
				request.setAttribute("totalRecord", totalRecord);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("totalPage", totalPage);
				request.getRequestDispatcher("/frontend/news-list.jsp").forward(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(!cateid.equals("")){
			try {
				int page = 0, firstResult = 0, maxResult = 0, totalRecord = 0;
				int pageSize = 3;
				int totalPage = 0;
				if(request.getParameter("page") != null){
					page = Integer.parseInt(request.getParameter("page"));
				}
				totalRecord = ArticleDAO.countNewsByCategory(Integer.parseInt(cateid));
				if(totalRecord <= pageSize){
					firstResult = 1;
					maxResult = totalRecord;
				}
				else{
					firstResult = (page - 1) * pageSize;
					maxResult = pageSize;
				}
				totalPage = (int) Math.ceil((double)totalRecord/pageSize);
				List<BaiViet> e = ArticleDAO.listNewsByCategory(Integer.parseInt(cateid), firstResult, maxResult);
				List<DanhMucBaiViet> listCate = ArticleCategoryDAO.listAll();
				request.setAttribute("listNews", e);
				request.setAttribute("listCate", listCate);
				request.setAttribute("totalRecord", totalRecord);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("totalPage", totalPage);
				request.getRequestDispatcher("/frontend/news-list-by-category.jsp").forward(request, response);
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
		doGet(request, response);
	}

}
