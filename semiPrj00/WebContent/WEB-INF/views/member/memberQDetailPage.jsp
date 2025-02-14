<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

        #wrapper{
            padding-top: 150px;
            padding-bottom: 150px;
        }

        #header{
            width: 1194px;
            height: 24px;
            left: 35%;
            margin-top: 200px;
            padding: 20px;

            margin: 0 auto;
            text-align: center;
        }

        #header a{
            padding: 15px;
            text-decoration: none;

            font-size: 1.3rem;
        }

        #header a:visited{
            color: black;
        }

        #header a:hover{
            color: #48CA7D;
        }

        section{
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            padding-top: 100px;
        }

        section button {
            color: white;
            border-radius: 50px;
            background-color: #48CA7D;
            border: 0px
        }

        #content-2 table{
            width: 90%;
            height: 90%;
        }

        #content-2{
            width: 800px;
            height: 500px;
            text-align: center;
            margin-top: 50px;
        }

       /* ------------------content-1---------------------------- */

       .member-info{
            padding-left: 300px;
            padding-right: 100px;
        }

         #content-1 *{
            display: flex;
            flex-direction: column;
        }
        #content-1{
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: center;
            font-size: 1rem;
            width: 300px;
            height: 500px;
        }

        #follow{
            text-align: center;
        }
        #member-name{
            font-size: 1.5rem;
            font-weight: 700;
        }
        #mall{
            font-size: 1.3rem;
            font-weight: 700;
        }
        #membership-img{
            width: 130px;
        }

    </style>
</head>
<body>

    <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>

   <div id="wrapper">

        <div id="header">

            <a href="/semiPrj00/member/mypage">정보수정</a>
            <a href="/semiPrj00/member/myprj">나의 프로젝트</a>
            <a href="/semiPrj00/member/mysponsor">나의 후원내역</a>
            <a href="/semiPrj00/member/myfollow">팔로우</a>
            <a href="/semiPrj00/member/mylike">좋아요</a>
            <a href="/semiPrj00/member/mycoupon">쿠폰내역</a>
            <a href="/semiPrj00/member/qanda">문의&답변내역</a>

        </div>
            
        <form action="/semiPrj00/member/qdetail" method="post">
        	<input type="hidden" name="memberNo" value="<%= loginMember.getNo() %>">
        	<input type="hidden" name="makerNo" value="${makerNo }">
        	
            <section>
            
                <div class="member-info">
                    <div id="content-1">
    
                        <div id="member-name">
                         <span><%= loginMember.getNick() %></span>
                        </div>
                        <div id="mall">
                         <span>친환경몰</span>
                        </div>
                        <div id="follow">
                         <span>팔로우 200명</span>
                         <span>팔로워 200명</span>
                        </div>
                        <div>
                         <img src="<%=contextPath %>/resources/img/memberLevelGold.png" alt="멤버십 이미지" id="membership-img">
                         <span name="mLevel"><%= loginMember.getmLevel() %></span>
                         <span name="memberType"><%= loginMember.getType() %></span>
                        </div>
             
                    </div>
                </div>

	            <div id="content-wrap">
	                
	                <div id="content-2">
	                    <table>
	                        <tr>
	                            <td>제목</td>
	                            <td><input type="text" name="title" placeholder="제목을 입력해 주세요." required style="width: 600px;"></td>
	                        </tr>
	                        <tr>
	                            <td>첨부파일</td>
	                            <td><input type="file" name="f"></td>
	                        </tr>
	                        <tr>
	                            <td>내용</td>
	                            <td><input type="text" name="content" placeholder="내용을 입력해주세요." required style="width: 600px; height: 400px;"></td>
	                        </tr>
	                    </table>
	                </div>
	
	                <div align="center">
	                    <button type="submit">작성하기</button>
	                    <button type="reset">취소하기</button>
	                </div>
	
	            </div>
	
	
	        </section>
        </form>
           
    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>

</body>
</html>