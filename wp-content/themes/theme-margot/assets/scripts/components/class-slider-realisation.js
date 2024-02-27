import gsap from 'gsap';

class SliderRealisation
{
    constructor( element )
    {
        this.$wrapper = element.querySelector( '.slider-realisation--wrapper' )
        this.$items = element.querySelectorAll( '.slider-realisation--wrapper-item' )
        this.$itemsPreview = element.querySelectorAll( '.slider-realisation--preview-item' )
        this.$itemsImage = element.querySelectorAll( 'figure' )
        this.$numbers = element.querySelectorAll( '.slider-realisation--number-item' )
        this.$titles = element.querySelectorAll( '.slider-realisation--title-item' )
        this.$buttons = this.$wrapper.querySelectorAll( '.button' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )
        this.$carousel = element.querySelector( '.slider-realisation--preview' )
        this.$itemsCarousel = element.querySelectorAll( '.slider-realisation--preview-item' )
        
        this.totalSlides = this.$items.length

        this.current = 0
        this.oldSlide = 0
        this.isAnimated = false

        this.slidesWrap = gsap.utils.wrap(0, this.totalSlides);
        this.titlesWrap = gsap.utils.wrap(0, this.$titles.length);
        this.numbersWrap = gsap.utils.wrap(0, this.$numbers.length);
        this.carouselWrap = gsap.utils.wrap(0, this.$itemsCarousel.length);
        this.buttonWrap = gsap.utils.wrap(0, this.$buttons.length);

        this.init()
        this.events()
    }

    init() {
        this.$items.forEach((item, index) => {
            if (index === this.current) {
                this.transitionInSlide(index, 0);
                this.transitionInTitle(index);
                this.transitionInNumber(index);
                return;
            }

            this.transitionOutTitle(index);
            this.transitionOutSlide(index, 0);
            this.transitionOutNumber(index, 0);
        });

        this.$buttons.forEach((button, i) => {
            if (i != 0) {
                gsap.set(button, {
                    yPercent: 100,
                    opacity: 0,
                    duration: 0.6
                });
            }
        });

        gsap.set(this.$itemsCarousel, {
            scale: (i) => {
                if (i != 0) {
                    return 0.75
                }
            },
            x: (i) => {
                if (i == this.$itemsCarousel.length - 1) {
                    return -this.$itemsCarousel[0].clientWidth
                } else {
                    return i * this.$itemsCarousel[0].clientWidth
                }
            },
            y: (i) => {
                if (i == 0) {
                    return 0
                } else {
                    return 20
                }
            },
            rotate: (i) => {
                if (i == 0) {
                    return 0
                }

                if (i == this.$itemsCarousel.length - 1) {
                    return -10
                } else {
                    return 10
                }
            }
        })
    }

    events() {
        this.$previous.addEventListener('click', () => { this.handlePrev() })
        this.$next.addEventListener('click', () => { this.handleNext() })
        window.addEventListener('resize', () => { this.init() })
    }

    transitionInSlide(slide, direction = 1, duration = 1) {
        gsap.fromTo(
            this.$items[slide],
            {
                xPercent: direction > 0 ? 100 : -100
            },
            {
                xPercent: 0,
                duration,
            }
        );

        gsap.fromTo(
            this.$buttons[slide],
            {
                yPercent: 100,
                opacity: 0
            },
            {
                yPercent: 0,
                opacity: 1,
                duration: 0.6,
                delay: 0.3
            }
        );
        
        gsap.fromTo(
            this.$items[slide].querySelector('figure'),
            {
                xPercent: direction > 0 ? -100 : 100
            },
            {
                xPercent: 0,
                duration
            }
        );
    }

    transitionOutSlide(slide, direction = 1, duration = 1) {
        gsap.to(this.$items[slide], {
            xPercent: direction > 0 ? -100 : 100,
            duration,
        });

        gsap.to(this.$buttons[slide], {
            yPercent: 100,
            opacity: 0,
            duration: 0.6
        });
        
        gsap.to(this.$items[slide].querySelector('figure'), {
            xPercent: direction > 0 ? 100 : -100,
            duration
        });
    }

    transitionInTitle(title) {
        gsap.fromTo(
            this.$titles[title],
            {
                opacity: 0
            },
            {
                opacity: 1,
                duration: 0.6,
                delay: 0.6
            }
        );
    }

    transitionOutTitle(title) {
        gsap.to(this.$titles[title], {
            opacity: 0,
            duration: 0.6
        });
    }

    transitionInNumber(title, direction = 1) {
        gsap.fromTo(
            this.$numbers[title],
            {
                yPercent: direction > 0 ? -100 : 100
            },
            {
                yPercent: 0,
                duration: 0.6
            }
        );
    }

    transitionOutNumber(title, direction = 1) {
        gsap.to(this.$numbers[title], {
            yPercent: direction > 0 ? 100 : -100,
            duration: 0.6
        });
    }

    transitionInCarousel(slide, direction = 1, duration = 1) {
        this.$itemsCarousel.forEach((item, i) => {
            if (i == slide) {
                gsap.to(item, {
                    x: direction > 0 ? "-=" + this.$itemsCarousel[0].clientWidth :  "+=" + this.$itemsCarousel[0].clientWidth,
                    scale: 1,
                    y: 0,
                    rotate: 0,
                    duration
                });
            } else {
                gsap.to(item, {
                    x: direction > 0 ? "-=" + this.$itemsCarousel[0].clientWidth :  "+=" + this.$itemsCarousel[0].clientWidth,
                    y: 20,
                    rotate: this.carouselWrap(slide - 1) == i ? -10 : 10,
                    scale: 0.75,
                    duration,
                    modifiers: {
                        x: gsap.utils.unitize(gsap.utils.wrap(-this.$itemsCarousel[0].clientWidth * 2, this.$itemsCarousel[0].clientWidth * 4), "px"),
                    }
                });
            }
        });
    }

    handlePrev() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current - 1);
        this.transitionInSlide(this.current, -1);
        this.transitionOutSlide(this.oldSlide, -1);
        this.transitionInTitle(this.current);
        this.transitionOutTitle(this.oldSlide);
        this.transitionInCarousel(this.current, -1);
        this.transitionInNumber(this.current);
        this.transitionOutNumber(this.oldSlide);
    }
  
    handleNext() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current + 1);
        this.transitionInSlide(this.current);
        this.transitionOutSlide(this.oldSlide);
        this.transitionInTitle(this.current);
        this.transitionOutTitle(this.oldSlide);
        this.transitionOutTitle(this.oldSlide);
        this.transitionInCarousel(this.current);
        this.transitionInNumber(this.current, -1);
        this.transitionOutNumber(this.oldSlide, -1);
    }
}

export default SliderRealisation