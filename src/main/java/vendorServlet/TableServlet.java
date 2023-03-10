package vendorServlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Product;

/**
 * Servlet implementation class TableServlet
 */
@WebServlet("/TableServlet")
public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String vendorId = (String) request.getSession().getAttribute("vendorID");
		System.out.println("Vendor Id:: "+vendorId);
		
		int page = 1;
        int recordsPerPage = 5;
        if (request.getParameter("page") != null)
            page = Integer.parseInt(
                request.getParameter("page"));
       
        List<Product> productLists;
		try {
			DAO dao = new DAO();
			productLists = dao.getProductByVendorIDPagination(vendorId,
			    (page - 1) * recordsPerPage,
			    recordsPerPage);
			
			 	int noOfRecords = dao.getNoOfRecords();
			 	System.out.println("Total number of records:: "+noOfRecords);
		        int noOfPages = (int)Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		        
		        if (noOfPages % recordsPerPage > 0) {

		        	noOfPages++;
		        }
		        
		        request.setAttribute("productLists", productLists);
		        request.setAttribute("noOfPages", noOfPages);
		        request.setAttribute("currentPage", page);
		        request.setAttribute("vendor", vendorId);
		        RequestDispatcher view
		            = request.getRequestDispatcher("add-product.jsp");
		        view.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
	}

}
