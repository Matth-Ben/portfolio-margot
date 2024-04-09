import gsap from 'gsap';
import { ScrollTrigger } from "gsap/ScrollTrigger";

class Projects
{
    constructor( element )
    {
        gsap.registerPlugin(ScrollTrigger)

        this.$element = element
        this.$items = this.$element.querySelectorAll('.project-item')
        this.$line = this.$element.querySelector('.projects--svg-advance')

        this.$items.forEach((el, index) => {
            const isLast = index === this.$items.length - 1

            gsap.timeline({
                scrollTrigger: {
                    trigger: el,
                    start: 'top top',
                    scrub: 1
                }
            })
            .to(el, {
                ease: 'none',
                startAt: { filter: 'brightness(100%) blur(0px)' },
                filter: isLast ? 'none' : 'brightness(50%) blur(10px)',
                scale: 0.6
            }, '<')
        });
    }
}

export default Projects