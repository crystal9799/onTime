<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	  window.onload = function(){
		  console.log('load');

          $(document).on("click","#moveBtn",function(event){
              alert($(this).text());
          });
 
		/* kanban list dynamic load */
		getBoardAllList();
		
		/*local storage 처리 */
		
		var iv;
		var i;
		
        $( 'p' ).click( function() {
            $( this ).toggleClass( 'jbBox' );
        	i=$(this).attr('id');
        	iv="#"+$(this).attr('id');
        	console.log('iv: '+iv);
        	console.log('i: '+i);
            
//            var i="#"+$(this).attr('id');
 //           var t=$(this).text();
//            var v="<br><button>삭제</button>";
 //           console.log(v);
 //           $(i).append(v);
  //          document.getElementById(i).append(v);
            
          });
		
        $("#delBtn").click( function() {
        	console.log('test');
        	console.log(iv);
        	console.log(i);
        	$(iv).remove();
        	
			$.ajax({
				url : "scheduleDel.ajax",
				type : "post",
  				data : {
					sched_num : i 
				}, 
				success : function(data) {
						console.log('del'); 
			    },
				error : function() {
					alert("error");
				}
			});
        });
        
        

	  };
      $("#addBtn").click( function() {
    	 console.log("addd test"); 
    	  
    	 $.ajax({
				url : "scheduleAdd.ajax",
				type : "post",
				data : {
					ename : $("select[id=nameList] option:selected").val(), // selected: 값 전달
					project_num : "2", // 클라이언트 값 전달
					sched_info : document.querySelector('#todo-input').value // 내용 태그 값 전달
				}, 
				success : function(data) {
						console.log('add'); 
			    }, 
				error : function() {
					alert("error");
				}  
			});
      });


	  const modal2 = document.querySelector('.modal_body');
      $("#modalClose").click( function() {
     		console.log('testbtn');
     		modal2.style.display = "none";
      });
/*       		$.ajax({
				url : "scheduleAdd.ajax",
				type : "post",
				data : {
					ename : $("select[id=nameList] option:selected").val(), // selected: 값 전달
					project_num : "2", // 클라이언트 값 전달
					sched_info : document.querySelector('#todo-input').value // 내용 태그 값 전달
				}, 
				success : function(data) {
						console.log('add'); 
			    },
				error : function() {
					alert("error");
				}
			});   */

/* ajax add */
 /*    	const addModalBtn = document.querySelector('.addModalBtn');
     addModalBtn.addEventListener('click', () => {
     	console.log('add modal Click!');

			$.ajax({
				url : "scheduleAdd.ajax",
				type : "post",
				data : {
					ename : $("select[id=nameList] option:selected").val(), // selected: 값 전달
					project_num : "2", // 클라이언트 값 전달
					sched_info : document.querySelector('#todo-input').value // 내용 태그 값 전달
				}, 
				success : function(data) {
						console.log('add'); 
			    },
				error : function() {
					alert("error");
				}
			});
     }); */
			
     
     
     
     
     
     
     
     
     
	  
/* 	  
	  $(".dj-tok .mem-list > li").click(function() {
			$(".mem-list > li").removeClass("active");
			$(this).addClass("active");
		})
	   */
	  
/* 	  function listJustSave(){
		  const divNode = document.getElementById("content");
		  console.log(divNode.innerText);
	  } */
 
	  
	  
	  /* refresh */
/* 	  const refreshBtn = document.querySelector('#refreshBtn');
	  refreshBtn.addEventListener('click', () => {
		  console.log('refresh Click!');
		  
	 
 
	});
	   */
 

	  
	  
	  /* kanban list dynamic create */
	  /* load list drag & drop event */
	  function getBoardAllList(){
			$.ajax({
				url: "allList.ajax",
				type: "GET", dataType:"json",
				success : function(data){
					$.each(data, function(index){
/* 						if(data[index].sched_prog==0){
					    	console.log(data[index].sched_info + ", "+data[index].sched_prog);
							$("#todo-prev").append
							('<p class="task" draggable="true">'+data[index].sched_info+'</p>');
							localStorage.setItem(data[index].sched_num, data[index].sched_info);
						}else if(data[index].sched_prog==1){
							$("#todo-curr").append
							('<p class="task" draggable="true">'+data[index].sched_info+'</p>');
							localStorage.setItem(data[index].sched_num, data[index].sched_info);
						}else{
							$("#todo-next").append
							('<p class="task" draggable="true">'+data[index].sched_info+'</p>');
							localStorage.setItem(data[index].sched_num, data[index].sched_info);
						} */
						
						const form = document.getElementById("todo-form");
						const input = document.getElementById("todo-input");
						const todoLane = document.getElementById("todo-prev");
						
						form.addEventListener("submit", (e) => {
						  e.preventDefault();
						  const value = input.value;
						
						  if (!value) return;
						
						  const newTask = document.createElement("p");
						  newTask.classList.add("task");
						  newTask.setAttribute("draggable", "true");
						  newTask.innerText = value;
						
						  newTask.addEventListener("dragstart", () => {
						    newTask.classList.add("is-dragging");
						  });
						
						  newTask.addEventListener("dragend", () => {
						    newTask.classList.remove("is-dragging");
						  });
						
						  todoLane.appendChild(newTask);
						
						  input.value = "";
						});
						
						const draggables = document.querySelectorAll(".task");
						const droppables = document.querySelectorAll(".swim-lane");
						
						draggables.forEach((task) => {
						  task.addEventListener("dragstart", () => {
						    task.classList.add("is-dragging");
						  });
						  task.addEventListener("dragend", () => {
						    task.classList.remove("is-dragging");
						  });
						});
						
						droppables.forEach((zone) => {
						  zone.addEventListener("dragover", (e) => {
						    e.preventDefault();
						
						    const bottomTask = insertAboveTask(zone, e.clientY);
						    const curTask = document.querySelector(".is-dragging");
						
						    if (!bottomTask) {
						      zone.appendChild(curTask);
						    } else {
						      zone.insertBefore(curTask, bottomTask);
						    }
						  });
						});
						
						const insertAboveTask = (zone, mouseY) => {
						  const els = zone.querySelectorAll(".task:not(.is-dragging)");
						
						  let closestTask = null;
						  let closestOffset = Number.NEGATIVE_INFINITY;
						
						  els.forEach((task) => {
						    const { top } = task.getBoundingClientRect();
						
						    const offset = mouseY - top;
						
						    if (offset < 0 && offset > closestOffset) {
						      closestOffset = offset;
						      closestTask = task;
						    }
						  });
						
						  return closestTask;
						};
					});
					//console.log(data); 
				},
				error :function(){
					alert("request error!");
				}
			}); 
			
//			listJustSave();
	  }
	  

		
		// String 형태로 변환

		
		////update ajax /////
      $(document).on("click","#saveBtn",function(){
//  		document.getElementById("1").innerText="바뀜";
    	  
		var prevList = new Array() ;
		const divNode = document.getElementById("todo-prev");
		for(let i=1; i<divNode.children.length; i++){
			// 객체 생성
			var data = new Object() ;
			data.sched_seq = i ;
			data.sched_info =  divNode.children[i].innerText;
			data.sched_num =  divNode.children[i].id;
			//console.log("data -- test ");
			//console.log(divNode.children[i]);
			//console.log(divNode.children[i].id);
			
//			data.sched_num =  divNode.children[i].innerText;
			// 리스트에 생성된 객체 삽입
			prevList.push(data) ;
		}
//		console.log(document.getElementById("1").innerText);
//		var jsonData = JSON.stringify(prevList) ;
		 $.ajax({
		        type: "POST",
		        //Array 형식의 데이터를 전송할 때는 traditional: true 옵션을 적용
		        traditional: true,
		        url: "scheduleUpdate.ajax",
		        //JSON.stringify를 통해 Javascript 객체를 JSON 문자열로 변환
		        data: {data : JSON.stringify(prevList)},
		        success: function (data) {
		            console.log("PREVLIST"+data);		        	
		        },
		        error: function () {
		            alert('오류 발생');
		        }
		    });
		 
			var currList = new Array() ;
			const divNode2 = document.getElementById("todo-curr");
			for(let i=1; i<divNode2.children.length; i++){
				// 객체 생성
				var data2 = new Object() ;
				data2.sched_seq = i ;
				data2.sched_info =  divNode2.children[i].innerText;
				data2.sched_num =  divNode2.children[i].id;
				//console.log("data -- test ");
				//console.log(divNode.children[i]);
				//console.log(divNode.children[i].id);
				
//				data.sched_num =  divNode.children[i].innerText;
				// 리스트에 생성된 객체 삽입
				currList.push(data2) ;
			}
//			console.log(document.getElementById("1").innerText);
//			var jsonData = JSON.stringify(prevList) ;
			 $.ajax({
			        type: "POST",
			        //Array 형식의 데이터를 전송할 때는 traditional: true 옵션을 적용
			        traditional: true,
			        url: "scheduleCurrUpdate.ajax",
			        //JSON.stringify를 통해 Javascript 객체를 JSON 문자열로 변환
			        data: {data : JSON.stringify(currList)},
			        success: function (data) {
			            console.log("currList"+data);		        	
			        },
			        error: function () {
			            alert('오류 발생');
			        }
			    });
			 
			 
				var nextList = new Array() ;
				const divNode3 = document.getElementById("todo-next");
				for(let i=1; i<divNode3.children.length; i++){
					// 객체 생성
					var data3 = new Object() ;
					data3.sched_seq = i ;
					data3.sched_info =  divNode3.children[i].innerText;
					data3.sched_num =  divNode3.children[i].id;
					//console.log("data -- test ");
					//console.log(divNode.children[i]);
					//console.log(divNode.children[i].id);
					
//					data.sched_num =  divNode.children[i].innerText;
					// 리스트에 생성된 객체 삽입
					nextList.push(data3) ;
				}
//				console.log(document.getElementById("1").innerText);
//				var jsonData = JSON.stringify(prevList) ;
				 $.ajax({
				        type: "POST",
				        //Array 형식의 데이터를 전송할 때는 traditional: true 옵션을 적용
				        traditional: true,
				        url: "scheduleNextUpdate.ajax",
				        //JSON.stringify를 통해 Javascript 객체를 JSON 문자열로 변환
				        data: {data : JSON.stringify(nextList)},
				        success: function (data) {
				            console.log("nextList"+data);		        	
				        },
				        error: function () {
				            alert('오류 발생');
				        }
				    });
		 <!-- 알림창 -->
			     	Swal.fire({
			     		  position: 'center',
			     		  icon: 'success',
			     		  title: 'Save Schedule',
			     		  showConfirmButton: false,
			     		  timer: 1500
			     		})
		 
	
      });	
		
		
