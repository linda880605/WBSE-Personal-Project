package ntou.cs.wbse;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MeServlet
 */
@WebServlet("/MeServlet")
public class MeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MeServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String latitude = request.getParameter("latitude");
		String longitude = request.getParameter("longitude");
		response.setContentType("text/html;charset=utf-8");

		String two = latitude + "," + longitude;
		// Where where = new Where();
		String name = Where.getHere(two);

		PrintWriter out = response.getWriter();
		out.print("地點名稱：" + name);
		out.flush();
		out.close();
	}
}
