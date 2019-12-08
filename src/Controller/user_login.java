package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.userDAO;
import Model.user;

/**
 * Servlet implementation class user_login
 */
@WebServlet("/user_login")
public class user_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= request.getParameter("UserName");
		String pass = request.getParameter("PassWord");
		
		new userDAO();
		user ng = userDAO.DanhSachTheoUserName(username);
		System.out.println(ng);
		new userDAO();
		boolean check = userDAO.KiemTraDangNhap(username, pass);
		System.out.println(check);
		if(check == false){
			
			request.setAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu!");
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user_login.jsp");
			dispatcher.forward(request, response);
			return;
			
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("username", ng);
			response.sendRedirect("dashboard.jsp");
			
			return;
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