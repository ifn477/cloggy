
//팝업창
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
