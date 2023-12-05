import Slider from '../components/class-slider'
import SliderProject from '../components/class-slider-realisation'

const init = () => {
    document.querySelectorAll( '.slider' ).forEach( element => {
        new Slider( element )
    } )

    document.querySelectorAll( '.slider-realisation' ).forEach( element => {
        new SliderProject( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )