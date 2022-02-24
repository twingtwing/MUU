<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
      background-color: black;
      color: white;
    }

    video {
      cursor: pointer;
    }
    ol>li{
      list-style-type: decimal-leading-zero;
      cursor: pointer;
      margin: 0.5rem;
      padding: 0.5rem;
    }
    ol>li:hover{
      background-color: rgb(121, 121, 121);
      border-radius: 10px;
      font-weight: bold;
      transition: all 0.3s;
    }
    @media (max-width:1080px) {
      #box {
        flex-direction: column;
        align-items: center;
        margin: 0px;
      }
      video{
        width: 100%;
        margin: 0px;
      }
    }
  </style>
</head>
<body class="bg-black;">
<div id="box" class="d-flex bg-black p-5" style="background-color: black;">
    <div style="width: 70vw;">
      <video controls width="100%" controlsList="nodownload">
        <source src="#" type="video/mp4" data-poster="/resources/img/normal-breadcrumb.jpg">
      </video>
      <h2 style="font-weight: bold; color:white;">오리엔테이션</h2>
      <div>
        <div style="text-align: right;">2022-05-23</div>
        잘 보고 따라하세요...
      </div>
    </div>
    <div style="margin-left: 10rem;">
      <h4>커리큘럼</h4>
      <ol>
        <li onclick="showLec(0)">오리엔테이션</li>
        <li>기초 다지기 - 피아노의 기본에 대하여</li>
        <li>기초 다지기 - 필수 음악이론</li>
        <li>악보 익히기 - 악보를 제대로 이해하자</li>
        <li>악보 익히기 - 오른손 연주</li>
        <li>악보 익히기 - 왼손 연주</li>
        <li>악보 익히기 - 양손 연주</li>
        <li>중간 점검</li>
        <li>리듬 연습 - 레가토와 스타카토</li>
        <li>리듬 연습 - 템포의 중요성</li>
        <li>리듬 연습 - 아름다운 선율을 만들어보자</li>
        <li>리듬 연습 - 박자와 음표의 이해</li>
        <li>리듬 연습 - 셈여림</li>
        <li>반주 연습 - 3박자 반주 패턴</li>
        <li>반주 연습 - 3/8박자와 6/8박자</li>
        <li>반주 연습 - 알베르티 베이스</li>
        <li>장조 - 음계</li>
        <li>장조 - C장조</li>
        <li>장조 - #이 붙으면 어떻게 되는데?</li>
        <li>장조 - 셋잇단음표 연주</li>
        <li>최종 점검 (1)</li>
        <li>최종 점검 (2)</li>
      </ol>
    </div>
  </div>
</body>
</html>