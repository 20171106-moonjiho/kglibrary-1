<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/jsp/default/favicon.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>비치희망도서</title>
</head>
<link href="book2.css" rel="stylesheet">
<body>
	<c:import url="/header" />
	<c:import url="/bookheader" />
	<div id="cont_head">
		<h2>비치희망도서</h2>
		<!-- 현재위치 -->
		<div id="location">
			<ul>
				<li>홈</li>
				<li>도서자료검색</li>
				<li class="now">비치희망도서</li>
			</ul>
		</div>

		<!-- //현재위치 -->
	</div>


	<div id="cont_wrap">
		<div id="board" style="width: 100%;">

			<form action="bookHopeForm">
				<span> ▷ 총 ${count }개의 검색 결과가 있습니다. </span> <span class="center">
					<select class="selectBox" name="select">
						<option value="board_title" selected="selected">제목</option>
						<option value="hope_user">신청자</option>
				</select> <c:choose>
						<c:when test="${empty search or search == 'null'}">
							<input type="text" name="search" />
						</c:when>
						<c:otherwise>
							<input type="text" name="search" value="${search }" />
						</c:otherwise>
					</c:choose> <input type="submit" class="submit_button" value="검색" />
				</span>
			</form>

			<c:choose>
				<c:when test="${empty boards }">
					<h1>등록된 데이터가 존재하지 않습니다.</h1>
				</c:when>
				<c:otherwise>
					<table style="padding-top: 30px;">
						<tr>
							<th width="70">번호</th>
							<th width="500">제목</th>
							<th width="300">작성자</th>
							<th width="200">작성일</th>
						</tr>

						<c:forEach var="board" items="${ boards}">
							<tr>
								<td class="center">${board.no }</td>
								<td class="left"
									onclick="location.href='bookHopeContent?no=${board.no }'">
									${board.board_title }</td>
								<td class="center">${board.hope_user }</td>
								<td class="center">${board.hopedate }</td>
							</tr>
						</c:forEach>
					</table>
					<div class="center" style="margin-top: 18px;">${result}</div>
				</c:otherwise>
			</c:choose>

			<span class="right">
				<button type="button" style="width: 150px;"
					onclick="location.href='bookHopeRegist'" class="submit_button">비치
					희망 도서 신청</button>
			</span>
		</div>
	</div>
	<c:import url="/bookfooter" />
	<c:import url="/footer" />
</body>
</html>