/* 
		$.ajax({
			url : "scheduleUpdate.ajax",
			type : "post",
				data :   JSON.stringify(prevList), 
			success : function(data) {
					console.log('addtest'); 
		    },
			error : function() {
				alert("error");
			}
		});
		 */
/* 		 $.ajax({
			  url: "scheduleUpdate.ajax",
			  type: "POST",
			  dataType:"JSON",
			  traditional : true, //필수
			  data: {list : JSON.stringify(prevList)},
			  success: function(result){
			    alert("저장되었습니다.");
			    self.selectList();
			  },
			  error: function (error){
			  	alert('다시 시도하세요');
			  }
			});
/* 		 */
 

/* 	    
		 */
		
		
		
		
		
		
     
/* 		    $.ajax({
		        url : 'scheduleUpdate.ajax',
		        type: 'POST',
 				data: {"jsonData" : JSON.stringify(prevList)},
		        dataType:'json',
		        success: function(data) {
		            alert('리스트에 추가하였습니다.');
		        },
		        error: function(x, e) {
		            //err msg 출력
		            $.failMsg('error');
		        }
		    }); */
		    

/*       $(document).on("click","#saveBtn",function(){
		var prevList = new Array() ;
		const divNode = document.getElementById("todo-prev")
		for(let i=0; i<divNode.children.length; i++){
			// 객체 생성
			var data = new Object() ;
			data.sched_seq = i ;
			data.sched_info =  divNode.children[i].innerText;
			// 리스트에 생성된 객체 삽입
			prevList.push(data) ;
		}
 
		   $.ajax({
			     method: 'post',
			     url: 'scheduleUpdate.ajax',
			     traditional: true,
			     data: {
			       data: JSON.stringify(prevList)
			     },
			     dataType: 'json',
			     success: function (res) {
			        if (res.result) {
			          alert("완료 되었습니다");
			        }
			     }
		
		  }); 
      }); */
		// 
