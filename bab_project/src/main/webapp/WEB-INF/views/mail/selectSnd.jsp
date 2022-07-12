<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section>
        <article>
                <div>
	                <h1>보낸 메일함</h1>
	                <div>
	                	<button type="button" class="btn btn-secondary">읽음</button>
	                	<button type="button" class="btn btn-secondary">삭제</button>
	                	<button type="button" class="btn btn-secondary">답장</button>
	                </div>
	                <div>
		                <table class="table table-hover" style="vertical-align: middle; text-align: center;">
						<c:forEach items="${selectBoard}" var="i">
							<tr>
								<th scope="row"><input type="checkbox" id="rowCheck" name="rowCheck" value="${i.board_no }"></th>
								<td class="y_td_no" style="text-align: left;">${i.board_no }</td>
								<td id="y_td_hover" style="width: 400px; text-align: left;"><a href="javascript:void(0)" id="y_board_view" class="y_board_view">${i.board_title }</a></td>
								<td>${i.board_writer }</td>
								<td>${i.board_date }</td>
							</tr>
						</c:forEach>
						   <!--  <tr>
						      <th scope="row"><input type="checkbox"></th>
						      <td style="text-align: left;">ksy1234@ieei.or.kr</td>
						      <td style="width: 400px; text-align: left;">휴가 신청</td>
						      <td>2022/05/26</td>
						      <td>15.2 KB</td>
						    </tr>
	                        <tr>
	                          <th scope="row"><input type="checkbox"></th>
	                          <td style="width: 200px; text-align: left;">ksy1234@ieei.or.kr</td>
	                          <td style="width: 400px; text-align: left;">입사지원서</td>
	                          <td>2022/05/26</td>
	                          <td>18.3 KB</td>
	                        </tr> -->
						</table>
					</div>
	            </div>
        </article>    
    </section>
</body>
</html>