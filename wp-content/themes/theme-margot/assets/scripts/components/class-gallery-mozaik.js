import gsap from 'gsap';

class CoverRealisations {
    constructor( element )
    {
        this.$images = element.querySelectorAll('.bloc-gallery-mozaik--image')
        this.$numbers = element.querySelectorAll('.number-item')
        this.$title = element.querySelector('.title')
        this.$titles = element.querySelectorAll('.title-item')
        this.$buttonLeft = element.querySelector('.button--before')
        this.$buttonRight = element.querySelector('.button--after')

        this.itemsWrap = gsap.utils.wrap(0, this.$titles.length);

        this.old = 0
        this.current = 0

        this.init()
        this.events()
    }

    init() {
        for (let index = 1; index < this.$titles.length; index++) {
            gsap.set(this.$titles[index], { yPercent: 100 })
            gsap.set(this.$numbers[index], { yPercent: 100 })
        }
    }

    events() {
        this.$images.forEach((image, i) => {
            image.addEventListener('click', () => {
                this.old = this.current;
                this.current = this.itemsWrap(i);
                this.changeImage()
                this.changeTitle(1);
                this.changeNumber(1);
            })
        });

        this.$buttonLeft.addEventListener('click', () => { this.handlePrev() })
        this.$buttonRight.addEventListener('click', () => { this.handleNext() })
    }

    handlePrev() {
        this.old = this.current;
        this.current = this.itemsWrap(this.current - 1);
        this.changeImage();
        this.changeTitle(-1);
        this.changeNumber(-1);
    }
  
    handleNext() {
        this.old = this.current;
        this.current = this.itemsWrap(this.current + 1);
        this.changeImage();
        this.changeTitle(1);
        this.changeNumber(1);
    }

    changeTitle(direction) {
        gsap.fromTo(this.$titles[this.old], {
            yPercent: 0
        }, {
            yPercent: -100 * direction
        })

        gsap.to(this.$title, {
            height: this.$titles[this.current].offsetHeight
        })

        gsap.fromTo(this.$titles[this.current], {
            yPercent: 100 * direction
        }, {
            yPercent: 0
        })
    }

    changeNumber(direction) {
        gsap.fromTo(this.$numbers[this.old], {
            yPercent: 0
        }, {
            yPercent: -100 * direction
        })

        gsap.fromTo(this.$numbers[this.current], {
            yPercent: 100 * direction
        }, {
            yPercent: 0
        })
    }

    changeImage() {
        this.$images[this.old].classList.remove('active')
        this.$images[this.current].classList.add('active')
    }
}

export default CoverRealisations
