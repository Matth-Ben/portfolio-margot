import gsap from 'gsap';

class SliderRealisation
{
    constructor( element )
    {
        this.$items = element.querySelectorAll( '.slider-realisation--wrapper-item' )
        this.$itemsImage = element.querySelectorAll( 'figure' )
        this.$numbers = element.querySelectorAll( '.slider-realisation--number-item' )
        this.$titles = element.querySelectorAll( '.slider-realisation--title-item' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )

        this.totalSlides = this.$items.length
        this.current = 0
        this.oldSlide = 0
        this.isAnimated = false
        this.slidesWrap = gsap.utils.wrap(0, this.totalSlides);
        this.titlesWrap = gsap.utils.wrap(0, this.$titles.length);
        this.numbersWrap = gsap.utils.wrap(0, this.$numbers.length);

        this.$items.forEach((item, index) => {
            if (index === this.current) {
                this.transitionInSlide(index, 0);
                this.transitionInTitle(index);
                return;
            }

            this.transitionOutTitle(index);
            this.transitionOutSlide(index, 0);
        });

        this.events()
    }

    events() {
        this.$previous.addEventListener('click', () => { this.handlePrev() })
        this.$next.addEventListener('click', () => { this.handleNext() })
    }

    transitionInSlide(slide, direction = 1, duration = 1) {
        gsap.fromTo(
            this.$items[slide],
            {
                xPercent: direction > 0 ? 100 : -100
            },
            {
                xPercent: 0,
                duration
            }
        );
        
        gsap.fromTo(
            this.$itemsImage[slide],
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
            duration
        });
        
        gsap.to(this.$itemsImage[slide], {
            xPercent: direction > 0 ? 100 : -100,
            duration
        });
    }

    transitionInTitle(title) {
        gsap.fromTo(
            [this.$numbers[title], this.$titles[title]],
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
        gsap.to([this.$numbers[title], this.$titles[title]], {
            opacity: 0,
            duration: 0.6
        });
    }

    handlePrev() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current - 1);
        this.transitionInSlide(this.current, -1);
        this.transitionOutSlide(this.oldSlide, -1);
        this.transitionInTitle(this.current);
        this.transitionOutTitle(this.oldSlide);
    }
  
    handleNext() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current + 1);
        this.transitionInSlide(this.current);
        this.transitionOutSlide(this.oldSlide);
        this.transitionInTitle(this.current);
        this.transitionOutTitle(this.oldSlide);
    }
}

export default SliderRealisation