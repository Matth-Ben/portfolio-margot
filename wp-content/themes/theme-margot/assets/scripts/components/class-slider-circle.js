import gsap from 'gsap'

class SliderCircle
{
    constructor( element )
    {
        this.element = element
        this.$container = element.querySelector( '.slider-circle--wrapper' )
        this.$items = element.querySelectorAll( '.slider-circle--item' )
        this.$imgs = element.querySelectorAll( '.slider-circle--img' )
        this.$dots = element.querySelectorAll( '.slider-circle--dot' )
        this.$titles = element.querySelectorAll( '.slider-circle--title' )
        this.$contents = element.querySelectorAll( '.slider-circle--content' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )
        this.$mainCircle = element.querySelector(".slider-circle--svg");
        this.$svg = element.querySelector("#circlePath");
        
        this.current = 0
        this.oldSlide = 0
        this.isAnimated = false
        this.arrayItems = []

        this.canUpdate = false

        this.opts = {
            angle: 0,
            radius: 0,
            width: null
        }

        this.$items.forEach((item, i) => {
            let titleWords = this.$titles[i].querySelectorAll('.word')
            let contentWords = this.$contents[i].querySelectorAll('.word')

            this.arrayItems[i] = {
                'number' : item.querySelector('.slider-circle--number'),
                'title' : titleWords,
                'content' : contentWords,
                'image' : this.$imgs[i],
                'dot' : this.$dots[i],
            }
        });

        this.itemsWrap = gsap.utils.wrap(0, this.$items.length);

        this.init()
        this.initGsap()
        this.events()
    }

    init()
    {
        this.opts = {
            angle: 0,
            radius: 0,
            width: null
        }

        const circleHeight = Math.sqrt(Math.pow(this.$mainCircle.offsetWidth, 2))
        this.opts.radius = circleHeight / 2
        
        this.arrayItems.forEach((element, i) => {
            const { width, height } = this.arrayItems[i].image.getBoundingClientRect()
            const angle = 360 / this.arrayItems.length * i
            this.transform(this.arrayItems[i].image, angle, width / 2, height / 2)

            const dotBounding = this.arrayItems[i].dot.getBoundingClientRect()
            const widthDot = dotBounding.width
            const heightDot = dotBounding.height
            this.transform(this.arrayItems[i].dot, angle, widthDot / 2, heightDot / 2)
        });
    }

    initGsap() {
        for (let i = 1; i < this.$items.length; i++) {
            gsap.set(this.arrayItems[i]['number'], { yPercent: 100 })

            this.arrayItems[i]['title'].forEach(tite => {
                gsap.set(tite.querySelector('span'), { yPercent: 100 })
            });

            this.arrayItems[i]['content'].forEach(content => {
                gsap.set(content.querySelector('span'), { yPercent: 100 })
            });

            gsap.set(this.arrayItems[i]['image'], { opacity: 0 })
        }

        this.$container.style.height = this.$items[0].clientHeight + 'px'

        this.arrayItems[0]['dot'].classList.add('current')

        this.arrayItems.forEach((item, i) => {
            gsap.set(this.arrayItems[i].image, { rotate: 8 })
        });
    }

    events() {
        this.$previous.addEventListener('click', () => { this.handlePrev() })
        this.$next.addEventListener('click', () => { this.handleNext() })

        this.arrayItems.forEach((item, i) => {
            item['dot'].addEventListener('click', () => {
                this.oldSlide = this.current;
                this.current = this.itemsWrap(i);
                this.transitionOutSlide(this.oldSlide);
            })
        });

        window.addEventListener('resize', () => { this.init() })
    }

