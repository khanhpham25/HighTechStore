package mta.cnpm12.store.controller.frontend;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mta.cnpm12.store.beans.DonHang;
import mta.cnpm12.store.beans.KhachHang;
import mta.cnpm12.store.dao.OrderFormDAO;

/**
 * Servlet implementation class PurchasingHistory
 */
@WebServlet("/PurchasingHistory")
public class PurchasingHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchasingHistory() {
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
		if(request.getSession().getAttribute("clientLogin") != null){
			KhachHang client = (KhachHang) request.getSession().getAttribute("clientLogin");
			try {
				List<DonHang> list = OrderFormDAO.getByCustomerId(client.getMaKhachHang());
				request.setAttribute("list", list);
				request.getRequestDispatcher("/frontend/purchasing-history.jsp").forward(request, response);
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
		doGet(request, response);
	}

}
