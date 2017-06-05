<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>
    
<%@include file="../include/header.jsp"%>

<form role="form" action="modifyPage" method="post">
	<input type='hidden' name='bno' value="${boardVo.bno }">
	<input type='hidden' name='page' value="${cri.page }">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
	<input type='hidden' name='searchType' value="${cri.searchType }">
	<input type='hidden' name='keyword' value="${cri.keyword}">


<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEamil1">Title</label>
		<input type="text" name="title" class="form-control" value="${boardVo.title }"
			readonly="readonly">
			
	</div>
	<div class="form-group">
		<label for="exampleImputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">${boardVo.content }</textarea>
	</div>
	
	<div class="form-group">
		<label for="exampleImputEmail1">Writer</label>
		<input type="text" name="writer" class="form-control" value="${boardVo.writer }"
			readonly="readonly">
	</div>
</div>


<div class="box-footer">
	<button type="submit" class="btn btn-warning">수정</button>
	<button type="submit" class="btn btn-danger">삭제</button>
	<button type="submit" class="btn btn-primary">목록</button>
</div>	


</form>

<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".btn-warning").on("click", function(){
			formObj.attr("action", "/sboard/modifyPage");
			formObj.attr("method", "get");
			formObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "/sboard/removePage");
			form.submit();
		});
		
		$(".btn-primary").on("click", function(){
			formObj.attr("method", "get");
			formObj.attr("action", "/sboard/list");
			formObj.submit();
		});
		
	});
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>















