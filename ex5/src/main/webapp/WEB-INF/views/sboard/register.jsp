<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.min.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">글 등록하기</h3>
				</div>
				<!-- /.box-header -->
<form role="form" method="post" id="registerForm">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">제목</label> 
			<input type="text" name='title' class="form-control" placeholder="제목 입력">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용</label>
			<textarea class="form-control" name="content" rows="3" placeholder="내용 입력"></textarea>
		</div>
		<div class="form-group">
			<label for="exampleInputEmail1">작성자</label> 
			<input type="text" name="writer" class="form-control" placeholder="작성자 입력" value="${login.uid}" readonly="readonly">
		</div>
	<!-- 파일 Drop 영역 -->
		<div class="form-group">
			<label for="exampleInputEmail1">파일을 이 곳에 위치 하세요.</label>
			<div class="fileDrop"></div>
		</div>
	</div>
	<!-- /.box-body -->
	<div class="box-footer">
	<!-- 파일 Show 영역 -->
		<ul class="mailbox-attachments clearfix uploadedList">
		</ul>
		
		<div>
			<hr>
		</div>
		<button type="submit" class="btn btn-primary">등록</button>
		<button type="submit" class="btn btn-warning">취소</button>
	</div>
</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
<!-- /.content-wrapper -->
<script>
	var formObj = $("form[role='form']");
	
	$(".btn-warning").on("click",function(){
		formObj.attr("method","get");
		formObj.attr("action","/sboard/list");
		formObj.submit();
	});
</script>
<style type="text/css">
.fileDrop{
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>
<script id="template" type="text/x-handelbars-template">
	<li>
		<span class="mailbox-attachment-icon has-img">
			<img src="{{imgsrc}}" alt="Attachment">
		</span>
		<div class="mailbox-attachment-info">
			<a href="{{getLink}}" class="mailbox-attachment-name">
				{{fileName}}
			</a>
			<a href="{{fullName}}" class="btn btn-default btn-xs pull-right delbtn">
				<i class="fa fa-fw fa-remove"></i>
			</a>
		</div>
	</li>
</script>
<script>
	var template = Handlebars.compile($("#template").html());
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		var formData = new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			url:'/uploadAjax',
			data:formData,
			dataType:'text',
			processData:false,
			contentType:false,
			type : 'POST',
			success: function(data){
				var fileInfo = getFileInfo(data);
				var html = template(fileInfo);
				$(".uploadedList").append(html);
			}
		});
	});
</script>
<script>
	$("#registerForm").submit(function(event){
		event.preventDefault();
		
		var that = $(this);
		
		var str = "";
	$(".uploadedList .delbtn").each(function(index){
		str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'>";		
	});
	
	that.append(str);
	
	that.get(0).submit();
});
	
	$(".uploadedList").on("click", ".delbtn", function(event){
		
		event.preventDefault();
		
		var that = $(this);
		
		$.ajax({
			url:"deleteFile",
			data:{fileName:$(this).attr("href")},
			type:"post",
			dataType:"text",
			success:function(result){
				if(result == 'deleted'){
					alert("삭제 완료!!");
					that.parent().parent().remove();
				}
			}
		});
	});
</script>

<%@include file="../include/footer.jsp"%>