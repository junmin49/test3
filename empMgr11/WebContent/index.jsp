<%@page import="com.empMgr.service.EmpMgrService"%>
<%@page import="com.empMgr.dao.EmpMgrDao"%>
<%@page import = "static org.mockito.BDDMockito.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HttpServletRequest req = mock(HttpServletRequest.class);
	given(req.getParameter("pageNo")).willReturn("2");
	EmpMgrDao dao = new EmpMgrDao();
	EmpMgrService service = new EmpMgrService(dao);
	String map = service.readEmpList(req);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	var result = <%= map%>;
	$(function() {
		var list = result.list;
		var pagination = result.pagination;
		var target = $("#content-main table tbody");
		$.each(list, function(idx, emp) {
			var str = "<tr><td>"+emp.employeeId+"</td>";
			str = str + "<td><a href='view?pageNo=" + pagination.pageNo + "&employee_id=" + emp.employeeId + "'>" + (emp.firstName+" "+emp.lastName) + "</a></td>";
			str = str + "<td>" + emp.departmentName + "</td><td></tr>";
			target.append(str);
		});
		$("#pagination").append("<ul></ul>");
		var p = $("#pagination ul");
		if (pagination.prev > -1)
			p.append("<li><a href='list?pageNo=" + pagination.prev + "'>이전으로</a></li>");
		for (var i = pagination.startPage; i <= pagination.endPage; i++)
			p.append("<li><a href='list?pageNo=" + i + "'>" + i + "</a></li>");
		if (pagination.next > -1)
			p.append("<li><a href='list?pageNo=" + pagination.next + "'>다음으로</a></li>");
	});
</script>
</head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<title>ICIA 홈페이지입니다</title>
	<link rel="stylesheet" href="view/css/header.css">
	<link rel="stylesheet" href="view/css/main.css">
	<link rel="stylesheet" href="view/css/footer.css">
<body>
	<header id="header">
		<%@include file="/view/include/header.jsp" %>
	</header>
	<div id="content">
		<section id="content-main">
			<table>
				<tbody>
				</tbody>
			</table>
		</section>
		<div id="pagination">
		</div>
		<aside>
			<%@include file="/view/include/aside.jsp" %>
		</aside>
	</div>
	<footer>
		<%@include file="/view/include/footer.jsp" %>
	</footer>
</body>
</html>