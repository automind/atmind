<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
		<li><a href="listPage?page=${pageMaker.startPage -1 }">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }"
			end="${pageMaker.endpage }" nar="idx">
			<li
				<c:out value="${pageMaker.cri.page == idx? 'class=active':''}"/>>
				<a href="listPage?page=${idx}">${idx }</a> 
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage> 0  }">
			<li><a href="listPage?page=${pageMaker.endpage +1 }">&raquo;</a></li>
		</c:if>
		
		
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
		</c:forEach>
		
		
		
	</ul>
</div>
<!-- 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->