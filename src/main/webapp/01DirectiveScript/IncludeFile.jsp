<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--
HTML주석 (소스보기 했을때 화면에 출력된다.)

보통의 경우 인플루드 되는 JSP파일은 HTML태그없이 순수한 JSP코드만
작성하는것이 좋다. 포함되었을떄 HTML태그가 중복되기 떄문이다. 
 -->
<%-- 
JSP주석(소스보기 하더라도 화면에 출력되지 않는다.)

포함되는 페이지를 만들떄에도 page 지시어는 반드시 있어야된다.
page 지시어가 없는 JSP파일은 500에러가 발생된다.
--%>
<%
//오늘날짜
LocalDate today = LocalDate.now(); //오늘 날짜
//내일날짜
LocalDateTime tomorrow = LocalDateTime.now().plusDays(1); //내일 날짜
%>