import gsap from 'gsap';

class CoverRealisations
{
    constructor( element )
    {
        this.$items = element.querySelectorAll( '.cover--realisations__item-wrapper' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )

        this.array = []
        this.current = 0
        this.oldCurrent = 0
        this.direction = 1
        this.isAnimated = false

        this.$items.forEach((element, i) => {
            this.array[i] = {
                'image_1': this.$items[0].querySelectorAll('figure')[i],
                'image_2': this.$items[1].querySelectorAll('figure')[i],
                'image_3': this.$items[2].querySelectorAll('figure')[i],
                'title': this.$items[0].querySelectorAll('.cover--realisations__item-title')[i]
            }
        });

        for (let index = 1; index < this.array.length; index++) {
            gsap.set([this.array[index]['image_3'], this.array[index]['image_2'], this.array[index]['image_1']], {
                xPercent: -100,
                duration: 0.6,
                ease: "power4.out",
                stagger: 0.2
            })
            gsap.set([this.array[index]['image_3'].querySelector('img'), this.array[index]['image_2'].querySelector('img'), this.array[index]['image_1'].querySelector('img')], {
                xPercent: 100,
                duration: 0.6,
                ease: "power4.out",
                stagger: 0.2
            })
            gsap.set(this.array[index]['title'], {
                yPercent: 100,
                opacity: 0,
                duration: 0.6,
                ease: "power4.out",
            })
        }

        this.events()
    }

    events() {
        this.$previous.addEventListener('click', () => { if (!this.isAnimated) { this.slideTo(false) } })
        this.$next.addEventListener('click', () => { if (!this.isAnimated) { this.slideTo(true) } })
    }

    slideTo(to) {
        this.isAnimated = true;
        this.oldCurrent = this.current

        if (to) {
            this.direction = 1
            this.current = this.current + 1
        } else {
            this.direction = -1
            this.current = this.current - 1
        }

        if (this.current < 0) { this.current = this.array.length - 1 }
        if (this.current > this.array.length - 1) { this.current = 0 }

        gsap.to([this.array[this.oldCurrent]['image_3'], this.array[this.oldCurrent]['image_2'], this.array[this.oldCurrent]['image_1']], {
            xPercent: 100 * this.direction,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.06,
            onComplete: () => {
                for (let index = 0; index <= 2; index++) {
                    this.$items[index].querySelectorAll('.cover--realisations__item-wrapper__elem')[this.oldCurrent].classList.remove('active')
                }
            }
        })
        gsap.to([this.array[this.oldCurrent]['image_3'].querySelector('img'), this.array[this.oldCurrent]['image_2'].querySelector('img'), this.array[this.oldCurrent]['image_1'].querySelector('img')], {
            xPercent: -100 * this.direction,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.06
        })
        gsap.to(this.array[this.oldCurrent]['title'], {
            yPercent: 100,
            opacity: 0,
            duration: 0.6,
            ease: "power4.out",
        })

        gsap.fromTo([this.array[this.current]['image_3'], this.array[this.current]['image_2'], this.array[this.current]['image_1']], {
            xPercent: -100 * this.direction,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.06
        }, {
            xPercent: 0,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.06,
            onComplete: () => {
                for (let index = 0; index <= 2; index++) {
                    this.$items[index].querySelectorAll('.cover--realisations__item-wrapper__elem')[this.current].classList.add('active')
                }
            }
        })
        gsap.fromTo([this.array[this.current]['image_3'].querySelector('img'), this.array[this.current]['image_2'].querySelector('img'), this.array[this.current]['image_1'].querySelector('img')], {
            xPercent: 100 * this.direction,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.06
        }, {
            xPercent: 0,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.06
        })
        gsap.to(this.array[this.current]['title'], {
            yPercent: 0,
            opacity: 1,
            duration: 0.6,
            delay: 0.6,
            ease: "power4.out",
            onComplete: () => { this.isAnimated = false }
        })
    }
}

export default CoverRealisations