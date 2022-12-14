# 2022.08.26(금)
## 전체 회의
### 회의 내용
- 각자 낸 아이디어에 대해서 기능 단위별로 페이지를 나눠서 카톡방에 공유
    - 주제에 따라 일정 재산정 예정
- 지금까지 나온 아이디어
    - 미션 인증 게시판
    - 독서 마라톤
    - 독서 모임 생성
    - 사진 공유 sns
    - 설문조사 생성/참여
    - 익명 실시간 댓글
    
### 일정
|기한|내용|비고|
|:--|:--|:--|
|~8/28(일)|개인 주제 아이디어 페이지화 공유|
|~8/29(월)|주제 확정|
|~9월 2주|기능 상세 정의|주제에 따라 일정 재산정 예정|

---

# 2022.09.02(금)
## 전체 회의

### 회의 내용

- 주제 선정
    - 챌린지 참여 및 인증 서비스 개발
- 롤모델 사이트
    - 챌린저스
- 메인 기능 : 모집 중 / 진행 중 / 완료 상태에 따라 UI와 기능이 달라져야 함
    - 챌린지 개설
    - 챌린지 참여 - 선착순 / 개설자 승인
    - 챌린지 상세 - 인증 현황(달성률) / 100% 달성자 통계
- 확정된 정책
    - 챌린지 개설 후 수정/삭제 불가
    - 챌린저 개인별 인증 현황판 날짜는 1일차~28일차와 같은 형식을 사용
    - 개설자 강퇴 권한 없음
    - 중도 포기 없음
        - 29일 차에 챌린지 종료, 결과(성공/실패) 발표
    - 달성률: 옵션에서 80, 90, 100 선택하도록
    - 종료된 챌린지를 조회했을 때 성공한 사람을 따로 표시해주고 개인별 달성률도 보여줌
- 테이블 구상
    - 필요한 화면 리스트업 > 화면별 상세 기능 정의 후에 테이블 구상 예정

---

# 2022.09.08(목)
## 전체 회의

### 기능 확정 논의

- 관리자 승인(x)
    - 1~10명 선착순 모집, 자동 시작
    - 개설자는 자동 참여니까 최소 1인 보장
- 최대 인원 설정
    - 10명 고정 ~~or 최대는 있지만 개설자가 그 안에서 설정하게 할건지~~
- 챌린지 썸네일
    - 미설정 시, 기본 이미지 1개로 넣어주기
- 인증샷 (선택 첨부)
- 모집완료 시, 상세 페이지에서 참여 버튼 비활성화
- 개설자의 프로필은 노출, 프로필 상세 조회는 추후 고려
- 챌린지 성공 기준 : 90%로 고정
- [챌린지 상세] 챌린지 참여자의 글을 한번에 볼 수 있는 탭(최신순) 추가, 댓글 달 수 있음
- 내 인증글: 챌린지 상세에서만 보게 할 지, ~~내 인증글 모아보기 메뉴를 추가할 지~~
- 완료된 챌린지- 성공/실패 표시(이모티콘 활용)
- 챌린지 생성 후에 삭제 불가능
- 생성 후 시작 전에 챌린지 수정 가능: 썸네일 / 소개글만
- 인증글 1일 1회만 작성 가능
- 진행 중 챌린지 개수 제한 없음

---

### 서비스명 아이디어

- 4weeks
    - 아이디어 수집 중

---

### 다음 회의

- 테이블 설계
    - 9/16(금) 회의 전까지 각자 테이블 설계해보고 회의에서 확정

---
# 2022.09.16(금)
## 전체회의

### ERD 공유

ERD 각자 작성해 온 내용 공유함

- 강사님 피드백: 챌린지 규칙 테이블을 챌린지마다 28개 이상의 컬럼으로 생성하면 낭비가 심함. 챌린지 인증 이력을 관리하는 테이블을 하나만 생성하고, 유저별/챌린지별/일차별 인증 이력 데이터를 쌓는 방향으로 수정
- 기능 정의 후에 수정 예정

### 기능 정의

