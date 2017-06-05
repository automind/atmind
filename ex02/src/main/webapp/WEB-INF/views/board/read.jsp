<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>    

<%@include file="../include/header.jsp"%>

<form role="form" method="post">
	<input type='hidden' name='bno' value="${boardVo.bno }">
	
</form>

<div class="box-body">
	<div class="form-group">
		<label for="exampleInputEamil1">Title</label>
		<input type="text" name="title" class="form-control" value="${boardVo.title }"
			readonly="readonly">
			
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">Content</label>
		<textarea class="form-control" name="content" rows="3"
			readonly="readonly">${boardVo.content }</textarea>
			
	</div>
	
	<div class="form-group">
		<label for="exampleInputEmail1">Writer</label>
		<input type="text" name="writer" class="form-control" value="${boardVo.writer }"
			readonly="readonly">
	</div>
</div>

<div class="box-footer">
	<button type="submit" class="btn btn-warning">수정</button>
	<button type="submit" class="btn btn-danger">삭제</button>
	<button type="submit" class="btn btn-primary">목록</button>
</div>	
<%@include file="../include/footer.jsp"%>
    
    


<script type="text/javascript">

$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");
		formObj.submit;
	});
	
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/board/remove");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		self.location="/board/listAll";
	});
	
});
</script>