/*       $(document).on("click","#saveBtn",function(){
		var prevList = new Array() ;
		const divNode = document.getElementById("todo-prev")
		for(let i=0; i<divNode.children.length; i++){
			// 객체 생성
			var data = new Object() ;
			data.sched_seq = i ;
			data.sched_info =  divNode.children[i].innerText;
			// 리스트에 생성된 객체 삽입
			prevList.push(data) ;
		}
		var jsonData = JSON.stringify(prevList) ;
		console.log(prevList);
		console.log(jsonData);
 
		$.ajax({
			url : "scheduleUpdate.ajax",
			type: "POST", dataType:"json",
			success : function(jsonData) {
					console.log('add');  
		    },
			error : function() {
				alert("error");
			}
		});
		
		
	  });  */
      
      
/*       $(document).on("click","#saveBtn",function(){
    	  /* 		  var f= $("#todo-prev").attr('value');
    	  			  console.log(f); v
    	  			  const divNode = document.getElementById("todo-prev");
    	  			for(let i=0; i<divNode.children.length; i++){
    	  				console.log(i+": " +divNode.children[i].innerText	);
    	  				// i 가 seq, 0; prog
    	  			}

     	  			  console.log(divNode.children[0].innerText	);
    	  			  var tt=localStorage.getItem('2');
     		  const divNode = document.getElementById("todo-prev");
    	  			  console.log(divNode.innerText);
    	  			  
    	  			  var tt=localStorage.getItem('2');
    	  			  var t=localStorage.getItem("업무1");
    	  			  
    	  			  console.log("2:"+tt);  
    	  	  });  */
      
      
	  /* ename list dynamic create */
	  function getNameList(){
			$.ajax({
				url: "projectEnamelist.ajax",
				type: "GET", dataType:"json",
				success : function(data){
					console.log(data); 
					for(var i=0; i<data.length; i++){
						$("#nameList").append('<option id="'+data[i]+'" value="' + data[i] + '">' + data[i] + '</option');
					}
				},
				error :function(){
					alert("request error!");
				}
			}); 
	  }
	  
	  /* modal load */
      const body = document.querySelector('body');
      const modal = document.querySelector('.modal');
      const btnOpenPopup = document.querySelector('.modalBtn');

      btnOpenPopup.addEventListener('click', () => {
        modal.classList.toggle('show');
			getNameList();

        if (modal.classList.contains('show')) {
          body.style.overflow = 'hidden';
        }
      });

      modal.addEventListener('click', (event) => {
        if (event.target === modal) {
          modal.classList.toggle('show');

          if (!modal.classList.contains('show')) {
            body.style.overflow = 'auto';
          }
        }
      });

	  

		 
		 
		 

		 /*선택된 값 전달*/
		 /*클라이언트 값 ajax로 보내줌 매핑 필요*/
	  	function addSchedule(data){
	 	console.log("ready data send method: "+data);


			
	 	
		 }







		 

        
		 
		 /* ajax add */
/*       	const addModalBtn = document.querySelector('.addModalBtn');
       addModalBtn.addEventListener('click', () => {
       	console.log('add modal Click!');
       	let inputInfo=document.querySelector('#todo-input'); 
       	let en=$("select[id=nameList] option:selected").text();
  
       	console.log("info : "+inputInfo.value);   
       	console.log($("select[id=nameList] option:selected").text());  

       	
			$.ajax({
				url : "sheduleAdd.ajax",
				type : "post",
				data : {
					ename : en, // selected: 값 전달
					project_num : "28", // 클라이언트 값 전달
					sched_info : inputInfo.value // 내용 태그 값 전달
				},
				success : function(data) {
							console.log(data);
			    },
				error : function() {
					alert("error");
				}
			});
       	
       	
       	
       }); */
		 
		 
		 /* vo 객체 ajax 전달 방법 */
		 /* ajax add */
 /*       	const addModalBtn = document.querySelector('.addModalBtn');
        addModalBtn.addEventListener('click', () => {
        	console.log('add modal Click!');
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	const dataArray = {
        			sched_num: 1, sched_info: inputInfo.value,
        			sched_prog:0, sched_seq:3,
        			project_num:10
        			};
        		$.ajax({
        			url : "add.ajax",
        			type : 'POST',
        			data : JSON.stringify(dataArray),
        			contentType: 'application/json',
        			success : function(data) {
        				console.log("data: " + data);
        			}
        		});
        });
			 */
		 
		 
		

	/* select 동적 태그 생성 메소드 */
	function createSelectNameList(data){
		console.log('create selete ready');
		 
/* 		$.ajax({
		type : "GET",
		data : data,
		url : url,
		success : function(data){
			for(var i=0; i<data.length; i++){
				$("#nameList").append('<option value="' + data.data + '">' + data.data + '</option');
			}
		}
		}); */
	}
	  
	  
	 /* name list load*/
/*   	const enamelistBtn = document.querySelector('.enamelistBtn');
  	enamelistBtn.addEventListener('click', () => {
    	console.log(' enamelistBtn Click!');

		$.ajax({
			url: "projectemplist.ajax",
			type: "GET", dataType:"json",
			success : function(data){
		    	console.log("ajax sucess data: "+data);
		    	ajaxtest(data);
				},
			error :function(){
				alert("request error!");
				}
		}); 
    }); */
  	
  	/* foreach 로 돌면서 select 박스 생성 */
  	
  	
  	
 	/* insert ajax */
 	/* param 객체로 전달하기 */
 	/*scheduleBoard*/
	 	/* seleted:name data */
	 	/* boardInfo data */
 	/*schedule*/
	 	/* seleted:name data */
  	
	 	
	 	


 	
 	
/* 	 	var data = {};
	 	  data["user_id"] = "2";
	 	  data["project_num"] = "1";
	 	  data["sched_info"] = "업무내용";
	   
	  $.ajax({
	    type: "POST",
	    url : "goAjax5.do",
	    data : JSON.stringify(data),
	    dataType: "json",
	    contentType:"application/json;charset=UTF-8",
	    async: false,
	    success : function(data, status, xhr) {
	      console.log(data);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      alert("error= " + errorThrown);
	    }
	  }); */
 	
/*  	$.ajax({
 		url : "test.ajax",
 		type : "post",
 		dataType:"json",
 		data : {
 			user_id : "1",
 			project_num : "2",
 			sched_info : "업무내용"
 		},
 		success : function(data) {
 			console.log(data);
 	     },
 		error : function() {
 			alert("error");
 		}
 	}); */
/* 
 	$.ajax({
		url :'Url',
		type : 'post',
		dataType : 'json',
		data : {
			nickName : '닉네임',
		},
		success: function(data){
			console.log("성공");
		}
	});
 	 */
 	
/*  	const dataArray = {
 			"user_id" : "1",
 			"project_num" : "2",
 			"sched_info" : "업무내용"
			};
		$.ajax({
			url : "t.ajax",
			type : 'POST',
			data : JSON.stringify(dataArray),
			contentType: 'application/json',
			success : function(data) {
				console.log("data: " + data);
			}
		});
   */
 	  

 
/*  	
 	
    $.ajax({
		 type:"post",
		 url:"t.ajax",
		 dataType:"json", 
		 data:{
	 			user_id : "1",
	 			project_num : "2",
	 			sched_info : "업무내용"
		 },
		 success:function(data){
			alert("성공");
			 print(data)
		 },
		 error:function(request,status,error){
		     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		  }
	}); 
 	 
 	 
 	 
 	  */
 	 
 	 
 	 
 	 
 	  
  	
  	
  	
  	
  	
  	
  	
  	
		

        
        
        /* add just schedule ajax*/
