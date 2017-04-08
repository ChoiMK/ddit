<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 등록</title>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    // 포커스 처리
    // $('#bo_content').summernote( {focus: true} );
    // 값 취득
    // $('#bo_content').summernote('code');
    // 값 추가
    // $('#bo_content').summernote('code', '<font color="red">추가글</font>');
    // 에디터 제거
    // $('#bo_content').summernote('destroy');
    
	/* BootstrapDialog.show({
	    title: '알럿창',
	    message: '알럿창으로 활용하세요!'
	}); */
	
	/* BootstrapDialog.show({
        message: '컨펌 다이얼로그로 활용하세요!',
        buttons: [{
            label: 'Button 1'
        }, {
            label: 'Button 2',
            cssClass: 'btn-primary',
            action: function(){
                alert('Hi Orange!');
            }
        }, {
            icon: 'glyphicon glyphicon-ban-circle',
            label: 'Button 3',
            cssClass: 'btn-warning'
        }, {
            label: 'Close',
            action: function(dialogItself){
                dialogItself.close();
            }
        }]
    });
 */
 
	$('form[name=boardForm]').submit(function(){
		var flag = true;
		
		if(fileNameConfirm($('#file01').val()));
		if(fileNameConfirm($('#file02').val()));
		
//		$('form[name=freeboardForm] input[type=file]').each(function(idx, ipn){
// 			if($(ipn).val() == ''){
// 				alert('업로드 대상 파일을 선택해주세요');
// 				flag = false;
// 			}
//		});
		
		var val = $('#bo_content').summernote('code');
		$(this).append('<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id}">');
		$(this).append('<input type="hidden" name="bo_content" value="'+val+'"/>');
		$(this).append('<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}">');
		$(this).attr('action', '${pageContext.request.contextPath}/11/freeboard/insertBoardInfo.jsp'); 	
		return true;
	});
 
 
 	$("#list").click(function(){
 		$(location).attr('href','${pageContext.request.contextPath}/11/main.jsp');
 	});
});

function fileNameConfirm(fileName){
	if(!/\.(jpg|jpeg|gif|png)/.test(fileName.toLowerCase())){
		alert('이미지 파일만 업로드 가능합니다');
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form name="boardForm" class="form-horizontal" role="form" action="" method="post"
	enctype="multipart/form-data">
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" placeholder="제목 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" value="${LOGIN_MEMBERINFO.mem_name}">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pwd" name="bo_pwd" placeholder="패스워드 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_mail" name="bo_mail" placeholder="메일주소 입력...">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
		<div class="col-sm-10">
			 <input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary">
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-info" style="float: right">등록</button>
			<button type="reset" class="btn btn-danger" style="float: right">취소</button>
			<button id="list" type="button" class="btn btn-primary" style="float: right">목록</button>
		</div>
	</div>
</form>
</body>
</html>