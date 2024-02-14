import gsap from 'gsap'

class SliderCircle
{
    constructor( element )
    {
        this.element = element
        this.$items = element.querySelectorAll( '.slider-circle--item' )
        this.$imgs = element.querySelectorAll( '.slider-circle--img' )
        this.$dots = element.querySelectorAll( '.slider-circle--dot' )
        this.$previous = element.querySelector( '.button--before' )
        this.$next = element.querySelector( '.button--after' )
        this.$mainCircle = element.querySelector(".slider-circle--svg");
        // this.$svg = this.$mainCircle.getBBox();
        
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
            this.arrayItems[i] = {
                'number' : item.querySelector('.slider-circle--number'),
                'title' : item.querySelector('.slider-circle--title'),
                'content' : item.querySelector('.slider-circle--content'),
                'image' : this.$imgs[i],
                'dot' : this.$dots[i],
            }
        });

        this.itemsWrap = gsap.utils.wrap(0, this.$items.length);

        this.init()
        this.events()
    }

    init()
    {
        const circleHeight = Math.sqrt(Math.pow(this.$mainCircle.offsetWidth, 2))
        this.opts.radius = circleHeight / 2

        for (let i = 1; i < this.$items.length; i++) {
            gsap.set([this.arrayItems[i]['number'], this.arrayItems[i]['title'], this.arrayItems[i]['content']], {
                yPercent: 100,
                stagger: 0.02
            })
        }
        
        for (let i = 0; i < this.arrayItems.length; i++) {
            const { width, height } = this.arrayItems[i].image.getBoundingClientRect()
            const angle = 360 / this.arrayItems.length * i
    
            this.transform(this.arrayItems[i].dot, angle, 0, 0)
            this.transform(this.arrayItems[i].image, angle, width / 2, height / 2)
    
            gsap.set(this.arrayItems[i].image, { rotate: 8 })
        }

        // this.positionElements(this.$dots)
        // this.positionElements(this.$imgs)
    }

    events() {
        this.$previous.addEventListener('click', () => { this.handlePrev() })
        this.$next.addEventListener('click', () => { this.handleNext() })
        window.addEventListener('resize', () => { this.init() })
    }

    transform(el, angle, offsetX = 0, offsetY = 0) {
        let x, y
    
        console.log(this.opts.radius);
        if (angle <= 90) {
            x = (Math.cos((90 - angle) * Math.PI / 180) * this.opts.radius) - 10
            y = this.opts.radius - Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        } else if (angle > 90 && angle <= 180) {
            x = (Math.cos((angle - 90) * Math.PI / 180) * this.opts.radius) - 10
            y = this.opts.radius + Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        } else if (angle > 180 && angle <= 270) {
            x = (- Math.cos((270 - angle) * Math.PI / 180) * this.opts.radius) - 10
            y = this.opts.radius + Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        } else if (angle > 270) {
            x = (- Math.cos((angle - 270) * Math.PI / 180) * this.opts.radius) - 10
            y = this.opts.radius - Math.sqrt(Math.pow(this.opts.radius, 2) - Math.pow(x, 2))
        }
    
        el.style.transform = `translate(${x - offsetX}px, ${y - offsetY}px)`
    }    

    positionElements(items) {
        console.log(this.$svg);
        const numImages = items.length;
        const radius = 332;
        const widthSVG = this.$svg.width;
        const heightSVG = this.$svg.height;
        const angleIncrement = (2 * Math.PI) / numImages;
        
        items.forEach((item, index) => {
            const initialAngle = -Math.PI / 2;
            const angle = initialAngle + angleIncrement * index;
            const x = 332 + radius * Math.cos(angle) - item.offsetWidth / 2;
            const y = 332 + radius * Math.sin(angle) - item.offsetHeight / 2;

            console.log(item);
            console.log(radius * Math.cos(angle));
            console.log(item.offsetWidth / 2);
            console.log(widthSVG);
            console.log(heightSVG);
            console.log('----------------------');
            item.style.left = `${x}px`;
            item.style.top = `${y}px`;
        });
    }

    transitionInSlide(slide, duration = 0.6) {
        gsap.fromTo([this.arrayItems[slide]['number'], this.arrayItems[slide]['title'], this.arrayItems[slide]['content']], {
            yPercent: 100,
            stagger: 0.1,
            duration
        },{
            yPercent: 0,
            stagger: 0.1,
            duration
        });
    }

    transitionOutSlide(slide, duration = 0.6) {
        gsap.to([this.arrayItems[slide]['number'], this.arrayItems[slide]['title'], this.arrayItems[slide]['content']], {
            yPercent: -100,
            stagger: 0.1,
            duration,
            onComplete: () => {
                this.transitionInSlide(this.current);
            }
        });
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