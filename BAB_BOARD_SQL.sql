--행 1
INSERT INTO BOARD (board_no, board_title, board_writer, board_date, board_content, emp_no) VALUES (BOARD_SEQ.NEXTVAL, '금일 BAB 메일 서버 점검 공지', '이대표', systimestamp, '금일 BAB 메일 점검 공지 안내 드립니다.
12:00~14:00까지 진행 될 예정이면 빠른 시간 내에 복구하겠습니다.
불편을 드려 죄송합니다.', (select emp_no from employee where emp_name='이대표'));