import Slider from '../components/class-slider'

const init = () => {
    document.querySelectorAll( '.slider' ).forEach( element => {
        new Slider( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )