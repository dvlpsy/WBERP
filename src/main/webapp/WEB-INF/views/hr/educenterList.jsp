<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 페이지에 맞추어 타이틀 작업 -->
<title>기업은행 WBERP - 교육장 조회</title>
<style type="text/css">
.default_search_area {
	width: 840px;
}
.default_board {
	width: 840px;
}

.page_wrap {
	width: 500px;
}
</style>
</head>
<!-- 헤더추가 -->
<c:import url="/header"></c:import>
<!-- 추가스크립트 작업 -->

<script type="text/javascript">
$(document).ready(function() {
	if('${param.searchGbn}' != '') {
		$("#searchGbn").val('${param.searchGbn}');
	}
	
	reloadList();
	
	$("#searchBtn").on("click", function() {
		$("#page").val("1");
		reloadList();
	});
	
	$("tbody").on("click","tr", function(){
		
		$("#edu_no").val($(this).attr("name"));
		$("#actionForm").attr("action", "educenterDetail");
		$("#actionForm").submit();
	});
	
	$(".page_nation").on("click", "div", function() {
		$("#page").val($(this).attr("name"));
		reloadList();
	});
	
	$("#addBtn").on("click", function() {
		$("#actionForm").attr("action", "educenterAdd");
		$("#actionForm").submit();
	});
	
	$("tbody").on("click", "tr", function() {
		$("#edu_center_no").val($(this).attr("name"));
		$("#actionForm").submit();
	
	});

function drawList(list, cnt) {
	var html = "";
	
	if(cnt == 0) {
		html += "<tr>";
		html += "<td colspan=\"4\">데이터가 없습니다.</td>";
		html += "</tr>";
	} else {
		for(var i = 0 ; i < list.length ; i++) {
			html += "<tr name=\"" + list[i].EDU_CENTER_NO + "\">";
			html += "<td>" + list[i].EDU_CENTER_NM + "</td>";
			html += "<td>" + list[i].ADDR + "</td>";
			html += "<td>" + list[i].PHONE_NUM + "</td>";
			html += "<td>" + list[i].ACPT_PSBL_PERS + "</td>";
			html += "</tr>";
		}  
	}
	$(".edu_center tbody").html(html);
}

function drawPaging(pb) {
	var html = "";

	if ($("#page").val() == 1) {
		html += "<div class=\"arrow prev\"></div>";
	} else {
		html += "<div class=\"arrow prev\" name =\""
				+ ($("#page").val() - 1) + "\"></div> ";
	}

	for (var i = pb.startPcount; i <= pb.endPcount; i++) {
		if ($("#page").val() == i) {
			html += "<div class=\"page_on\" name=\"" + i + "\">" + i
					+ "</b></div> ";
		} else {
			html += "<div class=\"page\" name=\"" + i + "\">" + i
					+ "</div> ";
		}
	}

	if ($("#page").val() == pb.maxPcount) {
		html += "<div class =\"arrow next\"></div>";
	} else {
		html += "<div class=\"arrow next\" name =\""
				+ ($("#page").val() * 1 + 1) + "\"></div> ";
	}

	$(".page_nation").html(html);
}

function reloadList() {
	var params = $("#actionForm").serialize();
	
	$.ajax({
		type : "post",
		url : "educenterListAjax",
		dataType : "json",
		data : params, 
		success : function(res) {
			drawList(res.list, res.cnt);
			drawPaging(res.pb);
		},
		error : function(req, status, error) {
			console.log("code : " + req.status);
			console.log("message : " + req.responseText);
		}
	});
}
   });
   
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
		<div class="contents_header_txt">교육장 조회</div>
	</div>
	<div class="contents">
		<!-- 여기에 내용을 작성하시오. -->
		<form action="#" method="post" id="actionForm">
			<!-- 아래 두개 필수 -->
			<input type="hidden" id="top" name="top" value="${param.top}" />
			<input type="hidden" id="menuNo" name="menuNo" value="${param.menuNo}" />
			<!-- -->
			<input type="hidden" name="edu_center_no" id="edu_center_no" value="${edu_center_no}" />
			<input type="hidden" name="page" id="page" value="${page}" />
		<div class="default_search_area">
			<select name ="searchGbn">
				<option value="0">교육장명</option>
				<option value="1">주소</option>
			</select>
				<input type="text" name="searchTxt" value="${param.searchTxt}"/>
				<input type="button" value="검색" id="searchBtn" />
			<div class="search_btn_area">
					<input type="button" value="등록" id="addBtn" />
			</div>
		</div>  
			<div class="default_board">
				<table class ="edu_center">
					<colgroup>
						<col width="240px">
						<col width="240px">
						<col width="240px">
						<col width="240px">
					</colgroup>
					<thead>
						<tr class="top">
							<th>교육장명</th>
							<th>주소</th>
							<th>연락처</th>
							<th>수용가능인원</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<div class="page_wrap">
					<div class="page_nation">
					</div>
				</div>
			</div>
			</form>
		</div>
	<!-- bottom -->
	<c:import url="/bottom"></c:import>
</body>
</html>