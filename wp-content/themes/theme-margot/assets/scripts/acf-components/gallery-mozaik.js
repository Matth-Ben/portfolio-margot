import GalleryMozaik from '../components/class-gallery-mozaik'

const init = () => {
    document.querySelectorAll( '#bloc-gallery-mozaik' ).forEach( element => {
        new GalleryMozaik( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )