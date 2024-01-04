import Marquee from '../components/class-marquee'

const init = () => {
    document.querySelectorAll( '.marquee' ).forEach( element => {
        new Marquee( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )