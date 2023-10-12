import { Transition } from '@unseenco/taxi'
import gsap from 'gsap'

export default class TransitionSwitchRealisation extends Transition {
    /**
     * Handle the transition leaving the previous page.
     * @param { { from: HTMLElement, trigger: string|HTMLElement|false, done: function } } props
     */
    onLeave({ from, trigger, done }) {
        this.parent = trigger.closest('.js--switch-realisation')
        this.title = trigger.querySelector('.next-realisation--text')
        document.body.querySelector('.header').classList.add('hide--header')

        gsap.to(this.title, {
            opacity: 0,
            duration: 0.6,
            ease: 'power1.in'
        })

        gsap.to(this.parent, {
            height: window.innerHeight + 'px',
            zIndex: 100,
            top: 0,
            duration: 0.6,
            ease: 'power1.in',
            onComplete: () => {
                setTimeout(() => { done() }, 600)
            }
        })

        setTimeout(() => {
            window.scrollTo({
                top: 0,
                behavior: "smooth"
            });
        }, 300)
    }
    
    /**
     * Handle the transition entering the next page.
     * @param { { to: HTMLElement, trigger: string|HTMLElement|false, done: function } } props
    */
    onEnter({ to, trigger, done }) {
        setTimeout( () => {
            document.body.querySelector('.header').classList.remove('hide--header')
            document.body.classList.remove( 'hide-article' )
            document.dispatchEvent( new CustomEvent( 'NewContentLoaded' ) )
            done()
        }, 500 )
    }
}