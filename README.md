# 애견 쇼핑몰 Cloggy 🐕 
<br>

## 프로젝트 소개 
애견 쇼핑몰 Cloggy 프로젝트는 애견 소유자와 애견을 사랑하는 이들을 위한 온라인 쇼핑몰을 구현하였습니다.<br>
애견 제품 및 이벤트를 사용자에게 제공합니다.
<br>

## 프로젝트 개발 기간
2023.09.18 ~ 2023.10.27
<br>

## 팀 멤버
노수람, 소하영, 이한솔, 한유정
<br>

## 기술 스택
- Java
- Spring Framework
- HTML, CSS, JavaScript
- Oracle
- Git
- Python
  <br>

![Untitled](https://github.com/ifn477/team_project/assets/145645381/4c03313c-13a1-4f36-b00d-b1fc0cac6b9a)
<br>



## 회원 주요 기능
- 메인 페이지
        - 각 카테고리, 회원 가입 및 로그인
        - BEST 아이템 슬라이드, 이벤트 팝업 창, 업 버튼
        - 상담톡 (카카오 API)
- 관리자, 사용자에 따른 카테고리 및 기능
        - 마이 페이지, 내 정보, 우리 아이 등록 등 (사용자 모드)
        - 상품 관리, 쿠폰 생성 기능 추가 (관리자 모드)
- 회원 가입, 로그인
    - 각 부문 별 유효성 검사
    - ID 중복, PW 일치 검사
    - 이메일 인증 (JAVA API), 주소 (행정안전부 API)
    - 간편 회원 가입, 간편 로그인 (카카오, 네이버)
    - 아이디 찾기, 비밀번호 찾기, 회원 정보 기억하기
- 회원 정보 출력, 수정, 삭제, 검색
- Q&A  및 공지사항 게시판 출력, 수정, 삭제, 검색
    - 비밀 글 (관리자만 열람 가능)
    - 답글
<br>

![슬라이드14](https://github.com/ifn477/team_project/assets/145645381/fec98564-ebf1-4145-b670-17383f5f17ff)
![슬라이드15](https://github.com/ifn477/team_project/assets/145645381/56e82332-3107-4070-a13d-0ac49539ecf2)
![슬라이드24](https://github.com/ifn477/team_project/assets/145645381/9a6b95a1-5007-4114-9611-ed136b982db7)
![슬라이드18](https://github.com/ifn477/team_project/assets/145645381/2074d820-98c7-4d3b-9ed4-ffde03b93377)
![슬라이드22](https://github.com/ifn477/team_project/assets/145645381/aae83619-15bf-4df1-a128-b86ec1452837)
![슬라이드21](https://github.com/ifn477/team_project/assets/145645381/2dc02902-52eb-472a-ad45-1520dbcbf3d1)
![슬라이드22](https://github.com/ifn477/team_project/assets/145645381/32147cc3-6628-425e-877a-6c26d5173894)
![슬라이드37](https://github.com/ifn477/team_project/assets/145645381/8f952747-d6d4-41e2-a3f5-328c89e5834e)
![슬라이드40](https://github.com/ifn477/team_project/assets/145645381/47854410-9e0b-4c04-bf7a-91b7489f811a)
<br>

## 상품 주요 기능
- 상품 전체 및 상세 페이지
    - 상품 전체 검색 (사용자 모드)
    - 입력, 출력, 수정, 삭제, 검색 (관리자 모드)
    - 상품 URL 공유 (카카오 API)
- 장바구니
    - 전체/선택 체크 박스 선택
    - 수량 스핀 버튼 클릭 시 DB 내 수량 정정
    - 상품 금액, 할인가, 배송 비 자동 합산된 총 금액 출력
- 결제 (포트 원 API)
    - 수취인 배송 정보 입력
    - 장바구니에서 선택한 상품 출력
    - 상품 금액에 따른 배송 비 변화, 쿠폰 적용 시 결제 금액 변동
    - 결제 완료 후 알림 톡 발송
- 쿠폰
    - 쿠폰 생성 혜택 시작일 적용
    - 관리자 아이디에서 쿠폰 등록, 수정, 삭제
    - 생성된 쿠폰 다운로드 및 DB 저장
- 찜하기
    - 상품 페이지 (제품 페이지, 상세 페이지)에서 버튼 클릭 시
      DB저장 및 상태에 따른 버튼 새로 고침
    - 해당 제품 찜 목록 카테고리에서 조회
- 최근 본 상품
    - 상품 상세 페이지 조회 시 최대 10개 상품 저장
    - 해당 제품 최근 본 상품 카테고리에서 조회
 <br>
 
![슬라이드29](https://github.com/ifn477/team_project/assets/145645381/154cf612-d1d6-4044-a0bc-10969fa16896)
![슬라이드17](https://github.com/ifn477/team_project/assets/145645381/d00561ad-8357-4d20-980c-ba0138ea2e9b)
![슬라이드33](https://github.com/ifn477/team_project/assets/145645381/7958ccd3-cdb4-4a0f-b8c3-6f04b9743fa7)
![슬라이드34](https://github.com/ifn477/team_project/assets/145645381/291d8204-de56-451b-b214-e42f6994dc1c)
![슬라이드41](https://github.com/ifn477/team_project/assets/145645381/df699266-9ee1-4e82-8133-6f879d342e02)
![슬라이드42](https://github.com/ifn477/team_project/assets/145645381/00396751-a08b-46f8-87f2-5f09be6bb9e1)
![슬라이드35](https://github.com/ifn477/team_project/assets/145645381/0f23a05c-b4c2-404f-bb6a-cdb6f970a9be)
![슬라이드27](https://github.com/ifn477/team_project/assets/145645381/02c61e75-9e26-497d-a42e-e33acf2e9d1a)
![슬라이드28](https://github.com/ifn477/team_project/assets/145645381/328031e3-574c-430c-a6d6-5513dd27ea8e)
<br>
