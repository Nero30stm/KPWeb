var slider = {
  slides:["/images/1.jpg",'/images/2.jpg','/images/3.jpg'],
  titles:["You can add hotels", "you can leave a response"],
  frame:0, // текущий кадр для отбражения - индекс картинки из массива
  set: function(image) { // установка нужного фона слайдеру
  	document.getElementById("scr").style.backgroundImage = "url("+image+")";
  },
  set_title(title){
  	var div = document.getElementById("st");
  	div.innerHTML = "<strong>" + title + "</strong>";
  },
  init: function() { // запуск слайдера с картинкой с нулевым индексом
    this.set(this.slides[this.frame]);
    this.set_title(this.titles[this.frame]);
  },
  left: function() { // крутим на один кадр влево
    this.frame--;
    if(this.frame < 0) this.frame = this.slides.length-1;
    this.set(this.slides[this.frame]);
    this.set_title(this.titles[this.frame]);
  },
  right: function() { // крутим на один кадр вправо
    this.frame++;
    if(this.frame == this.slides.length) this.frame = 0;
    this.set(this.slides[this.frame]);
    this.set_title(this.titles[this.frame]);
  }

};
window.onload = function() { // запуск слайдера после загрузки документа
  slider.init();
  setInterval(function() { // ставим пятисекундный интервал для перелистывания картинок
    slider.right();
  },5000);
};











let mainSliderSelector = '.main-slider',
    navSliderSelector = '.nav-slider',
    interleaveOffset = 0.5;

// Main Slider
let mainSliderOptions = {
      loop: true,
      speed:1000,
      autoplay:{
        delay:3000
      },
      loopAdditionalSlides: 10,
      grabCursor: true,
      watchSlidesProgress: true,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {
        init: function(){
          this.autoplay.stop();
        },
        imagesReady: function(){
          this.el.classList.remove('loading');
          this.autoplay.start();
        },
        slideChangeTransitionEnd: function(){
          let swiper = this,
              captions = swiper.el.querySelectorAll('.caption');
          for (let i = 0; i < captions.length; ++i) {
            captions[i].classList.remove('show');
          }
          swiper.slides[swiper.activeIndex].querySelector('.caption').classList.add('show');
        },
        progress: function(){
          let swiper = this;
          for (let i = 0; i < swiper.slides.length; i++) {
            let slideProgress = swiper.slides[i].progress,
                innerOffset = swiper.width * interleaveOffset,
                innerTranslate = slideProgress * innerOffset;
            swiper.slides[i].querySelector(".slide-bgimg").style.transform =
              "translate3d(" + innerTranslate + "px, 0, 0)";
          }
        },
        touchStart: function() {
          let swiper = this;
          for (let i = 0; i < swiper.slides.length; i++) {
            swiper.slides[i].style.transition = "";
          }
        },
        setTransition: function(speed) {
          let swiper = this;
          for (let i = 0; i < swiper.slides.length; i++) {
            swiper.slides[i].style.transition = speed + "ms";
            swiper.slides[i].querySelector(".slide-bgimg").style.transition =
              speed + "ms";
          }
        }
      }
    };
let mainSlider = new Swiper(mainSliderSelector, mainSliderOptions);

// Navigation Slider
let navSliderOptions = {
      loop: true,
      loopAdditionalSlides: 10,
      speed:1000,
      spaceBetween: 5,
      slidesPerView: 5,
      centeredSlides : true,
      touchRatio: 0.2,
      slideToClickedSlide: true,
      direction: 'vertical',
      on: {
        imagesReady: function(){
          this.el.classList.remove('loading');
        },
        click: function(){
          mainSlider.autoplay.stop();
        }
      }
    };
let navSlider = new Swiper(navSliderSelector, navSliderOptions);

// Matching sliders
mainSlider.controller.control = navSlider;
navSlider.controller.control = mainSlider;