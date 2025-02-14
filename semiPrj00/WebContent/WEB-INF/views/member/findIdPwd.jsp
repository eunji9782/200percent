<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = (String)request.getAttribute("result");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #box{height: 150px;width: 1920px;}
    #outer{
        /* border: 1px solid blue; */
        width: 700px;
        height: 800px;
        margin: 0 auto;
    }
    #find-id-pwd-div{
        /* border: 1px solid red; */
        margin: 0 auto;
        width: 600px;
        height: 300px;
        margin: 0 auto;
        margin-top: 20px;
        padding-top: 60px;
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 10px;
    }
   
    #find-id-form{
        width: 400px;
        height: 250px;
        /* border: 1px solid gray; */
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 10px;
        margin: 0 auto;
        margin-top: 45px;
    }

    .find-ul{
        position: relative;
        bottom: -26px;
        right:-60px;
    }
    .find-li{
        list-style: none;
        line-height: 27px;
        font-size: 20px;
        height: 28px;
        margin-bottom: 10px;
    }
    input{
        border: 0px;
        border-bottom: 2px solid darkgray;
    }
    h1{text-align: center;}
    
    #submit{
        position: relative;
        right: -50px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 35px;
        color: white;
        font-weight: 50px;
    }
    #submit_pwd{
        position: relative;
        right: -75px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 35px;
        width: 60px;
        color: white;
        font-weight: 50px;
    }
    #check_pwd{
        position: relative;
        right: -75px;
        background-color: #48ca7d;
        border: 0px;
        border-radius: 8px;
        height: 35px;
        width: 60px;
    }
    #find{
        text-align: center;
        font-size: 20px;
        color: red;
    }
    #modal_btn{
        width: 140px;
        height: 140px;
        font-size: 23px;
        margin-right: -40px; 
        color: white;

    }
    #modal_btn_pwd{
        width: 140px;
        height: 140px;
        font-size: 23px;
        margin-left: -40px;
        color: white;
    }
    .modal_wrap{
        display: none;
        width: 700px;
        height: 500px;
        position: absolute;
        top: 18%;
        /* left: 50%; */
        border-radius: 10px;
        background: #F9F5EA;
        z-index: 2;
    }
    .back {
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5);
        top: 0;
        left: 0;
        z-index: 1;
    }
    .modal_close {
        width: 26px;
        height: 26px;
        position: absolute;
        bottom: 30px;
        right: 50px;
        border-radius: 50px;
        color: white;
    }
    .modal_close_pwd {
        width: 26px;
        height: 26px;
        position: absolute;
        bottom: 30px;
        right: 50px;
        color: white;
    }
    .back_pwd {
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 800px;
        background-color: rgba(0,0,0,0.5);
        top: 0;
        left: 0;
        z-index: 1;
    }
    .modal_wrap_pwd{
        display: none;
        width: 700px;
        height: 600px;
        position: absolute;
        top: 18%;
        /* top: 50%;
        left: 50%; */
        
        background: #F9F5EA;
        z-index: 2;
    }
   
    #find-pwd-form{
        width: 400px;
        height: 450px;
        /* border: 1px solid gray; */
        background-color: rgba(255, 255, 255, 0.675);
        border-radius: 10px;
        margin: 0 auto;
        margin-top: 20px;
    }
    #btn_div{
        float: right;
        margin-top: 60px;
    }
    #btn_div button{
        border: 0px;
    }
    .after_check{
        display: none;
    }
    #btn_div a{
        text-decoration: none;
        color:black;
        font-size: 18px;
    }
    #btn_div a:hover{
        color: #48ca7d;
    }
    input[type=password]{
	font-family:"Nanum Gothic", sans-serif !important;
        }
</style>
<head>
    <meta charset="UTF-8">
   
    <title>아이디/비밀번호 찾기</title>
