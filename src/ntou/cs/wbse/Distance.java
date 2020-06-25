package ntou.cs.wbse;

import java.io.IOException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class Distance {
	public static String StringFromURL(String requestURL) throws IOException { // 拿到返回的JSON
		try (Scanner scanner = new Scanner(new URL(requestURL).openStream(), StandardCharsets.UTF_8.toString())) {
			scanner.useDelimiter("\\A");
			return scanner.hasNext() ? scanner.next() : "";
		}
	}

	public static String getDistance(String origin, String destination) throws IOException {
		String url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" + origin + "&destinations=" + destination + "&key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&mode=driving";
		String Json = StringFromURL(url); // 取得JSON

		JsonObject obj = new JsonParser().parse(Json).getAsJsonObject();
		JsonArray row = obj.getAsJsonArray("rows");
		JsonArray elements = new JsonArray();
		for (JsonElement r : row)
			elements = (JsonArray) r.getAsJsonObject().get("elements");

		JsonObject Jobj = elements.get(0).getAsJsonObject();
		JsonObject distance = Jobj.getAsJsonObject("distance");
		JsonObject duration = Jobj.getAsJsonObject("duration");

		return "兩地距離" + distance.get("text").getAsString() + "," + "開車需要花" + duration.get("text").getAsString() + "抵達";
	}
}
