<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>

<%
String username = (String) request.getAttribute("username");
String userid = (String) request.getAttribute("userid");
%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat Example</title>
<style>


 .message-join {
    padding: 10px;
    margin: 5px 0;
    background-color: #e1e5e6;
    text-align: center;
    border-radius: 10px;
    margin-right:10px;
    margin-left:10px;
}
.message-sent {
   background-color: #f0e09c	;
    text-align: left;
    padding: 5px;
    margin: 5px;
    border-radius: 10px;
    margin-right:50px;
}

.message-received {
    background-color: #aef7a6	;
    text-align: right;
    padding: 5px;
    margin: 5px;
    border-radius: 10px;
    margin-left:50px;
    
}

.containerd {
            display: flex;
            justify-content: space-between;
            margin: 0 auto;
        }
        .left-pane {
            flex: 1;
            min-width: 300px;
            max-width: 300px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            height: 950px; /* 채팅방 목록의 높이를 조정 */
            overflow-y: auto;
        }
        .right-pane {
            flex: 1;
            background-color: #f0f0f0;	
            border: 1px solid #ddd;
        }
        .chat-room-button {
            display: flex;
            padding: 10px;
            border: none;
            background: #f4f4f4;
            text-align: left;
            width: 100%;
            cursor: pointer;
            box-sizing: border-box;
        }
        .chat-room-button:hover {
            background: #e0e0e0;
        }
        .chat-room-button img {
            border-radius: 50%;
            width: 44px;
            height: 44px;
            object-fit: cover;
        }
        .dropdown-menu {
            position: absolute;
            right: 0;
            top: 100%;
            width: 200px;
            background: #fff;
            border: 1px solid #ddd;
            display: none;
        }
        .dropdown-menu.visible {
            display: block;
        }
        .dropdown-menu button {
            display: block;
            width: 100%;
            padding: 10px;
            border: none;
            background: #fff;
            text-align: left;
            cursor: pointer;
        }
        .dropdown-menu button:hover {
            background: #f0f0f0;
        }
        .message-container {
            overflow-y: auto;
            min-height: 670px; 

        }
.hidden {
    height: 0;
    overflow: hidden;
}


.visible {
    height: auto;
}
</style>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
</head>
<jsp:include page="../Common/header.jsp"></jsp:include>

<div class="containerd" style="max-width: 1050px;";>
        <!-- 왼쪽 사이드바 -->
        <div class="left-pane">
            <!-- 헤더 -->
            <div class="text-3xl font-semibold mb-4  border border-gray-300" style="display:flex;justify-content: flex-start;">
                <%= username %>의 채팅방
            </div>
            
            <!-- 채팅방 목록 -->
            <c:forEach var="chatRoom" items="${chatRooms}">
                <button class="chat-room-button" style="border: 1px solid #ddd;" onclick="connectRoom(${chatRoom.room_id}, this)">
                    <div class="inline-block">
                        <c:choose>
                            <c:when test="${userid == chatRoom.seller_id}">
                    <c:choose>
                        <c:when test="${not empty chatRoom.sender_shop_img}">
                            <img src="${chatRoom.sender_shop_img}" alt="Shop Image"/>
                        </c:when>
                        <c:otherwise>
                            <div class="w-11 h-11 min-w-[44px] rounded-full bg-zinc-300"></div>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:when test="${userid == chatRoom.sender}">
                    <c:choose>
                        <c:when test="${not empty chatRoom.seller_shop_img}">
                            <img src="${chatRoom.seller_shop_img}" alt="Shop Image"/>
                        </c:when>
                        <c:otherwise>
                            <div class="w-11 h-11 min-w-[44px] rounded-full bg-zinc-300"></div>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                        </c:choose>
                    </div>
                    <div class="flex flex-col items-start ml-2">
                        <div class="font-semibold">
                            <c:choose>
                                <c:when test="${userid eq chatRoom.sender}">
       						     ${chatRoom.seller_id}
     						    </c:when>
      						  <c:otherwise>
           						 ${chatRoom.sender}
      						  </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="text-xs text-zinc-500">${chatRoom.formatted_created_at}</div>
                    </div>
                </button>	
            </c:forEach>
        </div>
        
        <!-- 오른쪽 채팅 영역 -->
        <div class="right-pane">
            <!-- 상단에 닉네임과 상품 정보 영역 -->
            <div class="flex flex-col">
                <div class="p-4 border border-gray-300 bg-white flex justify-between items-center">
                   <div id="shopSection" class="hidden">
                   <img id="shopImg" src="" alt="Shop Image" style="width: 50px; height: 50px;margin-right:10px;border-radius: 50%;"/>
                   </div>
                   <div class="col">
                   <span id="nickname" class="font-semibold"></span>
                   </div>

                   
                    <!-- 드롭다운 메뉴 -->
                    <div class="relative inline-block text-right">
                        <button onclick="toggleDropdown()" class="inline-flex justify-center rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none">
                            메뉴
                        </button>
                        <div id="dropdownMenu"  class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 hidden">
                         <div class="py-1">
                          <button id="deleteChatRoomButton" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">채팅방 나가기</button>
                        <button id="markTransactionCompleteButton" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">상품 거래 완료</button>
                        </div>
                        </div>
                    </div>
                </div>


    			<div class="p-4 border border-gray-300 bg-white flex justify-between items-center">
                <!-- 상품 목록 -->
                <div id="imgSection" class="hidden">
               <img id="productImage" src="" alt="Product Image" style="width: 50px; height: 50px; margin-right:10px;">
               </div>
          		<div class="col">	
               <span id="productInfo" class="font-semibold"></span> <br/>
               <span id="productPrice" class="font-semibold"></span>
    			</div>	
               <div class="inline-block text-right">
               <span id="productStatus" class="font-semibold"></span>
                </div>
				</div>

            <!-- 수신된 메시지를 출력 -->
            <div class="message-container bg-white border border-gray-300">
                <div class="message-item"></div>
            </div>

            <!-- 메시지 입력 칸 -->
            <div class="w-full p-3 border border-gray-300 bg-white">
                <div class="flex justify-between items-center">
                    <label class="flex-grow">
                        <input type="text" id="messageInput" placeholder="메시지를 입력해주세요" class="w-full p-2 border border-gray-300 rounded"/>
                    </label>
                    <button class="min-w-[80px] ml-2 p-2 bg-blue-500 text-white rounded" onclick="sendMessage()">전송</button>
                </div>
            </div>
        </div>
    </div>
    </div>
    


	
