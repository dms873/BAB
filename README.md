




# 파이널 프로젝트 - BAB 그룹웨어 <img width="50" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1568917764/noticon/stddia3lvzo8napn15ec.png">


## Contents <img width="30" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1567008133/noticon/mw0xnjgco64rfeviwqvy.png">
1. 팀 소개
2. 프로젝트 개요
3. 설계의 주안점
4. 개발환경
5. 주요기능
6. Document

<br>

## 1️⃣ 팀 소개
<img width="1911" alt="image" src="https://user-images.githubusercontent.com/83773369/181913934-be21209f-3edb-4a7b-8428-f67879500a3d.png">

<br>

## 2️⃣ 프로젝트 개요
<img width="1913" alt="image" src="https://user-images.githubusercontent.com/83773369/181913946-265024a0-50af-4e75-97b1-efdf2054c5bc.png">

<img width="30" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1626765925/noticon/mpyse3r6bwekcye70p5o.png"> ***그룹웨어 미사용시***
  - 업무 프로세서가 정립되지 않아 업무 인수인계가 제대로 이루어지지 않을 수 있다.
  - 실시간으로 의사 결정을 내리기가 어렵다.
  - 협업을 함에 있어 애로사항이 많다.

<br>

## 3️⃣ 설계의 주안점
- **접근성**
  - 메뉴를 직관적으로 표기하여 누구나 쉽게 사용할 수 있도록 접근성을 높임
- **편의성**
  - 100% 웹 기반으로 모든 구성원이 시간과 장소에 제약없이 실시간으로 반영된 정확한 자료를 확인할 수 있음
- **오류의 최소화**
  - 많은 테스트를 통해 여러가지 오류들을 수정해 사용자의 불편함을 최소화함

<br>

## 4️⃣ 개발환경
<img width="1711" alt="image" src="https://user-images.githubusercontent.com/83773369/181913916-5f7079cd-9175-4580-ae52-22e469f8060c.png">

<br>

## 5️⃣ 주요기능

<div align="center">
<img width="200" alt="image" src="https://user-images.githubusercontent.com/83773369/181919991-5f793a9f-3436-4c6a-988c-a531159070e8.png">
</div>

<details>
<summary><h3>✅ 조직도 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 조직도 조회 및 검색 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![1_조직도)조회,검색](https://user-images.githubusercontent.com/83773369/181914139-fe9856f3-6230-4ad8-902b-e4ab6c9ceb44.gif)

</div>

---
<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1887" alt="image" src="https://user-images.githubusercontent.com/83773369/181916270-7f9031d4-43bc-42be-8a7f-7475868189a0.png">



- jsTree API 사용
- 부서, 사원을 DB에서 조회하여 배열안 객체(`[{}]`)형태로 만든 후 jsTree만드는 함수에 데이터를 넣어 조직도 생성
- 노드 전체 펼치기와 전체 닫기 버튼을 구현
- 검색 기능을 구현하여 검색한 내용과 일치하는 노드 찾기
- 사원 클릭 시 사원의 상세 정보 조회 가능
</details>

---

<details>
<summary><h3>✅ 전자결재 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 결재 양식 선택 <img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![2_전자결재)결재양식선택](https://user-images.githubusercontent.com/83773369/181916365-e35a83fd-9f1f-4235-85df-84e486aaa1c0.gif)

</div>

- 양식을 선택하지 않으면 경고메시지
- 휴가신청서를 선택하면 휴가신청서 로드
- 지출결의서를 선택하면 지출결의서 로드
---
<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 결재선 지정
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![3_전자결재)결재선지정](https://user-images.githubusercontent.com/83773369/181916622-907b8a5a-356d-41ca-8891-ca9ad25020c9.gif)

</div>

- 결재선 지정 전 입력 시 alert
- 조직도가 로드되고 사원 선택 후 `→` 를 클릭하면 결재선 리스트에 직책 순으로 추가됨
- 결재선에 4명 이상 추가 시, 기안자 결재선 리스트에 추가 시, 결재선 리스트에 아무도 없을 시 alert
- `←` 클릭 시 결재선 리스트 모두 삭제
- 부서명 클릭 후 `→` 클릭 시 참조처 리스트에 추가

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 문서 기안 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![4_전자결재)문서기안](https://user-images.githubusercontent.com/83773369/181917698-661216e5-4bbd-401b-b656-3c9e6cebd506.gif)

</div>

- 결재선 지정 후 제목, 내용, 내역 입력(미입력 시 결재요청 진행되지 않음)
- datepicker API를 사용하여 날짜 선택
- 수량, 금액 입력 시 합계금액 자동 계산
- uploadcare API사용하여 파일첨부 기능 구현

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 결재 회수
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![5_전자결재)문서회수](https://user-images.githubusercontent.com/83773369/181916879-c50f1e7f-6365-44f0-b12e-70243d227acf.gif)

</div>

- 내가 올린 기안문 중 결재자가 승인/반려 전인 문서는 결재회수 가능

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 문서 수정
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![6_전자결재)문서수정](https://user-images.githubusercontent.com/83773369/181916883-c668239b-5f96-4be4-8518-26cf4787e4cd.gif)

</div>

- 결재대기 상태인 문서는 문서수정 가능

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 결재 승인 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![7_전자결재)승인](https://user-images.githubusercontent.com/83773369/181916968-5dc038ed-71e3-4c81-9aee-707ae5721137.gif)

</div>

- 결재 수신 문서에서는 내가 승인/반려해야 할 문서들 조회
- 결재 승인 클릭 시 승인되며 다음 결재자 순서로 넘어감

---

<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1909" alt="image" src="https://user-images.githubusercontent.com/83773369/181917133-07e94bbd-8374-40db-8f2f-92f93e66103d.png">

- 승인 후 결재상태는 진행중으로 변경됨
- 결재 회수 또는 수정이 불가능
- 문서 상세조회 시 현재 어느 결재자가 승인했는지 확인 가능

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 결재 반려 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![8_전자결재)반려](https://user-images.githubusercontent.com/83773369/181916971-621a3684-3899-4cf3-9627-1650a90248ad.gif)

</div>

- 메인페이지의 알람버튼 클릭 시 결재해야 할 문서가 몇 건 있는지 알려줌
- 반려 사유 입력 시 반려 진행

<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1912" alt="image" src="https://user-images.githubusercontent.com/83773369/181917190-332c8224-1504-4396-82e9-857f01f3643d.png">

- 문서 상세조회 시 누가 반려했는지 확인 가능
- 반려 사유 클릭 시 사유 확인 가능
- 반려 시 다음 결재자가 있어도 해당 문서는 더이상 결재 진행되지 않음

---
<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1906" alt="image" src="https://user-images.githubusercontent.com/83773369/181917896-f0e01f52-7452-4b57-8bf6-c66ff07ebb86.png">

- jsp에서 `<c:if>` 태그를 사용하여 승인자 순서 별로 조건을 추가하여 상태를 화면에 나타내줌

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 기안 문서함
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![9_전자결재)기안문서함](https://user-images.githubusercontent.com/83773369/181917378-c2f17d4a-79ee-4ed9-b5f1-2feef44fa9d9.gif)

</div>

- 내가 기안했던 문서들 중 반려 또는 결재완료 상태인 문서 조회
- 한 페이지에 6개씩 보이도록 페이징 처리
- [ 제목 / 결재 양식 ] 으로 검색 가능
- 검색 결과가 없을 시 검색결과가 없다고 메시지가 나타나고 목록으로 클릭 시 리스트들 다시 조회 가능

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 결재 문서함 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![10_전자결재)결재문서함](https://user-images.githubusercontent.com/83773369/181917581-8c18dbf1-702c-4e0c-b9ea-cc16c77e1626.gif)

</div>

- 내가 승인 또는 반려했던 문서들 중 반려 또는 결재완료 상태인 문서 조회
- 한 페이지에 6개씩 보이도록 페이징 처리
- [ 제목 / 결재 양식 / 기안자 / 기안 부서 ] 로 검색 가능
- 검색 결과가 없을 시 검색결과가 없다고 메시지가 나타나고 목록으로 클릭 시 리스트들 다시 조회 가능

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 참조 문서함 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![11_전자결재)참조문서함](https://user-images.githubusercontent.com/83773369/181917834-dc378a5b-5f9e-48ef-8949-961be34c760b.gif)

</div>

- 결재선 지정 시 참조부서를 지정하면 해당 부서 사원 모두가 조회 가능
- 한 페이지에 6개씩 보이도록 페이징 처리
- [ 제목 / 결재 양식 / 기안자 / 기안 부서 ] 로 검색 가능
- 검색 결과가 없을 시 검색결과가 없다고 메시지가 나타나고 목록으로 클릭 시 리스트들 다시 조회 가능

</div>
</details>

---

<details>
<summary><h3>✅ 근태관리 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 출근 등록
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![12_근태관리)출근등록](https://user-images.githubusercontent.com/83773369/181917973-ff194941-591a-4afc-98e6-ec8b2429ed0d.gif)

</div>

- 출근 버튼 클릭 시 출근 시간이 DB에 저장되며 내 근태 현황에 리스트로 확인 가능
- 출근시간이 DB에 저장되어 있다면 출근 버튼은 비활성화, 퇴근 버튼은 활성화
- 출근시간이 저장 되어있지 않다면 퇴근 버튼은 비활성화 상태

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 퇴근 등록
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![13_근태관리)퇴근등록](https://user-images.githubusercontent.com/83773369/181917986-deb3019f-69a9-4796-9214-11dc1ca4f9cd.gif)

</div>

- 퇴근 버튼 클릭 시 퇴근 시간이 DB에 저장되며 누적 근무 시간이 늘어남
- 퇴근시간이 저장되어 있다면 퇴근 버튼은 비활성화 상태

---
<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1908" alt="image" src="https://user-images.githubusercontent.com/83773369/181918128-4e12b874-481a-44fd-92d7-5d28cc147178.png">

- 시간 단위로 계산되기 때문에 1시간 이상 근무해야 퇴근 처리 가능
- 퇴근시간 저장되면 오늘 날짜의 퇴근시간 - 출근시간으로 계산하여 소정 근무 시간 구함

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 내 근태 현황 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![14_근태관리)내근태현황](https://user-images.githubusercontent.com/83773369/181917989-5e53b81f-a743-4253-9059-b1b0c09d825d.gif)

</div>

- highcharts API를 사용하여 하프도넛 그래프로 누적 근무 시간, 남은 근무 시간 수치를 시각화 함
- 누적 근무 시간, 남은 근무 시간 확인
- 해당 월에 언제 얼마나 근무했는지 테이블로 확인

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 내 연차 내역
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![15_근태관리)내연차내역](https://user-images.githubusercontent.com/83773369/181917991-4b24c654-71c5-427b-bdc8-7051440113ee.gif)

</div>

- 총 연차, 사용 연차, 잔여 연차 확인
- 연차 사용 내역, 연차 생성 내역 확인
- 사용 내역 2개씩 뜨도록 페이징처리

---
<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1913" alt="image" src="https://user-images.githubusercontent.com/83773369/181918298-534776f7-d952-47dd-96f4-49d3b805d9bc.png">

- highcharts API를 사용하여 내가 원하는 대로 컬러 변경, 퍼센트로 표기하는 title의 위치와 style을 지정하는 등 
프로젝트에 맞게 커스텀 진행

</div>
</details>

---

<details>
<summary><h3>✅ 채팅 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 채팅 홈 
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![16_채팅)채팅홈](https://user-images.githubusercontent.com/83773369/181918369-8020788a-d452-4eac-a0e7-d8595aef79e2.gif)

</div>

- websocket API 사용
- 사원목록에서 친구 리스트를 조회
- 채팅 리스트에서 내가 참여한 채팅방들, 가장 마지막 대화 조회
- 채팅방 클릭 시 채팅 내역 확인

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 채팅방 만들기 및 멤버 초대
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![17_채팅)방만들기,멤버초대](https://user-images.githubusercontent.com/83773369/181918371-1b6286ab-5725-470b-b1b4-eb6324b8375e.gif)

</div>

- 채팅방 생성 시 대화상대를 선택하지 않았을 때, 방 제목을 입력하지 않았을 때 alert
- 새로 만들어진 방 상세조회 시 채팅 참여 인원 수와 채팅 참여자 확인

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 채팅 발신 및 수신
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![18_채팅)채팅발신,수신](https://user-images.githubusercontent.com/83773369/181918373-38edc9e7-cfc9-4743-9d31-34a3f3285ace.gif)

</div>

- 채팅 발신 시 오른쪽 말풍선으로 표시
- 채팅 수신 시 왼쪽 말풍선으로 표시
- 같은 사람이 여러 개 채팅을 보낼 경우 말풍선만 띄워 줌

---
<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1909" alt="image" src="https://user-images.githubusercontent.com/83773369/181918569-bbd800fa-3be7-48e5-b09f-807ef65cd2fe.png">

- 라이브러리를 pom.xml에 설정
- EchoHandler 클래스 생성
- servlet-context.xml에서 웹소켓 핸들러를 등록 후 웹소켓 서버로 사용할 클래스를 bean으로 생성

<img width="1904" alt="image" src="https://user-images.githubusercontent.com/83773369/181918620-edab2420-4327-4431-ae63-da83c46876e4.png">

- jsp에서 웹 소켓 접속, 메시지 발신, 수신 코드 작성
- 메시지 발송 시 이름, 채팅 내용, 방 번호 controller에 전달
- controller에서 받은 메시지를 웹 소켓 세션의 sendMessage()를 통해 모든 유저에게 메시지를 전달하여 수신기능 구현
- jsp에서 전달받은 메시지를 TextMessage의 getPayload()를 통해 controller에서 확인 가능
- 메시지 발송 시 채팅 테이블에 insert하여 DB에 저장
- jsp에서 메시지 수신 시 보낸사람과 받는사람을 로그인 한 사람과 비교하여 말풍선 색깔로 구분해줌
- 같은 사람이 여러 개 채팅을 보낼 경우 말풍선만 띄워줌
- 채팅이 여러 개일 경우 스크롤바가 생성되어 가장 하단으로 가도록 설정

---

<div align="center">
<img width="100" alt="image" src="https://noticon-static.tammolo.com/dgggcrkxq/image/upload/v1577544307/noticon/a7cmr2ibsfyuwcydpvny.png">
</div>

<img width="1916" alt="image" src="https://user-images.githubusercontent.com/83773369/181918630-9fc883a3-764c-4ad2-b744-e547c4125034.png">

- 채팅 내용 조회 시 중복된 행은 하나만 조회되도록 차집합 역할을 해주는 MINUS를 이용하여 2개의 SELECT문을 하나의 쿼리로 조회
- LEFT OUTER JOIN을 이용하여 채팅 내용이 없는 방도 조회
- 채팅번호 DESC로 정렬 후 채팅 내용이 없는 방은 마지막으로 정렬

</div>
</details>

---

<br>

<div align="center">
<img width="202" alt="image" src="https://user-images.githubusercontent.com/83773369/182773336-b2226c1b-02ee-445b-aa31-5ebf09254acb.png">
</div>

<details>
<summary><h3>✅ 주소록 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 주소록 조회, 검색
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![주소록X2](https://user-images.githubusercontent.com/83773369/182774004-e7dc93e9-a2e9-4735-bbb7-2e7753b69c1c.gif)

</div>

</div>
</details>

---

<details>
<summary><h3>✅ 공지사항 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 공지사항 글쓰기
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![공지사항글쓰기X2](https://user-images.githubusercontent.com/83773369/182774185-c56ebce7-6203-4446-a27c-ca2b0e9fa47d.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 공지사항 삭제
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![공지사항삭제X2](https://user-images.githubusercontent.com/83773369/182774290-cf610f67-1023-46dc-8397-75ccac48fc83.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 공지사항 조회, 검색
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![공지사항조회X2](https://user-images.githubusercontent.com/83773369/182774372-17637cd4-ae18-4ab8-9b33-1db062e7fe4b.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 공지사항 상세 조회
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![공지사항상세보기X2](https://user-images.githubusercontent.com/83773369/182774357-25955578-fa24-4f12-892f-b84f14eb0cbd.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 공지사항 수정
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![공지사항수정X2](https://user-images.githubusercontent.com/83773369/182774367-96fae620-c5c7-41d4-9b94-93e81dbbdc2d.gif)

</div>

</div>
</details>

---

<details>
<summary><h3>✅ 메일 </h3></summary>
<div markdown="1"> 


<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 메일 쓰기
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![메일쓰기x2](https://user-images.githubusercontent.com/83773369/183241003-49488764-ae7e-4ba5-bdf5-54ec849c7ab4.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 메일 조회
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![메일조회X2](https://user-images.githubusercontent.com/83773369/182774905-0b3e24d9-75f6-4edc-81d1-342c0df88547.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 메일 읽기
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![메일읽기X2](https://user-images.githubusercontent.com/83773369/182774913-b28a843a-0f87-4995-96b5-d397112bc23e.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 메일 삭제
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<br>

<div align="center">

![메일삭제x2](https://user-images.githubusercontent.com/83773369/183241009-396ad828-9e50-4f5c-badb-551cfd553ae1.gif)

</div>


</div>
</details>

---

<br>

<div align="center">

<img width="202" alt="image" src="https://user-images.githubusercontent.com/83773369/183080289-febe828b-1b19-4f65-9dad-8bea6533b119.png">

</div>

<details>
<summary><h3>✅ 로그인 / 로그아웃 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 로그인 / 로그아웃
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![로그인,로그아웃](https://user-images.githubusercontent.com/83773369/183080597-66acda39-57df-4ee5-b7e4-339a432cf700.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 아이디 찾기
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![아이디 찾기](https://user-images.githubusercontent.com/83773369/183080784-867d5021-29aa-4662-a6c2-ba53de7dcd2b.gif)

</div>


---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 비밀번호 찾기
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![비밀번호 찾기](https://user-images.githubusercontent.com/83773369/183080924-531ad121-d170-4a89-ac90-784ebb50b249.gif)

</div>

</div>
</details>

---

<details>
<summary><h3>✅ 내 정보 수정 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 내 정보 수정
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![내정보수정](https://user-images.githubusercontent.com/83773369/183081230-034b0021-6334-4492-9eff-1f37fca867bc.gif)

</div>

</div>
</details>

---

<details>
<summary><h3>✅ 캘린더 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 캘린더 등록 / 조회
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![캘린더_등록,조회](https://user-images.githubusercontent.com/83773369/183081365-872dc245-4f1c-4813-b863-af12728968de.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 캘린더 삭제
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![캘린더_삭제](https://user-images.githubusercontent.com/83773369/183081424-26963f60-b666-4bfe-b855-998077ed918f.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 캘린더 수정
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![캘린더_수정](https://user-images.githubusercontent.com/83773369/183081490-bcf59907-7f32-4039-b461-9e4956d01791.gif)

</div>

</div>
</details>

---

<details>
<summary><h3>✅ 투표 </h3></summary>
<div markdown="1"> 

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 투표 등록 / 투표
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![투표_등록,투표](https://user-images.githubusercontent.com/83773369/183081570-1632a0ba-382a-425b-bba5-543aede817c1.gif)

</div>

---

<div align="center">
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png"> 투표 조회 / 검색
<img width="250" alt="image" src="https://media.discordapp.net/attachments/692994434526085184/1002954522253074472/a0c55ca0bfe82413.png">
</div>

<div align="center">

![투표_조회,검색](https://user-images.githubusercontent.com/83773369/183081631-16d264bb-8e5a-4e1f-98ee-fcd802f9d8ee.gif)

</div>

</div>
</details>

---

<br>


## 6️⃣ Document

<br>

##  1. 개발 일정

<img width="1906" alt="image" src="https://user-images.githubusercontent.com/83773369/182081450-dbb3a95f-6235-4bcb-b460-4c9ed1a22c6d.png">

<br>

## 2. 유스케이스

<img width="1707" alt="image" src="https://user-images.githubusercontent.com/83773369/182176678-d45a7246-a74e-4ac5-b700-2a4178a828fc.png">

<br>

## 3. ERD

![6_9수정  5조_BAB 그룹웨어 (1)](https://user-images.githubusercontent.com/83773369/183255199-34af36d4-92c7-4e62-a529-e4f18b878851.png)


<br>

## 4. Sequence Diagram

![문서기안, 기안문 결재 행동 시퀀스](https://user-images.githubusercontent.com/83773369/183291735-3a9ba65b-5467-4507-8b57-49bd1c1ebbc6.png)

<br>

## 5. Class Diagram


![5조_클래스다이어그램(사원)](https://user-images.githubusercontent.com/83773369/183291755-7a47a40b-d0e7-4948-8748-310d47fc6194.png)

<br>

