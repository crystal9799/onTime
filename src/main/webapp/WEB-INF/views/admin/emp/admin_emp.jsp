<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<div class="col-sm-8 col-md-6">
					<div id="grid"></div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
	<script>
      const grid = new tui.Grid({
        el: document.getElementById("grid"),
        data: {
          api: {
            readData: { url: "/api/readData", method: "GET" },
          },
        },
        scrollX: false,
        scrollY: false,
        minBodyHeight: 30,
        rowHeaders: ["rowNum"],
        pageOptions: {
          perPage: ${pagecount},
        },
        columns: [
          {
            header: "사원번호",
            name: "user_id",
          },
          {
            header: "사원이름",
            name: "ename",
          },
          {
            header: "직종",
            name: "job",
          },
          {
            header: "상사",
            name: "dhead_",
          },
        ],
      });
    </script>
</body>

</html>