<jsp:include page="../Common/footer.jsp"></jsp:include>

	<script>
        let ws;
        let sender = "<%= username %>";
        let currentRoomId = "";
		let message = "";
		let currentSelectedButton = null;
		var userid = "<%= userid %>";
		
		console.log("sender : " + sender);
		

        function connect() {
            console.log("Connecting to WebSocket for room: ", currentRoomId);
            let socket = new SockJS('/ws-stomp');
            ws = Stomp.over(socket);
            
            let reconnect = 0;

            ws.connect({}, function (frame) {
                console.log("Connected to WebSocket")

                ws.subscribe("/sub/chat/room/" + currentRoomId, function(message) {
                    let recv = JSON.parse(message.body); 
                  	addMessage(recv);
				});
                
                ws.subscribe("/topic/chatroom/delete", function (message) {
                    let deletedRoomId = JSON.parse(message.body);
                    console.log(" deletedroomid " + deletedRoomId);
                    if (deletedRoomId === currentRoomId) {
                        alert("이 채팅방이 삭제되었습니다.");
                        window.location.href = '/myRoomsPage'; // 채팅 목록 페이지로 리다이렉트
                    }
                });
                
                ws.send("/pub/chat/message", {} , JSON.stringify({ 
				messageType: "JOIN",
				room_id: currentRoomId,
				sender: sender,
				message: ""

                }));       
        });
        }

        function addMessage(recv) {

            // 1. recv 객체 확인
            if (!recv) {
                console.error("Received data is null or undefined.");
                return;
            }

            console.log("addMessage called with:", recv);

            // 2. 메시지 컨테이너 선택
            let messageContainer = document.querySelector(".message-container");

            if (!messageContainer) {
                console.error("Message container not found.");
                return;
            }

            // 3. 메시지 DIV 생성
            let messageDiv = document.createElement("div");
			console.log("div : " , messageDiv);
            // 메시지 타입에 따른 클래스 설정
            messageDiv.className = recv.messageType === 'JOIN'
                ? 'message-join'
                : (recv.sender === sender ? 'message-sent' : 'message-received');

            // 4. 메시지 내용 설정
            let content;
            if (recv.messageType === 'JOIN') {
                content = recv.message || '입장 메시지';  // 기본값 설정
            } else if (recv.messageType === 'TALK') {
            	content = recv.sender ;
            	content += ' : '
            	content += recv.message;
            } else {
                content = `Unknown message type: ${recv.message}`;
            }

            // `content`를 콘솔로 출력하여 확인
            console.log("Content being set:", content);

            // 5. 메시지 DIV의 내용 설정
            messageDiv.innerHTML = content;  // HTML 태그를 포함하지 않는 경우

            // 6. 메시지 DIV를 메시지 컨테이너에 추가
            messageContainer.appendChild(messageDiv);

            // 7. 스크롤을 최신 메시지로 이동
            messageContainer.scrollTop = messageContainer.scrollHeight;
        }

     // Axios를 사용하여 채팅방 세부정보를 가져오는 함수
        function loadChatRoomDetails(room_id) {
            console.log("loadChatRoomDetails " + room_id);
            
            axios.get(`/chatroom/details`, {
                params: {
                    room_id: room_id
                }
            })
            .then(response => {
                const data = response.data;
                console.log(data);
                
                let opponentId = '';
                let opponentImg = '';

                if (userid === data.seller_id) {
                    opponentId = data.sender;
                    opponentImg = data.sender_shop_img; 
                } else {
                    opponentId = data.seller_id;
                    opponentImg = data.seller_shop_img; 
                }

                // 상대방의 닉네임과 이미지를 설정
                document.getElementById('nickname').innerText = opponentId || '';
                document.getElementById('shopImg').src = opponentImg || '';
                // 상품 정보 업데이트
                document.getElementById('productInfo').innerText = data.products_name || '';
                document.getElementById('productPrice').innerText = data.products_price + '원' || '';
                document.getElementById('productStatus').innerText = data.products_status || '';
                document.getElementById('productImage').src = data.products_img1 || ''; // 상품 이미지 URL
				
               

                // 오른쪽 패널의 정보 섹션을 표시
                document.getElementById('shopSection').classList.remove('hidden');
                document.getElementById('shopSection').classList.add('visible');
                document.getElementById('imgSection').classList.remove('hidden');
                document.getElementById('imgSection').classList.add('visible');
                // 버튼 클릭 이벤트 설정
                document.getElementById('deleteChatRoomButton').onclick = function() {
                    deleteChatRoom(room_id);
                };
                document.getElementById('markTransactionCompleteButton').onclick = function() {
                	
                	markTransactionComplete(data.product_idx);
                };

            })
            .catch(error => {
                console.error('Error fetching chat room details:', error);
            });
        }

        
        

        function connectRoom(room_id, buttonElement) {

        	 if (room_id === currentRoomId) {
        	        console.log("Already connected to room:", room_id);
        	        return;
        	    }
        	 if(currentSelectedButton) {
        		 currentSelectedButton.classList.remove('bg-blue-100');
        	}
        	 buttonElement.classList.add('bg-blue-100');
        	 currentSelectedButton = buttonElement
      
        	    currentRoomId = room_id;

        	if(ws) {
				ws.disconnect(function () {
					console.log("Disconnected from previous WebSoucket");
					
					clearChatMessages();
					
					loadChatRoomDetails(room_id);
					connect();
				
				});
        	} else{

        		loadChatRoomDetails(room_id);
        		connect();  <!-- 웹소켓 -->
        	}
        
        	}

        document.querySelector("#messageInput").addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                sendMessage();
            }
        });	

       function clearChatMessages() {
			let chatContainer = document.querySelector('.message-container');
			if (chatContainer) {
				chatContainer.innerHTML = '';
			}
    	   
       } 


        function sendMessage() {
            let message = document.querySelector("#messageInput").value;
            if (message === "") return;

            console.log("Sending message", message);

            // 클라이언트에서 보낼 메시지 객체 생성
            const messageData = {
                messageType: 'TALK',
                room_id: currentRoomId,
                sender: sender,
                message: message
            };
			
            // 서버에 메시지 전송
            ws.send("/pub/chat/message", {}, JSON.stringify(messageData));

            // 입력 필드 초기화
            document.querySelector("#messageInput").value = '';

        }

        function addMessageToContainer(sender, message) {
            let messageContainer = document.querySelector(".message-container");
            
            if (!messageContainer) {
                console.error("Message container not found.");
                return;
            }
            
            let messageDiv = document.createElement("div");
            messageDiv.className = "message-sent"; // 클래스 이름을 통해 스타일 지정 가능

            let content = `<div><strong>${sender}:</strong> ${message}</div>`;
            messageDiv.innerHTML = content;

            messageContainer.appendChild(messageDiv);
            messageContainer.scrollTop = messageContainer.scrollHeight;
        }
        
        function toggleDropdown() {
            var dropdown = document.getElementById('dropdownMenu');
            dropdown.classList.toggle('hidden');
        }

        // 채팅방 삭제 기능
        function deleteChatRoom(room_id) {
        if (confirm("정말로 이 채팅방을 삭제하시겠습니까?")) {
        	console.log("Deleting room with ID:", room_id);
            fetch('/chatroom/delete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    'room_id': room_id
                })
            })
            .then(response => {
                if (response.ok) {
                    // 성공적으로 삭제된 경우
                    alert("채팅방이 삭제되었습니다.");
                    
                    ws.send("/pub/chatroom/delete", {}, JSON.stringify({ 
                        'room_id': room_id 
                    }));
                    
                    window.location.href = '/myRoomsPage'; // 채팅 목록 페이지로 리다이렉트
                } else {
                    // 삭제 실패한 경우
                    alert("채팅방 삭제에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("채팅방 삭제 중 오류가 발생했습니다.");
            });
        }
    }

        function markTransactionComplete(product_idx) {
        	console.log("trans product stauts p : "+ product_idx);
			
			if (confirm('이 거래를 완료로 표시하시겠습니까?')) {
            fetch('/product/status', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: new URLSearchParams({
                    'product_idx': product_idx
                })
            })
            .then(response => response.text())
            .then(result => {
            	 console.log('Server response:', result);
                if (result === "success") {
                    alert("상품 거래가 완료되었습니다.");
                    window.location.href = '/myRoomsPage'; 
                    
                } else {
                    alert("상품 거래 완료 처리 중 오류가 발생했습니다.");
                    window.location.href = '/myRoomsPage'; 
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("상품 거래 완료 처리 중 오류가 발생했습니다.");
            });
			}
        }

        
    </script>
</body>
</html>
