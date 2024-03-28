import gsap from 'gsap';

class CoverRealisations
{
    constructor( element )
    { 
        this.$items = element.querySelectorAll( '.cover--realisations__item-wrapper' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )

        this.current = 0
        this.oldSlide = 0
        this.direction = 1

        this.slides = this.$items[0].querySelectorAll('.cover--realisations__item-wrapper__elem')
        this.titles = element.querySelectorAll('.cover--realisations__item-title')
        this.titlesMobile = element.querySelectorAll('.cover--realisations__item-titleMobile')
        this.slidesWrap = gsap.utils.wrap(0, this.slides.length);
        this.slidesWrapTitle = gsap.utils.wrap(0, this.titles.length);

        this.wrapper = []
        this.$items.forEach((element, i) => {
            this.wrapper[i] = {
                'elem': element.querySelectorAll('.cover--realisations__item-wrapper__elem'),
                'figure': element.querySelectorAll('figure'),
            }
        });

        this.wrapper.forEach((element, index) => {
            if (index !== this.current) {
                this.transitionOutSlide(index, 0);
                return;
            }
            
        })

        this.events()
    }

    events() {
        this.$previous.addEventListener('click', () => { this.handlePrev() })
        this.$next.addEventListener('click', () => { this.handleNext() })
    }

    transitionInSlide(slide, direction = 1, duration = 1) {
        this.wrapper.forEach((element, i) => {
            gsap.fromTo(
                element.elem[slide],
                {
                    xPercent: direction > 0 ? 100 : -100
                },
                {
                    xPercent: 0,
                    duration
                }
            );
            
            gsap.fromTo(
                element.figure[slide],
                {
                    xPercent: direction > 0 ? -100 : 100
                },
                {
                    xPercent: 0,
                    duration
                }
            );

            gsap.fromTo(
                [this.titles[slide], this.titlesMobile[slide]],
                {
                    yPercent: direction > 0 ? 100 : -100,
                    opacity: 0
                },
                {
                    yPercent: 0,
                    opacity: 1,
                    duration,
                    delay: 0.8
                }
            );
        })
    }

    transitionOutSlide(slide, direction = 1, duration = 1) {
        this.wrapper.forEach((element, i) => {
            gsap.to(element.elem[slide], {
                xPercent: direction > 0 ? -100 : 100,
                duration
            });
            
            gsap.to(element.figure[slide], {
                xPercent: direction > 0 ? 100 : -100,
                duration
            });

            gsap.to([this.titles[slide], this.titlesMobile[slide]], {
                yPercent: direction > 0 ? -100 : 100,
                opacity: 0,
                duration,
                delay: 0.4
            });
        })
    }

    handlePrev() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current - 1);
        this.transitionInSlide(this.current, -1, 0.4);
        this.transitionOutSlide(this.oldSlide, -1, 0.4);
    }
  
    handleNext() {
        this.oldSlide = this.current;
        this.current = this.slidesWrap(this.current + 1);
        this.transitionInSlide(this.current, 1, 0.4);
        this.transitionOutSlide(this.oldSlide, 1, 0.4);
    }
}

export default CoverRealisations