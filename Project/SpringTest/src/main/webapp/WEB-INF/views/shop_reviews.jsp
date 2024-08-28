<%@page import="com.zerock.test.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/shop_reviews.css" rel="stylesheet" type="text/css">
<%
int cnt = (Integer) request.getAttribute("cnt");
int size = (Integer) request.getAttribute("size");
Integer shopNum = (Integer) request.getAttribute("shopId");
%>
<div class="reviews-banner">
	<div style="display: flex;">
		후기 <span class="reviews-cnt">${cnt }</span>
	</div>

</div>
<%
if (cnt == 0) {
%>
<div class="nonereviews-container">등록된 후기가 없습니다. ${cnt }</div>
<%
}
%>
<div class="reviews-container">
	<%
	List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
	if (reviews != null && !reviews.isEmpty()) {
		for (ReviewDTO review : reviews) {
	%>
	<div class="content-container">
		<a class="shop-link" href="/shop/1"> <img
			src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwIiBoZWlnaHQ9IjEwMCIgdmlld0JveD0iMCAwIDEwMCAxMDAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxjaXJjbGUgZmlsbD0iI0ZBRkFGQSIgY3g9IjUwIiBjeT0iNTAiIHI9IjUwIi8+CiAgICAgICAgPHBhdGggZD0iTTM2LjIxNiA0MS42ODNjLjI0OC0xLjkzMS40OTgtMy44NjIuNzUtNS43OTRoNi43OWwtLjI4MyA1LjUzN2MwIC4wMTcuMDA3LjAzNC4wMDcuMDUxLS4wMDIuMDEtLjAwMi4wMi0uMDAyLjAzLS4wOTggMS44NzYtMS44OTcgMy4zOTItNC4wMzUgMy4zOTItMS4wNjYgMC0yLjAxOC0uMzktMi42MTUtMS4wNzItLjUxLS41ODUtLjcyMi0xLjMyNS0uNjEyLTIuMTQ0em04Ljg4OCA0LjA3OGMxLjIyNCAxLjI4OSAzLjAwOSAyLjAyOCA0Ljg5IDIuMDI4IDEuODkgMCAzLjY3NC0uNzQgNC45LTIuMDMzLjEwNy0uMTEyLjIwNy0uMjI4LjMwNC0uMzQ1IDEuMjggMS40NDcgMy4yMTcgMi4zNzggNS4zNSAyLjM3OC4xMTIgMCAuMjE2LS4wMjcuMzI4LS4wMzJWNjMuNkgzOS4xMTVWNDcuNzU3Yy4xMTIuMDA1LjIxNS4wMzIuMzI4LjAzMiAyLjEzMyAwIDQuMDcxLS45MzEgNS4zNTEtMi4zOC4wOTkuMTIxLjIuMjM4LjMxLjM1MnptMS41NDUtOS44NzJoNi42OThsLjI4MiA1LjYxOWMwIC4wMTUtLjAwNy4wMjctLjAwNy4wNGwuMDA0LjA4NmEyLjkzOSAyLjkzOSAwIDAgMS0uODI2IDIuMTMyYy0xLjM2NyAxLjQ0LTQuMjMzIDEuNDQxLTUuNjA0LjAwM2EyLjk1IDIuOTUgMCAwIDEtLjgzLTIuMTQybC4wMDQtLjA3OGMwLS4wMTYtLjAwOC0uMDMtLjAwOC0uMDQ4bC4yODctNS42MTJ6bTE2LjM3NiAwYy4yNTIgMS45MzMuNTAyIDMuODY1Ljc1MyA1LjgwNC4xMDkuODEtLjEwNCAxLjU0Ny0uNjE0IDIuMTMyLS41OTYuNjgzLTEuNTUgMS4wNzQtMi42MTYgMS4wNzQtMi4xMzcgMC0zLjkzMi0xLjUxNC00LjAzNC0zLjM4OGEuMzU5LjM1OSAwIDAgMC0uMDAzLS4wNDRjMC0uMDE1LjAwNi0uMDI3LjAwNi0uMDRsLS4yNzgtNS41MzhoNi43ODZ6TTM2LjIyNiA0Ni45NDZ2MTguMDk4YzAgLjc5OC42NDYgMS40NDUgMS40NDQgMS40NDVoMjQuNjVjLjc5OSAwIDEuNDQ1LS42NDcgMS40NDUtMS40NDVWNDYuOTQ2Yy41OS0uMzI4IDEuMTM3LS43MTkgMS41NzUtMS4yMiAxLjA2MS0xLjIxNCAxLjUyMi0yLjc4NSAxLjMwMS00LjQxLS4zLTIuMzU1LS42MDctNC43MDctLjkxOC03LjA2YTEuNDQzIDEuNDQzIDAgMCAwLTEuNDMxLTEuMjU3SDM1LjY5OWMtLjcyNCAwLTEuMzM4LjUzOC0xLjQzMSAxLjI1Ny0uMzExIDIuMzU0LS42MTcgNC43MDctLjkxNiA3LjA1LS4yMjEgMS42MzcuMjQgMy4yMDggMS4zIDQuNDIxLjQzOS41MDIuOTg0Ljg5MyAxLjU3NCAxLjIyeiIgZmlsbD0iI0NDQyIvPgogICAgPC9nPgo8L3N2Zz4K"
			width="60" height="60" alt="리뷰어 이미지">
		</a>
		<div class="content-info">
			<div class="childcontent-info">
				<div class="reviews-name">
					<a class="shop-r-link" href="/shop/1/reviews"><%=review.getId()%></a>
					<div class="time-class"><%=review.getReviewDate()%></div>
				</div>
				<a class="rating-link" href="/shop/1/reviews"> <%
 double rating = review.getRating(); 


 StringBuilder starsHtml = new StringBuilder();


 for (int i = 0; i < 5; i++) {

 	if (rating >= 1.0) {
 		starsHtml.append("<img src='/img/2scorestar.png' width='15' height='14' >");
 		rating -= 1.0;
 	} else if (rating >= 0.5) {
 		starsHtml.append("<img src='/img/1scorestar.png' width='15' height='14' >");
 		rating -= 0.5;
 	} else {
 		starsHtml.append("<img src='/img/emptystar.png' width='15' height='14' >");
 	}
 }
 %>
					<div class="rating-container">
						<%=starsHtml.toString()%>
					</div>

				</a>
				<div class="reviews-content">
					<%=review.getContent()%>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	}
	%>
	<div class="show-more">
	<button class="more-btn">
		<div class="morebtn-banner">상점후기 더보기</div>
	</button>
	</div>
	<form id="reviewForm">
		<div class="star-rating">
			<input type="radio" id="star5" name="rating" value="5" /> <label
				for="star5">★</label> <input type="radio" id="star4" name="rating"
				value="4" /> <label for="star4">★</label> <input type="radio"
				id="star3" name="rating" value="3" /> <label for="star3">★</label>
			<input type="radio" id="star2" name="rating" value="2" /> <label
				for="star2">★</label> <input type="radio" id="star1" name="rating"
				value="1" /> <label for="star1">★</label>
		</div>

		<div class="comment-box">
			<textarea id="comment" placeholder="Write your comment here..."></textarea>
		</div>

		<button type="button" onclick="submitReview()">Submit</button>
	</form>
	
	<script type="text/javascript">
	$(document).ready(function () {
		var size = 5;
		var shopNum = '<%=shopNum%>';
		
		 $('.more-btn').on('click', function () {
	          size += 2; // 버튼 클릭 시 데이터 사이즈 증가
	          console.log(size); // 현재 사이즈 로그 출력
	          getReviews(); // 데이터 요청 함수 호출
	      });

	      // 리뷰 리스트를 가져오는 함수
	      function getReviews() {
	          $.ajax({
	              url: '/shop/' + shopNum + '/reviews', // 서버 요청 URL
	              method: 'GET',
	              data: {
	                  size: size
	              },
	              success: function (response) {
	                  $('#shopContent').html(response); // 응답 데이터로 콘텐츠 업데이트
	              },
	              error: function () {
	                  alert('데이터를 가져오는 데 실패했습니다.'); // 에러 시 경고 메시지
	              }
	          });
	      }
	});
	</script>
</div>