</head>
<body>
   <%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
   
   <main>
    <div id="box"></div>
     <div id="outer">
        <h1>아이디 / 비밀번호 찾기</h1>
        <div id="find-id-pwd-div">
            <div id="btn-div">
                <button id="modal_btn" style="border-radius:50%;">아이디 <br> 찾기</button>
                <div class="back"></div>
                <div class="modal_wrap">
                    <div>
                        <br> <h1>아이디 찾기</h1>
                        <form action="<%=contextPath %>/member/findId" method="post" id="find-id-form">
                            <ul class="find-ul">
                                <li class="find-li">이름</li>
                                <li class="find-li"><input type="text" name="memberName" id="memberName"  required></li>
                                <li class="find-li">전화번호</li>
                                <li class="find-li"><input type="phone" name="memberPhone" id="memberPhone" required></li>
                                <br><li class="find-li"><input type="button" value="아이디찾기" id="submit" onclick="findId();"></li>
                            </ul>
                        </form>   
                        <div id="find"><br><span id="checked1"></span></div>
                    </div>
                    <div class="modal_close"><button style="color:white;">close</button></div>
                </div>

                <button id="modal_btn_pwd"style="border-radius:50%;">비밀번호 <br> 찾기</button>
                <div class="back_pwd"></div>
                <div class="modal_wrap_pwd">
                    <div class="modal_close_pwd"><button style="color:white;">close</button></div>
                    <div>
                        <br> <h1>비밀번호 찾기/변경</h1>
                        <form action="<%=contextPath %>/member/findPwd" method="post" id="find-pwd-form">
                            <ul class="find-ul">
                                <li class="find-li">E-mail</li>
                                <li class="find-li"><input type="text" id="memberEmail" name="memberEmail" required></li>
                                <li class="find-li">전화번호</li>
                                <li class="find-li">
                                <input type="phone" id="phone" name="memberPhone" required>
        						<button onclick="findPwd();" style='color:white;'>인증</button>
                                </li>
                				<br>
                                <li class="find-li">새 비밀번호</li>
                                <li class="find-li"><input type="password" name="memberNewPwd" required></li>
                                <li class="find-li">비밀번호 재확인</li>
                                <li class="find-li"><input type="password" name="memberNewPwd2" required></li>
                                <br><li class="find-li"><input type="submit" value="변경하기" id="submit_pwd" disabled style="width:85px;"></li>
                                </div>
                            </ul>
                        </form>
                    </div>
                </div>
                <div id="btn_div"><a href="<%=contextPath %>/member/join" class="under-btn">회원가입 |</a><a href="<%=contextPath %>/member/login"class="under-btn">&nbsp;로그인&nbsp;</a></div>
            </div>
            
            
        </div>
        
    </div>submit_pwd
    </main>
    <!-- 모달창 -->
   <script>
    window.onload=function(){
        function onClick(){
            document.querySelector('.modal_wrap').style.display='block';
            document.querySelector('.back').style.display='block';
        }
        function offClick(){
            document.querySelector('.modal_wrap').style.display='none';
            document.querySelector('.back').style.display='none';
        }

        document.getElementById('modal_btn').addEventListener('click',onClick);
        document.querySelector('.modal_close').addEventListener('click',offClick);

        function onClick2(){
            document.querySelector('.modal_wrap_pwd').style.display='block';
            document.querySelector('.back_pwd').style.display='block';
        }
        function offClick2(){
            document.querySelector('.modal_wrap_pwd').style.display='none';
            document.querySelector('.back_pwd').style.display='none';
        }

        document.getElementById('modal_btn_pwd').addEventListener('click',onClick2);
        document.querySelector('.modal_close_pwd').addEventListener('click',offClick2);
   
    }
   </script>
   <!-- 아이디찾기ajax -->
	<script>
  		function findId(){
  			const name = $('#memberName').val();
  			const phone = $('#memberPhone').val();
  			
  			console.log(name);
  			$.ajax({
  				url : "<%=contextPath %>/member/findId",
  				type : "POST",
  				data : {
  					memberName : name,
  					memberPhone : phone
  					},
  				dataType : 'text',
  				success : function(result){
  					if(result == ""){
  						document.getElementById('checked1').innerHTML = "일치하는 정보가 없습니다.";
  						document.getElementById('checked1').style.color = "#48CA7D";
  					}else{
  						document.getElementById('checked1').innerHTML = result;
  						document.getElementById('checked1').style.color = "red";
  					}
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
  			
  			})
  			
  		}
  	</script>
  	<!-- 비밀번호 찾기ajax -->
  	<script>
  		function findPwd(){
  			const email = $('#memberEmail').val();
  			const phone = $('#phone').val();
  			
  			console.log(email);
  			$.ajax({
  				url : "<%=contextPath %>/member/findPwd",
  				type : "GET",
  				data : {
  					memberEmail : email,
  					memberPhone : phone
  					},
  				dataType : 'text',
  				success : function(result){
  					if(result == 1){
  						console.log(result);
  						alert('변경할 비밀번호를 입력해주세요!');
  						$('#submit_pwd').attr("disabled",false);
  					}else{
  						console.log(result);
  						alert('일치하는 정보가 없습니다.');
  						return;
  					}
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
  			
  			})
  			
  		}
  	</script>
</body>
</html>