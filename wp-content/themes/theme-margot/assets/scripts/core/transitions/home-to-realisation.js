import { Transition } from '@unseenco/taxi'
import gsap from 'gsap';

export default class TransitionHomeToRealisation extends Transition {
  /**
   * Handle the transition leaving the previous page.
   * @param { { from: HTMLElement, trigger: string|HTMLElement|false, done: function } } props
   */
  onLeave({ from, trigger, done }) {
    this.parent = trigger.closest('.js--transition-realisation')
    this.image = trigger.querySelector('img')

    document.body.querySelector('.header').classList.add('hide--header')

    gsap.to(this.parent, {
        width: window.innerWidth + 'px',
        top: 0,
        right: 0,
        zIndex: 100,
        duration: 0.6,
        ease: 'power1.in',
        onComplete: () => {
            setTimeout(() => { done() }, 500)
        }
    })
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
