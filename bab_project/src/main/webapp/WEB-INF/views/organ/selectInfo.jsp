<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>사원 상세정보</title>
</head>
<body>

	<img src="https://media.discordapp.net/attachments/692994434526085184/981215903570092132/unknown.png">
    <table id="s_organ_table">
        <tr>
            <th>이름</th>
            <td class="s_organ_td">손은진</td>
            <td><button class="btn btn-outline-primary">쪽지 보내기</button></td>
            <td><button class="btn btn-outline-primary">메신저 연결</button></td>
        </tr>
        <tr>
            <th>핸드폰</th>
            <td class="s_organ_td" colspan="3">010-1234-5678</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td class="s_organ_td">dms873@naver.com</td>
            <td colspan="2"><button class="btn btn-outline-primary">메일쓰기</button></td>
        </tr>
        <tr>
            <th>부서</th>
            <td class="s_organ_td" colspan="3">회계팀</td>
        </tr>
        <tr>
            <th>직책</th>
            <td class="s_organ_td" colspan="3">차장</td>
        </tr>
        <tr>
            <th>내선번호</th>
            <td class="s_organ_td" colspan="3">5678</td>
        </tr>
    </table>

</body>
</html>