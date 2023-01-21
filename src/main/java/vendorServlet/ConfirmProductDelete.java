package vendorServlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Product;

/**
 * Servlet implementation class ConfirmProductDelete
 */
@WebServlet("/ConfirmProductDelete")
public class ConfirmProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmProductDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productid = request.getParameter("productId");
		
		Product product = new Product();
		product.setProductId(productid);
		
		try {
			if(DAO.deleteProductById(product)==1) {
				System.out.println("Product  with product id "+productid+" has been deleted successfully");
				response.sendRedirect("merchant-dashboard.jsp");
			}else {
				System.out.println("Something went wrong!");
				response.sendRedirect("merchant-dashboard.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
