<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
    
<%@include file="../include/header.jsp"%>


<div class= 'box-body'>
	<select name="searchType">
		<option value="n"
			<c:out value = "cri.searchType == null?'select':''}"/>>
			---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't'?'select':''}"/>>
			Title</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'?'select':''}"/>>
			Content</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'select':''}"/>>
			Writer</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'?'select':''}"/>>
			Title  OR Writer</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw'?'select':''}"/>>
			Content OR Writer</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw'?'select':''}"/>>
			Title OR Content OR Writer</option>					
	</select>

<input type="text" name='keyword' id="keywordInput"
	value='${cri.keyword }'>
	<button id='searchBtn'>Seaerch</button>
	<button id='newBtn'>New Board</button>

</div>


<%-- 
<div>
<ul class="pagination">
	<c:if test="${pageMaker.prev }">
	<li><a href="list${pageMaker.makeSearch(pageMaker.startPage -1) }">&laquo;</a>
	</li>
	</c:if>
	
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
		<li <c:out value="${pageMaker.cri.page == idx?'clsss=active':''}"/>>
			<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
		</li>
	</c:forEach>
	<c:if test="${pageMaker.next && pageMaker.endPage>0 }">
		<li> <a href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a>
		</li>
	</c:if>
</ul>

</div> --%>



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
			<td><a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVo.bno}'>
				${boardVo.title }</a></td>
			<td>${boardVo.writer }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
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

<%-- 		
		<c:forEach items="${list }" var="boardVo">
			<tr>
				<td>${boardVo.bno }</td>
				<td>
					<a href='/board/readPage${pageMaker.makeQuery(pageMaker.cri.page) }&bno=&{boardVo.bno}'>
					${boardVO.title }</a>
				</td>
				<td>${boardVO.writer }</td>
				<td><fmt:formatDate parttern="yyyy-mm-dd HH:MM"
				value="${boardVO.regdate }"/></td>
				<td><span class="badge bg-red">${boardVo.viewcnt }</span></td>
			</tr>
		</c:forEach> --%>
		
	</ul>
</div>




<script>
	$(document).ready(
			function(){
				$('#searchBtn').on(
					"click",
					function(event){
						self.location = "list"
							+ '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("select option:selected").val()
							+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
					});
				$('#newBtn').on("click", function(evt){
					self.location="register";
				});
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