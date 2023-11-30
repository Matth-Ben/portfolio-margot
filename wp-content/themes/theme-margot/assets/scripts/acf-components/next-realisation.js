import NextRealisation from '../components/class-next-realisation'

const init = () => {
    document.querySelectorAll( '.next-realisation' ).forEach( element => {
        new NextRealisation( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )