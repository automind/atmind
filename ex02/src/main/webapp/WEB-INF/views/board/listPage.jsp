<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
    
<%@include file="../include/header.jsp"%>

<form id="jobForm">
	<input type='hidden' name="page" value=${pageMaker.cri.perPageNum }>
	<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum }>
</form>


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
			<td><a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page)}&bno=${boardVo.bno}'>
				${boardVo.title }</a></td>
			<td>${boardVo.writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd hh:mm"
				value="${boardVo.regdate }"/></td>
			<td><span class="badge bg-red">${boardVo.viewcnt }</span></td>		
		</tr>
	</c:forEach>

	</table>


<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
		<li><a href="listPage?page=${pageMaker.startPage -1 }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }"
			end="${pageMaker.endPage }" var="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx? 'class=active':''}"/>>
				<a href="listPage${ pageMaker.makeQuery(idx)}">${idx }</a> 
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage> 0  }">
			<li><a href="listPage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
		</c:if>
	</ul>
</div>





<script>
	$(".pagination li a").on("click", function(event){
		event.preventDefault();
		
		var targetPage = $(this).attr("href");
		
		var jobForm = $("#jobForm");
		jobForm.find("[name='page']").val(targetPage);
		jobForm.attr("action", "/board/listPage").attr("method","get");
		jobForm.submit();
	});
</script>


<%@include file="../include/footer.jsp"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>