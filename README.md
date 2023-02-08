
## 1. 제작 기간 & 참여 인원
- 2022년 10월 18일 ~ 2022년 12월 10일
- 4인 팀 프로젝트 (팀장)

<br>

## 2. 사용 기술

#### `Back-end`

  - Java 11
  - Spring 3.9.18
  - Maven
  - Oracle 21C
  - Apache Tomcat 9.0
  - Spring Security
  - Mybatis
#### `Front-end`
  - HTML/CSS
  - Javascript

<br>

## 3. ERD 설계
<img src="https://user-images.githubusercontent.com/110653581/206644146-b63977b9-e8ad-45f6-9d72-66abfcdd1c95.png"/>

ERD 주소 : https://www.erdcloud.com/d/rH52AGzEpuXjv7vir

## 4. 핵심 기능

<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 4.1. 모임생성

<img width="50%" alt="스크린샷 2022-12-13 오전 1 49 14" src="https://user-images.githubusercontent.com/110653575/217594377-35cd5e0d-4773-42ce-8eaf-10c7782f073c.png">

<br>

- 항목 : 모임명, 이미지(선택), 카테고리, 공개여부
  * 필수 항목 미기재 시 유효성 검사로 생성 불가
- 모임 생성 시 해당 회원을 모임장으로 상태 변경
- 코드확인
  * [Controller](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/controller/BondController.java#L49)
  * [Service](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/model/service/BondServiceImpl.java#L32)
	
<br>
<br>

### 4.2. 가입한 모임 페이지(게시글)

<img width="50%" alt="스크린샷 2023-02-09 오전 1 45 14" src="https://user-images.githubusercontent.com/110653575/217595607-92ed6d7b-7591-4975-a4df-dc4841da668d.png">

<br>

- 게시글 전체 조회
  * 무한스크롤을 통한 전체 글 리스트 조회
  * 클릭 시 게시글 상세조회 모달창 생성
	
- 코드확인
  * [Controller](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/controller/BondController.java#L102)
  * [JS](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/webapp/resources/js/bond/bond.js#L58)
  * [Mapper](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/resources/mappers/post-mapper.xml#L72)
	
<br>
<br>

### 4.3. 게시글 작성 및 수정
<img width="50%" alt="스크린샷 2022-12-13 오전 1 51 54" src="https://user-images.githubusercontent.com/110653575/217594987-c9046f6f-f5aa-46ed-a85f-2d31ac896fca.png">

<br>

- summernote api 를 통한 게시글 작성 및 수정
- 게시글 수정 시 기존 글 불러오기
- 이미지 등록
  * 게시글 내 <img> 태그만 정규표현식으로 추출하여 DB에 저장
  * scheduler를 통해 서버에 저장된 이미지와 DB에 저장된 이미지 비교하여 미사용 이미지 일정시간마다 삭제
 
- 코드확인
  * [Controller](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/controller/PostController.java#L119)
  * [작성 Service](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/model/service/PostServiceImpl.java#L60)
  * [수정 Service](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/model/service/PostServiceImpl.java#L116)
  * [JS](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/webapp/resources/js/bond/bond.js#L278)
  * [Mapper](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/resources/mappers/post-mapper.xml#L181)
	
<br>
<br>

	
### 4.4. 댓글 기능

<img width="50%" alt="스크린샷 2022-12-13 오전 2 00 25" src="https://user-images.githubusercontent.com/110653575/217595203-a1e91aad-b251-4326-95c4-de423b7960cd.png">

<br>

- 댓글
  * 댓글 작성과 답글 작성 가능
  * 댓글 삭제 시 “삭제 된 댓글입니다”로 내용 수정 후 신고, 수정, 삭제 버튼 모두 사라짐
- 좋아요, 댓글 수 실시간 반영
  * 좋아요 클릭, 댓글 등록 시 상세조회와 목록조회 모두 숫자 증가
  
- 코드확인
  * [Controller](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/java/kh/semi/project/bond/controller/ReplyController.java)
  * [Mapper](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/resources/mappers/reply-mapper.xml)
  * [JS](https://github.com/Hyunjae/bondProject/blob/main/Bond/src/main/webapp/resources/js/bond/bond.js#L540)


<br>
<br>


</div>
</details>

<br>

## 5. 핵심 트러블 슈팅
### 5-1. DB 전체 삭제

학원에서 DB 서버를 업데이트하는 과정에서 모든 DB가 날라가는 이슈가 발생했습니다<br>

> 저희 팀의 경우 DB 설명서 테이블을 제작해 두었고, 각자 작성한 SQL문이 있었기 때문에 큰 틀에서는 문제가 없었습니다.<br>
>
> 하지만 중간에 수정 및 생성한 테이블이 있었고, 날라갈 수 있는 상황을 대비한 백업이 아니었기 때문에 복구를 위한 작업이 필요했습니다.<br>
> <br>
>
> 이 때 전체 SQL문 중 변경된 사항을 반영하여 다시 백업해 두었고, <br>
> 
> 그 덕분에 2차로 DB가 날라갔을 때나 서버가 마비되었을 때 영향을 받지 않고 개발할 수 있었습니다. <br>
> <br>
> 
> 결국 백업과 백업 데이터의 최신화에 대해 배우는 시간이었습니다.

