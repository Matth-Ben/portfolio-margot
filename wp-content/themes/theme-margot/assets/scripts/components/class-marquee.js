import gsap from 'gsap';

class Marquee
{
    constructor( element )
    {
        const marquee = element

        const marqueeContent = element.querySelector('.marquee--content');
        if (!marqueeContent) {
            return;
        }

        const marqueeContentClone = marqueeContent.cloneNode(true);
        marquee.append(marqueeContentClone)

        let tween;

        const playMarquee = () => {
            let progress = tween ? tween.progress() : 0;
            tween && tween.progress(0).kill();
            
            const width = parseInt(getComputedStyle(marqueeContent).getPropertyValue("width"), 10);
            const gap = parseInt(getComputedStyle(marqueeContent).getPropertyValue("column-gap"), 10);
    
            const distanceToTranslate = -1 * (gap + width);
    
            tween = gsap.fromTo(
                marquee.children,
                { x: 0 },
                { x: distanceToTranslate, duration: 16, ease: "none", repeat: -1 }
            )
            tween.progress(progress)
        }

        playMarquee();

        function debounce(func) {
            var timer;
            return function (event) {
                if (timer) clearTimeout(timer);
                timer = setTimeout(
                    () => {
                        func()
                    },
                    1600,
                    event
                )
            }
        }

        window.addEventListener('resize', debounce(playMarquee));
    }
}

export default Marquee