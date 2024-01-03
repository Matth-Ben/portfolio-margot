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

        for (let i = 0; i < this.$items.length; i++) {
            gsap.to(this.$items[i], {
                scrollTrigger: {
                    trigger: this.$items[i],
                    start:'40% 50%',
                    end:'bottom 50%',
                    scrub: 1,
                    markers: false,
                    toggleActions: "restart none none reverse"
                },
                scale: 0.85,
                transformOrigin: 'top'
            });    
        }
    }
}

export default Projects