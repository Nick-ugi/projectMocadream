var swiper;

document.addEventListener('DOMContentLoaded', function() {

   // swiper 변수에 Swiper 인스턴스를 할당합니다.
   swiper = new Swiper('.swiper-container', {
      slidesPerView: 3, // 동시에 보여줄 슬라이드 갯수
      spaceBetween: 30, // 슬라이드간 간격
      slidesPerGroup: 1, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음
      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
      loopFillGroupWithBlank: true,
      loop: true, // 무한 반복
      autoplay: {
         delay: 3000, // 슬라이드가 자동으로 이동할 딜레이 (ms)
         disableOnInteraction: false, // 유저가 슬라이드에 상호작용할 경우 자동 재생 중지 여부
      },
      pagination: { // 페이징
         el: '.swiper-pagination',
         clickable: true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
      },
      navigation: { // 네비게이션
         nextEl: '.swiper-button-next', // 다음 버튼 클래스명
         prevEl: '.swiper-button-prev', // 이번 버튼 클래스명
      },
   });

   // 화면 크기에 따라 슬라이드 개수 조정
   function updateSlidesPerView() {
      swiper.params.slidesPerView = window.innerWidth >= 768 ? 3 : 1;
      swiper.update(); // Swiper 업데이트
      if (window.innerWidth < 480) {
         swiper.autoplay.stop(); // 화면 폭이 479px 이하이면 자동 재생 중지
      } else {
         swiper.autoplay.start(); // 화면 폭이 480px 이상이면 자동 재생 시작
      }
   }

   window.addEventListener('resize', updateSlidesPerView);
   // 페이지 로드 시에도 슬라이드 개수 업데이트
   updateSlidesPerView();
   
      // 마우스 호버 시 자동 슬라이딩 멈춤
   $('.swiper-container').hover(function() {
      swiper.autoplay.stop();
   }, function() {
      swiper.autoplay.start();
   });

});