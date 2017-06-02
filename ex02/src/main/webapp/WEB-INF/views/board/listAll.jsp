<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
    
<%@include file="../include/header.jsp"%>
	<table class="table table-bordered">
		<tr>
			<th style="width:50px">글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
	
	<c:forEach items = "${list }" var="boardVo">
		<tr>
			<td>${boardVo.bno }</td>
			<td><a href='/board/read?bno=${boardVo.bno }'>${boardVo.title }</a></td>
			<td>${boardVo.writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
				value="${boardVo.regdate }"/></td>
			<td><span class="badge bg-red">${boardVo.viewcnt }</span></td>		
		</tr>
	</c:forEach>
	</table>

<%@include file="../include/footer.jsp"%>
<script>
	var result = '${result}';
	if(result == 'SUCCESS'){
		alert("처리가 완료되었습니다.");
	}
</script>
