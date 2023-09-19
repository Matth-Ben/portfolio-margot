import CarouselBasic from "../components/class-carousel-basic"

const init = () => {
    document.querySelectorAll( '.carousel--full' ).forEach( element => {
        new CarouselBasic( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )
