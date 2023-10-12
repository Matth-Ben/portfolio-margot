import LoadShader from "../webgl/shader"


const init = () => {
    document.querySelectorAll( '.canvasContainer' ).forEach( element => {
        new LoadShader( element )
    } )
}

document.addEventListener( 'NewContentLoaded', init )
document.addEventListener( 'ContentLoaded', init )