이후에 해야 할 플로우 차트 작성 / UI 프로토타입 작성 등을 위해 상세 기능 정의가 필요하다는 의견이 다시 나옴. 프로젝트 개발 시작까지 기간이 여유롭지 않으므로 9/23(금)까지 각자 대메뉴를 한 두 개씩 담당해 상세 기능을 정의하기로 함. 확정된 메뉴별로 플로우 차트 작성 시작할 수 있도록 계획

1. 기능 정의 및 추가 논의 내용을 카톡방에 공유(`상시`)
2. 피드백 및 애매한 사항 추가 논의(온/오프라인 `상시`)
3. `9/23(금)` 오후 4시20분 수업 종료로 회의시간 1시간 있을 것으로 예상됨. 이 날 기능 정의 모두 완료되어야 함

\[기능 정의 담당 내용]

- 로그인/회원가입/마이페이지 (지원)
- 메인페이지 (지원)
- 챌린지 개설 (지인)
- 챌린지 인증 (민재)
- 챌린지 상세 (소정)
- 챌린지 검색 (근재)
- 팝업 (근재)

\[기능 정의에 포함되어야 할 내용 예시]

- 로그인/회원가입/마이페이지 (지원)
- 메인페이지 (지원)
    - 리스트에 나올 챌린지 조건
        - 탭을 구분한다(모집중, 전체)
        - 전체: 정렬 조건(완료된 챌린지는 제일 뒷 순서에 배치, 삭제된 챌린지는 안나옴 등)
    - 리스트 구성
        - ex. 한 줄에 3개씩, 한페이지에 n줄씩
    - 이동할 수 있는 메뉴
        - 헤더/푸터
- 챌린지 개설 (지인)
    - 이동할 수 있는 메뉴
        - 헤더에서 메뉴 이동 가능
        - 저장 안하고 이동 시 개설 취소됨, 지금까지 입력된 정보 날라감(이 때 추가 안내 할지?)
        - 취소/저장 버튼
        - 저장 누르면 어디로 이동?
    - 개설 시 입력해야 하는 정보
    - 입력 정보별 타입
        - ex. 썸네일: 이미지, 한 개만
        - ex. 시작일: 라디오 버튼으로 5일 내 날짜 리스트 노출
- 챌린지 인증 (민재)
    - 이동할 수 있는 메뉴
    - 입력해야 할 정보
    - 참여 중인 챌린지 드롭다운으로 선택 가능
    - 취소/저장
- 챌린지 상세 (소정)
    - 내가 참여이력이 있는 챌린지를 조회했을 때
        - 시작 전 챌린지를 조회했을 때
        - 진행 중 챌린지를 조회했을 때
        - 완료된 챌린지를 조회했을 때
    - 참여 이력이 없는 챌린지를 조회했을 때
        - 시작 전 챌린지를 조회했을 때
        - 진행 중 챌린지를 조회했을 때
        - 완료된 챌린지를 조회했을 때
    - 삭제된 챌린지를 조회했을 떄
- 챌린지 검색 (근재)
    - 검색 조건
    - 키워드 검색바 조건
    - 검색 결과 리스트 구성/정렬 조건 등
    - 삭제된 챌린지를 조회했을 떄
- 팝업 (근재)
    - 에러케이스랑 버튼 클릭 시 이동할 페이지 설정
    - 에러 팝업
    - 재확인 팝업
        - 진짜 이탈할거니? (ex. 작성 중이던 정보가 저장되지 않습니다. 그래도 나갈까요?) > 확인 누르면 어디로 갈 지
<br>

---
# 2022.09.23(금)
## 전체회의
## 기능 정의 검토

### 댓글 피드백 확인 후 기능 확정

- 공통사항
    - 인풋박스 아래 헬퍼텍스트로 에러 처리
    - 챌린지 미리보기 카드
    - 날짜 형식: yyyy.MM.dd(E)
    - 페이징 컨트롤: 수업시간에 한 대로 통일
    - 비번변경은 이전과 다를 때만 가능
    - 서비스 내에서는 닉네임만 사용, unique not null
    - 정렬 기준: default=시작일 최신순
    - 챌린지 미리보기 리스트 레이아웃 4*4(메인, 검색결과)
    - 인풋박스 욕설 필터링
- 비번찾기: 비번 변경 페이지로 바로 이동
    - 바꾸고 로그인 페이지로 이동
    - 현재 비번이랑 같은지 검사해서 같으면 튕김
    - 다를 때만 저장 가능
- 마이페이지
    - 인증하기 공통 버튼으로 빼기(드롭다운으로 선택)
    - 챌린지마다 내 인증글 버튼만 띄우기
    - 참가중인 탭에서만 활성화
    - 나머지 탭에서만 비활성화
    - 참가중인게 없으면 메인으로 보내기(참가중인 게 없어요 구경하기)
- 개설
    - 주제
        - 그 외 선택 시 노출되는 화면에서 ‘기타’로 대체해서 보여줌
    - 제목: 40자로 변경
    - 라디오버튼: 첫 번째 자동 선택된 상태로 진입
    - 그외: 선택 시 인풋 박스 뜨도록
    - 제목에 특수문자 안됨
    - 인증방법에는 특수문자 됨
    - 모집방법
        - 선택하는 항목 없이 안내 문구만 노출
            - ex.
            
            [모집방식] 선착순
            
            [참가인원] 최대 10명 (시작 전 10명이 모이면 자동으로 모집이 마감됩니다.)
            
    - 사진
        - 사이즈/용량 개발하다가 확정
        - 미선택 시 랜덤 이미지 적용된다는 안내문구 추가
- 인증
    - 내인증글은 내인증글만, 다른사람 인증글은 챌린지 상세에서
    - 인증글 쓰고 등록하면 글 상세로 가기
    - 인증글 상세 > 댓글o(대댓글x / 작성자 본인 표시), 인증글 좋아요o, 제목 강조/인기글 없음
- 상세
    - 모집방식 영역 제거
    - 참여 신청 버튼 클릭 시, 진짜 참여할 건지 확인팝업 노출
    - 참여중인 챌린지
        - 캘린더에 day별 클릭이벤트 없음
        - 내 캘린더 영역 고정(접기 없음)
        - 인증글 전체 보기 > 게시판 형태로 수정
            - 작성 최신순
    - 참여했는데 완료된 챌린지
        - 성공/실패 여부를 임티로 표시
        - 100%달성자 → 챌린지 성공한 사람 리스트로 변경
            - 100% 달성자에는 별도의 표시(왕관)
- 검색/팝업
    - 페이지 이탈 확인 팝업: 나가기 클릭 시 이전페이지로 이동
        - 이전페이지 없는 경우 홈으로 이동
    - 검색어 길이 제한 = 챌린지 제목 길이

### ERD 수정

- challenge_rule 테이블 수정
- 마감일: ~9/29(목)
- 담당자: 근재, 민재

### 플로우 담당자 배정

- 각자 상세 기능 정의한 부분 맡아서 작성
- 작성 마감일: ~9/28(수)
- 개인별 피드백:  ~9/29(목)
    - diagrams.net에는 댓글 기능이 없음. 그냥 텍스트박스 추가해서 빈 공간에 의견 남기기

---

# 2022.09.30(금)
## Flow 검토

### 댓글 피드백 확인 후 flow 확정

- join → redirect to login
- 팝업: 정보 입력필요한 건 화면이어야 함 (추가 검토 필요)
    - 참가 재확인 팝업
- 챌린지 상세 조회 시에는 챌린지 번호, 유저 번호 둘 다 검사
- 참가 후 시작 전까지 ‘참가/인증 버튼’ 비활성화
    - ex. label: 아직 시작 전이에요 → 문구 고민 필요
- 챌린지 인증
    - 로그인/참가여부 둘 다 확인 필요
- 마이페이지 > 챌린지 개설 버튼 추가

## ERD 검토

### 댓글 피드백 확인 후 ERD 확정

- 컬럼명: 의미 부여한 컬럼명을 지정하고 모든 테이블에 공통명으로 쓰기
- 챌린지 생성
    - 종료 여부 추가
    - 종료일은 insert 2번으로 처리(생성 시 기본정보 등록 후 시작일 +28일)
    - 기본 썸네일 저장하고 넣어주는 방법
        - 서버에 저장된 이미지를 넣어줌(db 불필요)
- 챌린지 규칙
    - 인증 유무: 컬럼 삭제
    - PK: 챌린지 번호+아이디+인증시각 → 자체 IDX 추가
- 관리자는 댓글/인증글/챌린지 삭제는 없고 블라인드만 가능
    - 인증글 블라인드 처리 시, 인증여부N으로 업데이트
    

## 관리자 기능

### 관리자 기능 리스트업

- 댓글/인증글/챌린지 블라인드 기능 추가
    - 유저 차단 없음
- 관리자 페이지 추가
- 오늘/주간/월간 통계 GRAPH
    - 유저 통계
        - 가입자 수
        - 탈퇴자 수
        - 유니크 방문자 수
        
    - 챌린지 통계
        - 생성 챌린지 수
        - 종료 챌린지 수
        - 챌린지 주제 통계(누적 기간 / 막대 그래프)
            - 인기 주제 챌린지를 MAIN에 뿌리기

## 개인 과제

- FLOW에 조건(마름모) 추가해서 다듬어 오기

### UI 작성

- 지원

### use-case 작성

- 지인

### 관리자 FLOW

- 소정

### commons.css

- 지인
- 스타일 가이드 완성 후에 작업

### 테이블 생성

- 근재
- ERD 피드백 받은 후에 테이블 생성 구문 사전 준비

---

# 2022.10.04(화)

## Flow 조건 추가 검토
- 완료
    
## use-case 검토
    
- 완료
- 추가하기로 한 관리자 기능 추가 필요
    
## ui 검토
- ~10/7(금)까지 draft 완료 예정
    
## 관리자 FLOW 검토
    
- 목록 페이지는 회원 목록만 남기고 모두 제거
    
## 확정된 추가 기능
- 관리자 기능
    - 관리자용 게시판 필요
    - 관리자용 공지쓰기 메뉴 필요
    - 공지글 작성 시, 전체 챌린지 인증글 리스트에 상단 고정됨
    - 근재) 테이블 추가 여부 재확인 필요
    
- 문의하기
    - 고객센터 챗봇으로 만들기
    - 근재) 생활코딩에서 만들었던 챗봇 라이브러리 알아보기(무료/관리자 커스텀 가능 여부)
        
- 비번 찾기에 과정 추가
    - 이메일 입력하면 해당 이메일로 인증번호를 전송
    - 그 인증번호를 화면에 입력해서 일치해야 비밀번호 변경 화면으로 이동할 수 있음
    - 근재) 인증번호 저장용 테이블 추가 여부 확인 필요
    
- 챌린지 인증 사진 최대 1개

---

# 2022.10.07(금)

## UI 검토

### 메인(홈)

- 홈-전체 챌린지 페이지 분리 ✅
- 주제별 조회 메뉴 추가 ✅
- 메인에 노출할 챌린지 기준
    - 시작일이 1일 이하로 남은 챌린지 (오늘부터 시작, 내일부터 시작)
    - key copy 고민 필요
    - 내일부터 갓생살기
    - 지금 바로 시작하는 거야 !(•̀ᴗ•́)و
    - 이제 그만 미루고 싶을 때…
    - 여럿이서 힘이 팍! (•̀ᴗ•́)و
    

### 챌린지 상세

- 일반-참가중 상세화면 분리
- 일반: 비회원/회원 구분 없이 공통
    - 상태: 모집중, 모집 마감(이미 진행중 or 종료)
- 참가 중일 때의 상세화면 추가
    - 챌린지 성공 유저 리스트: 달성률이 같으면 닉네임 ㄱㄴㄷ순

### 인증글/댓글

- 인증글 리스트에서는 내가 좋아요 누른 여부 표시 안함
    - 인증글 상세에서만 표시
- 인증글 상세
    - 하트 누르면 좋아요 카운트+1, 하트 채워짐
- 댓글에 게시글 작성자 표시
- 댓글 한페이지에 5개

### 마이페이지

- 챌린지 미리보기 리스트는 한 페이지에 5개씩
- 내 인증글 리스트: 한 페이지에 5개씩
- 탈퇴하기 누르면 비밀번호 한 번 더 확인 하고 맞으면 탈퇴시키기

### 문의하기

- 채팅 라이브러리 검토 결과
    - 커스텀 가능 ✅
- 헤더 메뉴 버튼 클릭 시 채팅창 플로팅되는 방식으로 결정 ✅
- 라이브러리 주소 :

## 관리자 기능

### 관리자 페이지

- ui
- flow
- table
- 통계 페이지 차트 유형

