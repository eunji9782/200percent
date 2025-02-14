<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
       
        #box{height: 150px;width: 1920px;}
        #join{
            /* border: 2px solid blue; */
            width: 700px;
            height: 800px;
            margin: 0 auto;
        }
        #join-h1{
            text-align: center;
        }
        #content{
        border: 1px solid black;
        width: 500px;
        height: 200px;
        overflow: scroll;
        margin: 0 auto;
        }
        #check{
        position: relative;
        text-align: center;
        bottom: -10px;
        }
        #form{
            /* border: 1px solid red; */
            width: 500px; height: 630px;
            margin: 0 auto;
            font-size: 20px;
            background-color: rgba(255, 255, 255, 0.675);
            margin-top: 20px;
            border-radius: 10px;
        }
        .join-li{
        list-style-type: none;
        line-height: 28px;
        margin-bottom: 20px;
    
       }
       #form-ul{
        padding: 0px;
        padding-left: 120px;
       }
       input{
        width: 250px;
        background-color: white;
       }
       #pre{
        width: 60px;
        float: left;
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        margin-left: 5px;
        color: white;
        font-size: 18px;
       }
       #next{
        width: 60px;
        float: right;
        border: 0px solid gray ;
        border-radius: 50px;
        background-color: #48CA7D;
        margin-right: 5px;
        color: white;
        font-size: 18px;
       }
       ::placeholder{
        font-size: 15px;
       } 
        #check-btn{
        width: 80px;
        border: 1px solid lightgray;
        font-size: medium;
        border-radius: 50px;
        }
      
      .img-join{
        width: 70px;
        height: 70px;
  
        margin-left: 75px;
        margin-bottom: -50px;
        /* left: 80px;
        bottom: -27px; */
      }
      .modal-div{
        display: none;
      }
	
		#checked{
		font-size: 15px;
		}
      @import url("//fonts.googleapis.com/earlyaccess/nanumgothic.css" );
    input[type=password]{
	font-family:"Nanum Gothic", sans-serif !important;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/userHeader.jsp" %>
		
	
    <main>
        <div id="box"></div>
        <div id="join">
            <div class="img-join">
                <img src="<%=contextPath%>/resources/img/join2.png" alt="" class="img-join">
            </div>
            <div id="join-h1"><h1>회원 정보 입력</h1></div>
           
            <div id="form">
                <form action="<%=contextPath%>/member/join2" method="post">
                   <ul id="form-ul">
                    <br>
                    <li class="join-li">*E-mail <br>
                    <input type="email" name="memberEmail" id="email" placeholder="중복확인을 해주세요." required readonly>
                     <button id="check-btn" onclick="emailCheck()">중복확인</button></li>
                    <li class="join-li">
                        *비밀번호 <br><input type="password" name="memberPwd" id="pwd" required>
                        <div id="pwd-size" style="color: red; font-size:15px; position: absolute;">4자리 이상 입력하세요.</div>
                    </li>
                    <li class="join-li" >
                        *비밀번호 확인<br><input type="password" name="memberPwd2" id="pwd2" required>
                        <div id="danger" style="color: red; font-size:15px; position: absolute;">비밀번호와 일치하지않습니다.</div><div id="success" style="color: #48CA7D; font-size:15px; position: absolute;">비밀번호와 일치합니다!</div>
                    </li>
                    <li class="join-li">*이름 (법인 : 대표명)<br><input type="text" name="memberName" required></li>
                    <li class="join-li">*닉네임<br><input type="text" id="id" name="memberNick" required onfocusout="test();"> <br><span id="checked"></span> </li>
                    <li class="join-li">*연락처<br><input type="text" name="memberPhone" required placeholder="-제외 입력"></li>
                    <li class="join-li">
                    추천코드<br><input type="text" name="code" id="code">
                    	<div id="danger1" style="color: red; font-size:15px; position: absolute;">존재하지않는 추천코드입니다.</div><div id="success1" style="color: #48CA7D; font-size:15px; position: absolute;">추천코드가 확인되었습니다!</div>
                    </li>
                    
                   
                   
                   </ul>
                   <br><input type="button" value="이전" id="pre" onclick="history.go(-1)"><input type="submit" value="다음" id="next">
                </form>
               
            </div>
            
        </div>

    </main>
    <!-- 추천코드 일치 확인 -->
    <script>
    $(function(){
        $("#success1").hide();
        $("#danger1").hide();
        $("#code").blur(function(){
            var code=$('#code').val();
            
            if(code == "북극곰아 미안해"){
            	$('#danger1').hide();
                $("#success1").show();
            }else{
            	if(code == ''){
            		//아무것도 없음
            		$('#code').value=null;
                	$("#success1").hide();
                    $('#danger1').hide();
            	}else{
            		//이상한 코드 들어옴
            		$('#code').value=null;
                	$("#success1").hide();
                    $('#danger1').show();
            	}
            }
            
            
            
        })

    })
    </script>
    <!-- 이메일 중복검사 -->
    <script>
    	function emailCheck(){
    		var openWin = window.open("<%=contextPath %>/member/emailCheck","none","width=200px, heignt=150px,resizable = no, scrollbars = no");
    	}
    	function setChildValue(email){
    		document.getElementById("email").value=email;
    	}
    </script>
    
    
  <script>
  		function test(){
  			const temp = $('#id').val();
  			
  			console.log(temp);
  			$.ajax({
  				url : "<%=contextPath %>/idCheck",
  				type : "POST",
  				data : {userId : temp},
  				dataType : 'text',
  				success : function(result){
  					if(result == 0){
  						document.getElementById('checked').innerHTML = "사용가능한 닉네임입니다.";
  						document.getElementById('checked').style.color = "#48CA7D";
  					}else{
  						document.getElementById('checked').innerHTML = "이미 사용 중인 닉네임입니다.";
  						document.getElementById('checked').style.color = "red";
  						
  						$('#next').attr("disabled","disabled");
  					}
  				},
  				error : function(){
  					alert("서버요청실패..");
  				}
  			
  			})
  			
  		}
  	</script>
    <script>
    
        $(function(){
            $("#success").hide();
            $("#danger").hide();
            $("input").keyup(function(){
                var pwd=$('#pwd').val();
                var pwd2=$('#pwd2').val();
                if(pwd != "" && pwd2 != ""){
                    if(pwd != pwd2){
                        $("#success").hide();
                        $('#danger').show();
                        $('#next').attr("disabled","disabled");
                    }else{
                        $('#danger').hide();
                        $("#success").show();
                        $('#next').removeAttr("disabled");
                    }
                }
                if(pwd.length < 4){
                    $("#pwd-size").show();
                }else{
                    $("#pwd-size").hide();
                }
            })

        })

    </script>

</body>
	
</html>