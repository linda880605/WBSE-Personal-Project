<%@ page language="java" contentType="text/html;iso-8859-1" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>首頁</title>
<style>
#map {
	height: 500px;
	width: 100%;
}

input[type="text"] {
	padding: 12px 25px;
	font-size: 16px;
}

input[type="submit"] {
	border: none;
	color: white;
	padding: 12px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	background-color: #4CAF50;
}

input[type="submit"]:hover {
	background-color: #008CBA;
	color: white;
}

input[type="button"] {
	border: none;
	color: white;
	padding: 12px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	background-color: #4CAF50;
}

input[type="button"]:hover {
	background-color: #008CBA;
	color: white;
}
</style>
</head>
<body>
	<form action="MapServlet">
		<font size="5"><br>&nbsp &nbsp輸入想查詢的地方：<input type="text"
			name="location" placeholder="名稱 / 地址皆可"></font> <input type="submit"
			value="查詢">&nbsp<input type="button" value="我在哪" onclick="openpage()"> <br>
		<br>
	</form>
	<div id="map"></div>
	<script type="text/javascript">
	  function openpage(){
	      window.location.replace("/WBSE-project/home.jsp");
	  }
	  
	  var marker;
	  function initMap() {
		  var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 10, //地圖顯示的近或遠
			center : {
				lat : 25.0336962,
				lng : 121.5643673
			}
		  });
	
		  marker = new google.maps.Marker({
			map : map,
			draggable : true, //marker可移動
			animation : google.maps.Animation.DROP, //載入時有掉落效果 
			position : {
				lat : 25.0336962,
				lng : 121.5643673
			}
		  });
		  marker.addListener('click', toggleBounce);
	  }

	  function toggleBounce() { //按一下會跳
		if (marker.getAnimation() !== null)
			marker.setAnimation(null);
		else
			marker.setAnimation(google.maps.Animation.BOUNCE);
	  }
	</script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&callback=initMap">
		
	</script>
</body>
</html>