### 관리자 기능

- 유저와 똑같이 홈페이지에 로그인 불가
- 관리자용 페이지 별도로 개설

### 관리자 페이지

- 통계확인
- 관리자 글쓰기 메뉴
    - 사진 추가 1개만 가능
    - 관리자 글 말머리: 공지
- 관리자 글은 모든 인증글 게시판에 상단 고정
    - 상단 고정 개수 제한
        - 최신 글 3개
- 추가기능: 가능할 경우 게시글/댓글 전체 조회 페이지 생성 후 블라인드 기능 추가
- 일반 유저: 관리자 글에 댓글 남기기 불가
    - 조회만 가능, 조회수만 보여준다(상세에서만 가능. 리스트에서는 말머리+제목만 보여줌)

## ERD 검토

### 강사님 피드백

- 유저 아이디는 다 유저 테이블에서 가져오고 챌린지 번호는 챌린지 생성 테이블에서 가져오기
- 챌린지 주제 테이블 추가
    - 주제 항목이 고정이 아니기 때문에 필요함
- 챌린지 생성
    - 종료 여부 컬럼 삭제(종료일로 처리)
    
- 챌린지 참가
    - `수정 시각`? (시작 전 취소 가능 ?) 삭제
    - *`시작 전 챌린지 수정(개설자), 참가 여부 수정 불가능`
- 챌린지 규칙
    - 테이블 삭제
    - 챌린지 인증 테이블과 같음
- js 타이머 라이브러리
- 인증용 테이블 따로 생성
    - 생성 시각
    - 누구한테 언제 보냈는지
    - 그 시간을 기준으로 확인해서 검사(유효시간 15~10분)
    - 인증되면 데이터 삭제
    - 스케줄러(1시간/1일 등 마다 데이터 삭제)
- 관리자는 겹치는 기능이 하나도 없으면 테이블 따로 만들고 로그인도 따로만들고..
    - 회원이 신청해서 운영자가 되는 경우가 아니므로(겹치는 기능이 없으므로)
    - 등급이 일반/관리자만 있으면 유저 테이블에서 등급 컬럼 필요 없음

## 역할분담

- 방법1
    - 2인 1조 + 3인 1조 (프론트 팀당 1명)
- 방법2
    - 2인 1조 + 2인 1조 (서비스팀)
    - 1인 (관리자페이지)

---

# 2022.10.11(화)

## UI 검토

### 그리드 변경

- 전체 화면 크기 1920px → 1440px로 변경

### 인증글 상세

- 내 글일 때 작성 당일 동안 수정하기 버튼 노출 화면 추가

### 문의하기

