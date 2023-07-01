<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>부서별 사원관리 페이지</title>
<jsp:include page="/common/Head.jsp" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
</head>
<body>
	<jsp:include page="/common/Header.jsp" />
	<div class="flex">
		<jsp:include page="/common/asideNav.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
				<h2>영업부 부서별 사원 현황</h2>
				<h3>부서인원: ${countByDept}</h3>
				<div>
					<!-- 테이블 추가 이벤트 -->
					<div class="btn-wrapper" style="margin-bottom: 10px;">
						<!-- 테이블 버튼 구성 -->
						<div class="btn-wrapper" style="margin-bottom: 10px;">
							<button id="saveBtn" th:class="btnStyle"
								style="float: right; margin-left: 20px;">수정</button>
							<button id="registerBtn" class="transactionBtn"
								th:class="btnStyle" style="float: right;">등록</button>
							<button id="appendBtn" th:class="btnStyle" style="float: right;">추가</button>
						</div>
						<!-- Toast Grid Load -->
						<div id="grid"></div>
					</div>
				</div>
			</div>
		</div>

		<script type="text/javascript"
			src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
		<script type="text/javascript"
			src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
		<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
		<script>
		$(document).ready(async () => {
			  const gridLoad = async () => {
			    try {
			      const response = await fetch('/Team4_WebProject_2/admin/empManage/show.do?deptno=${deptno}');
			      const data = await response.json();

			      if (data.result) {
			        const contents = data.data.contents;
			        grid.resetData(contents);
			      } else {
			        console.error('Failed to load data:', data);
			      }
			    } catch (error) {
			      console.error('Error while loading data:', error);
			    }
			  };

			  await gridLoad();
			  
			const dataSource = {
				api: {
					readData: { url: '/Team4_WebProject_2/admin/empManage/show.do', method: 'GET', initParams: { deptno: ${deptno} } },
					createData: { url: '/Team4_WebProject_2/admin/empManage/createOk.do', method: 'POST', contentType: 'application/json' },
					modifyData: { url: '/Team4_WebProject_2/admin/empManage/updateOk.do', method: 'PUT', contentType: 'application/json' },
					deleteData: { url: '/Team4_WebProject_2/admin/empManage/deleteOk.do', method: 'DELETE' }
				}
			};

			const grid = new tui.Grid({
				el: document.getElementById("grid"),
				data: dataSource,
				scrollX: false,
				scrollY: false,
				minBodyHeight: 30,
				rowHeaders: ["rowNum"],
				pageOptions: {
					perPage: ${pagecount},
					page: ${cpage},
				},
				columns: [
					{
						header: "사원번호",
						name: "user_id"
					},
					{
						header: "사원이름",
						name: "ename"
					},
					{
						header: "직종",
						name: "job"
					},
					{
						header: "부서담당자",
						name: "dhead_name"
					}
				]
			});

			const appendBtn = document.getElementById('appendBtn');     // 그리드 추가 버튼
			const saveBtn = document.getElementById('saveBtn');         // 그리드 추가/저장 버튼
			const registerBtn = document.getElementById('registerBtn'); // 그리드 등록 버튼

			/**
			 * '추가' 버튼 수행 이벤트 등록
			 */
			appendBtn.addEventListener('click', () => {
				grid.prependRow(
					{
						"user_id": "",
						"ename": "",
						"userMail": "",
						"userAge": "",
						"userGender": "man",
						"userHobby": "H1"
					},
					{ focus: true }
				);
				grid.setPerPage(10); // 페이지당 10개씩 보여지고 페이지 새로고침을 수행합니다.
			});

			/**
			 * '저장' 버튼 수행 이벤트 등록 => 수정
			 */
			saveBtn.addEventListener('click', () => {
				transactionValidateMsg(grid, 'modify');
			});

			/**
			 * '등록' 버튼 수행 이벤트 등록 => 등록
			 * '추가' 버튼 이후에 저장하는 데이터
			 */
			registerBtn.addEventListener('click', () => {
				// 유효성 검증을 데이터를 반환 받습니다.
				transactionValidateMsg(grid, 'register');
			});

			/**
			 * [함수] dataSource 선언한 API 함수 호출이 발생할 경우 반환값을 리턴해주는 함수 입니다.
			 * @param ev
			 * @returns void
			 */
			const responseList = (ev) => {
				const { response } = ev.xhr;
				console.log(response);
				const responseObj = JSON.parse(response);
				const { result, data: { contents } } = responseObj;

				if (result) {
					console.log(typeof data);
					console.log(contents);

					if (contents.length === undefined) {
						if (contents.type === "insert") {
							alert("사용자 등록이 완료되었습니다.");
						}
						if (contents.type === "update") {
							alert("사용자 수정이 완료되었습니다.");
						}
					}
				} else {
					alert("해당 처리가 되지 않았습니다. 관리자에게 문의해주세요.");
				}

				console.log('result:', responseObj.result, "data:", responseObj.data);
			};

			grid.on('response', (ev) => responseList(ev));
		});
		</script>
	</div>
</body>
</html>
