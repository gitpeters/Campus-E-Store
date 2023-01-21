package vendorServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DeleteProductReport;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteProduct() {
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
		String productId = request.getParameter("pId");
		HttpSession session = request.getSession();
		session.setAttribute("pid", productId);
		
		HttpSession session2 = request.getSession();
		
		DeleteProductReport report = new DeleteProductReport("Delete Product","Are you sure you want to delete this product?"+productId,"hide");
		session2.setAttribute("report", report);
		
		
		
		response.sendRedirect("merchant-dashboard.jsp");
		
//		out.println("<style>");
//		out.println(".close-call_action_popup{visibility:hidden; top:0; transition: translate(-20%, -50%) scale(0.1);}");
//		out.println("</style>");
//		session.setAttribute("pid", productId);
//		out.println("<div class='call_action_popup' id='popup'>");
//			out.println("<h2>Delete User</h2>");
//			out.println("<p>Are sure you want to delete this product ('"+productId+"')?</p>");
//			out.println("<div class='call_action_popup_btn'>");
//				out.println("<form action='ConfirmProductDelete' method='post'>");
//					out.println("<input type='hidden' value='"+productId+"' name='pid'/>");
//					out.println("<button type='submit' >Yes</button>");
//				out.println("</form>");
//				out.println("<button type='button' class='cancel-btn' onclick='hidePopup()'>Cancel</button>");
//			out.println("</div>");
//		out.println("</div>");
//		
//		
//		out.println("<script type='text/javascript'>");
//		out.println(" function hidePopup(){document.querySelector('#popup').classList.add('close-call_action_popup');}");
//		out.println("</script>");
	}
	}

	

}
