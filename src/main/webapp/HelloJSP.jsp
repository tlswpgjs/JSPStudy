<%@page import="test.HelloJava"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
String str = "�ȳ��ϼ���.";
int result = HelloJava.myFn();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>ó�� ����� ���� JSP</h2>
	<%
	out.println(str + " JSP..!!");
	%>
	<p>
		1���� 10������ ���� <%=result %> �Դϴ�.
	</p>
</body>
</html>
