<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(function(){
		function printList(result){
			var list = result.list;
			var p = result.pagination;
			var t = $("#content-main tnody");
		}
		
		$.ajax({
			type:"POST",
				url:"/manager/employee/list",
					data:{pageNO:1},
						success: function(result){
						printList(result);	
						}
							
		})
	})



</script>
<title>Insert title here</title>
</head>
<body>
	<!--문서의 구조를 나타내는 태그 : !-->


	<header></header>
	<nav></nav>
	<aside></aside>
	<section id="context-main">
		<table>
			<tbody>
			</tbody>
		</table>
	</section>
	
</body>
</html>