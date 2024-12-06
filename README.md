# 웹사이트 프로젝트

## 📌 주제
🐾 강아지와 고양이를 위한 케어 및 입양 플랫폼

## 🖥️ 소개
소개 보류

## 🌟 주요 목적
**1. 입양 활성화** : 유기동물 보호소와 입양 희망자를 연결하여 입양 절차를 간소화. <br><br>
**2. 책임감 있는 반려동물 관리 지원**: 초보자도 쉽게 따라할 수 있는 관리 팁 제공. <br><br>
**3. 커뮤니티 형성** : 사용자 간의 소통을 통해 반려동물 관련 정보를 공유. <br><br>

## 주요 기능

**입양 정보 제공:** <br>
- 보호소에서 제공하는 강아지와 고양이 정보 조회. <br>
- 지역 기반 입양 가능 동물 필터링 및 신청 절차 안내. <br><br>

**케어 정보:** <br>
- 초보자를 위한 사료 선택, 건강 관리, 훈련 방법 등 단계별 가이드. <br>
- 품종별 특화된 관리 팁 제공. <br><br>

**커뮤니티:** <br>
- Q&A 포럼: 사용자 질문과 답변 공유. <br>
- 팁과 경험 공유 게시판. <br><br>

**서비스 연계:** <br>
- 동물 병원, 미용실, 반려동물 등록 대행 업체 위치 정보 제공. <br><br>

## 📑 사용될 API 및 자료
**1. 공공데이터 국가동물보호정보시스템 구조동물 조회 서비스 API** <br><br>
**2. 지도 API** <br><br>
**3. 공공데이터 행정안전부_동물병원 CSV** <br><br>

## 📑 기능 리스트
| **분류**          | **깊이-1**        | **깊이-2**            | **깊이-3**             | **깊이-4**         | **설명**                                                                                                                                   | **비고**                                                                             | **로그인 여부** |
|-------------------|--------------------|------------------------|-------------------------|---------------------|------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|-----------------|
| **회원** | 회원가입 | | | | 입력 정보: 아이디, 비밀번호, 이름, 닉네임, 이메일, 전화번호, 주소 | - 아이디 중복 체크 <br>- 닉네임 중복 체크|X |
| | 로그인 | | | | 입력 정보: 아이디, 비밀번호 | - 비밀번호 암호화 및 보안 검증<br>- 로그인 실패 시 오류 메시지 제공 | X |
| | 아이디/비밀번호 찾기 | | | | - 아이디 찾기: 이메일 입력 후 일치하는 아이디 반환<br>- 비밀번호 찾기: 랜덤 비밀번호 생성 후 이메일 발송 | | X |
| **입양 정보** | 입양 가능 동물 조회 | | | | 보호소 등록 강아지와 고양이 목록 확인<br>- 품종, 나이, 건강 상태, 위치 정보 제공 | - 필터 기능 제공: 지역, 나이, 품종 | O |
| | | 입양 신청 | | | 선택한 동물의 입양 신청서 작성<br>- 신청 상태 확인 가능 | - 입양 절차 안내 제공<br>- 보호소와 연결(역량 이슈로 보류) | O |
| **펫 케어 정보** | 케어 가이드 제공 | | | | 강아지와 고양이의 품종별 관리 팁 제공<br>- 건강 관리, 필수 예방접종 등 | - 사용자 맞춤형 추천 기능 | X |
| | 의사 등록 | | | | 새로운 동물 전문 의사 등록<br>- 입력 정보: 이름, 전문 분야, 경력, 연락처 | - 관리자 권한 필요 |  |
| | 의사 삭제 | | | | 등록된 의사를 목록에서 삭제 | - 관리자 권한 필요|  |
| | 의사 상담 | | | | 홈페이지에 등록된 동물 전문 의사에게 질문 등록| - 상담 내역 저장 및 확인 가능<br>- 답변 알림 제공 | O |
| **상품 판매** | 상품 관리 | 등록, 수정, 삭제, 조회 | | | 홈페이지 내에서 애완동물 관련 상품 등록, 수정, 삭제, 조회 가능<br>- 상품 정보: 이름, 설명, 가격, 재고, 이미지 |  |
| | 상품 구매 | | | | 사용자가 상품을 선택하여 구매 가능<br>- 장바구니 추가 및 결제 기능 제공 | - 재고 확인 후 구매 가능<br>- 결제 완료 시 구매 내역 저장 | O |
| **게시판** | 글 관리 | 등록, 수정, 삭제, 조회 | | | 게시판 글 작성, 조회, 수정, 삭제 기능 제공<br>- 제목, 내용, 첨부 파일 관리 가능 | - 첨부 파일 제한: 이미지/문서<br>- 글 작성 시 미리보기 제공 | O |
| | 스크랩 관리 | 등록, 삭제, 조회 | | | 관심 있는 게시글 스크랩 등록, 삭제 및 목록 조회 | - 사용자별 스크랩 목록 저장 | O |
| **커뮤니티** | 공지사항 | | | | 공지사항 및 이벤트 | - 중요 공지는 상단 고정 | |
| **지도 서비스** | 보호소 위치 조회 | | | | 지역 기반 보호소 위치 표시<br>- 지도에서 보호소 정보 확인 가능 | - 카카오 지도 API 사용 | X |
| **실종 동물 찾기** | 실종 신고 | | | | 실종된 반려동물 신고 등록 및 정보 수정 | - 실종 동물 상세 정보 제공<br>- 목격 정보 댓글 가능 | O |
| **알림 서비스** | 알림 기능 | | | | 입양 신청 상태, 커뮤니티 댓글, 실종 동물 목격 정보 알림(목격 정보 댓글 알림임) | | O |
