package ntou.cs.wbse;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class MapServlet
 */
@WebServlet("/MapServlet")
public class MapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MapServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String location = request.getParameter("location");
		String id = Place.getId(URLEncoder.encode(location, "utf-8"));
		String json = Place.getDetail(id);
		JsonObject obj = new JsonParser().parse(json).getAsJsonObject();
		request.setAttribute("formatted_address",((JsonObject) obj.get("result")).get("formatted_address").getAsString());

		JsonElement phone = ((JsonObject) obj.get("result")).get("formatted_phone_number");
		if (phone == null)
			request.setAttribute("formatted_phone_number", "這個地點沒有提供電話資訊");
		else
			request.setAttribute("formatted_phone_number",((JsonObject) obj.get("result")).get("formatted_phone_number").getAsString());
		
		request.setAttribute("name", ((JsonObject) obj.get("result")).get("name").getAsString());
		request.setAttribute("rating", ((JsonObject) obj.get("result")).get("rating").getAsString());
		JsonArray reviews = ((JsonObject) obj.get("result")).getAsJsonArray("reviews");
		int count = 0;
		for (JsonElement review : reviews) {
			String author_name = (String) review.getAsJsonObject().get("author_name").getAsString();
			String profile_photo_url = (String) review.getAsJsonObject().get("profile_photo_url").getAsString();
			String rating = (String) review.getAsJsonObject().get("rating").getAsString();
			String text = (String) review.getAsJsonObject().get("text").getAsString();
			int size = Integer.parseInt(rating);
			rating = "";
			for (int i = 0; i < size; i++)
				rating += "★";
			request.setAttribute("author_name" + Integer.toString(count), author_name);
			request.setAttribute("profile_photo_url" + Integer.toString(count), profile_photo_url);
			request.setAttribute("rating" + Integer.toString(count), rating);
			request.setAttribute("text" + Integer.toString(count), text);
			count++;
		}
		RequestDispatcher view = request.getRequestDispatcher("location.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
