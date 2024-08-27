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
.message-container {
    overflow-y: scroll;
    min-height:600px;
 /* 예시: 최대 높이 설정 */
}

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
   background-color: #ffbd08	;
    text-align: left;
    padding: 5px;
    margin: 5px;
    border-radius: 10px;
    margin-right:50px;
}

.message-received {
    background-color: #8ded1f	;
    text-align: right;
    padding: 5px;
    margin: 5px;
    border-radius: 10px;
    margin-left:50px;
    
}
</style>
<script src="https://cdn.tailwindcss.com"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/sockjs-client@1.5.1/dist/sockjs.min.js"></script>
</head>
<jsp:include page="../Common/header.jsp"></jsp:include>

<div class="container" style="display: flex; justify-content: space-around; max-width: 1050px; margin: 0 auto;">
  <!-- 왼쪽 사이드바 -->
  <div class="flex flex-col w-6/12 min-w-[900px] max-w-[900px] mt-6" id="app">
    <!-- 헤더 -->
    <div class="text-3xl font-semibold mb-4">
    <%= username %> 님의 채팅방입니다
    </div>
    
    <div class="flex flex-grow h-[calc(100vh-140px)]"> <!-- 채팅방 목록과 채팅 영역의 높이를 조정 -->
      <!-- 채팅방 목록 -->
      <div class="flex flex-col w-2/6 bg-gray-50 border border-gray-300 overflow-y-auto">
        <c:forEach var="chatRoom" items="${chatRooms}">
          <button class="flex p-3 hover:bg-zinc-200" onclick="connectRoom(${chatRoom.room_id}, this)">
            <div class="inline-block w-11 h-11 min-w-[44px] rounded-full bg-zinc-300"></div>
            <div class="flex flex-col items-start ml-2">
              <div class="font-semibold">${chatRoom.room_name}</div>
              <div class="text-xs text-zinc-500">${chatRoom.created_at}</div>
            </div>
          </button>
        </c:forEach>
      </div>
      
     <div class="flex flex-col w-4/6 bg-gray-100">
    <!-- 상단에 닉네임과 상품 정보 영역 -->
    <div class="flex flex-col">
        <!-- 채팅 상대방 닉네임 -->
        <div class="p-4 border border-gray-300 bg-white flex justify-between items-center">
            <span id="nickname" class="font-semibold">상대방 닉네임</span>
            <!-- 드롭다운 메뉴 -->
            <div class="relative inline-block text-left">
                <button onclick="toggleDropdown()" class="inline-flex justify-center w-full rounded-md border border-gray-300 shadow-sm px-4 py-2 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none">
                    메뉴
                </button>
                <!-- 드롭다운 메뉴 항목 -->
                <div id="dropdownMenu" class="origin-top-right absolute right-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 hidden">
                    <div class="py-1">
                        <button onclick="deleteChatRoom()" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full text-left">채팅방 삭제</button>
                        <button onclick="markTransactionComplete()" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 w-full text-left">상품 거래 완료</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- 상품 목록 -->
        <div id="productList" class="p-4 border border-gray-300 bg-white text-center font-semibold">
            상품 목록
        </div>
    </div>

        <!-- 수신된 메시지를 출력 -->
        <div class="flex-grow overflow-y-auto bg-white border border-gray-300 message-container">
          <div class="message-item"></div>
        </div>
        
        <!-- 메시지 입력 칸 -->
        <div class="w-full p-3 border border-gray-300 bg-white">
          <div class="flex justify-between items-center">
            <label class="flex-grow">
              <input type="text" id="messageInput" placeholder="메시지를 입력해주세요" class="w-full p-2 border border-gray-300 rounded" />
            </label>
            <button class="min-w-[80px] ml-2 p-2 bg-blue-500 text-white rounded" onclick="sendMessage()">전송</button>
          </div>
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
            messageContainer.scrollBottom = messageContainer.scrollHeight;
        }

        
     // 초기 메시지 로드
        function fetchMessages() {
        	
            axios.get(`/messages/${currentRoomId}`)
                .then(response => {
                    const messages = response.data;
                    messages.forEach(messages => {
                        addMessage({
                            messageType: 'TALK',
                            sender: messages.sender,
                            message: messages.message,
                            room_id: messages.room_id
                        });
                    });
                })
                .catch(error => {
                    console.error("Error loading messages:", error);
                });
        }
        // 주기적으로 메시지 조회 (5초마다)
        setInterval(fetchMessages, 100000);

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
					connect();
				
				});
        	} else{
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

        $(document).ready(function() {
            $("#createRoomForm").submit(function(event) {
                event.preventDefault(); // Prevent form from submitting the traditional way
                const room_id = $("#room_id").val();
                const name = $("#name").val();

                $.ajax({
                    url: `${pageContext.request.contextPath}/chat/room`,
                    type: "POST",
                    data: {
                        room_id: room_id,
                        name: name
                    },
                    success: function(response) {
                        // On success, append the new room to the list
                        $("#rooms").append(`
                            <button class="flex p-3 hover:bg-zinc-200"
                                    onclick="connectRoom('${room_id}')">
                                <div class="inline-block w-11 h-11 min-w-[44px] rounded-full bg-zinc-300"></div>
                                <div class="flex flex-col items-start ml-2">
                                    <div class="flex items-baseline">
                                        <div class="font-semibold">${name}</div>
                                        <div class="ml-2 text-xs text-zinc-500">2분전</div>
                                    </div>
                                    <div class="truncate text-sm text-zinc-700 w-8/12">${room_id}</div>
                                </div>
                            </button>
                        `);
                        // Optionally clear the form inputs
                        $("#room_id").val('');
                        $("#name").val('');
                    },
                    error: function(error) {
                        console.log("Error creating room", error);
                    }
                });
            });
        });
        
        function toggleDropdown() {
            var dropdown = document.getElementById('dropdownMenu');
            dropdown.classList.toggle('hidden');
        }

        // 채팅방 삭제 기능
        function deleteChatRoom() {
            if (confirm('정말 이 채팅방을 삭제하시겠습니까?')) {
                // 서버에 채팅방 삭제 요청을 보냄
                fetch(`/api/deleteChatRoom?roomId=${currentRoomId}`, {
                    method: 'DELETE'
                })
                .then(response => {
                    if (response.ok) {
                        alert('채팅방이 삭제되었습니다.');
                        location.reload(); // 삭제 후 페이지 새로고침
                    } else {
                        alert('채팅방 삭제에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error deleting chat room:', error);
                });
            }
        }

        // 상품 거래 완료 기능
        function markTransactionComplete() {
            if (confirm('이 거래를 완료로 표시하시겠습니까?')) {
                // 서버에 거래 완료 요청을 보냄
                fetch(`/api/completeTransaction?roomId=${currentRoomId}`, {
                    method: 'POST'
                })
                .then(response => {
                    if (response.ok) {
                        alert('거래가 완료되었습니다.');
                        // 추가 동작 필요시 여기에 추가
                    } else {
                        alert('거래 완료에 실패했습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error marking transaction complete:', error);
                });
            }
        }

    </script>
</body>
</html>
