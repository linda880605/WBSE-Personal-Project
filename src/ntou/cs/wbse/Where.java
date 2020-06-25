package ntou.cs.wbse;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Where {

	public static String StringFromURL(String requestURL) throws IOException { // 拿到返回的JSON
		try (Scanner scanner = new Scanner(new URL(requestURL).openStream(), StandardCharsets.UTF_8.toString())) {
			scanner.useDelimiter("\\A");
			return scanner.hasNext() ? scanner.next() : "";
		}
	}

	public static String getHere(String two) throws IOException { // 給經緯度查位置
		String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + two
				+ "&key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg";
		String json = StringFromURL(url); // 取得JSON
		JsonObject obj = new JsonParser().parse(json).getAsJsonObject();
		JsonArray ja = obj.getAsJsonArray("results");

		String name = "";
		int count = 0;
		for (JsonElement review : ja) {
			JsonArray test = (JsonArray) review.getAsJsonObject().get("address_components");
			for (JsonElement tt : test) {
				if (count == 0)
					name = tt.getAsJsonObject().get("long_name").toString();
				count++;
			}
		}
		name = name.substring(1, name.length() - 1);
		return name;
	}

}
