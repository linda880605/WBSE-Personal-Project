<%@ page language="java" contentType="text/html;iso-8859-1" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<!DOCTYPE html>

<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&callback=first">
	</script>
	
<title>定位</title>
<style>
div {font-size:22px;}
input[type="button"] {
	border: none;
	color: #555555;
  	background-color: #e7e7e7;
	padding: 11px 22px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

input[type="button"]:hover {
  	background-color: #555555;
  	color: #e7e7e7;
}
#route{
	font-size:1cm;
}
#route:hover{
	font-size:1cm;
	color:red;
}
</style>
</head>

<body>
	<div id="map" style="font-size:22px">您所在的位置為</div>
	<div id="place" style="font-size:22px">地點名稱：＿＿＿＿＿＿＿＿</div>
	
	<font size="5">
	您想要去<input type="text" style="font-size:22px" id="destination"
			name="destination" placeholder="輸入名稱 / 地址皆可">
	</font>
	&nbsp&nbsp<input type="button"value="go" onclick="toWhere()"><br>
	<!--  </form><br>-->
	
	
	<iframe width="600" height="450" frameborder="0" style="border: 0"
		id="iframe" src=" " allowfullscreen> </iframe>
	<div id="route"></div>
	
	<script>
		var x = document.getElementById("map");
		var latitude,longitude;
		function first() {
			if (navigator.geolocation) 
				navigator.geolocation.getCurrentPosition(showPosition);
			else 
				x.innerHTML = "您沒有開放存取位置的權限";
		}
		window.onload = first; //自動載入function

		function showPosition(position) {
			latitude = position.coords.latitude;
			longitude = position.coords.longitude;
			var two = position.coords.latitude + ","+ position.coords.longitude;
			document.getElementById("iframe").src = "https://www.google.com/maps/embed/v1/place?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&q=" + two;
			x.innerHTML = "您所在的位置為「經度： " + position.coords.latitude
					+ "  緯度： " + position.coords.longitude+"」";
			const data = {
				"latitude" : latitude,
				"longitude" : longitude
			};
			$.ajax({
				type : "POST",
				url : "MeServlet.do",
				data : data,
				success : function(data) {
					$("#place").text(data);
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
		
		function toWhere() {
		  var destination = document.getElementById("destination").value;
		  const data = {
				"latitude" : latitude,
				"longitude" : longitude,
				"destination" : destination
		  };
		  $.ajax({
				type : "POST",
				url : "RouteServlet.do",
				data : data,
				success : function(data) {
					$("#route").text(data);
				},
				error: function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status);
					alert(XMLHttpRequest.readyState);
					alert(textStatus);
				}
			});
		}
		
	</script>
</body>
</html>