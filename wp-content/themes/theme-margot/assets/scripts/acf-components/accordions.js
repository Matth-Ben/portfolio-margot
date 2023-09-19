import Accordion from '../components/class-accordions'

const init = () => {
    document.querySelectorAll( '.accordion' ).forEach( element => {
        new Accordion( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )