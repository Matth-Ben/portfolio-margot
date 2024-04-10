import { Transition } from '@unseenco/taxi'
import gsap from 'gsap';

const animation_duration = 500

export default class TransitionHomeToRealisation extends Transition {
  /**
   * Handle the transition leaving the previous page.
   * @param { { from: HTMLElement, trigger: string|HTMLElement|false, done: function } } props
   */
  onLeave({ from, trigger, done }) {
    this.parent = trigger.closest('.js--transition-realisation')
    this.image = trigger.querySelector('img')

    document.body.querySelector('.header').classList.add('hide--header')

    const distanceToTop = this.parent.getBoundingClientRect().top;
    const distanceToLeft = this.parent.getBoundingClientRect().left;

    gsap.to(this.parent, {
      width: window.innerWidth + 'px',
      top: -distanceToTop + 'px',
      left: -distanceToLeft + 'px',
      zIndex: 100,
      duration: 0.6,
      ease: 'power1.in',
      onComplete: () => {
        setTimeout(() => {
          // document.body.classList.add( 'hide-article' )
          
          setTimeout( () => {
            lenis.scrollTo( 0, { immediate: true } )
          }, animation_duration )
          
          setTimeout( done, animation_duration )
        }, 500)
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
