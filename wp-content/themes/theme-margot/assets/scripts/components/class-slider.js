import gsap from 'gsap';

class Slider
{
    constructor( element )
    {
        this.$items = element.querySelectorAll( '.slider--wrapper-item' )
        this.$numbers = element.querySelectorAll( '.slider--number-item' )
        this.$titles = element.querySelectorAll( '.slider--title-item' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )

        this.array = []
        this.current = 0
        this.oldCurrent = 0
        this.direction = 1
        this.isAnimated = false

        this.$items.forEach((element, i) => {
            this.array[i] = {
                'figure': element,
                'image': element.querySelector('img'),
                'number': this.$numbers[i],
                'title': this.$titles[i],
            }
        });

        for (let index = 1; index < this.array.length; index++) {
            gsap.set(this.array[index]['figure'], {
                xPercent: -100,
                duration: 0.6,
                ease: "power4.out"
            })
            gsap.set(this.array[index]['image'], {
                xPercent: 100,
                duration: 0.6,
                ease: "power4.out"
            })
            gsap.set([this.array[index]['title'], this.array[index]['number']], {
                yPercent: 100,
                opacity: 0,
                duration: 0.6,
                ease: "power4.out",
                stagger: 0.02
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

        gsap.to(this.array[this.oldCurrent]['figure'], {
            xPercent: 100 * this.direction,
            duration: 0.6,
            ease: "power4.out"
        })
        gsap.to(this.array[this.oldCurrent]['image'], {
            xPercent: -100 * this.direction,
            duration: 0.6,
            ease: "power4.out"
        })
        gsap.to([this.array[this.oldCurrent]['number'], this.array[this.oldCurrent]['title']], {
            yPercent: 100,
            opacity: 0,
            duration: 0.6,
            ease: "power4.out",
            stagger: 0.2
        })

        gsap.fromTo(this.array[this.current]['figure'], {
            xPercent: -100 * this.direction,
            duration: 0.6,
            ease: "power4.out"
        }, {
            xPercent: 0,
            duration: 0.6,
            ease: "power4.out"
        })
        gsap.fromTo(this.array[this.current]['image'], {
            xPercent: 100 * this.direction,
            duration: 0.6,
            ease: "power4.out"
        }, {
            xPercent: 0,
            duration: 0.6,
            ease: "power4.out"
        })
        gsap.to([this.array[this.current]['number'], this.array[this.current]['title']], {
            yPercent: 0,
            opacity: 1,
            duration: 0.6,
            delay: 0.6,
            ease: "power4.out",
            stagger: 0.2,
            onComplete: () => { this.isAnimated = false }
        })
    }
}

export default Slider