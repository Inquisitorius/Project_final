<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Chat Example</title>
<style>
.message-container {
    overflow-y: scroll;
    min-height: 800px; /* 예시: 최대 높이 설정 */
}

 .message-join {
    padding: 10px;
    margin: 5px 0;
    background-color: #e0fafa;
}
.message-sent {
   background-color: #faf3e0;
    text-align: right;
    padding: 5px;
    margin: 5px;
    border-radius: 10px;
    margin-right:30px;
}

.message-received {
    background-color: #f5cb42;
    text-align: left;
    padding: 5px;
    margin: 5px;
    border-radius: 10px;
    
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

<body class="flex justify-center h-screen">
	<div class="flex flex-col w-7/12 min-w-[800px] max-w-[900px] mt-6"
		id="app">
		<div class="text-3xl font-semibold">채팅</div>
		<div class="border border-inherit mt-4"></div>
		<div class="flex justify-start h-5/6 w-full">
			<div class="border border-inherit h-full"></div>
			<div class="flex flex-col w-2/6 justify-between">
				<div class="flex flex-col" id="rooms">
					<c:forEach var="chatRoom" items="${rooms}">
						<button class="flex p-3 hover:bg-zinc-200"
							onclick="connectRoom(${chatRoom.room_id})">
							<div
								class="inline-block w-11 h-11 min-w-[44px] rounded-full bg-zinc-300"></div>
							<div class="flex flex-col items-start ml-2">
								<div class="font-semibold">${chatRoom.name}</div>
								<div class="text-xs text-zinc-500">2분전</div>
							</div>
						</button>
					</c:forEach>
				</div>

				<form action="${pageContext.request.contextPath}/chat/room"
					method="post" id="createRoomForm">
					<input type="number" name="room_id" id="room_id"
						placeholder="방 ID 입력" required /> <input type="text" name="name"
						id="name" placeholder="방 이름 입력" class="w-full" required />
					<button type="submit">방 만들기</button>
				</form>
			</div>

			<div class="border border-inherit"></div>
			<div class="flex flex-col-reverse justify-start w-full overflow-y-scroll message-container">
				<div class="mb-3 mt-5">
					<div class="flex justify-between">
						<label class="w-full ml-3"> 
						<input type="text" id="messageInput" placeholder="메시지를 입력해주세요" class="w-full" />
						</label>
						<button class="min-w-[8%]" onclick="sendMessage()">전송</button>
					</div>
				</div>

				<!-- 수신된 메시지를 출력 -->
			</div>
			<div class="border border-inherit"></div>
		</div>

<div class="border border-inherit"></div>
		
	</div>

	<script>
        let ws;
        let sender = "wlstjd";
        let currentRoomId = "";
		let message = "";
        function connect() {
            console.log("Connecting to WebSocket for room: ", currentRoomId);
            let socket = new SockJS('/ws-stomp');
            ws = Stomp.over(socket);
            
            let reconnect = 0;

            ws.connect({}, function (frame) {
                console.log("Connected to WebSocket")

                
                ws.subscribe("/sub/chat/room/" + currentRoomId, function(message) {
                	console.log("Received message:", message.body);  // 메시지 내용을 콘솔에 출력
                    let recv = JSON.parse(message.body);  // JSON 문자열을 객체로 변환
                    console.log("Parsed message:", recv); 	
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
        	
            axios.get(`/messages/`)
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

        function connectRoom(room_id) {
        	 if (room_id === currentRoomId) {
        	        console.log("Already connected to room:", room_id);
        	        return;
        	    }
        	    
        	    // 방 ID 업데이트 및 메시지 로드
        	    currentRoomId = room_id;
        	    connect();  // WebSocket 연결
        	  
        	}
        

        document.querySelector("#messageInput").addEventListener("keydown", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                sendMessage();
            }
        });	



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
    </script>
</body>
</html>
