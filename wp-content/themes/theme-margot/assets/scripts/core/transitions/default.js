import { Transition } from '@unseenco/taxi'

const animation_duration = 500

export default class TransitionDefault extends Transition {
    /**
     * Handle the transition leaving the previous page.
     * @param { { from: HTMLElement, trigger: string|HTMLElement|false, done: function } } props
     */
    onLeave({ from, trigger, done }) {
        document.body.classList.add( 'hide-article' )
        setTimeout( done, animation_duration )
    }
    
    /**
     * Handle the transition entering the next page.
     * @param { { to: HTMLElement, trigger: string|HTMLElement|false, done: function } } props
    */
    onEnter({ to, trigger, done }) {
        setTimeout( () => {
            document.body.classList.remove( 'hide-article' )
            document.dispatchEvent( new CustomEvent( 'NewContentLoaded' ) )
            done()
        }, animation_duration )
    }
}