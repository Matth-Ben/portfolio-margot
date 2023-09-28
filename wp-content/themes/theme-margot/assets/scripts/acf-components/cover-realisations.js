import CoverRealisations from "../components/class-cover-realisations"

const init = () => {
    document.querySelectorAll( '.cover--realisations' ).forEach( element => {
        new CoverRealisations( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )
