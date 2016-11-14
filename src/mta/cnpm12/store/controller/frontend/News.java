package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.BaiViet;
import mta.cnpm12.store.beans.BinhLuanBaiViet;
import mta.cnpm12.store.beans.DanhMucBaiViet;
import mta.cnpm12.store.dao.ArticleCategoryDAO;
import mta.cnpm12.store.dao.ArticleCommentDAO;
import mta.cnpm12.store.dao.ArticleDAO;

/**
 * Servlet implementation class News
 */
@WebServlet("/News")
public class News extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public News() {
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
		int newsId = Integer.parseInt(request.getParameter("id"));
		try {
			BaiViet e = ArticleDAO.getById(newsId);
			List<DanhMucBaiViet> listCate = ArticleCategoryDAO.listAll();
			List<BinhLuanBaiViet> listComment = ArticleCommentDAO.getByNewsId(newsId);
			int countComment = ArticleCommentDAO.countComment(newsId);
			request.setAttribute("e", e);
			request.setAttribute("listCate", listCate);
			request.setAttribute("listComment", listComment);
			request.setAttribute("countComment", countComment);
			request.getRequestDispatcher("/frontend/news-detail.jsp").forward(request, response);
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
		String name = request.getParameter("name");
		Date date = new Date(System.currentTimeMillis());
		String comment = request.getParameter("comment");
		boolean status = true;
		int newsid = Integer.parseInt(request.getParameter("newsid"));
		BinhLuanBaiViet e = new BinhLuanBaiViet(0, name, date, comment, status, newsid);
		boolean bl = false;
		try {
			bl = ArticleCommentDAO.create(e);
			if(bl){
				response.sendRedirect(request.getContextPath() + "/news?id="+ newsid);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
