import gsap from 'gsap';

class Slider
{
    constructor( element )
    {
        this.$items = element.querySelectorAll( '.slider--item' )
        this.$itemsImage = element.querySelectorAll( 'figure' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )

        this.totalSlides = this.$items.length
        this.current = 0
        this.oldSlide = 0
        this.isAnimated = false
        this.slidesWrap = gsap.utils.wrap(0, this.totalSlides);

        this.$items.forEach((item, index) => {
            if (index === this.current) {
                this.transitionInSlide(index, 0);
                return;
            }
            
            this.transitionOutSlide(index, 0);
        });

        this.events()
    }

    events() {
        this.$previous.addEventListener('click', () => { if (!this.isAnimated) { this.handlePrev() } })
        this.$next.addEventListener('click', () => { if (!this.isAnimated) { this.handleNext() } })
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

    handlePrev() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current - 1);
        this.transitionInSlide(this.current, -1);
        this.transitionOutSlide(this.oldSlide, -1);
    }
  
    handleNext() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current + 1);
        this.transitionInSlide(this.current);
        this.transitionOutSlide(this.oldSlide);
    }
}

export default Slider