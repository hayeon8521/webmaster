<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  <!-- 날짜 포멧 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<h3>글목록(boardList.jsp)</h3>
<!-- 검색조건 넣기 -->
<form action="boardlist.do" class="row g-3">
	<div class="col-md-3">
	<select name="searchCondition" class="form-select">
		<option selected value="">선택하세요.</option>
		<option value="T" <c:if test="${searchCondition != null && searchCondition == 'T'}">selected</c:if>>제목</option>
		<option value="W" <c:if test="${searchCondition != null && searchCondition == 'W'}">selected</c:if>>작성자</option>
		<option value="TW" <c:if test="${searchCondition != null && searchCondition == 'TW'}">selected</c:if>>제목 & 작성자</option>
	</select>
	</div>
  <div class="col-md-4">
    <input type="text" class="form-control" name="keyword" value='${keyword }'>
  </div>
  <div class="col-md-5">
    <button type="submit" class="btn btn-primary">조 회</button>
  </div>
</form>
<!-- 테이블 -->
<table class="table table-bordered table-hover">
	<thead>
		<tr>
			<th>글번호</th><th>글제목</th><th>작성자</th><th>작성일자</th><th>조회수</th>
		</tr>
	</thead>
	<tbody>

	<c:forEach var="board" items="${boardList }">
		<tr>
			<td><c:out value="${board.boardNo }" /></td>
			<td><a href='board.do?page=${page.page }&bno=${board.boardNo }&searchCondition=${searchCondition }&keyword=${keyword }'>${board.title }</a></td>
			<td><c:out value="${board.writer }" /></td>
			<td><fmt:formatDate value="${board.writeDate }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td><c:out value="${board.viewCnt }" /></td>
		</tr>
	</c:forEach>

	</tbody>
</table>
<!-- paging -->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
<c:choose>
	<c:when test="${page.prev }">
		<li class="page-item">
		    <a class="page-link" href="?page=${page.startPage-1 }&searchCondition=${searchCondition }&keyword=${keyword }">Previous</a>
		</li>
	</c:when>
	<c:otherwise>
		<li class="page-item disabled">
		    <a class="page-link">Previous</a>
		</li>
	</c:otherwise>
</c:choose>

<c:forEach var="p" begin="${page.startPage }" end="${page.endPage }" step="1">
	<li ${p == page.page ? 'class="page-item active" aria-current="page" ':'class="page-item"' }>
        <a class="page-link" href="?page=${p}&searchCondition=${searchCondition }&keyword=${keyword }">${p}</a>
    </li>
</c:forEach>

<c:choose>
	<c:when test="${page.next }">
		<li class="page-item">
      <a class="page-link" href="?page=${page.endPage+1 }&searchCondition=${searchCondition }&keyword=${keyword }">Next</a>
    </li>
	</c:when>
	<c:otherwise>
		<li class="page-item disabled">
      <a class="page-link" href="#">Next</a>
    </li>
	</c:otherwise>
</c:choose>

  </ul>
</nav>
