import SliderCircle from '../components/class-slider-circle'

const init = () => {
    document.querySelectorAll( '.slider-circle' ).forEach( element => {
        new SliderCircle( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )