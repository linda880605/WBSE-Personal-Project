<%@ page language="java" contentType="text/html;iso-8859-1"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="utf-8">
<title>地點查詢</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.like {
	font-size: 30px;
	color: #ccc;
	cursor: pointer;
}

.cs {
	color: #ffee00;
}
</style>
</head>
<body style="height: 100%;">
	<script type="text/javascript"
		src="http://libs.baidu.com/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function () { $(".like").click(function () { $(this).toggleClass('cs'); }) })	
	function first() {
			var name = '<%=request.getAttribute("name")%>';
			//$("#iframe").attr("src", "https://www.google.com/maps/embed/v1/place?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&q=海大");
			document.getElementById("iframe").src = "https://www.google.com/maps/embed/v1/place?key=AIzaSyB_9wxosSF9XnJP_1GB8PBx4BjKnNyJLDg&q="+ name;
		}
		window.onload = first; //自動載入function
	</script>
	<div style="width: 55%; height: 100%; float: left;">
		<font size="6"> 
			<b>&nbsp地點名稱：<%=(String) request.getAttribute("name")%></b><br>
			<b>&nbsp電話：<%=(String) request.getAttribute("formatted_phone_number")%></b><br>
		</font> 
		<font size="5"> 
			&nbsp&nbsp地址：<%=(String) request.getAttribute("formatted_address")%><br>
			&nbsp&nbsp總評分：<%=(String) request.getAttribute("rating")%>
			<span class="like">★</span><br>
		</font>
		<iframe width="760" height="570" frameborder="0" style="border: 0"
			id="iframe" src=" " allowfullscreen> </iframe>
	</div>

	<div style="width: 45%; height: 100%; float: left;">
		<h2>評論</h2>
		<div class="panel-group" id="accordion">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse1"> <img
							src=<%=(String) request.getAttribute("profile_photo_url0")%>
							width="50" height="50"> <%=(String) request.getAttribute("author_name0")%>－評分：<%=(String) request.getAttribute("rating0")%>
						</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body"><%=(String) request.getAttribute("text0")%></div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse2"> <img
							src=<%=(String) request.getAttribute("profile_photo_url1")%>
							width="50" height="50"> <%=(String) request.getAttribute("author_name1")%>－評分：<%=(String) request.getAttribute("rating1")%>
						</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body"><%=(String) request.getAttribute("text1")%></div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse3"> <img
							src=<%=(String) request.getAttribute("profile_photo_url2")%>
							width="50" height="50"> <%=(String) request.getAttribute("author_name2")%>－評分：<%=(String) request.getAttribute("rating2")%>
						</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body"><%=(String) request.getAttribute("text2")%></div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse4"> <img
							src=<%=(String) request.getAttribute("profile_photo_url3")%>
							width="50" height="50"> <%=(String) request.getAttribute("author_name3")%>－評分：<%=(String) request.getAttribute("rating3")%>
						</a>
					</h4>
				</div>
				<div id="collapse4" class="panel-collapse collapse">
					<div class="panel-body"><%=(String) request.getAttribute("text3")%></div>
				</div>
			</div>

			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse5"> <img
							src=<%=(String) request.getAttribute("profile_photo_url4")%>
							width="50" height="50"> <%=(String) request.getAttribute("author_name4")%>－評分：<%=(String) request.getAttribute("rating4")%>

						</a>
					</h4>
				</div>
				<div id="collapse5" class="panel-collapse collapse">
					<div class="panel-body"><%=(String) request.getAttribute("text4")%></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>