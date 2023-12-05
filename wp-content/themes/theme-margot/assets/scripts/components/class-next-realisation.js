import gsap from 'gsap';
import { ScrollTrigger } from "gsap/ScrollTrigger";

class NextRealisation
{
    constructor( element )
    {
        gsap.registerPlugin(ScrollTrigger)

        let tl = gsap.timeline({
            scrollTrigger: {
                trigger: element,
                start: "center bottom",
                end: "bottom bottom",
                scrub: 1,
                markers: false,
                toggleActions: "restart none none reverse"
            },
        });

        tl.to(element, {
            borderTopLeftRadius: "50% 0%",
            borderTopRightRadius: "50% 0%",
            ease: "power4.out",
            duration: 1.6
        });
    }
}

export default NextRealisation