export default function()
{
    if ( !document.body.classList.contains( 'grid-helper-init' ) ) {
        document.body.classList.add( 'grid-helper-init' )
        
        window.addEventListener( 'keyup', e => {
            if ( e.key && e.key === "g" ) {
                document.querySelectorAll( '.grid-helper' ).forEach( element => {
                    element.classList.toggle( 'active' )
                } )
            }
        } )
    }
}
