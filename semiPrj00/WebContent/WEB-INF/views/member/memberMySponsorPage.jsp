<%@page import="com.kh.common.vo.PageVo"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.project.vo.SupportVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	List<SupportVo> sponList = (List<SupportVo>)request.getAttribute("sponList");
	PageVo pv = (PageVo)request.getAttribute("pv");
	
	int currentPage = pv.getCurrentPage();
	int startPage = pv.getStartPage();
	int endPage = pv.getEndPage();
	int maxPage = pv.getMaxPage();

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

        button {
            color: white;
            margin-top: 10px;
            border-radius: 50px;
            background-color: #48CA7D;
            border: 0px
        }
        #content-2 button {
            width: 100px;
            height: 40px;
            color: white;
            margin-top: 10px;
            border-radius: 50px;
            background-color: #48CA7D;
            border: 0px
        }

        #content-3 table{
            width: 90%;
            height: 90%;
        }

        #content-3{
            width: 800px;
            height: 150px;
            margin-top: 30px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
        }

        #content-4 table{
            width: 90%;
            height: 90%;
        }

        #content-4{
            width: 800px;
            height: 150px;
            margin-top: 30px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
        }

        #content-5 table{
            width: 90%;
            height: 90%;
        }

        #content-5{
            width: 800px;
            height: 150px;
            margin-top: 30px;
            border: 5px solid #48CA7D;
            border-radius: 10px;
            text-align: center;
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
		#page-area{
			position:relative;
			top:800px;
			right:550px;
		}
			#page-area a{
       		width:35px;
       		font-size : 18px;
       	}
        .btn-success{
            background-color: #48CA7D!important;
            border: 0px!important;
        }
        .btn{
            border-radius: 50px !important;
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

        <input type="hidden" name="memberNo" value="<%= loginMember.getNo() %>">

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
    
                   <button>전체</button>
                   <button>후원</button>
                   <button>후원취소</button>
         
                </div>
                
				<%for(int i = 0; i <sponList.size(); i++){ %>
				
                <div id="content-3">

                    <table>

                        <tr>
                            <td rowspan="4"><a href="/semiPrj00/member/mysponsor2"><img src="" alt="프로젝트사진"></a></td>
                            <td><%=sponList.get(i).getProjectTitle() %></td>
                        </tr>
                        <tr>
                            <td>후원금액 : <%=sponList.get(i).getAmount() %></td>
                        </tr>
                        <tr>
                            <td>후원일자 : <%=sponList.get(i).getDonateDate() %></td>
                        </tr>
                        <tr>
                            <td>상태 : <%=sponList.get(i).getCancelYN() %></td>
                        </tr>

                    </table>

                </div>
				<% }%>
                


            </div>
			
            <div id="page-area">
                <%if(currentPage != 1){ %>
		<a class="btn btn-sm btn-success" href="<%=contextPath %>/member/mysponsor?p=<%=currentPage-1%>"> &lt; </a>
		<%} %>
		
		<% for(int i = startPage; i <= endPage; i++){ %>
			<%if(i==currentPage){ %>
				<a class="btn btn-sm btn-success"><%=i %><a>
			<%}else{ %>
				<a class="btn btn-sm" href="<%=contextPath %>/member/mysponsor?p=<%=i%>"><%=i %><a>
			<%} %>
		<%} %>
		<%if(currentPage != maxPage){ %>
		<a  class="btn btn-sm btn-success" href="<%=contextPath %>/member/mysponsor?p=<%=currentPage+1%>"> &gt; </a>
		<%} %>
            </div>
        </div>
        </section>
        

    </div>
    
    <%@ include file="/WEB-INF/views/common/userFooter.jsp" %>

</body>

</html>