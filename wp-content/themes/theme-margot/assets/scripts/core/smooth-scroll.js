import Lenis from '@studio-freight/lenis'

export default () => {
    const lenis = new Lenis({
        duration: 2,
        easing: (t) => (t === 1 ? 1 : 1.001 - Math.pow(2, -10 * t)),
        direction: "vertical",
        gestureDirection: "vertical",
        smooth: true,
        smoothTouch: false,
        touchMultiplier: 2,
    })
    window.lenis = lenis
    
    lenis.on('scroll', (e) => {
        // console.log(e)
    })
    
    function raf(time) {
        lenis.raf(time)
        requestAnimationFrame(raf)
    }
    
    requestAnimationFrame(raf)
}
