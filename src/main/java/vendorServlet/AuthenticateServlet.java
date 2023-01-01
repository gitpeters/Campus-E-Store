package vendorServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Login_credential;
import model.MessageReport;
import model.Vendor;

/**
 * Servlet implementation class AuthenticateServlet
 */
@WebServlet("/AuthenticateServlet")
public class AuthenticateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuthenticateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try(PrintWriter out = response.getWriter()){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			Login_credential login = new Login_credential();
			
			login.setUsername(username);
			login.setPassword(password);
			
			Login_credential lc = DAO.validatePosition(login);
			login.setPosition(lc.getPosition());
			
			if(DAO.authenticateUser(login) && login.getPosition().equals("Vendor")) {
				Vendor user = DAO.getVendor(username);
				
				HttpSession session = request.getSession();
				session.setAttribute("vendor", user);
				session.setMaxInactiveInterval(30*60);
				
				MessageReport msg = new MessageReport("Login successfully", "alert", "success");
				HttpSession session2 = request.getSession();
				session2.setAttribute("msg", msg);
				response.sendRedirect("merchant-dashboard.jsp");
			}else {
				MessageReport msg = new MessageReport("Invalide login credentials", "alert", "danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				response.sendRedirect("index.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



}
