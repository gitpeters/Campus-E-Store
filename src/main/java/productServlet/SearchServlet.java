package productServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspContext;

import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;

import dao.DAO;
import model.Product;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String searchTerm = request.getParameter("searchTerm");
		if (searchTerm == "") {

		} else {
			// perform the search
			try (PrintWriter out = response.getWriter()) {
				//JSONArray jArray = new JSONArray();
				String productNames;
				List<String> products = new ArrayList<String>();
				List<Product> alternative = DAO.getAllProductDetails();
				for (Product pr : alternative) {
					if (pr.getProductName().toLowerCase().contains(searchTerm.toLowerCase())) {
						productNames = pr.getProductName();
						
						products.add(productNames);
						//out.println(pr.getProductName());
						//String json = new Gson().toJson(productNames);
						
					}
				}
				String json = JSONArray.toJSONString(products);
				System.out.println(json);
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write(json);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