/*       	const addModalBtn = document.querySelector('.addModalBtn');
        addModalBtn.addEventListener('click', () => {
        	console.log(' modal Click!');
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	const dataArray = {
        			sched_num: 1, sched_info: inputInfo.value,
        			sched_prog:0, sched_seq:3,
        			project_num:10
        			};
        		$.ajax({
        			url : "addt.ajax",
        			type : 'POST',
        			data : JSON.stringify(dataArray),
        			contentType: 'application/json',
        			success : function(data) {
        				console.log("data: " + data);
        			}
        		});
			
        	var memberId = $("#memberId").val();
        	var memberPass = $("#memberPass").val();
        	
        	var param = {
        			"sched_num": 1, "sched_info": 'test',
        			"sched_prog":0, "sched_seq":3,
        			"project_num":10}
/*         			"memberId":memberId, "memberPass":memberPass */
/*             console.log(param);
        	
        	$.ajax({
        		url : "addtest.ajax",
        		type : "post",
        		data : {
        			sched_num: 1, sched_info: 'test',
        			sched_prog:0, sched_seq:3,
        			project_num:10
        		},
        		success : function(data) {
        					console.log(data);
        	     },
        		error : function() {
        			alert("errorrrrr");
        		}
        	});
        }); 
        	*/ 
                
/*         	
        	let inputInfo=document.querySelector('#todo-input'); 
        	console.log(inputInfo.value);   
        	
    		const dataArray = {
			};
    		
    		$.ajax({
    			type : 'POST',
    			url : "add.ajax",
    			dataType:"json",
    			data :{    				
    				sched_num: 1, sched_info: 'test',
    				sched_prog:0, sched_seq:3,
    				project_num:10
    			},
    			data : JSON.stringify(dataArray),
   			 success:function(data){
 				alert("성공");
 				 print(data)
 			 },
 			 error:function(request,status,error){
 			     console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
 			 }
    		}); */
        	
 
/*  function Drag(){
    			const form = document.getElementById("todo-form");
    			const input = document.getElementById("todo-input");
    			const todoLane = document.getElementById("todo-prev");
    			
    			form.addEventListener("submit", (e) => {
    			  e.preventDefault();
    			  const value = input.value;
    			
    			  if (!value) return;
    			
    			  const newTask = document.createElement("p");
    			  newTask.classList.add("task");
    			  newTask.setAttribute("draggable", "true");
    			  newTask.innerText = value;
    			
    			  newTask.addEventListener("dragstart", () => {
    			    newTask.classList.add("is-dragging");
    			  });
    			
    			  newTask.addEventListener("dragend", () => {
    			    newTask.classList.remove("is-dragging");
    			  });
    			
    			  todoLane.appendChild(newTask);
    			
    			  input.value = "";
    			});
    			
    			const draggables = document.querySelectorAll(".task");
    			const droppables = document.querySelectorAll(".swim-lane");
    			
    			draggables.forEach((task) => {
    			  task.addEventListener("dragstart", () => {
    			    task.classList.add("is-dragging");
    			  });
    			  task.addEventListener("dragend", () => {
    			    task.classList.remove("is-dragging");
    			  });
    			});
    			
    			droppables.forEach((zone) => {
    			  zone.addEventListener("dragover", (e) => {
    			    e.preventDefault();
    			
    			    const bottomTask = insertAboveTask(zone, e.clientY);
    			    const curTask = document.querySelector(".is-dragging");
    			
    			    if (!bottomTask) {
    			      zone.appendChild(curTask);
    			    } else {
    			      zone.insertBefore(curTask, bottomTask);
    			    }
    			  });
    			});
    			
    			const insertAboveTask = (zone, mouseY) => {
    			  const els = zone.querySelectorAll(".task:not(.is-dragging)");
    			
    			  let closestTask = null;
    			  let closestOffset = Number.NEGATIVE_INFINITY;
    			
    			  els.forEach((task) => {
    			    const { top } = task.getBoundingClientRect();
    			
    			    const offset = mouseY - top;
    			
    			    if (offset < 0 && offset > closestOffset) {
    			      closestOffset = offset;
    			      closestTask = task;
    			    }
    			  });
    			
    			  return closestTask;
    			};
    } */

    </script>
