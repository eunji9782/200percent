<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


    #proposalDetailOuter {
        display: flex;
        flex-wrap: wrap;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        width: 1500px;
        height: 4000px;
        margin-left: 50px;
    }

    #proposalDetail {
        height: 3750px;
        display: flex;
        flex-direction: column;
        width: 50%;
        border-radius: 10px;
    }

    #proposalBtns {
        width: 100%;
        height: 5%;
        display: flex;
        flex-direction: row;
        justify-content: flex-end;
        align-items: center;
    }

    #proposalBtns * {
        width: 80px;
        height: 30px;
        border-radius: 50px;
        border: 1px solid #C3B091;
        flex-wrap: wrap;
        text-align: center;
        margin: 5px;
    }

    #proposalInfo {
        width: 100%;
        height: 16%;
        display: flex;
        flex-direction: column;
    }

    #projectInfo {
        width: 100%;
        height: 27%;
        display: flex;
        flex-direction: column;
    }

    #projectMedia {
        width: 100%;
        height: 60%;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
    }

    .proposalInfoBar {
        width: 100%;
        height: 50px;
        border: 1px solid #C3B091;
        border-radius: 50px;
        background-color: #F9F5EA;
        font-weight: 700;
        color: black;
        display: flex;
        flex-direction: column;
        justify-content: center;
        padding-left: 30px;
    }

    #proposalInfoBox {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items : center;
    }

    .proposalInfoBox {
        width: 50%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    #projectInfoBox {
        width: 100%;
        height: 500px;
        display: flex;
        flex-direction: column;
        justify-content:flex-start;
        align-items: center;
    }
    


    .proposalInfo {
        width: 100%;
        height: 10%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .projectInfo {
        width: 100%;
        height: 14%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .projectExplain {
        width: 100%;
        height: auto;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
    }

    .justify-right {
        justify-content:flex-end;
        padding-right: 30px;
    }

    .justify-left {
        justify-content:flex-start;
        padding-left: 30px;
    }

    .mediaText {
        width: 100%;
        height: 80px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .mediaText {
        margin-top: 40px;
        height: 30px;
    }
    
    .mediaBox {
    	width : 100%
    	height : 100%
    	display : flex;
    	flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
    }

    .padding_bottom {
        padding-bottom: 10px;
    }


    

</style>
</head>
<body>
    
<%@ include file="/WEB-INF/views/common/adminLayout.jsp" %>

<content>
    <div id="proposalDetailOuter">
        <div id="proposalDetail">
            <div id="proposalBtns">
           <c:set var="voStatus" value="${adminProposalVo.status}" />
           <c:if test="${voStatus eq '접수' or voStatus eq '검토중'}">
                <select name="status" id="statusSelect" >
                   <option class="statusSelect" value="assessing">검토중</option>
                   <option class="statusSelect" value="return">반려</option>
                   <option class="statusSelect" value="approve">승인</option>
                </select>
                <input id="submit" class="button" type="button" value="수정완료">
           </c:if> 
            </div>
            <div id="proposalInfo">
                <div class="proposalInfoBar">1.제안서 정보</div>
                <div id="proposalInfoBox">
                    <div class="proposalInfoBox">
                        <div class="proposalInfo justify-right">제안서 번호 </div>
                        <div class="proposalInfo justify-right">제안 회원</div>
                        <div class="proposalInfo justify-right">프로젝트 카테고리</div>
                        <div class="proposalInfo justify-right">프로젝트 이름</div>
                        <div class="proposalInfo justify-right">접수날짜</div>
                        <div class="proposalInfo justify-right">처리상태</div>
                    </div>
                    <div class="proposalInfoBox">
                        <div id= "proposalNoBox" class="proposalInfo justify-left">${adminProposalVo.no}</div>
                        <div class="proposalInfo justify-left">${adminProposalVo.nick}</div>
                        <div class="proposalInfo justify-left">${adminProposalVo.categoryName}</div>
                        <div class="proposalInfo justify-left">${adminProposalVo.name}</div>
                        <div class="proposalInfo justify-left">${adminProposalVo.registerDate}</div>
                        <div id="proposalStatusBox" class="proposalInfo justify-left">${adminProposalVo.status}</div>
                    </div>
                </div>
            </div>
            <div id="projectInfo">
                <div class="proposalInfoBar">2.프로젝트 정보</div>
                <div id="projectInfoBox">
                    <div class="proposalInfoBox">
                        <div class="projectInfo ">프로젝트 일자 </div>
                        <div class="projectInfo padding_bottom">${adminProposalVo.startDate} ~ ${adminProposalVo.endDate} </div>
                        <div class="projectInfo ">프로젝트 목표금액</div>
                        <div class="projectInfo padding_bottom">${adminProposalVo.goal}</div>
                        <div class="projectInfo ">배송일</div>
                        <div class="projectInfo padding_bottom">${adminProposalVo.shippingDate}</div>
                        <div class="projectInfo padding_bottom">설명</div>
                    </div>
                    <div class="projectExplain"> ${adminProposalVo.text} </div>
                </div>

            </div>
            <div id="projectMedia">
                <div class="proposalInfoBar">3.프로젝트 자료</div>
                <div class="mediaText">썸네일</div>
                <div class="mediaBox"><img src="<%=contextPath %>/resources/upload/${adminProposalVo.thumbnailName}>" alt="섬네일 이미지"></div>
                <div class="mediaText">상세 이미지/영상</div>
              <c:forEach items="${proposalAttachmentVoList}" var="item">
                <div class="mediaBox"><img src="<%=contextPath %>/resources/upload/${item.changeName}" alt="이미지 내용"></div>
           	  </c:forEach>
            </div>
        </div>
    </div>

</content>


	<script>
	
		$(document).ready(function(){
			$('#submit').click(function() {
				
				const value = $('#statusSelect').val();
				const no = ${adminProposalVo.no};
				const arr = {}
				
				$.ajax({
                	url : "<%=contextPath%>/admin/proposal/changeStatus" ,
                	type:"POST",
                	data : {
                		option : value,
                		no : no
                	},
                	success:function(result) {
                		$('#proposalStatusBox').text(result);
                	},
                	error:function(error) {
                		alert("삭제에 실패하였습니다.");
                	}
                });
			});
		});
		
	</script>

</body>
</html>