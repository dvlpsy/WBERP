<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 결재</title>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<style type="text/css">
.wrap {
	text-align: center;
}
.form {
	width: 600px;
	height: 80px;
	background-color: #fff;
	border-top: 1px solid #000000;
}
.form_last {
	width: 600px;
	height: 80px;
	background-color: #fff;
	border-top: 1px solid #000000;
	border-bottom: 1px solid #000000;
}
.f_head {
	width:230px;
	background-color: #e4eaf2;
	display: inline-block;
	text-align: left;
}
.f_icon {
	width: 70px;
	height: 65px;
	background-color: #e4eaf2;
	display: inline-block;
	text-align: center;
	padding-top: 15px;
}
.f_title {
	width: 160px;
	height: 80px;
	line-height: 80px;
	display: inline-block;
	vertical-align: top;
	text-align: center;
	background-color: #e4eaf2;
	font-size: 15px;
}
.f_content_wrap {
	display: inline-block;
	vertical-align: top;
	width: 370px;
	height: 80px;
	text-aling: center;
	line-height: 80px;
	font-size: 13px;
}
.page_wrap {
	width: 600px;
}
</style>
<!-- 추가스크립트 작업 -->
<script type="text/javascript">
$(document).ready(function() {
	reloadList();
	
	$(".wrap").on("click", ".form", function() {
		$("#modeNo").val($(this).attr("name"));
		$("#sampleForm").attr("action", "gwAppAdd");
		$("#sampleForm").submit();
	});
	
	$(".wrap").on("click", ".form_last", function() {
		$("#modeNo").val($(this).attr("name"));
		$("#sampleForm").attr("action", "gwAppAdd");
		$("#sampleForm").submit();
	});
	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});

});

function reloadList() {
	var params = $("#sampleForm").serialize();
	
	$.ajax({
		type : "post",
		url : "AppModeListAjax", //결재첫화면(양식목록 출력)Ajax
		dataType : "json",
		data : params, 
		success : function(res) { 
			drawList(res.list,res.cnt);
			drawPaging(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}

function drawList(list, cnt) {
	var html = "";
	
	if(cnt == 0) {
		html += "<div class=\"form\">";
		html += "<div class=\"f_head\">";
		html += "<div class=\"f_icon\">";
		html += "<img src=\"resources/images/gw/f_icon.png\" width=\"50\" height=\"50\">";
		html += "</div>";
		html += "<div class=\"f_title\">양식제목</div>";
		html += "</div>";
		html += "<div class=\"f_content_wrap\">양식이 없습니다</div>";
		html += "</div>";
	} else {
		for(var i = 0; i < list.length; i++){
			if(i!=list.length-1){
				html += "<div class=\"form\" name=\"" +list[i].APRV_MODE_NO+ "\">";
				html += "<div class=\"f_head\">";
				html += "<div class=\"f_icon\">";
				html += "<img src=\"resources/images/gw/f_icon.png\" width=\"50\" height=\"50\">";
				html += "</div>";
				html += "<div class=\"f_title\">" +list[i].APRV_MODE_NM+ "</div>";
				html += "</div>";
				html += "<div class=\"f_content_wrap\">" +list[i].APRV_MODE_EXPN+ "</div>";
				html += "</div>";
			} else {
				html += "<div class=\"form_last\" name=\"" +list[i].APRV_MODE_NO+ "\">";
				html += "<div class=\"f_head\">";
				html += "<div class=\"f_icon\">";
				html += "<img src=\"resources/images/gw/f_icon.png\" width=\"50\" height=\"50\">";
				html += "</div>";
				html += "<div class=\"f_title\">" +list[i].APRV_MODE_NM+ "</div>";
				html += "</div>";
				html += "<div class=\"f_content_wrap\">" +list[i].APRV_MODE_EXPN+ "</div>";
				html += "</div>";
			}
		}
	}
	
	$(".wrap").html(html);
	
}

function drawPaging(pb) {
      var html = "";

      if ($("#page").val() == 1) {
         html += "<div class=\"arrow prev\"></div>";
      } else {
         html += "<div class=\"arrow prev\" name =\"" + ($("#page").val() - 1) + "\"></div> ";
      }

      for (var i = pb.startPcount; i <= pb.endPcount; i++) {
         if ($("#page").val() == i) {
            html += "<div class=\"page_on\" name=\"" + i + "\">" + i + "</b></div> ";
         } else {
            html += "<div class=\"page\" name=\"" + i + "\">" + i + "</div> ";
         }
      }

      if ($("#page").val() == pb.maxPcount) {
         html += "<div class=\"arrow next\" name =\"" +pb.maxPcount + "\"></div>";
      } else {
         html += "<div class=\"arrow next\" name =\"" + ($("#page").val() * 1 + 1) + "\"></div> ";
      }

      $(".page_nation").html(html);
}
</script>
</head>
<body>
	<!-- top & left -->
	<c:import url="/topLeft">
		<c:param name="top">${param.top}</c:param>
		<c:param name="menuNo">${param.menuNo}</c:param>
	</c:import>
	<!-- 화면에 맞추어 제목작성 -->
	<div class="contents_header">
		<div class="contents_header_txt">결재</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<!-- 화면전환 시 아래와 같이 폼을 구성하시오. -->
		<form action="#" id="sampleForm" method="post">
		<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<input type="hidden" id="page" name="page" value="${page}"/>
			<input type="hidden" name="modeNo" id="modeNo"/>
		</form>
		
		<div class="wrap">
		</div>
		
		<div class="page_wrap">
			<div class="page_nation"></div>
		</div>
		
	</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>