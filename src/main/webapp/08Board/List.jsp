<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//DAO객체 생성을 통해 DB에 연결
BoardDAO dao = new BoardDAO(application);

/*
검색어가 있는 경우 클라이언트가 선택한 필드명과 검색어를 저장할
Map을 생성한다. 파라미터가 추가되는 경우에도 그대로 활용할 수 있다.
*/
Map<String, Object> param = new HashMap<String, Object>();

/*
검색폼에서 입력한 검색어와 필드명을 파라미터로 받아온다.
<form>태그의 전송방식은 get, action속성은 없는 상태이므로 
현재 페이지로 폼값이 전송된다.
*/
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
if (searchWord != null) {
	/*
	클라이언트가 입력한 검색어가 있는 경우에만 Map에 컬럼명과
	검색어를 추가한다. 이값은 DB처리를 위한 DAO로 전달함
	*/
	param.put("searchField", searchField);
	param.put("searchWord", searchWord);
}
//Map을 인수로 게시물의 갯수를 카운트
int totalCount = dao.selectCount(param);
//목록에 출력한 게시물을 인출하여 반환
List<BoardDTO> boardLists = dao.selectList(param);
//DB 연결 해제
dao.close();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
    <jsp:include page="../Common/Link.jsp" />  

    <h2>목록 보기(List)</h2>
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 목록보기 -->
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
<%
if (boardLists.isEmpty()) {
 //List에 출력할 데이터가 없는지 확인
%>
        <tr>
            <td colspan="5" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
<%
}
else {
	//출력할 데이터가 있다면 확장for문으로 반복해서 출력
	int virtualNum = 0;
	for (BoardDTO dto : boardLists)
	{
			
		//게시물의 갯수로 목록의 가상번호 부여
		virtualNum = totalCount--;
%>
        <tr align="center">
            <td><%= virtualNum %></td>  
            <td align="left"> 
                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>
            </td>
            <td align="center"><%= dto.getId() %></td>           
            <td align="center"><%= dto.getVisitcount() %></td>   
            <td align="center"><%= dto.getPostdate() %></td>    
        </tr>
<% 
	}
}
%>
    </table>
   
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>
</html>