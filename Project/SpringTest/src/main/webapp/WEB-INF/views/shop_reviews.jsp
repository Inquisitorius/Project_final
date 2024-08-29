<%@page import="com.zerock.test.dto.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/css/shop_reviews.css" rel="stylesheet" type="text/css">
<%
int cnt = (Integer) request.getAttribute("cnt");
int size = (Integer) request.getAttribute("size");
Integer shopNum = (Integer) request.getAttribute("shopId");
String shopOwner = (String) request.getAttribute("shopOwner");
String userid = (String) request.getAttribute("userid");
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
	int j = 0;
	List<ReviewDTO> reviews = (List<ReviewDTO>) request.getAttribute("reviews");
	if (reviews != null && !reviews.isEmpty()) {
		for (ReviewDTO review : reviews) {
			String id = review.getId();
			String shopImgKey = "shopImg1_" + j++;
			String shopImg1 = (String) request.getAttribute(shopImgKey);
	%>
	<div class="content-container">
		<a class="shop-link"
			href="/shop/<%=review.getOther_shopid()%>/reviews"> <img
			src="<%=shopImg1%>" width="60" height="60" alt="리뷰어 이미지"
			style="border-radius: 50%">
		</a>
		<div class="content-info">
			<div class="childcontent-info">
				<div class="reviews-name">
					<a class="shop-r-link"
						href="/shop/<%=review.getOther_shopid()%>/reviews"><%=review.getId()%></a>
						<%if(id.equals(userid)){ %>			
					<div class="btn-container"
						style="display: flex; justify-content: space-between;">
						<button class="comment-btn comment-edit" data-review-id="<%=review.getIdx()%>" id="comment-edit">수정</button>
						<button class="comment-btn comment-del" data-review-id="<%=review.getIdx()%>" id="comment-del">삭제</button>
					</div>
					<%} %>
				</div>
				
				<a class="rating-link" 
					href="/shop/<%=review.getOther_shopid()%>/reviews"> <%
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
					<div class="rating-container" data-review-id="<%=review.getIdx()%>">
						<%=starsHtml.toString()%>
					</div>
				</a>
				
				<div hidden class="editstar_rating" data-review-id="<%=review.getIdx()%>">
				<span class="editstar on" data-editrating="1"></span> <span class="editstar"
					data-editrating="2"></span> <span class="editstar" data-editrating="3"></span>
				<span class="editstar" data-editrating="4"></span> <span class="editstar"
					data-editrating="5"></span>
					<input type="hidden" id="editrating" name="editrating" value="1" />
			</div>
				<div class="reviews-content" data-review-id="<%=review.getIdx()%>">
					<%=review.getContent()%>
				</div>
				
				<div hidden class="content-form" data-review-id="<%=review.getIdx()%>">
				<textarea class="content-edit" id="content" name="content"
					><%=review.getContent()%></textarea>
					<button class="btn btn-dark edit-submit" style="width: 100px" type="button" data-review-id="<%=review.getIdx()%>">수정</button>
					<button class="btn btn-dark edit-cancel" style="width: 100px" type="button" data-review-id="<%=review.getIdx()%>">취소</button>
				</div>
				
				<input type="hidden" name="idx" id="idx" value="<%=review.getIdx()%>">
			</div>
		</div>
	</div>
	<%
	}
	}
	%>
	<%
	if (size < cnt) {
	%>
	<div class="show-more">
		<button class="more-btn" data-load="load">
			<div class="morebtn-banner">상점후기 더보기</div>
		</button>
		<%
		} else if (size >= cnt || size == cnt) {
		%>

		<%
		}
		%>
	</div>
	<%
	if (!shopOwner.equals(userid) && userid != null && !userid.isEmpty()) {
	%>
	<div class="insert-form">
		<form action="/insert-comment" method="post">
			<input type="hidden" name="shop_id" value="${shopId}"> <input
				type="hidden" name="userid" value="${userid}">

			<div class="star_rating">
				<span class="star on" data-rating="1"></span> <span class="star"
					data-rating="2"></span> <span class="star" data-rating="3"></span>
				<span class="star" data-rating="4"></span> <span class="star"
					data-rating="5"></span>
			</div>
			<input type="hidden" id="rating" name="rating" value="1" />
			<div class="content-form">
				<textarea class="content" id="content" name="content"
					placeholder="후기를 작성해주세요."></textarea>
			</div>
			<div>
				<button class="btn btn-dark" type="submit">댓글 작성</button>
			</div>
		</form>
	</div>
	<%
	}
	%>
	<script type="text/javascript">
	$(document).ready(function () {
		var shopNum = '<%=shopNum%>';
		var size = '<%=size%>';
			var load = $(this).data('load');
			$('.more-btn').on('click', function() {
				var load = $(this).data('load');
				size = parseInt(size) + 2;
				getReviews(size, load); // 데이터 요청 함수 호출
			});
			
			$(document).on('click', '.comment-edit', function(){
			    var reviewId = $(this).data('review-id');
			    
			    // 리뷰 콘텐츠를 숨김
			    $('.reviews-content').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', true);
			        }
			    });

			    // 댓글 버튼을 숨김
			    $('.comment-btn').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', true);
			        }
			    });

			    // 폼을 표시
			    $('.content-form').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', false);
			        }
			    });
			    
			    $('.rating-container').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', true);
			        }
			    });
			    
			    $('.editstar_rating').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', false);
			        }
			    });
			    
			    
			});
			
			
			$(document).on('click', '.edit-cancel', function(){
			    var reviewId = $(this).data('review-id');
			    
			    // 리뷰 콘텐츠를 숨김
			    $('.reviews-content').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', false);
			        }
			    });

			    // 댓글 버튼을 숨김
			    $('.comment-btn').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', false);
			        }
			    });

			    // 폼을 표시
			    $('.content-form').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', true);
			        }
			    });
			    
			    $('.rating-container').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', false);
			        }
			    });
			    
			    $('.editstar_rating').each(function() {
			        if ($(this).data('review-id') === reviewId) {
			            $(this).attr('hidden', true);
			        }
			    });
			});
			
			$('.edit-submit').on('click', function () {
				 var $container = $(this).closest('.content-form'); 

				    var content = $container.find('.content-edit').val();
				var rating = $('#editrating').val();
				 var idx = $(this).data('review-id');
				
				console.log(idx);
				$.ajax({
					url : '/edit-comment', // 서버 요청 URL
					method : 'POST',
					data : {
						content : content,
						editrating : rating,
						idx : idx,
						shop_id : shopNum
					},
					success : function(response) {
						location.reload();
						alert(content);
					},
					error : function() {
						alert('데이터를 가져오는 데 실패했습니다.' + ' ' + rating); // 에러 시 경고 메시지
					}
				});
			})
			
			$('.comment-del').on('click', function(){
				var idx = $(this).data('review-id');
				$.ajax({
					url : '	/del-comment', // 서버 요청 URL
					method : 'POST',
					data : {
						
						idx : idx,
						shop_id : shopNum
					},
					success : function(response) {
						location.reload();
					},
					error : function() {
						alert('데이터를 가져오는 데 실패했습니다.'); // 에러 시 경고 메시지
					}
				});
			})
			
			// 리뷰 리스트를 가져오는 함수
			function getReviews(size, load) {
				$.ajax({
					url : '/shop/' + shopNum + '/reviews', // 서버 요청 URL
					method : 'GET',
					data : {
						size : size,
						load : load
					},
					success : function(response) {
						console.log(size);
						$('#shopContent').html(response); // 응답 데이터로 콘텐츠 업데이트

					},
					error : function() {
						alert('데이터를 가져오는 데 실패했습니다.'); // 에러 시 경고 메시지
					}
				});
			}

			$('.star_rating > .star').click(function() {
				var rating = $(this).data('rating'); // 선택한 별점 값
				$('#rating').val(rating); // 숨겨진 입력 필드에 값 설정

				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
			});
			
			$('.editstar_rating > .editstar').click(function() {
				var rating = $(this).data('editrating'); // 선택한 별점 값
				$('#editrating').val(rating); // 숨겨진 입력 필드에 값 설정

				$(this).parent().children('span').removeClass('on');
				$(this).addClass('on').prevAll('span').addClass('on');
			});

		});
	</script>
</div>