package ntou.cs.wbse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RouteServlet
 */
@WebServlet("/RouteServlet")
public class RouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RouteServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = request.getParameter("destination");
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		String origin = latitude + "," + longitude;
		//Distance distance = new Distance();
		String json = Distance.getDistance(origin, destination);
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}

}
