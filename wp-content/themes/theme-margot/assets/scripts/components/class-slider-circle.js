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
        this.$mainCircle = element.querySelector("svg #circlePath");
        this.$svg = this.$mainCircle.getBBox();
        
        this.current = 0
        this.oldSlide = 0
        this.isAnimated = false
        this.arrayItems = []

        this.$items.forEach((item, i) => {
            this.arrayItems[i] = {
                'number' : item.querySelector('.slider-circle--number'),
                'title' : item.querySelector('.slider-circle--title'),
                'content' : item.querySelector('.slider-circle--content')
            }
        });

        this.itemsWrap = gsap.utils.wrap(0, this.$items.length);

        this.init()
        this.events()
    }

    init()
    {
        for (let i = 1; i < this.$items.length; i++) {
            gsap.set([this.arrayItems[i]['number'], this.arrayItems[i]['title'], this.arrayItems[i]['content']], {
                yPercent: 100,
                stagger: 0.02
            })
        }

        this.positionElements(this.$dots)
        this.positionElements(this.$imgs)
    }

    events() {
        this.$previous.addEventListener('click', () => { this.handlePrev() })
        this.$next.addEventListener('click', () => { this.handleNext() })
        // window.addEventListener('resize', () => { this.init() })
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