package vendorServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.LoginCredentials;
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try(PrintWriter out = response.getWriter()){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			LoginCredentials ln = new LoginCredentials ();
			
			ln.setPassword(password);
			ln.setUsername(username);
			
			LoginCredentials login = DAO.validatePosition(ln);
			ln.setPosition(login.getPosition());
			
			if(DAO.authenticateUser(ln) && ln.getPosition().equals("Vendor")) {
				MessageReport msg = new MessageReport("Login Successfully", "alert", "success");
				HttpSession session = request.getSession();
				HttpSession session2 = request.getSession();
				session2.setAttribute("username", username);
				session2.setMaxInactiveInterval(30*60); //Setting Session to expire in 30mins
				Cookie user = new Cookie("user", username);
				user.setMaxAge(30*60);
				response.addCookie(user);
				session.setAttribute("msg", msg);
				response.sendRedirect("merchant-dashboard.jsp");
			}else {
				MessageReport msg = new MessageReport("Invalid Login Credentials", "alert", "danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				response.sendRedirect("index.jsp");
//				out.println("Invalid Login Credentials");
			}
		}
	}



}
