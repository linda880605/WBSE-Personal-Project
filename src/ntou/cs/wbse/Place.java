package ntou.cs.wbse;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
import com.google.gson.JsonParser;

public class Place {
	public static String StringFromURL(String requestURL) throws IOException { // 拿到返回的JSON
		try (Scanner scanner = new Scanner(new URL(requestURL).openStream(), StandardCharsets.UTF_8.toString())) {
			scanner.useDelimiter("\\A");
			return scanner.hasNext() ? scanner.next() : "";
		}
	}

	public static String getId(String input) throws IOException { // 找某個地點 取得id
		String url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&input=" + input + "&inputtype=textquery";
		String Json = StringFromURL(url); // 取得JSON
		String id = new JsonParser().parse(Json).getAsJsonObject().getAsJsonArray("candidates").get(0).getAsJsonObject().get("place_id").getAsString(); // 取得id
		return id;
	}

	public static String getDetail(String id) throws IOException { // 用id 找出地點的評論
		String url = "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&fields=formatted_address,formatted_phone_number,name,rating,reviews&place_id=" + id;
		String Json = StringFromURL(url); // 取得JSON
		return Json;
	}
}
