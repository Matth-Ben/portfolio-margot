export default ( () =>
{
    document.addEventListener( 'DOMContentLoaded', () => {

        if ( document.body.classList.contains( 'welcome' ) ) {
            const welcome = document.querySelector( 'body > .welcome' )
            const text = welcome ? welcome.querySelector( 'p' ) : null

            if ( text ) {
                setTimeout( () => {
                    text.classList.add( 'is-in-view' )
                }, 600 )
                setTimeout( () => {
                    welcome.classList.add( 'hide' )
                }, 1200 )
                setTimeout( () => {            
                    document.dispatchEvent( new CustomEvent( 'ContentLoaded' ) )
                }, 2000 )
            }
        }
    } )
} )()
