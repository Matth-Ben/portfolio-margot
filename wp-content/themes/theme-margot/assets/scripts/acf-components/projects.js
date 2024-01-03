import Projects from '../components/class-projects'

const init = () => {
    document.querySelectorAll( '.projects' ).forEach( element => {
        new Projects( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )