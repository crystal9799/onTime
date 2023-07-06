<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}

{
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	font-family: sans-serif;
	-ms-overflow-style: none; 
	scrollbar-width: none;  
}

*::-webkit-scrollbar {
	display: none;
}

.board {
	width: 100%;
	height: 100vh;
	overflow: scroll;
	background-position: center;
	background-size: cover;
}

/* ---- FORM ---- */
#todo-form {
	padding: 32px 32px 0;
}

#todo-form input {
	padding: 12px;
	margin-right: 12px;
	width: 225px;
	border-radius: 4px;
	border: none;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background: white;
	font-size: 14px;
	outline: none;
}

#todo-form button {
	padding: 12px 32px;
	border-radius: 4px;
	border: none;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background: #ffffff;
	color: black;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
}

/* ---- BOARD ---- */
.lanes {
	display: flex;
	align-items: flex-start;
	justify-content: start;
	gap: 16px;
	/* 	padding: 24px 32px; */
	overflow: scroll;
	height: 100%;
}

.heading {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 15px;
	margin-left: 15px;
	margin-right: 10px;
	/*	text-align:center; */
}

/* #todo-curr{
background-color:#D8E3FF;}
 */
p {
	cursor: pointer;
}

#todo-prev {
	background-color: #E6E6F4;
}

#todo-curr {
	background-color: #C7C7E6;
}

#todo-next {
	background-color: #8988C9;
	color: #E6E6F4;
}

.modal-footer {
	border: none;
}
.btnClass{
	margin-bottom:10px;
}
#modalBtn {
	font: bold;
	font-size: 48px;
	color: #4b49ac;
		margin-right:5px;
}

#modalBtn:hover {
	font-size: 52px;
/* 	background-color:#E6E6F4;
	opacity:0.8; */
	border-radius: 10px;
	margin-right:5px;
}

#reBtn {
	margin-left: 3px;
	font: bold;
	font-size: 36px;
	color: #8988C9;
}

#reBtn:hover { 
	animation: rotate_image 2.5s linear infinite;transform-origin: 50% 50%;
}
@keyframes rotate_image{
    100% {
        transform: rotate(360deg);
    }
}
#delBtn {
	font: bold;
	font-size: 35px;
	color: #fff;
	margin-right: 12px;
	float: right;
}@keyframes shake {
  0% {
    transform: rotate(0deg)
    }
  25% {
      transform: rotate(-10deg);
    }
  50% {
      transform: rotate(10deg);
    }
  75% {
      transform: rotate(-10deg);
    }
  100% {
      transform: rotate(0deg);
    }
}

#delBtn:hover, #delBtn:active {
	font: bold;
	font-size: 35px;
	color: #fff;
	margin-right: 12px;
	float: right;
	 animation-name: shake;
  animation-duration: 1s;
}
#delBtn:visited {
	font: bold;
	font-size: 35px;
	color: #fff;
	margin-right: 12px;
	float: right;
	 animation-name: shake;
  animation-duration: 1s;
}

#saveBtn {
	font: bold;
	font-size: 35px;
	color: #4b49ac;
	margin-right: 60px;
	float: right;        position: relative;
        animation: fadeInDown 1s;
}
#saveBtn:hover {
	font: bold;
	font-size: 40px;
	color: #8988C9;
	margin-right: 60px;
	float: right; position: relative;
        animation: fadeInDown 1s;

}  

.jbBox {
	padding: 20px;
	color: #fff;
	background-color: #4B49AC;
}
.swim-lane p:visited {
	padding: 20px;
	color: #fff;
	background-color: #4B49AC;
}
 

 .swim-lane p:hover {
	padding: 20px;
	color: #fff;
	background-color: #4B49AC;
}

.swim-lane p:active {
	padding: 30px;
	color: #fff;
	background-color: #4B49AC;
} 

.swim-lane p {
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	border-radius: 1px;
	padding: 20px;
	background-color: #F5F7FF;
	min-height: 70px;
	/* 	text-align : center; */
	font-size: 15px;
	color: #4B49AC; border-radius : 10px;
	text-align: left;
	border-radius: 10px;	position: relative;
        animation: fadeInDown 0.6s;
}

.swim-lane {
	background-color: white;
	padding: 45px 20px 20px 20px;
	display: flex;
	flex-direction: column;
	gap: 1px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	/*	border: 1px solid #4b49ac;*/
	border-radius: 4px;
	width: 280px;
	min-height: 570px;
	flex-shrink: 0;
	color: #4b49ac;
}

.pro {
	padding: 40px 20px 20px 20px;
	display: flex;
	flex-direction: column;
	gap: 12px;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background-color: #4B49AC;
	border-radius: 10px;
		width: 500px;
/* 		maigin-right:10px; */
	/*width: 100%;*/
	max-width: 700px;
	min-height: 520px;
	flex-shrink: 0;
	color: #fff;	
	line-height:50px;
}

#pap, #psp{
	font: bold;
		font-size: 20px;
			border-radius: 10px;
			min-height: 400px;
}

#psp{
/* height: 100%; */
}

.p-inner {
	padding: 55px 40px 10px 50px;
	background: white;
	opacity:0.8;
	color: black;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
	width: 600x;
/*	min-height: 430px;*/
	height: 70%;
	line-height:30px;	
	position: relative;
     animation: fadeInDown 0.5s;
}  @keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, -100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
.p-inner p{
	margin-top:10px;
	margin-left:20px;
	line-height:40px;
	font-size: 15px;
}
#addBtn {
	background-color: #4b49ac;
	border: none;
}

#closeBtn {
	background-color: #fff;
}

.task {
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	border-radius: 1px;
	background-color: #F5F7FF;
	min-height: 70px;
	/* 	text-align : center; */
	font-size: 15px;
	border-radius: 10px;
	text-align: left;
}

/* #task {
	background: white;
	color: black;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.15);
	padding: 12px 12px 12px 12px;
	border-radius: 4px;
	font-size: 50px;
	cursor: move;
} */


.is-dragging {
	scale: 1.05;
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.25);
	background: rgb(50, 50, 50);
	color: white;
}

.modal {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	display: none;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal.show {
	display: block;
}
/* .modalBtn {
font-size:30px;
	color:#4b49ac;
}
 */
.modal_body {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 400px;
	height: 600px;
	padding: 40px;
	text-align: center;
	background-color: rgb(255, 255, 255);
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	transform: translateX(-50%) translateY(-50%);
}


@import url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css");
 

.fa fa-trash {
  display: flex;
  justify-content: center;
  align-items: center;
    
  margin-right: 2rem;
    
  font-size: 1.4rem;
  font-weight: bold;
}
</style>