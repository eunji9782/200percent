<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String contextPath = request.getContextPath();
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	session.removeAttribute("alertMsg");

	String errorMsg = (String) session.getAttribute("errorMsg");
	session.removeAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

    
    * {
        color: white;
    }


    #pageWrap {
        width: 1920px;
        height: 1080px;
        background-repeat: no-repeat;
        -webkit-backdrop-filter: blur(10px);
        backdrop-filter: blur(10px);
        background-image: url(<%=contextPath%>/resources/img/adminLoginForm_background.jpg);
        background-size : cover;
        opacity: 0.8;
    }   


    #adminLoginDiv {
        position: absolute;
        top:290px;
        left: 710px;
        width: 500px;
        height:500px;
        border: 3px solid black;
        background-color: black;
        opacity: 0.7;
        border-radius: 50px;

    }

    #adminLoginDiv > form {
        width: 100%;
        height: 100%;
    }

    #adminLoginForm {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    #adminLoginLogo {
        width: 100%;
        height: 31%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    #adminLoginLogo>img {
        width: 200px;
        height: 95px;
    }

    #adminLoginId {
        width: 100%;
        height: 22%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    #adminLoginPwd{
        width: 100%;
        height: 22%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    #adminLoginBtn{
        width: 100%;
        height: 25%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding-bottom: 20px;
    }

    .idPwd {
        width: 70%;
        height: 35%;
        border-radius: 50px;
        background-color: darkgray;
        color: black;
        font-size: 16px;
        font-weight: 900;
        text-align: center;
    }

    .idPwd:focus {
        background-color: white;
    }
    

    .idPwdText {
        width: 68%;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        font-size: 16px;
        padding-bottom: 10px;
    }

    input[type=submit] {
        width: 100px;
        height: 40px;
        border-radius: 50px;
        background-color: #48CA7D;
        color: white;
        font-size: 16px;
        font-weight: 900;
    }


</style>
</head>
<body>

	<div id="pageWrap">

        <div id="adminLoginDiv">
            <form action="<%=contextPath %>/admin/login" method="post">
                <div id="adminLoginForm">
                    <div id="adminLoginLogo" >
                        <img src="<%=contextPath%>/resources/img/200perlogo_pse.png" alt="">
                        
                    </div>
                    <div id="adminLoginId">
                        <div class="idPwdText">아이디 * </div>
                        <input type="text" class="idPwd" name="adminId">
                    </div>
                    <div id="adminLoginPwd">
                        <div class="idPwdText">비밀번호 * </div>
                        <input type="password" class="idPwd" name="adminPwd">
                    </div>

                    <div id="adminLoginBtn">
                        <input type="submit" value="로그인">
                    </div>
                </div>
            </form>
        </div>
        
    </div>
    
    <script>
	    $(function(){ 
	    	
	        <%if(alertMsg!=null){%>
    			alert('<%=alertMsg%>');
    		<%}%>
	       
            <%if(errorMsg!=null){%>
                alert('<%=errorMsg%>');
            <%}%>
	    });
		
		
    </script>

	

</body>
</html>