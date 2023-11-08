<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        @charset "UTF-8";
        .search_box {
            font-family: 'Noto Sans KR', sans-serif;
            width: 30rem;
            text-align: left;
            margin-top: 5rem;
            margin-bottom: 16rem;
            border-collapse: collapse;
            border-left: none;
            border-right: none;
            margin-left: 40rem;
        }
        .btn {
            border-radius: 0;
            width: 100%;
            border: 0;
            margin-top: 15px;
        }
        .search_th {
            font-weight: 400;
            background-color: #f6eddf;
            padding: 10px;
            font-size: 13px;
            color: #463528;
            text-align: left;
            width: 100px;
            text-align: center;
            border-top: 1px solid #f6eddf;
        }
        .search_td {
            border-bottom: 1px solid #f6eddf;
            padding: 10px;
            font-size: 13px;
            color: #463528;
            width:100%
        }
        input {
            padding-left: 10px;
            width: 500px;
            height: 40px;
            border-style: none;
            outline: none;
        }
        p {
            font-size: 17px;
            margin-bottom: 20px;
            font-weight: 500;
            caption-side: top;
        }
        .search_option {
            display: flex;
            flex-direction: row;
        }
    </style>
</head>
<body>

<div class="search_box">
    <p>회원 검색</p>
    <form action="member-searchView" method="post">
        <div class="search_option">
            <div class="search_th">검색 항목</div>
            <div class="search_td">
            &nbsp;
                <select name="item">
                    <option value="userId">아이디</option>
                    <option value="userName">이름</option>
                    <option value="email">이메일</option>
                </select>
            </div>
        </div>
        <div class="search_option">
            <div class="search_th">검색어</div>
            <div class="search_td">
                <input type="text" name="value" style="width:100%;">
            </div>
        </div>
        <div class="btn">
            <input type="submit" value="검색" style="background-color: #e28b3a; color: #ffffff; font-weight: 600; width: 150px;"> &nbsp;
            <input type="reset" value="취소" style="font-weight: 500; width: 150px;">
        </div>
    </form>
</div>
</body>
</html>