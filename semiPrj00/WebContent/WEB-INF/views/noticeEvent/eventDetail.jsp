<%@page import="com.kh.admin.attachment.vo.AdminEventAttachmentVo"%>
<%@page import="com.kh.admin.event.vo.AdminEventVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	AdminEventVo vo = (AdminEventVo)request.getAttribute("eventVo");
	AdminEventAttachmentVo attachVo = (AdminEventAttachmentVo)request.getAttribute("attachVo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    #box{height: 150px;width: 1920px;}
       ul{
        padding: 0px;
       }
       li{
        list-style: none;
       }
        #event{
            /* border: 2px solid red; */
            width: 700px;
            height: 850px;
            margin: 0 auto;
            background-color: rgba(255, 255, 255, 0.675);
        }
        #event-h1{
            text-align: center;
            border-bottom: 2px solid lightgray;
        }
       #event-outer{
        /* border: 1px solid blue; */
        width: 700px;
        height: 750px;
        box-sizing: border-box;
        margin: 0 auto;
       }
       #event-title{
        text-align: center;
        font-size: 45px;
       }
       .event-date{
        text-align: right;
        width: 700px;
        margin-left: -34px;
        border-bottom: 1px solid  lightgray;
        font-size: 15px;
       } 
       .event-img{
        width: 300px;
        height: 300px;
        margin: 10px auto;
    
       }
       .event-term{
        text-align: center;
        border-bottom: 1px solid lightgray;
        margin-left: -34px;
        font-size:20px;
        color:#48CA7D;
       }
       
       #event-btn-div{
            border-top: 2px solid lightgray; 
            text-align: center;
            font-size: 18px;
        }
       #event-pre{margin-top:5px; box-sizing: border-box; position: relative; right: 260px; border-radius: 8px; width: 50px; height:30px;  text-decoration: none; color: black; background-color: #48CA7D;border: 0px;}
       #event-list{margin-top:5px; box-sizing: border-box; border-radius: 8px; width: 50px; height:30px;text-decoration: none; color: black; background-color: #48CA7D; border: 0px;}
       #event-next{margin-top:5px; box-sizing: border-box; position: relative; left: 260px; border-radius: 8px; width: 50px; height:30px; text-decoration: none; color: black; background-color: #48CA7D;border: 0px;}
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
    <main>
        <div id="box"></div>
        <div id="event">
            <div id="event-outer">
            
                <div>
                 <ul>
                     <li><br> <div id="event-title"><%=vo.getTitle() %></div></li>
                     <li><div class="event-date">작성일 :&nbsp;<%=vo.getWriteDate() %>&nbsp;</div></li>
                     <li><div class="event-term">이벤트 기간 : <%=vo.getStartDate() %> ~ <%=vo.getEndDate() %></div></li>
                     <li><div class="event-img"><img src="<%=contextPath%>/resources/admin/event/<%=attachVo.getName()%>" alt="이미지파일입니다"></div></li>
                     <li><div style="font-size : 25px;"><%=vo.getContent() %></div></li>
                 </ul>
                </div>
                
            </div>
            <div id="event-btn-div">
                <button id="event-list" onclick="location.href='<%=contextPath%>/member/eventList?p=1'" style="color:white;">목록</button>
            </div>
        </div>
     
    
    </main>
</body>
</html>