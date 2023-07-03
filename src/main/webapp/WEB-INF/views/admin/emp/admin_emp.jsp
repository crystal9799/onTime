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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
	crossorigin="anonymous"></script>
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
							<button id="saveBtn" class="btnStyle"
								style="float: right; margin-left: 20px;">수정</button>
							<button id="appendBtn" class="btnStyle" data-bs-toggle="modal"
								data-bs-target="#exampleModal" style="float: right;">추가</button>
							<button id="deleteBtn" class="btnStyle" style="float: right;">삭제</button>
						</div>
						<!-- Toast Grid Load -->
						<div id="grid"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title fs-5">사원생성</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form>
							<div class="form-group">
								<label for="enameInput">사원이름</label> <input type="text"
									class="form-control" id="enameInput">
							</div>
							<div class="form-group">
								<label for="passwordInput">비밀번호:</label> <input type="text"
									class="form-control" id="passwordInput">
							</div>
							<div class="form-group">
								<label for="passwordConfirmInput">비밀번호 확인:</label> <input
									type="text" class="form-control" id="passwordConfirmInput">
							</div>
							<div class="form-group">
								<label for="jobInput">직종:</label> <input type="text"
									class="form-control" id="jobInput">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" id="confirmBtn" class="btn btn-primary">생성</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">취소</button>
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
			const dataSource = {
					api: {
						readData: { url: '/Team4_WebProject_2/admin/empManage/show.do', method: 'GET', initParams: { deptno: ${deptno} } },
						createData: { url: '/Team4_WebProject_2/admin/empManage/createOk.do', method: 'POST', contentType: 'application/json' },
						updateData: { url: '/Team4_WebProject_2/admin/empManage/updateOk.do', method: 'PUT', contentType: 'application/json' },
						deleteData: { url: '/Team4_WebProject_2/admin/empManage/deleteOk.do', method: 'DELETE', contentType: 'application/json' }
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
					rowHeaders: ['checkbox'],
					header: ['center'],
					columns: [
						{
							header: "사원번호",
							name: "user_id",
							width: 15,
							align: 'center'
						},
						{
							header: "사원이름",
							name: "ename",
							editor: 'text',
							align: 'center'
						},
						{
							header: "직종",
							name: "job",
							editor: 'text',
							align: 'center'
						},
						{
							header: "부서담당자",
							name: "dhead_name",
							align: 'center'
						}
					],
				      contextMenu: ({ rowKey, columnName }) => (
				    	        [
				    	          [
				    	            {
				    	              name: 'export',
				    	              label: 'Export',
				    	              subMenu: [
				    	                {
				    	                  name: 'default',
				    	                  label: 'Default',
				    	                  subMenu: [
				    	                    {
				    	                      name: 'csvExport',
				    	                      label: 'CSV export',
				    	                      action: () => {
				    	                        grid.export('csv');
				    	                      }
				    	                    },
				    	                    {
				    	                      name: 'excelExport',
				    	                      label: 'Excel export',
				    	                      action: () => {
				    	                        grid.export('xlsx');
				    	                      }
				    	                    },
				    	                  ]
				    	                },
				    	                {
				    	                  name: 'includeHeader',
				    	                  label: 'includeHeader: false',
				    	                  subMenu: [
				    	                    {
				    	                      name: 'csvExport',
				    	                      label: 'CSV export',
				    	                      action: () => {
				    	                        grid.export('csv', { includeHeader: false });
				    	                      }
				    	                    },
				    	                    {
				    	                      name: 'excelExport',
				    	                      label: 'Excel export',
				    	                      action: () => {
				    	                        grid.export('xlsx', { includeHeader: false });
				    	                      }
				    	                    },
				    	                  ]
				    	                },
				    	                {
				    	                  name: 'colunmNames',
				    	                  label: `['name', 'artist']`,
				    	                  subMenu: [
				    	                    {
				    	                      name: 'csvExport',
				    	                      label: 'CSV export',
				    	                      action: () => {
				    	                        grid.export('csv', { columnNames: ['name', 'artist'] });
				    	                      }
				    	                    },
				    	                    {
				    	                      name: 'excelExport',
				    	                      label: 'Excel export',
				    	                      action: () => {
				    	                        grid.export('xlsx', { columnNames: ['name', 'artist'] });
				    	                      }
				    	                    },
				    	                  ]
				    	                },
				    	                {
				    	                  name: 'onlySelected',
				    	                  label: 'onlySelected: true',
				    	                  subMenu: [
				    	                    {
				    	                      name: 'csvExport',
				    	                      label: 'CSV export',
				    	                      action: () => {
				    	                        grid.export('csv', { onlySelected: true });
				    	                      }
				    	                    },
				    	                    {
				    	                      name: 'excelExport',
				    	                      label: 'Excel export',
				    	                      action: () => {
				    	                        grid.export('xlsx', { onlySelected: true });
				    	                      }
				    	                    },
				    	                  ]
				    	                },
				    	              ],
				    	            }
				    	          ],
				    	        ]
				    	      ),
				});
				<!-- 테마 적용 -->
				var Grid = tui.Grid;

				Grid.applyTheme(
						'striped',
						{
							grid: {
						        border: '#aaa',
						        text: '#333'
						    },
						    cell: {
						        disabled: {
						            text: '#999'
						        },
						        focused: {
						        	background: '#FF5733'
						        }
						    }
						});
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

			const appendBtn = document.getElementById('appendBtn');     // 그리드 추가 버튼
			const saveBtn = document.getElementById('saveBtn');         // 그리드 추가/저장 버튼
			const registerBtn = document.getElementById('registerBtn'); // 그리드 등록 버튼

			/**
			 * '추가' 버튼 수행 이벤트 등록
			 */
			 const modal = document.getElementById('exampleModal');
			 const confirmBtn = document.getElementById('confirmBtn');
			 const enameInput = document.getElementById('enameInput');
			 const passwordInput = document.getElementById('passwordInput');
			 const jobInput = document.getElementById('jobInput');
			 
			appendBtn.addEventListener('click', async() => {
				console.log("모달창 실행");
				modal.style.display = 'block';
			});
			
			confirmBtn.addEventListener('click', () => {
				  // Get the input values from the form
				  const ename = enameInput.value;
				  const password = passwordInput.value;
				  const job = jobInput.value;

				  // Close the modal
				  modal.style.display = 'none';

				  // Reset the input values
				  enameInput.value = '';
				  passwordInput.value = '';
				  jobInput.value = '';

				  
				  // Create an object to store the form data
				  const data = {
				    ename: ename,
				    password: password,
				    job: job
				  };
				  // Send a request to create a new row
				  fetch('/Team4_WebProject_2/admin/empManage/createOk.do?deptno='+${deptno}, {
					    method: 'POST',
					    headers: {
					      'Content-Type': 'application/json'
					    },
					    body: JSON.stringify(data)
					  })
					    .then(response => response.json())
					    .then(responseObj => {
					      // Handle the response from the server
					      console.log('result: ', responseObj.result);
					      console.log('message: ', responseObj.message);
					      if (responseObj.data === "insert") {
								alert("사용자 등록이 완료되었습니다.");
							}
					      location.reload();
					      
					    })
					    .catch(error => {
					      // Handle any errors that occur during the request
					      console.error('Error:', error);
					    });

				});
			
			// Close the modal when the user clicks outside of it
			window.addEventListener('click', (event) => {
			  if (event.target === modal) {
			    modal.style.display = 'none';
			  }
			});

			/**
			 * '저장' 버튼 수행 이벤트 등록 => 수정
			 */
			 saveBtn.addEventListener('click', async () => {
				 	console.log("수정이벤트실행");
				 	const { rowKey, columnName } = grid.getFocusedCell();
				 	if (rowKey && columnName) {
				 	    grid.finishEditing(rowKey, columnName);
				 	  }
				 	
				 	const updateResult = grid.request('updateData');
				 	console.log(updateResult);
				 	grid.on('response', ev => {
				 		  const {response} = ev.xhr;
				 		  const responseObj = JSON.parse(response);

				 		  console.log('result : ', responseObj.result);
				 		  console.log('data : ', responseObj.data);
				 		});
				    });
			/**
			 * '삭제' 버튼 수행 이벤트 등록 => 삭제
			 * 동시에 여러명 삭제 가능
			 */
			 deleteBtn.addEventListener('click', async () => {
				 	console.log("삭제이벤트실행");
				 	const checkedData = grid.getCheckedRows();
				 	console.log(checkedData);
				 	
				    // user_id만 추출하여 data 배열에 담기
				 	/* const data = jsonData.map(item => item.user_id); */
				 	fetch('/Team4_WebProject_2/admin/empManage/deleteOk.do', {
				 	  method: 'POST',
				 	  headers: {
				 	    'Content-Type': 'application/json'
				 	  },
				 	  // data 배열을 매개변수로 보내기
				 	  body: JSON.stringify(checkedData)
				 	})
				 	.then(response => response.json())
				 	.then(responseObj => {
				 		console.log('result: ', responseObj.result);
					    console.log('message: ', responseObj.message);
				 	 if (responseObj.data === "delete") {
							alert("사용자 삭제가 완료되었습니다.");
						}
				      location.reload();
				 	})
				 	.catch(error => {
				 	  console.error('Error:', error);
				 	});
 });

			/**
			 * [함수] dataSource 선언한 API 함수 호출이 발생할 경우 반환값을 리턴해주는 함수 입니다.
			 * @param ev
			 * @returns void
			 */
			const responseList = (ev) => {
				const { response } = ev.xhr;
				console.log(response);
				/* console.log(contents.type +"이벤트실행"); */
				const responseObj = JSON.parse(response);
				const { result, data: { contents } } = responseObj;
				
				if (result) {
					console.log(typeof data);
					console.log(contents);

						if (responseObj.data === "insert") {
							alert("사용자 등록이 완료되었습니다.");
						}
						if (responseObj.data === "update") {
							alert("사용자 수정이 완료되었습니다.");
						}
						if (responseObj.data === "delete") {
							alert("사용자 삭제가 완료되었습니다.");
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