    transform(el, angle, offsetX = 0, offsetY = 0) {
        let x, y

        if (angle <= 90) {
            x = (Math.cos((90 - angle) * Math.PI / 180) * this.opts.radius)
            y = this.opts.radius - Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        } else if (angle > 90 && angle <= 180) {
            x = (Math.cos((angle - 90) * Math.PI / 180) * this.opts.radius)
            y = this.opts.radius + Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        } else if (angle > 180 && angle <= 270) {
            x = (- Math.cos((270 - angle) * Math.PI / 180) * this.opts.radius)
            y = this.opts.radius + Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        } else if (angle > 270) {
            x = (- Math.cos((angle - 270) * Math.PI / 180) * this.opts.radius)
            y = this.opts.radius - Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        }
    
        el.style.transform = `translate(${x - offsetX}px, ${y - offsetY}px)`
    }    

    transitionInSlide(slide, duration = 0.6) {
        this.$container.style.height = this.$items[slide].clientHeight + 'px'

        gsap.fromTo([this.arrayItems[slide]['number']], {
            yPercent: 100,
            stagger: 0.1,
            duration
        },{
            yPercent: 0,
            stagger: 0.1,
            duration
        });

        this.arrayItems[slide]['title'].forEach(title => {
            const computedStyle = window.getComputedStyle(title);
            const lineIndex = computedStyle.getPropertyValue('--line-index');

            gsap.fromTo(title.querySelector('span'), {
                yPercent: 100,
                duration
            },{
                yPercent: 0,
                delay: 0.1 * lineIndex,
                duration
            });
        });

        this.arrayItems[slide]['content'].forEach(content => {
            const computedStyle = window.getComputedStyle(content);
            const lineIndex = computedStyle.getPropertyValue('--line-index');

            gsap.fromTo(content.querySelector('span'), {
                yPercent: 100,
                duration
            },{
                yPercent: 0,
                delay: 0.1 * lineIndex,
                duration
            });
        });

        this.arrayItems[slide]['dot'].classList.add('current')

        gsap.fromTo(this.arrayItems[slide]['image'], {
            opacity: 0,
            scale: 0,
            duration
        }, {
            opacity: 1,
            scale: 1,
            ease: "expo.out",
            duration
        })

        if (slide == 0) {
            slide = 3
        }

        let beforeSlide = slide - 1

        if (this.current < this.oldSlide) {
            beforeSlide = this.oldSlide
        }

        if (beforeSlide < 0) {
            beforeSlide = 0
        }

        gsap.fromTo(this.$svg, {
            strokeDashoffset: 700 * (3 - beforeSlide),
        },{
            strokeDashoffset: 700 * (3 - slide),
            onComplete: () => {
                if (slide == 3) {
                    gsap.fromTo(this.$svg, {
                        strokeDashoffset: 0,
                    }, {
                        strokeDashoffset: -2100,
                    })
                }
            }
        })
    }

    transitionOutSlide(slide, duration = 0.6) {
        gsap.to(this.arrayItems[slide]['number'], {
            yPercent: -100,
            duration,
            onComplete: () => {
                this.transitionInSlide(this.current);
            }
        });

        this.arrayItems[slide]['title'].forEach(title => {
            const computedStyle = window.getComputedStyle(title);
            const lineIndex = computedStyle.getPropertyValue('--line-index');

            gsap.to(title.querySelector('span'), {
                yPercent: -100,
                delay: 0.1 * lineIndex,
                duration
            });
        });

        this.arrayItems[slide]['content'].forEach(content => {
            const computedStyle = window.getComputedStyle(content);
            const lineIndex = computedStyle.getPropertyValue('--line-index');

            gsap.to(content.querySelector('span'), {
                yPercent: -100,
                delay: 0.1 * lineIndex,
                duration
            });
        });

        this.arrayItems[slide]['dot'].classList.remove('current')

        gsap.fromTo(this.arrayItems[slide]['image'], {
            opacity: 1,
            scale: 1,
            duration
        }, {
            opacity: 0,
            scale: 0,
            ease: "expo.out",
            duration
        })
    }

    handlePrev() {
        this.oldSlide = this.current;
        this.current = this.itemsWrap(this.current - 1);
        this.transitionOutSlide(this.oldSlide);
    }
  
    handleNext() {
        this.oldSlide = this.current;
        this.current = this.itemsWrap(this.current + 1);
        this.transitionOutSlide(this.oldSlide);
    }
}

export default SliderCircle