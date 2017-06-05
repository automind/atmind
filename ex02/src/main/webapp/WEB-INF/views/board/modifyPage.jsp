<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>



<form role="form" action="modify" method="post">
	<input type='hidden' name='page' value="${cri.page}">
	<input type='hidden' name='perPageNum' value="${cri.perPageNum}">
	
	<div class="box-body">
		<label for="exampleInputEmail1">BNO</label>
		<input type="text" name='bno' class="form-control"
		value="${boardVO.bno }" readonly="readonly">
	</div>
</form>


<div class="box-footer">
	<button type="submit" class="btn btn-primary">SAVE</button>
	<button type="submit" class="btn btn-primary">CANCEL</button>
</div>






<script> 
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$(".btn-waring").on("click", function(){
			self.location = "/board/listPage?page=${cri.page}&perPageNum=${cri.perPageNum}";
		});
		
		$(".btn=primary").on("click", function(){
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
</html>