<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false" %>
<div class="box-body">
	<select name="searchType">
		<option value="n" <c:out value="${cri.searchType == null?'selected':'' }"/>>
			--------------선택-----------------
		</option>
		<option value="t" <c:out value="${cri.searchType eq 't'?'selected':'' }"/>>
			제목
		</option>
		<option value="c" <c:out value="${cri.searchType eq 'c'?'selected':'' }"/>>
			내용
		</option>
		<option value="w" <c:out value="${cri.searchType eq 'w'?'selected':'' }"/>>
			작성자
		</option>
		<option value="tc" <c:out value="${cri.searchType eq 'tc'?'selected':'' }"/>>
			제목 or 내용
		</option>
		<option value="cw" <c:out value="${cri.searchType eq 'cw'?'selected':'' }"/>>
			내용 or 작성자
		</option>
		<option value="tcw" <c:out value="${cri.searchType eq 'tcw'?'selected':'' }"/>>
			제목 or 내용 or 작성자
		</option>
	</select>
<input type="text" name="keyword" id="keywordInput" value="${cri.keyword }">
	<button id="searchBtn">검색</button>
	<button id="newBtn">새 글 등록</button>
</div>

	
<table class="table table-bordered">
	<tr>
		<th style="width: 100px">글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th style="width:60px">조회수</th>
	</tr>
		
	<c:forEach items="${list }" var="boardVo">
		<tr>
			<td>${boardVo.bno }</td>
			<td>
				<a href='/sboard/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVo.bno}'>
					${boardVo.title } <strong>[ ${boardVo.replycnt } ]</strong>
				</a>
			</td>
			<td>${boardVo.writer }</td>
			<td><fmt:formatDate value="${boardVo.regdt }" pattern="yyyy-MM-dd HH:mm"/>
			<td>
				<span class="badge bg-red">${boardVo.viewcnt }</span>
			</td>
		</tr>
	</c:forEach>
</table>
	
<div class="text-center">
	<ul class="pagination">
		<c:if test="${pageMaker.prev }">
			<li>
				<a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">&laquo;</a>
			</li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
			<li <c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
				<a href="list${pageMaker.makeSearch(idx) }">${idx }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
			<li>
				<a href="list${pageMaker.makeSearch(pageMaker.endPage+1)}">&raquo;</a>
			</li>
		</c:if>
	</ul>
</div>
	
<%@include file="../include/footer.jsp"%>

<script>
	var result = '${msg}';
	
	if(result == 'SUCCESS'){
		alert("처리가 완료되었습니다.");
	}
	
	$(document).ready(function(){
			$("#searchBtn").on("click",function(event){
				self.location = "list"
								 	  + "${pageMaker.makeQuery(1)}" 
								 	  + "&searchType=" 
								 	  + $("select option:selected").val() 
								 	  + "&keyword=" 
							 		  + encodeURIComponent($("#keywordInput").val());
			});
		
			$("#newBtn").on("click",function(evt){
				self.location = "register";
			});
		});
</script>