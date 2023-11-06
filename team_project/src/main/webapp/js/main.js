
//팝업창
function getCookie( name ){
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
			var y = (x+nameOfCookie.length);
			if ( document.cookie.substring( x, y ) == nameOfCookie ) {
					if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
							endOfCookie = document.cookie.length;
					return unescape( document.cookie.substring( y, endOfCookie ) );
			}
			x = document.cookie.indexOf( " ", x ) + 1;
			if ( x == 0 )
					break;
	}
	return "";
}

if ( getCookie( "Notice" ) !="done") {
		noticeWindow  =  window.open('/dog/popup','notice','left=0, top=0, width=400,height=400');
		noticeWindow.opener = self;
}


//인기상품 슬라이드
var mySwiper = new Swiper('#best-product-slide', {
  slidesPerView: 'auto',
  spaceBetween: 10,
  scrollbar: {
    el: '.swiper-scrollbar',
    hide: false,
  },
  autoplay: {
    delay: 3000, // 3초마다 자동으로 슬라이드 넘김
    disableOnInteraction: false, // 사용자 상호 작용 후에도 계속 자동 슬라이딩 유지
  },
});