- 채팅 라이브러리: [https://urliveblogger.blogspot.com/2021/02/tawk-to-chat-widget-in-blogger.html#STEP_4._위젯_설치하기](https://urliveblogger.blogspot.com/2021/02/tawk-to-chat-widget-in-blogger.html#STEP_4._%EC%9C%84%EC%A0%AF_%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0)

## ERD 검토

### 수정 적용 확인

- 관리자 테이블, 공지글 첨부파일 테이블 추가 필요
- `10/13(목)까지 확정`

## 역할분담

- 방법1, 방법2 중에 방법1 선택
    - 2인 1조 + 3인 1조 (프론트 팀당 1명)
- 서비스 다 만들고 관리자페이지 하기

### 테이블 생성

- `소문자`로 생성

| 담당자 | 내용 |
| --- | --- |
| 근재 | 댓글 + 좋아요 + 파일첨부 |
| 밍대 | 유저+관리자 |
| 지원 | 챌린지 인증+탈퇴자 수 |

### Backend

- 통계: 일단 ‘오늘’ 데이터만 조회
- 추가기능: 게시글/댓글 조회 & 블라인드/해제

🏁서비스

| 담당자 | 내용 |
| --- | --- |
| 근재 | 홈 / 전체 챌린지 / 검색 / 회원가입 / 로그인 / 채팅(문의하기) |
| 밍대 | 챌린지 상세 / 마이페이지(조회) |
| 지원 | 챌린지 개설 / 인증 / 인증글 조회(마이/챌린지별) / 프로필 수정 / 계정찾기(id, pw) |

🔐관리자

| 담당자 | 내용 |
| --- | --- |
| 근재 | 유저 전체 조회 //(+페이지네이션, ++검색)
유저 통계 - 가입자수/탈퇴수/유니크 방문자수 |
| 밍대 | 공지글 쓰기/수정/삭제 |
| 지원 | 로그인/로그아웃
챌린지 통계 - 생성/종료 챌린지 수 // 챌린지 주제 통계(막대그래프) |

### Frontend

- 관리자페이지 담당 내용은 다음 회의에서 다시 정함

🏁서비스

| 담당자 | 내용 |
| --- | --- |
| 지인 | 회원가입 / 로그인 / 계정찾기(id, pw) / 챌린지 개설 /  인증 |
| 소정 | 홈 / 전체 챌린지 / 검색 / 상세 / 헤더 / 푸터 |

### Project

| 내용 | 담당자 |
| --- | --- |
| DB | 밍대 |
| UI | 지인 |
| 일정/회의록 | 지원 |
| 이슈관리 | 근재 |
| Flow | 소정 |

---
# 2022.10.14(금)

## 추가 역할 분담

### 에러 페이지 > 미정

- 403: 권한 없음/서버가 요청을 거부하고 있다는 뜻으로 접근이 금지되었다는 것
- 404: 서버가 요청한 페이지를 찾을 수 없다는 뜻
- 500: 서버에 오류가 발생하여 요청을 수행할 수 없다는 것
- [BE] ?
    - 인터셉터 - 권한 없음 에러: 403
    - 500에러용 컨트롤러 생성
- [FE] ?
    - 403/404 html 생성
    - exception.jsp, notfound.jsp 생성 (500에러)

### 문의하기

- [FE] 담당자: 소정

## ERD 검토

- 관리자 테이블, 공지글 첨부파일 테이블 추가 확인 완료
- 관리자 닉네임 컬럼 삭제 완료
- 챌린지 주제 테이블 추가 예정
- 유저 아이디와 닉네임에 관리자와 관련된 키워드 입력 불가 조건 추가

## 일정

[\[Semi] 프로젝트 일정관리 시트](https://docs.google.com/spreadsheets/d/16LscAkwpaAEuVUaq_u3yZkW2yNuEJSE997O4RkGOMvI/edit#gid=764467304)

### 전체 개발 일정

- 서비스 개발에 7일 설정, 어드민 개발에 2일 설정
- 프론트 개발일정은 백엔드 개발일정 +1일

### 개인 목표 설정

- 10/18(화)에 공유

### 준비

- 프로젝트 시작 전에 준비해야할 사항 10/18(화)에 공유

---
# 2022.10.24(월)

## 진척도 공유

- 각자 개인 목표 일정에 맞게 진행되고 있음

## 기능 변경

### 인증글 수정

- 작성 당일에만 수정 가능 → 항상 수정 가능
- 변경 사유: 인증 기록 유지를 위해 인증글 삭제 기능이 없으므로 항상 수정 가능하도록 변경

### 홈 검색 조건(type)

- 모집중/전체 → 전체/챌린지 주제
- 변경 사유: 모집중/전체로 탭을 나눠 결과를 보여주기 때문에 챌린지 주제별 키워드 검색을 할 수 있도록 하는 편이 더 유용하다고 판단함. 홈에서 주제별 전체 챌린지 검색을 쉽게 할 수 있는 메뉴도 제공하고 있으므로 코드 재활용에도 도움될 것으로 예상됨

### 댓글

- 댓글 전체보기 화면을 따로 만들고 페이징 처리 vs. 비동기로 같은 페이지에서 일정 개수만큼 더 불러오기 중 선택 필요함. 비동기 처리가 기간 내 구현이 어렵다고 판단되면 전자 선택

## 역할 분담

### 인증글 목록 조회

- 지원: 참가중(종료 포함) 챌린지 상세에서 참가자 인증글 목록 조회하는 부분 화면 구현

### 헤더

- 근재: 로그인 시 아이디 대신 닉네임 출력하도록 수정

## 일정 확인 필요 ❗️

- 인증글 목록(내 인증글, 참가자 인증글 전체) FE에 작업 이관 to `소정`
    - 10/24(월) 13:30
- 인증글 수정 FE에 작업 이관 to `지인`
